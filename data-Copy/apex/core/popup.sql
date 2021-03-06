set define '^'
set verify off
prompt ...wwv_flow_popup_lov

Rem NAME
Rem      wwwv_flow_popup_lov.sql
Rem
Rem    SCRIPT ARGUMENTS
Rem      1:
Rem      2:
Rem      3:  Flow Schema Owner
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem      mhichwa   02/08/2003 - Created

create or replace package wwv_flow_popup_lov as

--  Copyright (c) Oracle Corporation 2003. All Rights Reserved.
--
--    DESCRIPTION
--      Flow POPUP lov rendering engine package specification.
--
--    SECURITY
--      Only executable by flows owner    
--
--    RUNTIME DEPLOYMENT: YES
--

procedure show (
    p_request             in varchar2   default null,
    p_instance            in varchar2   default null,
    p_flow_id             in varchar2   default null,
    p_flow_page_id        in varchar2   default null,
    p_debug               in varchar2   default 'NO',
    p_arg_names           in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr,
    p_arg_values          in wwv_flow_global.vc_arr2 default wwv_flow.empty_vc_arr)
    ;

end wwv_flow_popup_lov;
/

show errors
