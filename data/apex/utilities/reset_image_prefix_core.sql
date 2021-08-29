Rem  Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
Rem
Rem    NAME
Rem      reset_image_prefix_core.sql
Rem
Rem    DESCRIPTION
Rem      Reset the image prefix used in an Application Express installation
Rem
Rem    NOTES
Rem
Rem      - This utility should be run via SQL*Plus and connected as SYS.
Rem      - This utility will also recompile the entire Application Express schema
Rem
Rem      - This utility should not be run on an active Application Express instance.
Rem        If need be, the database should be started in RESTRICT mode.
Rem
Rem    Arguments:
Rem      None - The user will be prompted for the updated image prefix
Rem
Rem    MODIFIED    (MM/DD/YYYY)
Rem      jkallman   02/27/2007 - Created
Rem      jkallman   12/04/2007 - Updated with FLOWS_030100
Rem      jkallman   04/14/2008 - Add call to wwv_flow_page_cache_api.purge_all (Bug 6963877)
Rem      jkallman   07/08/2008 - Updated with FLOWS_040000
Rem      jkallman   10/02/2008 - Changed FLOWS_040000 references to APEX_040000
Rem      jkallman   11/22/2010 - Changed APEX_040000 references to APEX_040100
Rem      pawolf     10/19/2012 - Changed APEX_040100 references to APEX_040200 (bug 14785456)
Rem      pawolf     12/12/2012 - Removed updating of image prefix for internal apps (bug #15969515)
Rem      jkallman   12/17/2012 - Changed APEX_040200 references to APEX_050000
Rem      jstraub    08/29/2013 - Split off from reset_image_prefix.sql to support CDB installs
Rem      vuvarov    02/26/2015 - Changed APEX_040200 references to APEX_050000
Rem      msewtz     07/07/2015 - Changed APEX_050000 references to APEX_050100
Rem      hfarrell   01/31/2017 - Changed APEX_050100 to APEX_050200
Rem      cneumuel   01/17/2018 - avoid hard-coded APEX schema name
Rem      jstraub    08/23/2018 - Added reset package state call after recompile of wwv_flow_global

set define '&'
set concat on
set concat .
set verify off
set termout on

define IMGPRE = '&1'

prompt ...Changing Application Express image prefix
select '&IMGPRE' as new_image_prefix from sys.dual;

whenever sqlerror exit

begin
    if nvl(length('&IMGPRE'),0) = 0 then
        raise_application_error(-20001,'Invalid image prefix');
    end if;
end;
/
begin
    if substr('&IMGPRE',length('&IMGPRE'),1) <> '/' then
        raise_application_error(-20001,'Image prefix must end in ''/''');
    end if;
end;
/

declare
    c_schema constant sys.dba_registry.schema%type := sys.dbms_registry.schema('APEX');
begin
    execute immediate 'alter session set current_schema='||sys.dbms_assert.enquote_name(c_schema);
end;
/

prompt
prompt ...Recreate APEX global
prompt
declare
    l_stmt varchar2(4000);
begin
    l_stmt := 'create or replace package wwv_flow_image_prefix
is
    g_image_prefix       constant varchar2(255) := ''&IMGPRE'';
end wwv_flow_image_prefix;';

    execute immediate l_stmt;
end;
/

exec sys.dbms_session.modify_package_state(sys.dbms_session.reinitialize)

prompt
prompt ...Purge all cached region and page entries
prompt
begin
    wwv_flow_page_cache_api.purge_all;
    commit;
end;
/



prompt
prompt ...Recompiling the Application Express schemas
prompt
begin
    sys.dbms_utility.compile_schema( schema => wwv_flow.g_flow_schema_owner, compile_all => false );
    sys.dbms_utility.compile_schema( schema => 'FLOWS_FILES', compile_all => false );
end;
/


prompt
prompt Image Prefix update complete
prompt
