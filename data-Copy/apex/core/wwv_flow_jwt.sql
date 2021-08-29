set define '^' verify off
prompt ...wwv_flow_jwt.sql
create or replace package wwv_flow_jwt as
--------------------------------------------------------------------------------
--
-- Copyright (c) Oracle Corporation 1999 - 2017. All Rights Reserved.
--
-- NAME
--   wwv_flow_jwt.sql - JSON Web Tokens
--
-- DESCRIPTION
--   This package provides APIs to work with JSON Web Tokens (JWT). JWTs can be
--   used to pass a number of signed claims between client and server.
--
--   Token values are URL-safe strings that consist of 3 parts, separated by
--   '.'. The header part identifies the algorithm used for the signature part.
--   The payload part contains the claims to make.
--
--   For more details on JWT, see RFC 7519.
--
-- RUNTIME DEPLOYMENT: YES
-- PUBLIC:             YES
--
-- MODIFIED   (MM/DD/YYYY)
--   cneumuel  10/10/2017 - Created
--   cneumuel  10/11/2017 - Added encode.
--   cneumuel  10/12/2017 - t_token attributes are varchar2 to avoid dependency on wwv_flow_json
--   cneumuel  10/18/2017 - In encode: p_exp_sec instead of absolute timestamp
--
--------------------------------------------------------------------------------

--==============================================================================
-- A t_token record contains the decoded parts of a JSON Web Token.
--
-- ATTRIBUTES
--   * header: The Javascript Object Signing and Encryption (JOSE) header
--     contains cryptographic parameters.
--   * payload: The claims which the token asserts.
--   * signature: The signature of header and payload.
--==============================================================================
type t_token is record (
    header    varchar2(32767),
    payload   varchar2(32767),
    signature varchar2(32767) );

--==============================================================================
-- Encode and optionally encrypt payload.
--
-- PARAMETERS
--   * p_iss: Optional "iss" (Issuer) claim.
--   * p_sub: Optional "sub" (Subject) claim.
--   * p_aud: Optional "aud" (Audience) claim.
--   * p_nbf_ts: Optional "nbf" (Not Before) claim.
--   * p_iat_ts: Optional "iat" (Issued At) claim (default systimestamp).
--   * p_exp_sec: Optional "exp" (Expiration Time) claim, in seconds. The start
--     time is taken from "nbf", "iat" or current time.
--   * p_jti: Optional "jti" (JWT ID) Claim.
--   * p_other_claims: Optional raw JSON with additional claims.
--   * p_signature_key: Optional MAC key for the signature. If not null, a
--     'HS256' signature is added. This requires 12c or higher.
--
-- RETURNS
--   A varchar2, the encoded token value.
--
-- EXAMPLE
--   Create and print a JWT value for Example User, intended to be used by
--   Example JWT Recipient. The token is valid for 5 minutes.
--
--     declare
--         l_jwt_value varchar2(32767);
--     begin
--         l_jwt_value := apex_jwt.encode (
--                            p_iss           => 'Example Issuer',
--                            p_sub           => 'Example User',
--                            p_aud           => 'Example JWT Recipient',
--                            p_exp_sec       => 60*5,
--                            p_other_claims  => '"name1": '||apex_json.stringify('value1')||
--                                               ',"name2": '||apex_json.stringify('value2'),
--                            p_signature_key => ... encryption key ... );
--         sys.dbms_output.put_line(l_jwt_value);
--     end;
--==============================================================================
function encode (
    p_iss           in varchar2                 default null,
    p_sub           in varchar2                 default null,
    p_aud           in varchar2                 default null,
    p_nbf_ts        in timestamp with time zone default null,
    p_iat_ts        in timestamp with time zone default systimestamp,
    p_exp_sec       in pls_integer              default null,
    p_jti           in varchar2                 default null,
    p_other_claims  in varchar2                 default null,
    p_signature_key in raw                      default null )
    return varchar2;

--==============================================================================
-- Decode a raw token value.
--
-- PARAMETERS
--   * p_value: A raw token value contains 3 base64-encoded parts, which are
--     separated by '.'. The parts are header, payload and signature.
--   * p_signature_key: If not null, validate p_value's signature using this key
--     and the algorithm specified in header. The algorithms 'HS256' and 'none'
--     are supported, but 'HS256' requires 12c or higher.
--
-- RETURNS
--   A t_token.
--
-- RAISES
--   * VALUE_ERROR: The input value is invalid.
--   * WWV_FLOW_CRYPTO.UNSUPPORTED_FUNCTION: The token is signed using an
--     unsupported function.
--
-- EXAMPLE
--   Decode an encoded token and print it's contents.
--
--     declare
--         l_token apex_jwt.t_token;
--         l_keys  apex_t_varchar2;
--     begin
--         l_token := apex_jwt.decode (
--                        p_value => 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJsb2dnZWRJbkFzIjoiYWRtaW4iLCJpYXQiOjE0MjI3Nzk2Mzh9.gzSraSYS8EXBxLN_oWnFSRgCzcmJmMjLiuyu5CSpyHI' );
--         sys.dbms_output.put_line('--- Header ---');
--         apex_json.parse(l_token.header);
--         l_keys := apex_json.get_members('.');
--         for i in 1 .. l_keys.count loop
--             sys.dbms_output.put_line(l_keys(i)||'='||apex_json.get_varchar2(l_keys(i)));
--         end loop;
--         sys.dbms_output.put_line('--- Payload ---');
--         apex_json.parse(l_token.payload);
--         l_keys := apex_json.get_members('.');
--         for i in 1 .. l_keys.count loop
--             sys.dbms_output.put_line(l_keys(i)||'='||apex_json.get_varchar2(l_keys(i)));
--         end loop;
--     end;
--
--   Output:
--
--     --- Header ---
--     alg=HS256
--     typ=JWT
--     --- Payload ---
--     loggedInAs=admin
--     iat=1422779638
--==============================================================================
function decode (
    p_value         in varchar2,
    p_signature_key in raw       default null )
    return t_token;

--==============================================================================
-- Validate the given token.
--
-- PARAMETERS
--   * p_token: The JWT.
--   * p_iss: If not null, verify that the "iss" claim equals p_iss.
--   * p_aud: If not null, verify that the single "aud" value equals p_aud. If
--     "aud" is an array, verify that the "azp" (Authorized Party) claim equals
--     p_aud. This is an OpenID extension.
--   * p_leeway_seconds: Fudge factor (in seconds) for comparing "exp"
--     (Expiration Time), "nbf" (Not Before) and "iat" (Issued At) claims.
--
-- RAISES
--   * APEX.ERROR.INTERNAL: Validation failed, check debug log for details.
--
-- EXAMPLE
--   Verify that l_value is a valid OpenID ID token.
--
--     declare
--         l_value varchar2(4000)          := 'eyJ0 ... NiJ9.eyJ1c ... I6IjIifX0.DeWt4Qu ... ZXso';
--         l_oauth2_client_id varchar2(30) := '...';
--         l_token apex_jwt.t_token;
--     begin
--         l_token := apex_jwt.decode (
--                        p_value => l_value );
--         apex_jwt.validate (
--             p_token => l_token,
--             p_aud   => l_oauth2_client_id );
--     end;
--==============================================================================
procedure validate (
    p_token          in t_token,
    p_iss            in varchar2    default null,
    p_aud            in varchar2    default null,
    p_leeway_seconds in pls_integer default 0 );

end wwv_flow_jwt;
/
show err

