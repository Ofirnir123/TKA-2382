set define '^' verify off
prompt ...create flow views

Rem  Copyright (c) Oracle Corporation 1999 - 2018. All Rights Reserved.
Rem
Rem    NAME
Rem      view.sql
Rem
Rem    DESCRIPTION
Rem      Create flow views
Rem
Rem    NOTES
Rem      Tables that describe a given flow.  Every attribute relates
Rem      back to the ID column of the WWV_FLOWS table.
Rem
Rem    RUNTIME DEPLOYMENT: YES
Rem
Rem    MODIFIED   (MM/DD/YYYY)
Rem    tmuth       12/02/2002 - Created
Rem    jstraub     03/10/2003 - Replaced select user with select sys_context( 'userenv', 'current_schema') for FLOW_OWNER
Rem    sspadafo    01/24/2009 - Revise wwv_flow_users view so as not to include password columns (Bug 7827992)
Rem    cneumuel    03/31/2011 - Added wwv_flow_developer_workspaces (Feature #632)
Rem    jkallman    06/06/2011 - Added workspace_status to wwv_flow_developer_workspaces
Rem    cneumuel    11/02/2011 - In wwv_flow_developer_workspaces: limit to workspaces with group_name of current one (if not null) (bug #13101596)
Rem    cneumuel    11/09/2011 - In wwv_flow_developer_workspaces: renamed group_name to cloud_group_name
Rem    cneumuel    11/18/2011 - Added wwv_flow_workspace_users (bug #13421209)
Rem    cneumuel    01/05/2012 - In wwv_flow_workspace_users: replaced #IMAGE_PREFIX# with v('IMAGE_PREFIX') (bug #13490773)
Rem    cneumuel    01/05/2012 - In wwv_flow_workspace_users: replaced &SESSION. with v('APP_SESSION') (bug #13490773)
Rem    cneumuel    04/17/2012 - Prefix sys objects with schema (bug #12338050)
Rem    cneumuel    05/16/2012 - Added wwv_flow_ws_app_and_auth (feature #808)
Rem    cneumuel    06/04/2012 - Added wwv_flow_data_view (feature #897)
Rem    hfarrell    07/16/2012 - Added view wwv_flow_pool_config for RESTful Services (feature #863)
Rem    jkallman    08/03/2012 - Added default_date_format to wwv_flow_users
Rem    cneumuel    02/28/2013 - In wwv_flow_workspace_users: added is_external_user (bug #16364188)
Rem    cneumuel    03/19/2013 - Added wwv_flow_lsnr_workspaces, wwv_flow_lsnr_applications, wwv_flow_lsnr_entry_points (bug #16513444)
Rem    pawolf      04/09/2013 - Moved several views from tab.sql to view.sql
Rem    cneumuel    04/26/2013 - In wwv_flow_workspace_users: renamed wwv_flow_utilities function
Rem                           - Renamed vc4000array to wwv_flow_t_varchar2
Rem    cneumuel    07/05/2013 - Moved wwv_flow_ws_app_and_auth_trg instead of trigger from trigger.sql to view.sql
Rem                           - Added wwv_flow_group_grants
Rem    pawolf      10/05/2013 - Added help_text to wwv_flow_native_plugins
Rem    pawolf      10/16/2013 - Added is_legacy and builder_js_function to wwv_flow_native_plugins
Rem    cneumuel    11/04/2013 - Moved wwv_flow_developer_workspaces from view.sql to dev_views.sql (feature #3)
Rem                           - in wwv_flow_developer_workspaces: added last_login, removed image, description, created_on (feature #3)
Rem    cneumuel    11/05/2013 - Moved wwv_flow_developer_workspaces back to view.sql, becuase of dependencies in wwv_flow_cloud_idm
Rem    cneumuel    11/12/2013 - In wwv_flow_developer_workspaces: allow end users that have team dev enabled (feature #3)
Rem    cneumuel    11/19/2013 - before wwv_flow_ws_app_and_auth_trg: forward declaration of wwv_flow_ws_security because of dependencies
Rem    pawolf      12/05/2013 - Added additional columns to wwv_flow_tabset_view to support Page Designer
Rem    shrahman    12/16/2013 - Fixed typo in system message for ADMINSTATOR to ADMINISTRATOR
Rem    cneumuel    12/20/2013 - Region type migration to native plugins: charts, calendars, trees (feature #1312)
Rem    vuvarov     01/09/2014 - In wwv_flow_pool_config: exclude SGID=12
Rem    vuvarov     01/09/2014 - In wwv_flow_pool_config: dont require allow_restful_services_yn=Y (feature #1267)
Rem    cneumuel    01/14/2014 - In wwv_flow_developer_workspaces: added developer_first_name, developer_last_name, developer_email
Rem    pawolf      02/26/2014 - Removed wwv_flow_plugins.builder_js_function
Rem                           - Added wwv_flow_plugins.is_quick_pick
Rem    hfarrell    03/03/2014 - In wwv_flow_workspace_users: added profile_image_size (feature #1379)
Rem    cneumuel    04/04/2014 - In wwv_flow_templates_used: remove code for item based buttons (feature #1314)
Rem    pawolf      04/14/2014 - In wwv_flow_files: added wwv_flow_static_files and wwv_flow_company_static_files for backward compatibility
Rem    pawolf      04/17/2014 - In wwv_flow_files: added trigger to avoid ORA-01732: data manipulation operation not legal on this view
Rem    cneumuel    05/20/2014 - Added wwv_flow_temp_files, exclude temp session files from wwv_flow_files (bug #15844363)
Rem    jkallman    06/03/2014 - Exposed instrumentation columns in wwv_flow_user_mail_log, wwv_flow_user_mail_queue
Rem    vuvarov     06/05/2014 - In wwv_multi_component_export: added message_language to Text Messages
Rem    cneumuel    06/06/2014 - In wwv_flow_files_iot: support insert, because that also worked in 4.x. On insert/update, compute doc_size and check workspace limits (feature #1198)
Rem    cneumuel    06/10/2014 - Added wwv_flow_workspace_file_stats (feature #1198)
Rem    cneumuel    06/11/2014 - Renamed wwv_flow_workspace_file_stats to wwv_flow_company_filestats, added wwv_flow_company_filestats_dev (feature #1198)
Rem    cneumuel    06/12/2014 - In wwv_flow_company_filestats: added plugin files and themes (feature #1198)
Rem    cneumuel    07/16/2014 - In wwv_flow_company_filestats_dev, wwv_flow_company_filestats: use message name in file_type and add file_newest/file_oldest for 4350:85
Rem    pawolf      07/22/2014 - Renamed legacy column in plug-in and property tables to deprecated
Rem    cneumuel    08/04/2014 - Added wwv_flow_current_sgid (bug #19306482)
Rem                           - Made wwv_flow_dual100 a view
Rem                           - In wwv_flow_user_activity_log, wwv_flow_user_access_log, wwv_flow_user_mail_log, wwv_flow_user_mail_attachments, wwv_flow_user_mail_attachments, wwv_flow_files, wwv_flow_collections,
Rem                           - wwv_flow_clickthru_log, wwv_flow_plsql_jobs, wwv_flow_users, wwv_flow_group_users, wwv_flow_list_of_values_data_v, wwv_flow_lists_of_values$_v: use wwv_flow_current_sgid
Rem                           - Added IOT triggers for wwv_flow_user_mail_queue, wwv_flow_user_mail_attachments, wwv_flow_temp_files
Rem    cneumuel    08/05/2014 - In wwv_flow_current_sgid: use sys.dual, prefix wwv_flow_t_varchar2 with apex schema name
Rem    cneumuel    08/05/2014 - Removed grants to public
Rem    vuvarov     08/06/2014 - Use cast() in NLS-dependent views (bug 19351979)
Rem    jkallman    08/17/2014 - Correct message name used for m_reset_to_null in wwv_flow_data_view view
Rem    hfarrell    09/18/2014 - In wwv_flow_developer_workspaces: added SGID condition - to return Internal Admin user (required for account mega menu display)
Rem    hfarrell    01/28/2015 - In wwv_flow_templates_all and wwv_flow_templates_used: add is_popup - to help identity dialog page templates
Rem    cneumuel    02/19/2015 - Added wwv_flow_admin_all_schemas: for instance admin LOVs of schemas that can be assigned to workspaces (bug #20566442)
Rem    cneumuel    02/23/2015 - In wwv_flow_admin_all_schemas no restriction on HTMLDB_PUBLIC_USER, FLOWS_FILES, SCHEDULER, PEOPLE, APEX_PUBLIC_USER anymore. all restrictions except for FLOWS% and APEX% are in wwv_flow_restricted_schemas (bug #20569037)
Rem    pawolf      03/18/2015 - In wwv_flow_files: include migrated static workspace and application files which do not exist anymore (bug #20729418)
Rem                           - In wwv_flow_company_filestats: do not include migrated static workspace and application files (bug #20729418)
Rem    msewtz      07/07/2015 - Changed APEX_050000 references to APEX_050100
Rem    cneumuel    08/03/2015 - In wwv_flow_pool_config, wwv_flow_lsnr_workspaces: make sure UPDATED column has some value (bug #21537995)
Rem    cneumuel    09/17/2015 - Dropped wwv_flow_version (bug #20197863)
Rem    hfarrell    11/18/2015 - In wwv_flow_pool_config: modifications for ORDS 3.0.3 (bug #22232069) NOTE:any future changes to this view must be applied to ORDS patch (see 5.0.1 PSE 21537995)
Rem    cneumuel    02/08/2016 - Added wwv_flow_debug_messages_v
Rem    pawolf      02/26/2016 - Added WWV_FLOW.AJAX
Rem    pawolf      03/15/2016 - In wwv_flow_native_plugins: added support for supported_component_types and supported_data_types
Rem    jkallman    03/15/2016 - Added app_id to wwv_flow_user_mail_queue, wwv_flow_user_mail_log
Rem    pawolf      04/13/2016 - In wwv_flow_plugins: added is_legacy
Rem    cczarski    04/16/2016 - In wwv_flow_instance_rest_stats: Added public_page_events and workspace_login_events
Rem    pawolf      06/13/2016 - In wwv_flow_debug_messages_v: changed execution_time to be the execution time from the current debug entry to the next entry
Rem    cczarski    06/23/2016 - Simplify wwv_flow_instance_rest_stats view since all required columns are now in wwv_flow_log_history
Rem    cczarski    06/23/2016 - added view WWV_FLOW_LOG_HISTORY_V for old WWV_FLOW_LOG_HISTORY rows w/o application name and workspace name
Rem    jstraub     07/22/2016 - In wwv_multi_component_export fixed POPUP LOV TEMPLATE case to also filter by component id (bug 20775221)
Rem    cneumuel    08/03/2016 - In wwv_flow_developer_workspaces, wwv_flow_workspace_users: treat users with SQL priv as developers (bug #24347447)
Rem    cneumuel    08/10/2016 - Moved wwv_flow_utilities.push/split/join/format to wwv_flow_string. (feature #2044)
Rem    cneumuel    08/10/2016 - Removed wwv_flow_plsql_jobs (feature #2046)
Rem    jkallman    10/28/2016 - Added mail_id to wwv_flow_user_mail_log (Bug 15966408)
Rem    hfarrell    01/05/2017 - Changed APEX_050100 reference to APEX_050200
Rem    cczarski    01/30/2017 - added view wwv_flow_instance_rest_ws to return provisioned workspaces for Admin REST services (bug #25467564)
Rem    cneumuel    02/06/2017 - In wwv_flow_user_mail_log, wwv_flow_user_mail_queue, wwv_flow_user_mail_attachments: added workspace id/name (bug #25299037)
Rem                           - In wwv_flow_user_mail_log: added mail_message_id (bug #25311325)
Rem    pawolf      03/09/2017 - In wwv_multi_component_export: added credentials and remote servers (feature #2109)
Rem    cneumuel    04/26/2017 - In wwv_flow_user_mail_log, wwv_flow_user_mail_queue, wwv_flow_user_mail_attachments, wwv_flow_current_sgid: make sure current_user is not merged into query (bug #25951335)
Rem    cczarski    05/16/2017 - In wwv_multi_component_export: added web sources (feature #2092)
Rem    cneumuel    08/16/2017 - In wwv_flow_developer_workspaces: exclude INTERNAL on 4550's workspace selection for CLOUD_IDM (bug #25791440)
Rem    jstraub     08/29/2017 - Added wwv_flow_mime_mapping_v
Rem    jstraub     11/21/2017 - Added wwv_flow_webservice_log
Rem    cneumuel    11/24/2017 - In wwv_flow_tabset_view: use ora_hash(tab_set) for id, since page designer expects a number
Rem    cneumuel    12/12/2017 - In wwv_flow_user_activity_log: null for removed columns (feature #1878)
Rem    cneumuel    12/13/2017 - Moved wwv_flow_data_view to dev_views.sql (bug #26880410)
Rem    cbcho       01/05/2018 - In wwv_multi_component_export: added application setting (feature #2257) 
Rem    cneumuel    01/17/2018 - Removed APEX schema name references
Rem    cbcho       01/17/2018 - In wwv_multi_component_export: added wwv_flow_app_acl_roles (feature #2268)
Rem    cneumuel    01/18/2018 - Determine APPUN based on current_schema. We need fully qualified references to wwv_flow_t_varchar2 to avoid deps on the pub syn.
Rem    cneumuel    01/23/2018 - In wwv_flow_ws_app_and_auth,wwv_flow_ws_app_and_auth_trg: added cookie_type (feature #1609)
Rem    cneumuel    01/26/2018 - In wwv_multi_component_export: APP ACL based on wwv_flow_fnd_user_groups (feature #2268)
Rem    cneumuel    02/05/2018 - Added wwv_flow_fnd_user_groups_noapp, for workspace groups without app specific roles
Rem    cneumuel    03/19/2018 - case sensitive comparison (bug #27716666)
Rem    pawolf      04/05/2018 - In wwv_flow_tabset_view: removed usage of ora_hash(tab_set) for id (bug #27019892)
Rem    cneumuel    04/27/2018 - In wwv_flow_current_sgid, wwv_flow_current_workspaces: use dual. Added wwv_flow_current_ws_for_dml for views that should support DML (bug #27566551)
Rem    cczarski    05/08/2018 - change WWV_FLOW_FILES and WWV_FLOW_TEMP_FILES to use wwv_flow_current_sgid_for_dml instead of wwv_flow_current_ws_for_dml (bug 27979774)
Rem    cneumuel    07/23/2018 - Made wwv_flow_upgrade_progress a view (feature #2344)

col APPUN new_val APPUN
set termout off
select sys_context('userenv','current_schema') APPUN from sys.dual;
set termout on

--==============================================================================
-- view that provides a single row with the current workspace id and prevents
-- locking (table(...) can not be locked).
--==============================================================================
prompt ...wwv_flow_current_sgid view
create or replace view wwv_flow_current_sgid as
select nullif(wwv_flow.get_sgid,0)                       security_group_id,
       cu,
       nls_sort,
       (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) has_apex_admin_read_role_yn
  from ( select /*+ no_merge cardinality(t 1) */
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from sys.dual t ) d
/
--==============================================================================
-- view that provides rows for all workspaces that are available to the current
-- user and which can not be locked.
--==============================================================================
prompt ...wwv_flow_current_workspaces view
create or replace view wwv_flow_current_workspaces as
select w.provisioning_company_id  workspace_id,
       w.short_name               workspace,
       w.short_name               workspace_name,
       w.display_name             workspace_display_name,
       w.first_schema_provisioned
  from wwv_flow_companies w,
       ( select /*+ no_merge cardinality(t 1) */
                nullif(wwv_flow.get_sgid,0)           security_group_id,
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from sys.dual t ) d
 where (   d.security_group_id = w.provisioning_company_id
        or (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) = 'Y'
        or w.provisioning_company_id     in ( select security_group_id
                                                from wwv_flow_company_schemas s
                                               where s.schema = d.cu
                                                 and (   d.nls_sort = 'BINARY'
                                                      or nlssort(s.schema,'NLS_SORT=BINARY')=nlssort(d.cu,'NLS_SORT=BINARY'))))
   and w.provisioning_company_id <> 0
/
--==============================================================================
-- Alternative version that allows DML on the main view. Note that predicate
-- pushdown does not automatically work on this view. The outer query can use
-- the push_pred hint, though.
--==============================================================================
prompt ...wwv_flow_current_ws_for_dml view
create or replace view wwv_flow_current_ws_for_dml as
select w.provisioning_company_id  workspace_id,
       w.short_name               workspace,
       w.short_name               workspace_name,
       w.display_name             workspace_display_name,
       w.first_schema_provisioned
  from wwv_flow_companies w,
       ( select /*+ no_merge cardinality(t 1) */
                nullif(wwv_flow.get_sgid,0)           security_group_id,
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from table(^APPUN..wwv_flow_t_varchar2('X')) t ) d
 where (   d.security_group_id = w.provisioning_company_id
        or (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) = 'Y'
        or w.provisioning_company_id     in ( select security_group_id
                                                from wwv_flow_company_schemas s
                                               where s.schema = d.cu
                                                 and (   d.nls_sort = 'BINARY'
                                                      or nlssort(s.schema,'NLS_SORT=BINARY')=nlssort(d.cu,'NLS_SORT=BINARY'))))
   and w.provisioning_company_id <> 0
/

--==============================================================================
prompt ...wwv_flow_current_sgid_for_dml view
create or replace view wwv_flow_current_sgid_for_dml as
select nullif(wwv_flow.get_sgid,0)                       security_group_id,
       cu,
       nls_sort,
       (select wwv_flow_security.has_apex_admin_read_role_yn(cu) from sys.dual) has_apex_admin_read_role_yn
  from ( select /*+ no_merge cardinality(t 1) */
                sys_context('userenv','current_user') cu,
                sys_context('userenv','nls_sort')     nls_sort
           from table(^APPUN..wwv_flow_t_varchar2('X')) t ) d
/

--==============================================================================
prompt ...wwv_flow_activity_log view
create or replace view wwv_flow_activity_log as
    select * from wwv_flow_activity_log1$ union all
    select * from wwv_flow_activity_log2$
/

--==============================================================================
prompt ...wwv_flow_webservice_log view
create or replace view wwv_flow_webservice_log as
    select * from wwv_flow_webservice_log1$ union all
    select * from wwv_flow_webservice_log2$
/

--==============================================================================
prompt ...wwv_flow_user_activity_log view
create or replace view wwv_flow_user_activity_log as
    select time_stamp,
           null component_type,
           null component_name,
           ( select upper(name)
               from wwv_flow_steps
              where id = a.step_id
                and flow_id = a.flow_id ) component_attribute,
           null information,
           elap,
           num_rows,
           userid,
           ip_address,
           user_agent,
           flow_id,
           step_id,
           session_id,
           sqlerrm,
           sqlerrm_component_type,
           sqlerrm_component_name,
           page_mode,
           null application_info,
           worksheet_id,
           ir_search,
           ir_report_id,
           websheet_id,
           webpage_id,
           datagrid_id,
           content_length
      from wwv_flow_current_sgid sgid,
           wwv_flow_activity_log a
     where a.security_group_id = sgid.security_group_id
/
comment on table wwv_flow_user_activity_log is 'All developer and application run-time activity';
comment on column wwv_flow_user_activity_log.time_stamp is 'Date and time that activity was logged at the end of the page view.';
comment on column wwv_flow_user_activity_log.component_type is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.component_name is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.component_attribute is 'Title of page.';
comment on column wwv_flow_user_activity_log.information is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.elap is 'Elapsed time of page view in seconds.';
comment on column wwv_flow_user_activity_log.num_rows is 'Number of rows processed on page.';
comment on column wwv_flow_user_activity_log.userid is 'User ID performing page view.';
comment on column wwv_flow_user_activity_log.ip_address is 'IP address of client.';
comment on column wwv_flow_user_activity_log.ir_report_id is 'Interactive report ID';
comment on column wwv_flow_user_activity_log.ir_search is 'Interactive report search criteria entered by users.';
comment on column wwv_flow_user_activity_log.user_agent is 'Web browser user agent of client.';
comment on column wwv_flow_user_activity_log.flow_id is 'Application ID.';
comment on column wwv_flow_user_activity_log.step_id is 'Page number.';
comment on column wwv_flow_user_activity_log.session_id is 'Oracle Application Express session identifier.';
comment on column wwv_flow_user_activity_log.sqlerrm is 'SQL Error message.';
comment on column wwv_flow_user_activity_log.sqlerrm_component_type is 'Reserved for future use.';
comment on column wwv_flow_user_activity_log.sqlerrm_component_name is 'Reserved for future use.';


--==============================================================================
prompt ...wwv_flow_user_access_log_v view
create or replace view wwv_flow_user_access_log_v as
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text, security_group_id
      from wwv_flow_user_access_log1$
    union all
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text, security_group_id
      from wwv_flow_user_access_log2$
/

--==============================================================================
prompt ...wwv_flow_user_access_log view
create or replace view wwv_flow_user_access_log as
    select login_name, authentication_method, application, owner, access_date, ip_address, remote_user, authentication_result, custom_status_text
      from wwv_flow_current_sgid sgid,
           wwv_flow_user_access_log_v a
     where a.security_group_id = sgid.security_group_id
/
comment on table wwv_flow_user_access_log is 'Login log for the current workspace';

--==============================================================================
prompt ...wwv_flow_user_mail_log view
create or replace view wwv_flow_user_mail_log as
    select mail_id,
       mail_message_id,
       mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_message_created, mail_message_send_begin, mail_message_send_end,
       mail_body_size, mail_body_html_size, mail_attachment_count, mail_attachment_size, mail_send_error, last_updated_on, flow_id app_id,
       a.security_group_id workspace_id,
       w.workspace_name
  from wwv_flow_mail_log           a,
       wwv_flow_current_workspaces w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_mail_log is 'Email send log for the current workspace';

--==============================================================================
prompt ...wwv_flow_user_mail_queue view
create or replace view wwv_flow_user_mail_queue
    (id, mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_body, mail_body_html, mail_send_count, mail_send_error, last_updated_by, last_updated_on, mail_message_created, mail_message_created_by, app_id,
     workspace_id,
     workspace_name )
as
select a.id, mail_to, mail_from, mail_replyto, mail_subj, mail_cc, mail_bcc, mail_body, mail_body_html, mail_send_count, mail_send_error, last_updated_by, last_updated_on, mail_message_created, last_updated_by, flow_id,
       a.security_group_id,
       w.workspace_name
  from wwv_flow_mail_queue         a,
       wwv_flow_current_ws_for_dml w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_mail_queue is 'Outgoing email queue for the current workspace';

create or replace trigger wwv_flow_user_mail_queue_iot
instead of delete
on wwv_flow_user_mail_queue
for each row
begin
    delete from wwv_flow_mail_queue
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id;
end wwv_flow_user_mail_queue_iot;
/

--==============================================================================
prompt ...wwv_flow_user_mail_attachments view
create or replace view wwv_flow_user_mail_attachments as
select a.id, mail_id, filename, mime_type, inline, attachment, last_updated_by, last_updated_on,
       a.security_group_id workspace_id,
       w.workspace_name
  from wwv_flow_mail_attachments   a,
       wwv_flow_current_ws_for_dml w
 where a.security_group_id = w.workspace_id
/
comment on table wwv_flow_user_mail_attachments is 'Attachments of emails in the outgoing email queue for the current workspace';

create or replace trigger wwv_flow_user_mail_atts_iot
instead of delete
on wwv_flow_user_mail_attachments
for each row
begin
    delete from wwv_flow_mail_attachments
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id;
end wwv_flow_user_mail_atts_iot;
/

--==============================================================================
prompt ...wwv_flow_temp_files view
create or replace view wwv_flow_temp_files as
  select id,
         flow_id            application_id,
         name,
         filename,
         mime_type,
         created_on,
         blob_content
    from wwv_flow_current_sgid_for_dml sgid,
         wwv_flow_file_objects$      a
   where a.security_group_id = sgid.security_group_id
     and session_id          = ( select nv('SESSION') from sys.dual )
with check option
/
comment on table wwv_flow_temp_files                  is 'Application Express (APEX) temporary upload files, automatically deleted at end of request processing or session';
comment on column wwv_flow_temp_files.id              is 'Primary key that identifies the file';
comment on column wwv_flow_temp_files.application_id  is 'Key that identifies the application';
comment on column wwv_flow_temp_files.name            is 'Unique name of the uploaded file';
comment on column wwv_flow_temp_files.filename        is 'Name of the uploaded file, without the unique prefix';
comment on column wwv_flow_temp_files.mime_type       is 'Mime Type';
comment on column wwv_flow_temp_files.created_on      is 'Date of creation';
comment on column wwv_flow_temp_files.blob_content    is 'BLOB file content';

create or replace trigger wwv_flow_temp_files_iot
instead of delete on wwv_flow_temp_files
for each row
begin
    delete from wwv_flow_file_objects$
     where id                = :old.id
       and security_group_id = wwv_flow_security.g_security_group_id
       and session_id        = wwv_flow.g_instance;
end wwv_flow_temp_files_iot;
/

--==============================================================================
prompt ...wwv_flow_files view
create or replace view wwv_flow_files as
  select id,
         flow_id,
         name,
         filename,
         title,
         mime_type,
         doc_size,
         dad_charset,
         created_by,
         created_on,
         updated_by,
         updated_on,
         last_updated,
         content_type,
         blob_content,
         language,
         description,
         file_type,
         file_charset
    from wwv_flow_current_sgid_for_dml  sgid,
         wwv_flow_file_objects$       a
   where a.security_group_id = sgid.security_group_id
     and session_id        is null
     and (  file_type is null
         or file_type not in ( 'IMAGE_FILE', 'CSS_FILE', 'STATIC_FILE' ) /* files are now stored in wwv_flow_static_files and wwv_flow_company_static_files */
         or ( /* include legacy static files which don't exist in the workspace and app static file table anymore, because wwv_flow_file_mgr.get_file
                 will still access them in fallback mode (bug #20729418)
              */
                file_type in ( 'IMAGE_FILE', 'CSS_FILE', 'STATIC_FILE' )
            and (  (   flow_id = 0
                   and not exists ( select 1
                                      from wwv_flow_company_static_files
                                     where security_group_id = a.security_group_id
                                       and file_name         = a.filename
                                  )
                   )
                or (   flow_id <> 0
                   and not exists ( select 1
                                      from wwv_flow_static_files
                                     where security_group_id = a.security_group_id
                                       and flow_id           = a.flow_id
                                       and file_name         = a.filename
                                  )
                   )
                )
            )
         )
   union all
  select id,
         flow_id,
         to_char( id ) || '/' || file_name as name,
         file_name,
         null as title,
         mime_type,
         sys.dbms_lob.getlength( file_content ) as doc_size,
         null as dad_charset,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         last_updated_on,
         null as content_type,
         file_content,
         null as language,
         null as description,
         case
           when upper( mime_type ) like 'IMAGE%' then 'IMAGE_FILE'
           when upper( mime_type ) = 'TEXT/CSS'  then 'CSS_FILE'
           else 'STATIC_FILE'
         end as file_type,
         file_charset
    from wwv_flow_static_files
   where security_group_id = ( select wwv_flow.get_sgid from sys.dual )
   union all
  select id,
         0 as flow_id,
         to_char( id ) || '/' || file_name as name,
         file_name,
         null as title,
         mime_type,
         sys.dbms_lob.getlength( file_content ) as doc_size,
         null as dad_charset,
         created_by,
         created_on,
         last_updated_by,
         last_updated_on,
         last_updated_on,
         null as content_type,
         file_content,
         null as language,
         null as description,
         case
           when upper( mime_type ) like 'IMAGE%' then 'IMAGE_FILE'
           when upper( mime_type ) = 'TEXT/CSS'  then 'CSS_FILE'
           else 'STATIC_FILE'
         end as file_type,
         file_charset
    from wwv_flow_company_static_files
   where security_group_id = ( select wwv_flow.get_sgid from sys.dual )
/
create or replace trigger wwv_flow_files_iot
instead of insert or update or delete
on wwv_flow_files
for each row
declare
    l_new_doc_size number;
begin
    if deleting then
        delete wwv_flow_file_objects$
         where id                = :old.id
           and security_group_id = wwv_flow_security.g_security_group_id;
    else
        wwv_flow_api.check_api_use_allowed;

        if :new.blob_content is not null then
            l_new_doc_size := sys.dbms_lob.getlength(:new.blob_content);
        else
            l_new_doc_size := 0;
        end if;

        if updating then
            update wwv_flow_file_objects$
            set flow_id      = :new.flow_id,
                name         = :new.name,
                filename     = :new.filename,
                title        = :new.title,
                mime_type    = :new.mime_type,
                doc_size     = l_new_doc_size,
                dad_charset  = :new.dad_charset,
                content_type = :new.content_type,
                blob_content = :new.blob_content,
                language     = :new.language,
                description  = :new.description,
                file_type    = :new.file_type,
                file_charset = :new.file_charset
            where id                = :old.id
            and security_group_id = wwv_flow_security.g_security_group_id;
        else
            insert into wwv_flow_file_objects$ (
                id,
                flow_id,
                name,
                filename,
                title,
                mime_type,
                doc_size,
                dad_charset,
                created_by,
                created_on,
                updated_by,
                updated_on,
                last_updated,
                content_type,
                blob_content,
                language,
                description,
                file_type,
                file_charset )
            values (
                :new.id,
                :new.flow_id,
                :new.name,
                :new.filename,
                :new.title,
                :new.mime_type,
                l_new_doc_size,
                :new.dad_charset,
                :new.created_by,
                :new.created_on,
                :new.updated_by,
                :new.updated_on,
                :new.last_updated,
                :new.content_type,
                :new.blob_content,
                :new.language,
                :new.description,
                :new.file_type,
                :new.file_charset );
        end if;

        if inserting
           or :old.doc_size is null
           or :old.doc_size <> l_new_doc_size
        then
            wwv_flow_file_api.check_workspace_limits;
        end if;
    end if;
end;
/
comment on table wwv_flow_files is 'Uploaded files';
--==============================================================================
-- utility view for wwv_flow_company_filestats, for development environment
-- related file stats. if the development environment is installed, the version
-- in dev_views.sql overwrites this view.
--==============================================================================
prompt ...wwv_flow_company_filestats_dev view
create or replace view wwv_flow_company_filestats_dev (
    security_group_id,
    file_type,
    file_newest,
    file_oldest,
    file_bytes,
    file_count )
as
select 0, 'x', max(sysdate), min(sysdate), 0, 0
  from sys.dual
 where 1=2
/
--==============================================================================
prompt ...wwv_flow_company_filestats view
create or replace view wwv_flow_company_filestats (
    security_group_id,
    file_type,
    file_newest,
    file_oldest,
    file_bytes,
    file_count )
as
select security_group_id, 'EXPORT REPOSITORY', max(created_on), min(created_on), nvl(sum(doc_size),0), count(*)
from WWV_FLOW_FILE_OBJECTS$
where file_type in ( 'FLOW_EXPORT','PLUGIN','PAGE_EXPORT','CSS_EXPORT',
                     'IMAGE_EXPORT','THEME','UI_DEFAULTS','FILE_EXPORT')
group by security_group_id
union all
select security_group_id, 'OTHER WORKSPACE FILES', max(created_on), min(created_on), nvl(sum(doc_size),0), count(*)
 from WWV_FLOW_FILE_OBJECTS$
 where ( file_type is null
         or file_type not in ( 'FLOW_EXPORT','PLUGIN','PAGE_EXPORT','CSS_EXPORT',
                               'IMAGE_EXPORT','THEME','UI_DEFAULTS','FILE_EXPORT',
                               'IMAGE_FILE', 'CSS_FILE', 'STATIC_FILE' ))
group by security_group_id
union all
select security_group_id, 'STATIC WORKSPACE FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(file_content)),0), count(*)
from wwv_flow_company_static_files
group by security_group_id
union all
select security_group_id, 'STATIC APPLICATION FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(file_content)),0), count(*)
from wwv_flow_static_files
group by security_group_id
union all
select security_group_id, 'PLUG-IN FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(FILE_CONTENT)),0), count(*)
from WWV_FLOW_PLUGIN_FILES
group by security_group_id
union all
select security_group_id, 'THEME FILES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(FILE_CONTENT)),0), count(*)
from WWV_FLOW_THEME_FILES
group by security_group_id
union all
select security_group_id, 'THEME IMAGES', max(created_on), min(created_on), nvl(sum(sys.dbms_lob.getlength(THEME_IMAGE)),0), count(*)
from WWV_FLOW_THEMES
group by security_group_id
union all
select * from wwv_flow_company_filestats_dev
/
--==============================================================================
prompt ...wwv_flow_collections view
create or replace view wwv_flow_collections as
    select c.collection_name, m.seq_id, m.c001, m.c002, m.c003, m.c004, m.c005, m.c006, m.c007,
           m.c008, m.c009, m.c010, m.c011, m.c012, m.c013, m.c014, m.c015, m.c016, m.c017,
           m.c018, m.c019, m.c020, m.c021, m.c022, m.c023, m.c024, m.c025, m.c026, m.c027,
           m.c028, m.c029, m.c030, m.c031, m.c032, m.c033, m.c034, m.c035, m.c036, m.c037,
           m.c038, m.c039, m.c040, m.c041, m.c042, m.c043, m.c044, m.c045, m.c046, m.c047,
           m.c048, m.c049, m.c050, m.clob001, m.blob001, m.xmltype001, m.n001, m.n002, m.n003,
           m.n004, m.n005, m.d001, m.d002, m.d003, m.d004, m.d005, m.md5_original
      from wwv_flow_current_sgid sgid,
           wwv_flow_collections$ c,
           wwv_flow_collection_members$ m
     where c.session_id = (select v('SESSION') from sys.dual)
       and c.security_group_id = sgid.security_group_id
       and c.id = m.collection_id
       and c.flow_id = (select nv('FLOW_ID') from sys.dual)
/
comment on table wwv_flow_collections is 'Session-based nonscalar store';

--==============================================================================
prompt ...wwv_flow_clickthru_log_v view
create or replace view wwv_flow_clickthru_log_v as
    select clickdate, category, id, flow_user, ip, security_group_id
      from wwv_flow_clickthru_log$
    union all
    select clickdate, category, id, flow_user, ip, security_group_id
      from wwv_flow_clickthru_log2$
/

--==============================================================================
prompt ...wwv_flow_clickthru_log view
create or replace view wwv_flow_clickthru_log as
    select clickdate, category, id, flow_user, ip
      from sys.dual bug19306482,
           wwv_flow_clickthru_log_v
     where security_group_id = (select wwv_flow.get_sgid from sys.dual)
/

--==============================================================================
prompt ...wwv_flow_tabset_view view
create or replace view wwv_flow_tabset_view as
select tab_set ||
       replace(' ('||
       max(decode(seq,1,tab_text,null))||
       max(decode(seq,2,', '||tab_text,null))||
       max(decode(seq,3,', '||tab_text,null))||
       max(decode(seq,4,'...',null))||
       ')','&'||'nbsp;',' ') d,
       tab_set r,
       flow_id,
       security_group_id,
       tab_set as id
from (
select flow_id, security_group_id, tab_set, tab_text, tab_sequence, row_number() over (partition by tab_set order by tab_sequence nulls last) seq
from wwv_flow_tabs
where flow_id = (select v('FB_FLOW_ID') from sys.dual) ) x
group by flow_id, security_group_id, tab_set
/

--==============================================================================
prompt ...wwv_flow_tabset_view2 view
create or replace view wwv_flow_tabset_view2 as
select d,r from(
    select tab_set ||
           replace(' ('||
           max(decode(seq,1,tab_text,null))||
           max(decode(seq,2,', '||tab_text,null))||
           max(decode(seq,3,', '||tab_text,null))||
           max(decode(seq,4,'...',null))||
           ')','&'||'nbsp;',' ') d,
           tab_set r, 1 ob
    from (
    select tab_set, tab_text, tab_sequence, row_number() over (partition by tab_set order by tab_sequence nulls last) seq
    from wwv_flow_tabs
    where flow_id = (select v('FB_FLOW_ID') from sys.dual) ) x
    group by tab_set
    union
    (select CURRENT_ON_TABSET d,CURRENT_ON_TABSET r, 2 ob
       from wwv_flow_toplevel_tabs
      where flow_id = (select v('FB_FLOW_ID') from sys.dual)
      minus
     select tab_set d,tab_set r,2 ob
       from wwv_flow_tabs
      where flow_id = (select v('FB_FLOW_ID') from sys.dual) )
    )
order by ob
/


--==============================================================================
prompt ...wwv_flow_list_of_values_data_v view
create or replace view wwv_flow_list_of_values_data_v
as
select id, lov_id, lov_disp_sequence, lov_disp_value, lov_return_value, lov_template, required_patch
  from wwv_flow_current_sgid sgid,
       wwv_flow_list_of_values_data w,
       (select wwv_flow_security.get_translated_flow_id flow_id from sys.dual) f
 where w.flow_id           = f.flow_id
   and w.security_group_id = sgid.security_group_id
/


--==============================================================================
prompt ...wwv_flow_lists_of_values$_v view
create or replace view wwv_flow_lists_of_values$_v
as
select id
  from wwv_flow_current_sgid sgid,
       wwv_flow_lists_of_values$ w,
       (select wwv_flow_security.get_flow_id flow_id from sys.dual) f
 where w.flow_id           = f.flow_id
   and w.security_group_id = sgid.security_group_id
/


--==============================================================================
prompt ...wwv_flow_build_options view
create or replace view wwv_flow_build_options as select * from wwv_flow_patches
/


--==============================================================================
-- Use cast() in NLS-dependent views to ensure the resulting data type is big enough for all languages
--
prompt ...calendar views

create or replace view wwv_flow_dual100
as
select level i
  from wwv_flow_current_sgid
connect by level <= 100
/

create or replace view wwv_flow_months_mon ( month_display, month_value )
as
select cast( to_char(to_date(to_char(rownum,'00'),'MM'),'Mon') as varchar2(128) ) as month,
       rownum as value
  from wwv_flow_dual100
 where rownum < 13;

create or replace view wwv_flow_months_month ( month_display, month_value )
as
select cast( to_char(to_date(to_char(rownum,'00'),'MM'),'Month') as varchar2(128) ) as month,
       rownum as value
  from wwv_flow_dual100
 where rownum < 13;

create or replace view wwv_flow_years(year_value) as
select i+1919 from wwv_flow_dual100
union all
select i+2019 from wwv_flow_dual100 where i < 32
/

create or replace view wwv_flow_hours_24 (hour_value) as
select i-1 from wwv_flow_dual100 where i < 25
/

create or replace view wwv_flow_hours_12 (hour_value) as
select i from wwv_flow_dual100 where i < 13
/

create or replace view wwv_flow_minutes_5 (minute_value) as
select (i-1)*5 from wwv_flow_dual100 where i < 13
/

create or replace view wwv_flow_minutes (minute_value) as
select i-1 from wwv_flow_dual100 where i < 61
/

--==============================================================================
-- Use cast() to ensure the resulting data type is big enough for all languages
--
prompt ...wwv_flow_format_masks view
create or replace view wwv_flow_format_masks as
select cast( d as varchar2(128) ) as d, r, t
  from ( select to_char((5234 + 10/100),'FML999G999G999G999G990D00') d, 'FML999G999G999G999G990D00' r, 'N' t from sys.dual
             union all
         select trim(to_char((5234 + 10/100),'999G999G999G999G990D00')) d, '999G999G999G999G990D00' r, 'N' t from sys.dual
             union all
         select trim(to_char((5234 + 10/100),'999G999G999G999G990D0000')) d, '999G999G999G999G990D0000' r, 'N' t from sys.dual
             union all
         select trim(to_char(5234,'999G999G999G999G999G999G990')) d, '999G999G999G999G999G999G990' r, 'N' t from sys.dual
             union all
         select trim(to_char((-5234 - 10/100),'999G999G999G999G990D00MI')) d, '999G999G999G999G990D00MI' r, 'N' t from sys.dual
             union all
         select trim(to_char((-5234 - 10/100),'S999G999G999G999G990D00')) d, 'S999G999G999G999G990D00' r, 'N' t from sys.dual
             union all
         select trim(to_char((-5234 - 10/100),'999G999G999G999G990D00PR')) d, '999G999G999G999G990D00PR' r, 'N' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-RR') d, 'DD-MON-RR' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY') d, 'DD-MON-YYYY' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON') d, 'DD-MON' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR-MON-DD') d, 'RR-MON-DD' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY-MM-DD') d, 'YYYY-MM-DD' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'fmDay, fmDD fmMonth, YYYY') d, 'fmDay, fmDD fmMonth, YYYY' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, 'DD-MON-YYYY HH24:MI' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI:SS') d, 'DD-MON-YYYY HH24:MI:SS' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH:MIPM') d, 'DD-MON-YYYY HH:MIPM' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'Month') d, 'Month' r, 'D' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, 'DD-MON-YYYY HH24:MI' r, 'T' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH24.MI.SSXFF') d, 'DD-MON-YYYY HH24.MI.SSXFF' r, 'T' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH:MI:SSXFF PM') d, 'DD-MON-YYYY HH:MI:SSXFF PM' r, 'T' t from sys.dual
             union all
         select to_char(to_timestamp_tz('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI TZR') d, 'DD-MON-YYYY HH24:MI TZR' r, 'Z' t from sys.dual
             union all
         select to_char(to_timestamp_tz('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH24.MI.SSXFF TZR') d, 'DD-MON-YYYY HH24.MI.SSXFF TZR' r, 'Z' t from sys.dual
             union all
         select to_char(to_timestamp_tz('20040112143012.8675309','YYYYMMDDHH24MISS.FF'),'DD-MON-YYYY HH.MI.SSXFF PM TZR') d, 'DD-MON-YYYY HH.MI.SSXFF PM TZR' r, 'Z' t from sys.dual
             union all
         select wwv_flow_lang.system_message('SINCE_DATE_MASK') d, 'SINCE' r, 'S' t from sys.dual
             union all
         select wwv_flow_lang.system_message('SINCE_SHORT_DATE_MASK') d, 'SINCE_SHORT' r, 'S' t from sys.dual
             union all
         select wwv_flow_lang.system_message('BLOB_FORMAT_MASK') d, 'BLOB' r, 'Z' t from sys.dual
       )
/

--==============================================================================
-- Use cast() to ensure the resulting data type is big enough for all languages
--
prompt ...wwv_flow_chart_format_masks view
create or replace view wwv_flow_chart_format_masks as
select cast( d as varchar2(128) ) as d, r, t
  from ( select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-RR') d, '%dd-%MMM-%yy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY') d, '%dd-%MMM-%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON') d, '%dd-%MMM' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR-MON-DD') d, '%yy-%MMM-%dd' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY-MM-DD') d, '%yyyy-%MM-%dd' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'fmDay, fmDD fmMonth, YYYY') d, '%dddd, %dd %MMMM, %yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, '%dd-%MMM-%yyyy %HH:%mm' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI:SS') d, '%dd-%MMM-%yyyy %HH:%mm:%ss' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH:MIPM') d, '%dd-%MMM-%yyyy %hh:%mm%tt' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'Month') d, '%MMMM' r, 'D' t from sys.dual
             union all
         select to_char(to_timestamp('20040112143012','YYYYMMDDHH24MISS'),'DD-MON-YYYY HH24:MI') d, '%dd-%MMM-%yyyy %HH:%mm' r, 'T' t from sys.dual
             union all
         select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH24:MI DD.MM.YYYY') d, '%HH:%mm %dd.%MM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH24:MI:SS DD.MM.YYYY') d, '%HH:%mm:%ss %dd.%MM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143012','YYYYMMDDHH24MISS'),'HH:MIPM DD.MM.YYYY') d, '%HH:%mm%tt %dd.%MM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON.RR') d, '%dd.%MMM.%yy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON.YYYY') d, '%dd.%MMM.%yyyy' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'DD.MON') d, '%dd.%MMM' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'RR.MON.DD') d, '%yy.%MMM.%dd' r, 'D' t from sys.dual
             union all
         select to_char(to_date('20040112143000','YYYYMMDDHH24MISS'),'YYYY.MM.DD') d, '%yyyy.%MM.%dd' r, 'D' t from sys.dual
       )
/


--
-- T H E M E / T E M P L A T E   V I E W S
--

-- view to report on defined templates
create or replace view wwv_flow_templates_all
(security_group_id, flow_id, theme_id, theme_class_id, temp_type, name, id, is_popup)
as
with sgid as (
    select (select nv('FLOW_SECURITY_GROUP_ID') from sys.dual) sgid
      from sys.dual )
select security_group_id, flow_id, theme_id, theme_class_id, 'PAGE' temp_type, name ,id, is_popup from wwv_flow_templates,sgid where security_group_id=sgid -- page
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'REGION' temp_type, PAGE_PLUG_TEMPLATE_NAME ,id, null from wwv_flow_page_plug_templates,sgid where security_group_id=sgid -- region
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'REPORT' temp_type, ROW_TEMPLATE_NAME ,id, null from wwv_flow_row_templates,sgid where security_group_id=sgid -- report
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'LIST' temp_type, LIST_TEMPLATE_NAME ,id, null from wwv_flow_list_templates,sgid where security_group_id=sgid -- list
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'LABEL' temp_type, TEMPLATE_NAME ,id, null from wwv_flow_field_templates,sgid where security_group_id=sgid -- label
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'BUTTON' temp_type, TEMPLATE_NAME ,id, null from wwv_flow_button_templates,sgid where security_group_id=sgid -- button
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'MENU' temp_type, name ,id, null from wwv_flow_menu_templates,sgid where security_group_id=sgid -- menu
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'CALENDAR' temp_type, name, id, null from wwv_flow_cal_templates,sgid where security_group_id=sgid -- calendar
union all
select security_group_id, flow_id, theme_id, theme_class_id, 'POPUP' temp_type, page_name, id, null from wwv_flow_popup_lov_template,sgid where security_group_id=sgid -- popup_lov
/

-- view to report on defined templates
create or replace view wwv_flow_templates_used
(security_group_id, flow_id, temp_type, id, name,
 theme_id, theme_class_id, is_popup)
as
select t.*, a.name, to_char(a.theme_id),a.theme_class_id, a.is_popup from (
select security_group_id, flow_id, 'PAGE' temp_type ,step_template id from wwv_flow_steps where step_template is not null
union all
select security_group_id, flow_id, 'PAGE' temp_type ,error_template from wwv_flow_themes where error_template is not null
union all
select security_group_id, flow_id, 'PAGE' temp_type ,printer_friendly_template from wwv_flow_themes where printer_friendly_template is not null
-- region
union all
select security_group_id, flow_id, 'REGION', plug_template from wwv_flow_page_plugs where (plug_template != 0 and plug_template is not null)
-- report
union all
select security_group_id, flow_id,'REPORT',plug_query_row_template from wwv_flow_page_plugs where (plug_query_row_template not in (1,2,3) and plug_query_row_template is not null)
-- list
union all
select security_group_id, flow_id,'LIST',list_template_id from wwv_flow_page_plugs where list_template_id is not null
-- label
union all
select security_group_id, flow_id, 'LABEL',item_field_template from wwv_flow_step_items where item_field_template is not null
-- button
union all
select security_group_id, flow_id,'BUTTON',button_template_id from wwv_flow_step_buttons where button_template_id is not null
-- menu
union all
select security_group_id, flow_id,'MENU',menu_template_id from wwv_flow_page_plugs where menu_template_id is not null
-- calendar
union all
select security_group_id, flow_id, 'CALENDAR',template_id from wwv_flow_cals where template_id is not null
) t,
  wwv_flow_templates_all a,
  ( select (select nv('FLOW_SECURITY_GROUP_ID') from sys.dual) sgid
      from sys.dual )
where a.temp_type         = t.temp_type
  and a.id                = t.id
  and a.security_group_id = t.security_group_id
  and a.security_group_id = sgid
  and t.security_group_id = sgid
/

--==============================================================================
prompt ...wwv_multi_component_export view
create or replace view wwv_multi_component_export
as
select c.flow_id as flow_id,
       seq_id,
       component_type,
       case component_type
         when 'PAGE TEMPLATE'          then (select name from wwv_flow_templates where id = c.component_id and flow_id = c.flow_id)
         when 'LIST'                   then (select name from wwv_flow_lists where id = c.component_id and flow_id = c.flow_id)
         when 'BREADCRUMB'             then (select name from wwv_flow_menus where id = c.component_id and flow_id = c.flow_id)
         when 'BUTTON TEMPLATE'        then (select template_name from wwv_flow_button_templates where id = c.component_id and flow_id = c.flow_id)
         when 'REGION TEMPLATE'        then (select page_plug_template_name from wwv_flow_page_plug_templates where id = c.component_id and flow_id = c.flow_id)
         when 'LIST TEMPLATE'          then (select list_template_name from wwv_flow_list_templates where id = c.component_id and flow_id = c.flow_id)
         when 'REPORT TEMPLATE'        then (select row_template_name from wwv_flow_row_templates where id = c.component_id and flow_id = c.flow_id)
         when 'LABEL TEMPLATE'         then (select template_name from wwv_flow_field_templates where id = c.component_id and flow_id = c.flow_id)
         when 'BREADCRUMB TEMPLATE'    then (select name from wwv_flow_menu_templates where id = c.component_id and flow_id = c.flow_id)
         when 'CALENDAR TEMPLATE'      then (select name from wwv_flow_cal_templates where id = c.component_id and flow_id = c.flow_id)
         when 'SHORTCUTS'              then (select shortcut_name from wwv_flow_shortcuts where id = c.component_id and flow_id = c.flow_id)
         when 'POPUP LOV TEMPLATE'     then (select page_title from wwv_flow_popup_lov_template where id = c.component_id and flow_id = c.flow_id)
         when 'PAGE'                   then (select id||'. '||name n from wwv_flow_steps where id = c.component_id and flow_id = c.flow_id)
         when 'TAB'                    then (select tab_set||': '||tab_name||' ('||tab_text||')' n from wwv_flow_tabs where id = c.component_id and flow_id = c.flow_id)
         when 'PARENT TAB'             then (select tab_set||': '||tab_name||' ('||tab_text||')' n from wwv_flow_toplevel_tabs where id = c.component_id and flow_id = c.flow_id)
         when 'LOV'                    then (select lov_name n from wwv_flow_lists_of_values$ where id = c.component_id and flow_id = c.flow_id)
         when 'NAVBAR'                 then (select icon_sequence||'. '||icon_image_alt||' ('||icon_image||')' n from wwv_flow_icon_bar where id = c.component_id and flow_id = c.flow_id)
         when 'SECURITY SCHEME'        then (select name n from wwv_flow_security_schemes where id = c.component_id and flow_id = c.flow_id)
         when 'APP ACL'                then (select group_name n from wwv_flow_fnd_user_groups where id = c.component_id and flow_id = c.flow_id)
         when 'TREE'                   then (select tree_name n from wwv_flow_trees where id = c.component_id and flow_id = c.flow_id)
         when 'PAGE GROUP'             then (select group_name n from wwv_flow_page_groups where id = c.component_id and flow_id = c.flow_id)
         when 'APP ITEM'               then (select name from wwv_flow_items where id = c.component_id and flow_id = c.flow_id)
         when 'APP PROCESS'            then (select process_name n from wwv_flow_processing where id = c.component_id and flow_id = c.flow_id)
         when 'APP COMPUTATION'        then (select computation_sequence||'. '||computation_item n from wwv_flow_computations where id = c.component_id and flow_id = c.flow_id)
         when 'APP SETTING'            then (select name n from wwv_flow_app_settings where id = c.component_id and flow_id = c.flow_id)
         when 'BREADCRUMB ENTRY'       then (select (select name from wwv_flow_menus where id = be.menu_id)||': '||short_name||' ('||page_id||')' n from wwv_flow_menu_options be where id = c.component_id and flow_id = c.flow_id)
         when 'SHARED QUERY'           then (select name from wwv_flow_shared_queries where id = c.component_id and flow_id = c.flow_id)
         when 'REPORT LAYOUT'          then (select report_layout_name from wwv_flow_report_layouts where id = c.component_id and flow_id = c.flow_id)
         when 'WEB SERVICE'            then (select name from wwv_flow_shared_web_services where id = c.component_id and flow_id = c.flow_id)
         when 'DATA LOADING'           then (select name from wwv_flow_load_tables where id = c.component_id and flow_id = c.flow_id)
         when 'AUTH SETUP'             then (select name from wwv_flow_authentications where id = c.component_id and flow_id = c.flow_id)
         when 'BUILD OPTION STATUS'    then (select patch_name from wwv_flow_patches where id = c.component_id and flow_id = c.flow_id)
         when 'BUILD OPTION'           then (select patch_name from wwv_flow_patches where id = c.component_id and flow_id = c.flow_id)
         when 'PLUGIN'                 then (select display_name from wwv_flow_plugins where id = c.component_id and flow_id = c.flow_id)
         when 'MESSAGES'               then (select name || ' (' || message_language || ')' from wwv_flow_messages$ where id = c.component_id and flow_id = c.flow_id)
         when 'CREDENTIAL'             then (select c.name from wwv_credentials c, wwv_flow_current_sgid w where c.id = c.component_id and c.security_group_id = w.security_group_id)
         when 'REMOTE SERVER'          then (select r.name from wwv_remote_servers r, wwv_flow_current_sgid w where r.id = c.component_id and r.security_group_id = w.security_group_id)
         when 'WEB SOURCE'             then (select name from wwv_flow_web_src_modules where id = c.component_id and flow_id = c.flow_id)
         end           as component_name,
       c.component_id
  from ( select to_number(c003) as flow_id,
                seq_id,
                c001            as component_type,
                to_number(c002) as component_id
           from wwv_flow_collections
          where collection_name = 'MULTI_COMPONENT_EXPORT' ) c
;

--==============================================================================
prompt ...wwv_flow_native_plugins view
create or replace view wwv_flow_native_plugins
as
select id,
       plugin_type,
       name,
       'NATIVE_'||name as name_with_prefix,
       display_name || case
                         when is_deprecated = 'Y' then wwv_flow_lang.system_message( 'PLUGIN.DEPRECATED' )
                         when is_legacy     = 'Y' then wwv_flow_lang.system_message( 'PLUGIN.LEGACY' )
                       end as display_name,
       category,
       supported_ui_types,
       supported_component_types,
       supported_data_types,
       standard_attributes,
       sql_min_column_count,
       sql_max_column_count,
       sql_examples,
       is_deprecated,
       is_legacy,
       is_quick_pick,
       help_text
  from wwv_flow_plugins
 where flow_id           = nvl((select wwv_flow_lang.get_translated_application_id(4411) from sys.dual), 4411)
   and security_group_id = 10
;

--==============================================================================
prompt ...wwv_flow_javascript_events view
create or replace view wwv_flow_javascript_events as
select d, r, g, supported_ui_types
  from ( select 1            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.system_message('EVENT.BROWSER.' || name) as d,
                name         as r,
                wwv_flow_lang.system_message('EVENT.BROWSER') as g,
                supported_ui_types
           from wwv_flow_standard_events
          where event_type = 'BROWSER'
          union all
        select  2            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.system_message('EVENT.FRAMEWORK.' || name) as d,
                name         as r,
                wwv_flow_lang.system_message('EVENT.FRAMEWORK') as g,
                supported_ui_types
           from wwv_flow_standard_events
          where event_type = 'APEX'
          union all
         select 3               as order_by,
                p.display_name  as order_by2,
                e.display_name || ' [' || p.display_name || ']'             as d,
                p.name_with_prefix || '|' || p.plugin_type || '|' || e.name as r,
                wwv_flow_lang.system_message('EVENT.COMPONENT')             as g,
                p.supported_ui_types
           from ( select id,
                         display_name,
                         plugin_type,
                         name_with_prefix,
                         supported_ui_types
                    from wwv_flow_native_plugins p
                   union all
                  select id,
                         display_name,
                         plugin_type,
                         'PLUGIN_' || name,
                         supported_ui_types
                    from wwv_flow_plugins
                   where flow_id           = (select nv('FB_FLOW_ID') from sys.dual)
                     and security_group_id = (select nv('FLOW_SECURITY_GROUP_ID') sgid from sys.dual)
                ) p,
                wwv_flow_plugin_events e
          where e.plugin_id = p.id
          union all
         select 4            as order_by,
                '1'          as order_by2,
                wwv_flow_lang.system_message('EVENT.CUSTOM.' || name) as d,
                name         as r,
                wwv_flow_lang.system_message('EVENT.CUSTOM') as g,
                supported_ui_types
           from wwv_flow_standard_events
          where event_type = 'CUSTOM'
          order by order_by, order_by2, d)
;

--==============================================================================
prompt ...wwv_flow_feedback_types view
create or replace view wwv_flow_feedback_types as
select 1 id, wwv_flow_lang.system_message('GENERAL_COMMENT') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('ENHANCEMENT_REQUEST') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('BUG') the_name from sys.dual
/
comment on table wwv_flow_feedback_types is 'Types of user feedback';

--==============================================================================
prompt ...wwv_flow_feedback_status view
create or replace view wwv_flow_feedback_status as
select 0 id, wwv_flow_lang.system_message('NO_STATUS') the_name from sys.dual union all
select 1 id, wwv_flow_lang.system_message('ACKNOWLEDGED') the_name from sys.dual union all
select 2 id, wwv_flow_lang.system_message('ADDITIONAL_INFORMATION_REQUESTED') the_name from sys.dual union all
select 3 id, wwv_flow_lang.system_message('OPEN_PROCESSING_FEEDBACK') the_name from sys.dual union all
select 4 id, wwv_flow_lang.system_message('CLOSED') the_name from sys.dual
/
comment on table wwv_flow_feedback_status is 'Status values for user feedback';
--==============================================================================
prompt ...wwv_flow_users view
create or replace view wwv_flow_users as select
		user_id,
		user_name,
		first_name,
		last_name,
		known_as,
		last_update_date,
		last_updated_by,
		creation_date,
		created_by,
		start_date,
		end_date,
		description,
		password_date,
		password_accesses_left,
		password_lifespan_accesses,
		password_lifespan_days,
		employee_id,
		person_type,
		email_address,
		person_id,
		a.security_group_id,
		default_schema,
		allow_access_to_schemas,
		default_date_format,
		attribute_01,
		attribute_02,
		attribute_03,
		attribute_04,
		attribute_05,
		attribute_06,
		attribute_07,
		attribute_08,
		attribute_09,
		attribute_10,
		last_login,
		builder_login_count,
		last_agent,
		last_ip,
		account_locked,
		account_expiry,
		failed_access_attempts,
		first_password_use_occurred,
		change_password_on_first_use,
		last_failed_login
from wwv_flow_current_sgid sgid,
     wwv_flow_fnd_user     a
where a.security_group_id = sgid.security_group_id
/


--==============================================================================
prompt ...wwv_flow_group_users view
create or replace view wwv_flow_group_users as
select g.id group_id,
          g.group_name,
          ug.user_id
  from wwv_flow_current_sgid    sgid,
       WWV_FLOW_FND_GROUP_USERS ug,
       WWV_FLOW_FND_USER_GROUPS g
where g.id                  = ug.group_id
   and ug.security_group_id = sgid.security_group_id
/

--==============================================================================
prompt ...wwv_flow_group_grants view
create or replace view wwv_flow_group_grants (
    security_group_id,
    grantee_type,
    grantee_id,
    grantee_name,
    granted_id,
    granted_name,
    granted_security_group_id
) as
select grantee.security_group_id,
       'U',
       grantee.user_id,
       grantee.user_name,
       granted.id,
       granted.group_name,
       granted.security_group_id
  from wwv_flow_fnd_user grantee,
       wwv_flow_fnd_user_groups granted,
       wwv_flow_fnd_group_users ug
 where grantee.security_group_id = ug.security_group_id
   and grantee.user_id           = ug.user_id
   and granted.id                = ug.group_id
   and granted.security_group_id in (10, ug.security_group_id)
union all
select grantee.security_group_id,
       'G',
       grantee.id,
       grantee.group_name,
       granted.id,
       granted.group_name,
       granted.security_group_id
  from wwv_flow_fnd_user_groups grantee,
       wwv_flow_fnd_user_groups granted,
       wwv_flow_fnd_group_groups gg
 where grantee.security_group_id = gg.security_group_id
   and grantee.id                = gg.grantee_group_id
   and granted.id                = gg.granted_group_id
   and granted.security_group_id in (10, gg.security_group_id)
/

--==============================================================================
prompt ...wwv_flow_developer_workspaces
create or replace force view wwv_flow_developer_workspaces (
    workspace_id,
    workspace_short_name,
    workspace_display_name,
    workspace_status,
    developer_name,
    developer_first_name,
    developer_last_name,
    developer_email,
    developer_role,
    last_login)
as
select ws.provisioning_company_id,
       ws.short_name,
       case when ws.display_name <> ws.short_name
         then ws.display_name||' ('||ws.short_name||')'
         else ws.short_name
       end,
       nvl(ws.account_status, 'ASSIGNED'),
       u.user_name,
       u.first_name,
       u.last_name,
       u.email_address,
       wwv_flow_lang.system_message (
           case
             when instr(d.developer_role,'ADMIN') > 0 then 'ACCESS_CONTROL_ADMIN'
             when instr(d.developer_role, 'EDIT') > 0 then 'DEVELOPER'
             when instr(d.developer_role, 'SQL') > 0 then 'DEVELOPER'
             else 'END_USER'
           end ),
       u.last_login
  from wwv_flow_developers d,
       wwv_flow_fnd_user   u,
       wwv_flow_companies  ws,
       ( select cloud_group_name current_group_name
           from wwv_flow_companies
          where provisioning_company_id = wwv_flow.get_security_group_id )
 where d.user_id                 (+) = u.user_id
   and d.security_group_id       (+) = u.security_group_id
   and u.security_group_id           = ws.provisioning_company_id
   and (d.user_id is not null or u.allow_team_development_yn = 'Y' or u.security_group_id=10)
   and nvl(u.account_locked,'N')     = 'N'
   and (    current_group_name   is null
         or ws.cloud_group_name  =  current_group_name )
   and not (    ws.provisioning_company_id = 10
            and nv('APP_ID')               = 4550
            and nv('APP_PAGE_ID')          = 20
            and exists ( select null
                           from wwv_flow_platform_prefs
                          where name  = 'APEX_BUILDER_AUTHENTICATION'
                            and value = 'CLOUD_IDM' ))
/

--==============================================================================
-- view to show workspace users in 4350:55
--
prompt ...wwv_flow_workspace_users view
create or replace view wwv_flow_workspace_users (
    workspace_id,
    icon_view_icon,
    alt,
    link,
    icon_view_name,
    user_id,
    "USER",
    "eMail",
    first_name,
    last_name,
    df, -- default schema
    developer,
    last_login,
    last_login2,
    builder_login_count,
    ul, -- is user locked?
    expiration,
    description,
    password_lifespan_days,
    password_lifespan_accesses,
    password_accesses_left,
    last_agent,
    last_ip,
    account_expiry,
    failed_access_attempts,
    change_password_on_first_use,
    first_password_use_occurred,
    dev_type, -- admin/developer/end user
    group_id, -- comma-separated list of assigned group ids
    group_name, -- comma-separated list of assigned group names
    last_update_date,
    last_updated_by,
    creation_date,
    created_by,
    developer_type,
    allow_app_building,
    allow_sql_workshop,
    allow_websheet_dev,
    allow_team_devopment, -- sic!
    is_external_user,
    profile_image_size)
as
select
    u.security_group_id,
    case
    -- unlocked, expired
    when nvl(u.account_locked,'N') = 'N' and (u.is_dev_account_expired = 'Y' or u.is_user_account_expired = 'Y')
    then image_prefix||'htmldb/icons/user_'||user_icon_color||'_exp.gif'
    -- locked, expired
    when nvl(u.account_locked,'N') = 'Y' and (u.is_dev_account_expired = 'Y' or u.is_user_account_expired = 'Y')
    then image_prefix||'htmldb/icons/user_'||d.user_icon_color||'_locked_exp.gif'
    -- locked, unexpired
    when nvl(u.account_locked,'N') = 'Y'
    then image_prefix||'htmldb/icons/user_'||d.user_icon_color||'_locked.gif'
    else
         -- unlocked and unexpired
         image_prefix||'htmldb/icons/user_'||d.user_icon_color||'.gif'
    end icon_view_icon,
    u.email_address alt,
    'f?p=4350:56:'||app_session||'.::NO:EDIT_USER_PRIVS:F4350_P56_USER_ID,LAST_VIEW:'||USER_ID||',55:' link,
    replace(replace(replace(u.user_name,'_',' '),'.','. '),'@','@ ') icon_view_name,
    user_id,
    u.user_name,
    u.email_address,
    u.first_name,
    u.last_name,
    replace(u.default_schema,'%'||'null%',null) df,
    case
    when d.user_type='END_USER'                                        then m.no_developer_priv
    when u.is_dev_account_expired='Y' or u.is_user_account_expired='Y' then m.password_expired
    else m.password_valid
    end developer,
    last_login,
    last_login,
    builder_login_count,
    decode(nvl(u.account_locked,'N'),'Y',m.yes,m.n)ul,
    case
    when u.is_user_account_expired='Y' then m.password_expired
    else m.password_valid
    end expiration,
    u.description,
    u.password_lifespan_days,
    u.password_lifespan_accesses,
    u.password_accesses_left,
    u.last_agent,
    u.last_ip,
    u.account_expiry,
    u.failed_access_attempts,
    u.change_password_on_first_use,
    u.first_password_use_occurred,
    case d.user_type
    when 'ADMIN' then m.admin
    when 'DEVELOPER' then m.dev
    else m.end_user
    end dev_type,
    wwv_flow_string.join(
        cast(multiset(
                select to_char(group_id)
                from WWV_FLOW_FND_GROUP_USERS
                where user_id = u.user_id
                order by group_id)
            as wwv_flow_t_varchar2),
        ','),
    wwv_flow_string.join(
        cast(multiset(
                 select group_name
                 from WWV_FLOW_FND_USER_GROUPS g,
                      WWV_FLOW_FND_GROUP_USERS gu
                 where g.id = gu.group_id
                   and gu.user_id = u.user_id
                 order by gu.group_id)
            as wwv_flow_t_varchar2),
        ','),
    last_update_date,
    last_updated_by,
    creation_date,
    created_by,
    d.user_type,
    decode(nvl(allow_app_building_yn,'Y'),'Y',m.yes,m.n) allow_app_building,
    decode(nvl(allow_sql_workshop_yn,'Y'),'Y',m.yes,m.n) allow_sql_workshop,
    decode(nvl(allow_websheet_dev_yn,'Y'),'Y',m.yes,m.n) allow_websheet_dev,
    decode(nvl(allow_team_development_yn,'Y'),'Y',m.yes,m.n) allow_team_devopment,
    case when u.person_type='E' then 'Y' else 'N' end is_external_user,
    sys.dbms_lob.getlength(u.profile_image) profile_image_size
from
   (select u.*,
           case when wwv_flow_fnd_user_int.workspace_account_days_left(u.user_name) <= 0 then 'Y' else 'N' end is_dev_account_expired,
           case when wwv_flow_fnd_user_int.end_user_account_days_left(u.user_name) <= 0 then 'Y' else 'N' end is_user_account_expired
      from wwv_flow_fnd_user u) u,
   (select userid,
           security_group_id,
           case
           when instr(developer_role,'ADMIN') > 0 then 'ADMIN'
           when instr(developer_role,'EDIT')  > 0 then 'DEVELOPER'
           when instr(developer_role,'SQL')   > 0 then 'DEVELOPER'
           else 'END_USER'
           end user_type,
           case
           when instr(developer_role,'ADMIN') > 0 then 'red'
           when instr(developer_role,'EDIT')  > 0 then 'yellow'
           when instr(developer_role,'SQL')   > 0 then 'yellow'
           else 'green'
           end user_icon_color
    from wwv_flow_developers ) d,
    (select wwv_flow_lang.system_message('F4000.NO') n,
            wwv_flow_lang.system_message('F4000.YES') yes,
            wwv_flow_lang.system_message('PASSWORD_VALID') password_valid,
            wwv_flow_lang.system_message('PASSWORD_EXPIRED') password_expired,
            wwv_flow_lang.system_message('NO_DEVELOPER_PRIV') no_developer_priv,
            wwv_flow_lang.system_message('DEVELOPER') dev,
            wwv_flow_lang.system_message('ADMINISTRATOR') admin,
            wwv_flow_lang.system_message('END_USER') end_user,
            wwv_flow_lang.system_message('BASIC_DEVELOPER') basic_developer,
            v('IMAGE_PREFIX') image_prefix,
            v('APP_SESSION')  app_session
     from sys.dual) m
where u.user_name         = d.userid (+)
  and u.security_group_id = d.security_group_id (+)
/

--==============================================================================
-- view with instead of trigger to manage websheet app + authentication
--==============================================================================
prompt ...wwv_flow_ws_app_and_auth view
create or replace force view wwv_flow_ws_app_and_auth (
    id,
    security_group_id,
    name,
    status,
    home_page_id,
    date_format,
    language,
    territory,
    show_reset_passwd_yn,
    email_from,
    owner,
    description,
    login_page_message,
    logo_type,
    logo_text,
    logo_text_attributes,
    logo_image,
    logo_image_attributes,
    logo_filepath,
    logo_filepath_attributes,
    --
    -- authentication
    --
    auth_id,
    authentication,
    logout_url,
    ldap_host,
    ldap_port,
    ldap_use_ssl,
    ldap_use_exact_dn,
    ldap_string,
    ldap_search_filter,
    ldap_edit_function,
    ldap_username_escaping,
    page_sentry_function,
    sess_verify_function,
    pre_auth_process,
    auth_function,
    post_auth_process,
    invalid_session_url,
    cookie_type,
    cookie_name,
    cookie_path,
    cookie_domain,
    use_secure_cookie_yn,
    --
    -- authorization
    --
    acl_type,
    allow_public_access_yn,
    --
    -- preferences
    --
    show_peer_navigation_yn,
    show_child_navigation_yn,
    show_annotations_control_yn,
    allow_sql_yn,
    --
    -- audit
    --
    created_by,
    created_on,
    updated_by,
    updated_on
) as
select
    app.id,
    app.security_group_id,
    app.name,
    app.status,
    app.home_page_id,
    app.date_format,
    app.language,
    app.territory,
    app.show_reset_passwd_yn,
    app.email_from,
    app.owner,
    app.description,
    app.login_page_message,
    app.logo_type,
    app.logo_text,
    app.logo_text_attributes,
    app.logo_image,
    app.logo_image_attributes,
    app.logo_filepath,
    app.logo_filepath_attributes,
    --
    -- authentication
    --
    app.auth_id,
    case
      when sys.dbms_lob.substr(auth.auth_function,10) = '-BUILTIN-'    then '1' -- apex auth
      when auth.invalid_session_url                   = '-PORTAL_SSO-' then '2' -- sso
      when sys.dbms_lob.substr(auth.auth_function,10) = '-LDAP-'       then '3' -- ldap
      when auth.invalid_session_url                   = '-CLOUD_IDM-'  then '5' -- cloud idm
      when auth.id is not null                                         then '4' -- custom
      else                                                                  '0' -- unknown - should not happen
    end,
    auth.logout_url,
    auth.ldap_host,
    auth.ldap_port,
    auth.ldap_use_ssl,
    auth.ldap_use_exact_dn,
    auth.ldap_string,
    auth.ldap_search_filter,
    auth.ldap_edit_function,
    auth.ldap_username_escaping,
    auth.page_sentry_function,
    auth.sess_verify_function,
    auth.pre_auth_process,
    auth.auth_function,
    auth.post_auth_process,
    auth.invalid_session_url,
    case
    when auth.use_secure_cookie_yn<>'N'
         or auth.cookie_domain is not null
         or auth.cookie_path   is not null
         or auth.cookie_name   <> '&WORKSPACE_COOKIE.'
    then 'C'
    when auth.cookie_name is null
    then 'A'
    when auth.cookie_name='&WORKSPACE_COOKIE.'
    then 'W'
    else 'C'
    end,
    auth.cookie_name,
    auth.cookie_path,
    auth.cookie_domain,
    auth.use_secure_cookie_yn,
    --
    -- authorization
    --
    app.acl_type,
    app.allow_public_access_yn,
    --
    -- preferences
    --
    app.show_peer_navigation_yn,
    app.show_child_navigation_yn,
    app.show_annotations_control_yn,
    app.allow_sql_yn,
    --
    -- audit
    --
    app.created_by,
    app.created_on,
    app.updated_by,
    app.updated_on
 from wwv_flow_ws_applications app,
      wwv_flow_ws_custom_auth_setups auth
where app.auth_id           = auth.id (+)
  and app.security_group_id = auth.security_group_id (+)
/
declare
    e_name_used exception;
    pragma exception_init(e_name_used, -955);
begin
    --
    -- forward declaration of wwv_flow_ws_security.update_ws_properties,
    -- because of dependency in IOT below
    --
    execute immediate q'{
    create package wwv_flow_ws_security as
        procedure update_ws_properties (
            p_ws in wwv_flow_ws_app_and_auth%rowtype );
    end;}';
exception when e_name_used then null;
end;
/
create or replace trigger wwv_flow_ws_app_and_auth_trg
instead of update
on wwv_flow_ws_app_and_auth
for each row
declare
    l_new wwv_flow_ws_app_and_auth%rowtype;
begin
    l_new.id                          := :new.id;
    l_new.security_group_id           := :new.security_group_id;
    l_new.name                        := :new.name;
    l_new.status                      := :new.status;
    l_new.home_page_id                := :new.home_page_id;
    l_new.date_format                 := :new.date_format;
    l_new.language                    := :new.language;
    l_new.territory                   := :new.territory;
    l_new.show_reset_passwd_yn        := :new.show_reset_passwd_yn;
    l_new.email_from                  := :new.email_from;
    l_new.owner                       := :new.owner;
    l_new.description                 := :new.description;
    l_new.login_page_message          := :new.login_page_message;
    l_new.logo_type                   := :new.logo_type;
    l_new.logo_text                   := :new.logo_text;
    l_new.logo_text_attributes        := :new.logo_text_attributes;
    l_new.logo_image                  := :new.logo_image;
    l_new.logo_image_attributes       := :new.logo_image_attributes;
    l_new.logo_filepath               := :new.logo_filepath;
    l_new.logo_filepath_attributes    := :new.logo_filepath_attributes;
    --
    -- authentication
    --
    l_new.auth_id                     := :new.auth_id;
    l_new.authentication              := :new.authentication;
    l_new.logout_url                  := :new.logout_url;
    l_new.ldap_host                   := :new.ldap_host;
    l_new.ldap_port                   := :new.ldap_port;
    l_new.ldap_use_ssl                := :new.ldap_use_ssl;
    l_new.ldap_use_exact_dn           := :new.ldap_use_exact_dn;
    l_new.ldap_string                 := :new.ldap_string;
    l_new.ldap_search_filter          := :new.ldap_search_filter;
    l_new.ldap_edit_function          := :new.ldap_edit_function;
    l_new.ldap_username_escaping      := :new.ldap_username_escaping;
    l_new.page_sentry_function        := :new.page_sentry_function;
    l_new.sess_verify_function        := :new.sess_verify_function;
    l_new.pre_auth_process            := :new.pre_auth_process;
    l_new.auth_function               := :new.auth_function;
    l_new.post_auth_process           := :new.post_auth_process;
    l_new.invalid_session_url         := :new.invalid_session_url;
    if :new.cookie_type <> 'C' then
        l_new.cookie_name             := case :new.cookie_type
                                         when 'W' then '&WORKSPACE_COOKIE.'
                                         end;
        l_new.cookie_path             := null;
        l_new.cookie_domain           := null;
        l_new.use_secure_cookie_yn    := 'N';
    else
        l_new.cookie_name             := :new.cookie_name;
        l_new.cookie_path             := :new.cookie_path;
        l_new.cookie_domain           := :new.cookie_domain;
        l_new.use_secure_cookie_yn    := :new.use_secure_cookie_yn;
    end if;
    --
    -- authorization
    --
    l_new.acl_type                    := :new.acl_type;
    l_new.allow_public_access_yn      := :new.allow_public_access_yn;
    --
    -- preferences
    --
    l_new.show_peer_navigation_yn     := :new.show_peer_navigation_yn;
    l_new.show_child_navigation_yn    := :new.show_child_navigation_yn;
    l_new.show_annotations_control_yn := :new.show_annotations_control_yn;
    l_new.allow_sql_yn                := :new.allow_sql_yn;
    --
    -- audit
    --
    l_new.created_by                  := :new.created_by;
    l_new.created_on                  := :new.created_on;
    l_new.updated_by                  := :new.updated_by;
    l_new.updated_on                  := :new.updated_on;

    wwv_flow_ws_security.update_ws_properties (
        p_ws => l_new );
end;
/

--==============================================================================
-- utility view for instance admin lovs of schemas that can be assigned to
-- workspaces
--==============================================================================
prompt ...wwv_flow_admin_all_schemas
create or replace view wwv_flow_admin_all_schemas (
    username,
    restricted_to_workspace )
as
select u.username,
       re.workspace_name
  from sys.all_users u,
       wwv_flow_restricted_schemas r,
       wwv_flow_rschema_exceptions re
 where u.username = r.schema (+)
   and r.id = re.schema_id (+)
   and (r.id is null or re.workspace_name is not null)
   and (u.username not like 'FLOWS_%' or length(username) != 12 or not REGEXP_LIKE(substr(username,7),'[0-9]{6}'))
   and (u.username not like 'APEX_%' or length(username) != 11 or not REGEXP_LIKE(substr(username,6),'[0-9]{6}'))
/

--==============================================================================
-- LEGACY CODE FOR BACKWARDS COMPATIBILITY
-- superseded by wwv_flow_lsnr_workspaces in newer APEX Listener versions.
--
-- RESTful Services required view to identify path_prefix for RESTful URL
--
-- Note: We don't require c.allow_restful_services_yn=Y here in order to support
-- built-in RESTful Services under each c.path_prefix. The c.allow_restful_services_yn=Y
-- check is enforced in wwv_flow_rt$services view.
--==============================================================================
prompt ...wwv_flow_pool_config view
create or replace view wwv_flow_pool_config
as
select null                                  pool_name,
       c.short_name                          workspace_identifier,
       case when c.host_prefix is null
            then lower(c.path_prefix)
            else lower(c.host_prefix) end    as uri,
       case when c.host_prefix is null
            then 'BASE_PATH'
            else 'BASE_URL' end              as type,
       coalesce (
           c.created_on,
           date'2015-01-01' )                updated,
       c.provisioning_company_id             tenant_id,
       c.cloud_group_name                    identity_domain
from   wwv_flow_companies c
where  c.provisioning_company_id not in (0,10,11,12)
and    c.account_status in ('AVAILABLE', 'ASSIGNED')
and    exists (  select 1
                  from wwv_flow_platform_prefs
                 where name  = 'RESTFUL_SERVICES_ENABLED'
                   and value = 'Y')
/
--==============================================================================
-- APEX Listener workspace view
--==============================================================================
prompt ...wwv_flow_lsnr_workspaces view
create or replace view wwv_flow_lsnr_workspaces (
       pool_name,
       workspace_identifier,
       uri,
       type,
       updated,
       workspace_id,
       default_schema,
       is_restful_enabled
) as
select null,
       c.short_name,
       case
         when c.host_prefix is null
         then lower(c.path_prefix)
         else lower(c.host_prefix)
       end,
       case
         when c.host_prefix is null
         then 'BASE_PATH'
         else 'BASE_URL'
       end,
       coalesce (
           c.created_on,
           date'2015-01-01' ),
       c.provisioning_company_id,
       c.first_schema_provisioned,
       case
         when     c.allow_restful_services_yn    = 'Y'
              and restful_enabled_on_instance_01 = 1
         then 'Y'
         else 'N'
       end
  from wwv_flow_companies c,
       ( select /*+result_cache*/
                count(*) restful_enabled_on_instance_01
           from wwv_flow_platform_prefs
          where name   = 'RESTFUL_SERVICES_ENABLED'
            and value  = 'Y'
            and rownum = 1 )
 where c.account_status in ('AVAILABLE', 'ASSIGNED')
/

--==============================================================================
-- APEX Listener db/websheet applications view
--==============================================================================
prompt ...wwv_flow_lsnr_applications view
create or replace view wwv_flow_lsnr_applications (
       workspace_id,
       application_type,
       application_id,
       application_alias,
       application_schema
) as
select a.security_group_id,
       'DB',
       a.id,
       a.alias,
       a.owner
  from wwv_flow_companies c,
       wwv_flows a
 where c.provisioning_company_id = a.security_group_id
   and c.account_status in ('AVAILABLE', 'ASSIGNED')
union all
select w.security_group_id,
       'WS',
       w.id,
       null,
       s.schema
  from wwv_flow_companies c,
       wwv_flow_company_schemas s,
       wwv_flow_ws_applications w
 where c.provisioning_company_id =  w.security_group_id
   and c.provisioning_company_id =  s.security_group_id
   and s.is_apex$_schema         =  'Y'
   and c.account_status          in ('AVAILABLE', 'ASSIGNED')
/
--==============================================================================
-- APEX Listener PL/SQL entry points view
--
-- The following entry points do not expose an application id and therefore are
-- not included in the view ( see also wwv_flow_epg_include.plb):
--
-- * p
-- * z
-- * apex
-- * htmldb
-- * htmldb_admin
-- * htmldb_login
-- * apex_admin
-- * apex_login
-- * wwv_flow_item_help.show_help
-- * wwv_flow_file_mgr.get_file
-- * wwv_flow_file_mgr.get_ws_file
-- * wwv_flow_file_mgr.get_team_file
-- * apex_util.get_file
-- * apex_util.count_click
-- * wwv_flow_custom_auth_sso.process_success
-- * apex_custom_auth.logout_then_go_to_page         - obsolete
-- * apex_custom_auth.logout_then_go_to_url          - obsolete
-- * wwv_flow_custom_auth_std.logout_then_go_to_page - obsolete
-- * wwv_flow_custom_auth_std.logout_then_go_to_url  - obsolete
-- * apexws                                          - obsolete
--==============================================================================
prompt ...wwv_flow_lsnr_entry_points view
create or replace view wwv_flow_lsnr_entry_points (
       name,
       application_type,
       application_parameter_name,
       application_parameter_regexp
) as
select 'ws'                                           , 'WS', 'p'                , '^([^:]+)' from sys.dual union all
--
select 'f'                                            , 'DB', 'p'                , '^([^:]+)' from sys.dual union all
--
select 'wwv_flow.show'                                , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'wwv_flow.ajax'                                , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'wwv_flow.accept'                              , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'apex_application.show'                        , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'apex_application.ajax'                        , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'apex_application.accept'                      , 'DB', 'p_flow_id'        , null       from sys.dual union all
--
select 'apex_util.flash2'                             , 'DB', 'p'                , '^([^:]+)' from sys.dual union all
select 'apex_util.get_blob'                           , 'DB', 'a'                , null       from sys.dual union all
select 'apex_util.get_blob_file'                      , 'DB', 'a'                , null       from sys.dual union all
select 'htmldb_util.flash2'                           , 'DB', 'p'                , '^([^:]+)' from sys.dual union all
select 'htmldb_util.get_blob'                         , 'DB', 'a'                , null       from sys.dual union all
select 'htmldb_util.get_blob_file'                    , 'DB', 'a'                , null       from sys.dual union all
--
select 'apex_rest.getreport'                          , 'DB', 'app'              , null       from sys.dual union all
select 'apex_rest.getservicedescription'              , 'DB', 'app'              , null       from sys.dual union all
select 'wwv_flow_rest.getreport'                      , 'DB', 'app'              , null       from sys.dual union all
select 'wwv_flow_rest.getservicedescription'          , 'DB', 'app'              , null       from sys.dual union all
--
select 'wwv_flow_utilities.gen_popup_list'            , 'DB', 'p_flow_id'        , null       from sys.dual union all
select 'wwv_flow_utilities.get_theme_file'            , 'DB', 'p_app_id'         , null       from sys.dual union all
--
select 'htmldb_custom_auth.logout'                    , 'DB', 'p_this_app'       , null       from sys.dual union all
select 'apex_custom_auth.logout'                      , 'DB', 'p_this_app'       , null       from sys.dual union all
--
select 'wwv_flow_custom_auth_std.logout'              , 'DB', 'p_this_flow'      , null       from sys.dual union all
select 'wwv_flow_custom_auth_std.ws_logout'           , 'WS', 'p_websheet_app_id', null       from sys.dual union all
--
select 'wwv_flow_item_help.show_plugin_attribute_help', 'DB', 'p_application_id' , null       from sys.dual union all
--
select 'wwv_flow_customize.show'                      , 'DB', 'p_flow'           , null       from sys.dual union all
select 'wwv_flow_customize.accept'                    , 'DB', 'p_flow'           , null       from sys.dual union all
--
select 'apex_authentication.logout'                   , 'DB', 'p_app_id'         , null       from sys.dual union all
select 'apex_authentication.callback'                 , 'DB', 'p_app_id'         , null       from sys.dual
/

--==============================================================================
prompt ...wwv_flow_mime_mapping_v view
create or replace view wwv_flow_mime_mapping_v as
    select 'au'    as extension, 'audio/basic' as mime_type from sys.dual union all
    select 'avi'   as extension, 'video/x-msvideo' as mime_type from sys.dual union all
    select 'bin'   as extension, 'application/octet-stream' as mime_type from sys.dual union all
    select 'bmp'   as extension, 'image/bmp' as mime_type from sys.dual union all
    select 'css'   as extension, 'text/css' as mime_type from sys.dual union all
    select 'doc'   as extension, 'application/msword' as mime_type from sys.dual union all
    select 'docx'  as extension, 'application/vnd.openxmlformats-officedocument.wordprocessingml.document' as mime_type from sys.dual union all
    select 'dot'   as extension, 'application/msword' as mime_type from sys.dual union all
    select 'eml'   as extension, 'message/rfc822' as mime_type from sys.dual union all
    select 'gif'   as extension, 'image/gif' as mime_type from sys.dual union all
    select 'htm'   as extension, 'text/html' as mime_type from sys.dual union all
    select 'html'  as extension, 'text/html' as mime_type from sys.dual union all
    select 'jpe'   as extension, 'image/jpeg' as mime_type from sys.dual union all
    select 'jpeg'  as extension, 'image/jpeg' as mime_type from sys.dual union all
    select 'jpg'   as extension, 'image/jpeg' as mime_type from sys.dual union all
    select 'js'    as extension, 'application/x-javascript' as mime_type from sys.dual union all
    select 'jsp'   as extension, 'text/html' as mime_type from sys.dual union all
    select 'mid'   as extension, 'audio/mid' as mime_type from sys.dual union all
    select 'mov'   as extension, 'video/quicktime' as mime_type from sys.dual union all
    select 'movie' as extension, 'video/x-sgi-movie' as mime_type from sys.dual union all
    select 'mp3'   as extension, 'audio/mpeg' as mime_type from sys.dual union all
    select 'mpe'   as extension, 'video/mpg' as mime_type from sys.dual union all
    select 'mpeg'  as extension, 'video/mpg' as mime_type from sys.dual union all
    select 'mpg'   as extension, 'video/mpg' as mime_type from sys.dual union all
    select 'msa'   as extension, 'application/x-msaccess' as mime_type from sys.dual union all
    select 'msw'   as extension, 'application/x-msworks-wp' as mime_type from sys.dual union all
    select 'pcx'   as extension, 'application/x-pc-paintbrush' as mime_type from sys.dual union all
    select 'pdf'   as extension, 'application/pdf' as mime_type from sys.dual union all
    select 'png'   as extension, 'image/png' as mime_type from sys.dual union all
    select 'ppt'   as extension, 'application/vnd.ms-powerpoint' as mime_type from sys.dual union all
    select 'pptx'  as extension, 'application/vnd.openxmlformats-officedocument.presentationml.presentation' as mime_type from sys.dual union all
    select 'ps'    as extension, 'application/postscript' as mime_type from sys.dual union all
    select 'qt'    as extension, 'video/quicktime' as mime_type from sys.dual union all
    select 'ra'    as extension, 'audio/x-realaudio' as mime_type from sys.dual union all
    select 'ram'   as extension, 'audio/x-realaudio' as mime_type from sys.dual union all
    select 'rm'    as extension, 'audio/x-realaudio' as mime_type from sys.dual union all
    select 'rtf'   as extension, 'application/rtf' as mime_type from sys.dual union all
    select 'rv'    as extension, 'video/x-realvideo' as mime_type from sys.dual union all
    select 'sgml'  as extension, 'text/sgml' as mime_type from sys.dual union all
    select 'svg'   as extension, 'image/svg+xml' as mime_type from sys.dual union all
    select 'tif'   as extension, 'image/tiff' as mime_type from sys.dual union all
    select 'tiff'  as extension, 'image/tiff' as mime_type from sys.dual union all
    select 'txt'   as extension, 'text/plain' as mime_type from sys.dual union all
    select 'url'   as extension, 'text/plain' as mime_type from sys.dual union all
    select 'vrml'  as extension, 'x-world/x-vrml' as mime_type from sys.dual union all
    select 'wav'   as extension, 'audio/wav' as mime_type from sys.dual union all
    select 'wpd'   as extension, 'application/wordperfect5.1' as mime_type from sys.dual union all
    select 'xls'   as extension, 'application/vnd.ms-excel' as mime_type from sys.dual union all
    select 'xlsx'  as extension, 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' as mime_type from sys.dual union all
    select 'xml'   as extension, 'text/xml' as mime_type from sys.dual union all
    select 'xsd'   as extension, 'text/xml' as mime_type from sys.dual union all
    select 'xsl'   as extension, 'text/xml' as mime_type from sys.dual union all
    select 'zip'   as extension, 'application/x-zip-compressed' as mime_type from sys.dual
/

--==============================================================================
create or replace force view wwv_flow_debug_messages_v (
    page_view_id,
    page_view_row_number,
    id,
    security_group_id,
    session_id,
    flow_id,
    page_id,
    apex_user,
    elapsed_seconds,
    execution_time,
    percent_of_max,
    message_timestamp,
    message_level,
    message,
    call_stack )
as
select page_view_id,
       row_number() over (partition by page_view_id order by id),
       id,
       security_group_id,
       session_id,
       flow_id,
       page_id,
       apex_user,
       elap,
       lead(elap) over (partition by page_view_id order by id) - elap,
       case max(elap) over (partition by page_view_id)
       when 0 then 0
       else (nvl(lead(elap) over (partition by page_view_id order by id) - elap, 0)) /
            max(elap) over (partition by page_view_id) *
            100
       end,
       message_timestamp,
       message_level,
       message,
       call_stack
  from ( select * from wwv_flow_debug_messages
         union all
         select * from wwv_flow_debug_messages2 )
/


--==============================================================================
--- APEX REST Statistics Collection
--==============================================================================
prompt ...wwv_flow_instance_rest_stats view
create or replace view wwv_flow_instance_rest_stats as
    select
           to_char(from_tz(to_timestamp(to_char(arc.log_day,'YYYYMMDDHH24MISS'),'YYYYMMDDHH24MISS'),to_char(systimestamp, 'TZR')) at time zone 'UTC', 'rrrr-MM-dd"T"HH24:mi:ss.FF3') log_day,
           arc.log_day as log_day_date,
           arc.workspace_id,
           coalesce(arc.workspace_name, w.short_name) workspace_name,
           arc.application_id,
           coalesce(arc.application_name, a.name) application_name,
           arc.page_events,
           case when arc.application_id between 4000 and 4999 then arc.page_events else 0 end builder_events,
           arc.public_page_events,
           arc.workspace_login_events,
           arc.distinct_pages,
           arc.distinct_users,
           arc.distinct_sessions,
           arc.average_render_time,
           arc.median_render_time,
           arc.maximum_render_time,
           arc.total_render_time,
           arc.error_count
      from wwv_flow_log_history arc
           left outer join wwv_flow_companies w  on (
               arc.workspace_id = w.provisioning_company_id and w.provisioning_company_id != 0
           )
           left outer join ( select f.id, f.name
                    from wwv_flows f
                   where not exists (
                       select 1
                         from wwv_flow_language_map m
                        where m.translation_flow_id =  f.id
                          and m.security_group_id   =  f.security_group_id
                          and f.authentication_id   <> trunc(f.authentication_id)
                   )
           ) a on ( arc.application_id = a.id )
/

prompt ...wwv_flow_instance_rest_ws view
create or replace view wwv_flow_instance_rest_ws as
select
    w.PROVISIONING_COMPANY_ID                           workspace_id,
    w.short_name                                        workspace_name,
    w.display_name                                      workspace_display_name,
    w.created_on                                        created_on,
    w.last_login                                        last_login,
    --
    nvl(w.allow_app_building_yn,'Y')                    allow_app_building_yn,
    nvl(w.allow_packaged_app_ins_yn,'Y')                allow_packaged_app_ins_yn,
    nvl(w.allow_sql_workshop_yn,'Y')                    allow_sql_workshop_yn,
    nvl(w.allow_websheet_dev_yn,'Y')                    allow_websheet_dev_yn,
    nvl(w.allow_team_development_yn,'Y')                allow_team_development_yn,
    nvl(w.allow_team_dev_files_yn,'Y')                  allow_team_dev_files_yn,
    nvl(w.allow_to_be_purged_yn,'Y')                    allow_to_be_purged_yn,
    nvl(w.allow_restful_services_yn,'Y')                allow_restful_services_yn,
    --
    (select count(*)
     from   wwv_flows
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  applications,
    --
    (select count(*)
     from   wwv_flow_steps
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  application_pages,
    --
    (select count(*)
     from   wwv_flow_fnd_user
     where  security_group_id =
            w.PROVISIONING_COMPANY_ID)                  apex_users
from wwv_flow_companies w
where w.provisioning_company_id != 0
/


prompt ...wwv_flow_instance_rest_info view
create or replace view wwv_flow_instance_rest_info as
select
    security_group_id,
    owner,
    last_updated_on,
    created_on,
    created_by,
    last_updated_by
from wwv_flows
/

--==============================================================================
--- View for Historical Activity data with join to COMPANIES and FLOWS
--==============================================================================

create or replace view wwv_flow_log_history_v
as
select
   h.log_day,
   h.workspace_id,
   coalesce(h.workspace_name, w.short_name) workspace_name,
   h.application_id,
   coalesce(h.application_name, a.name) application_name,
   h.page_events,
   h.page_views,
   h.page_accepts,
   h.partial_page_views,
   h.websheet_views,
   h.rows_fetched,
   h.ir_searches,
   h.distinct_pages,
   h.distinct_users,
   h.distinct_sessions,
   h.average_render_time,
   h.median_render_time,
   h.maximum_render_time,
   h.total_render_time,
   h.content_length,
   h.error_count,
   h.public_page_events,
   h.workspace_login_events
from wwv_flow_log_history h
       left outer join wwv_flow_companies w  on (
           h.workspace_id = w.provisioning_company_id and w.provisioning_company_id != 0
       )
       left outer join ( select f.id, f.name
                from wwv_flows f
               where not exists (
                   select 1
                     from wwv_flow_language_map m
                    where m.translation_flow_id =  f.id
                      and m.security_group_id   =  f.security_group_id
                      and f.authentication_id   <> trunc(f.authentication_id)
               )
       ) a on ( h.application_id = a.id )
/

--==============================================================================
-- View for workspace groups that excludes app acl roles
--==============================================================================
create or replace view wwv_flow_fnd_user_groups_noapp
as
select *
  from wwv_flow_fnd_user_groups
 where flow_id is null
/
--==============================================================================
-- Compatibility view for old table wwv_flow_upgrade_progress, which was
-- replaced by wwv_install_% in 18.2.
--==============================================================================
prompt ...wwv_flow_upgrade_progress
create or replace view wwv_flow_upgrade_progress (
       upgrade_id,
       upgrade_date,
       upgrade_sequence,
       upgrade_action,
       upgrade_error,
       upgrade_command )
as
select a.phase,
       a.started_at,
       nvl(e.id, a.id),
       a.action,
       sys.dbms_lob.substr(e.message, 4000),
       sys.dbms_lob.substr(e.statement, 4000)
  from wwv_install$        i,
       wwv_install_action$ a,
       wwv_install_error$  e
 where i.id         = a.install_id
   and a.id         = e.action_id (+)
   and i.schema     = '^APPUN'
/
