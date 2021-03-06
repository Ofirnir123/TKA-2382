set define off
set verify off

prompt ...wwv_flow_theme_dev

create or replace package wwv_flow_theme_dev
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_theme.sql
--
--    DESCRIPTION
--      This package is responsible for handling themes and templates
--      in the Builder.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/07/2012 - Created
--      pawolf    05/21/2012 - Added wwv_flow_theme_display_points (feature #936)
--      pawolf    09/11/2014 - Added theme roller support (feature #1488)
--      pmanirah  09/28/2015 - Added new overloading of get_region_template_id function with page_type parameter
--      pmanirah  10/01/2015 - Updated get_report_template_id to take new parameter p_report_type
--      msewtz    01/17/2018 - Added is_universal_theme
--      msewtz    01/17/2018 - Updated is_universal_theme to support theme_id
--      msewtz    01/31/2018 - Added is_universal_theme_yn
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================


--==============================================================================
-- Global constants
--==============================================================================


--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns the id of the default page template of the specified theme.
--==============================================================================
function get_page_template_id (
    p_application_id in number,
    p_theme_id       in number )
    return number;

--==============================================================================
-- Returns the id of the default breadcrumb template of the specified theme.
--==============================================================================
function get_breadcrumb_template_id (
    p_application_id in number,
    p_theme_id       in number )
    return number;

--==============================================================================
-- Returns the id of the default calendar template of the specified theme.
--==============================================================================
function get_calendar_template_id (
    p_application_id in number,
    p_theme_id       in number )
    return number;

--==============================================================================
-- Returns the id of the default region template of the specified theme.
--==============================================================================
function get_region_template_id (
    p_application_id in number,
    p_theme_id       in number )
    return number;

--==============================================================================
-- Returns the id of the default region template of the specified theme.
--==============================================================================
function get_region_template_id (
    p_application_id in number,
    p_theme_id       in number, 
    p_page_type      in varchar2 )
    return number;
	
--==============================================================================
-- Returns the id of the default report template of the specified theme.
--==============================================================================
function get_report_template_id (
    p_application_id in number,
    p_theme_id       in number,
    p_report_type    in varchar2  default null	)
    return number;
--
--==============================================================================
-- This procedure pulls content from the master theme display point and
-- copies it to the subscribing theme display point.
--==============================================================================
procedure subscribe_theme_display_point (
    p_master_display_point_id      in number,
    p_subscribing_display_point_id in number );
--
--==============================================================================
-- This procedure pushes content of the theme display point to
-- all theme display points that subscribe to this theme display point.
--==============================================================================
procedure push_theme_display_point (
    p_display_point_id in number );
--
--==============================================================================
-- Refreshes a theme display point with the values values of the subscribed
-- master theme display point.
--==============================================================================
procedure refresh_theme_display_point (
    p_display_point_id in number );
--
--==============================================================================
-- Dispatcher for all AJAX calls related to theme roller.
--==============================================================================
procedure theme_roller_ajax;
--

--==============================================================================
-- Returns TRUE if the current application theme is based on the Universal Theme
--==============================================================================
function is_universal_theme (
    p_application_id    in number default null,
    p_user_interface_id in number default null,
    p_theme_id          in number default null )
    return boolean;

--==============================================================================
-- Returns Y if the current application theme is based on the Universal Theme, else N
--==============================================================================
function is_universal_theme_yn (
    p_application_id    in number default null,
    p_user_interface_id in number default null,
    p_theme_id          in number default null )
    return varchar2;
--

end wwv_flow_theme_dev;
/
show errors

set define '^'
