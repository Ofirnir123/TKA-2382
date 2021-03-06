set define off
set verify off

prompt ...wwv_flow_theme

create or replace package wwv_flow_theme
as
--------------------------------------------------------------------------------
--
--  Copyright (c) Oracle Corporation 2012. All Rights Reserved.
--
--    NAME
--      wwv_flow_theme.sql
--
--    DESCRIPTION
--      This package is responsible for handling themes by the
--      runtime engine.
--
--    MODIFIED   (MM/DD/YYYY)
--      pawolf    03/16/2012 - Created
--      pawolf    04/05/2012 - Added support for page and popup transitions (feature #826)
--      pawolf    05/31/2012 - Continued work on grid layout (feature #936)
--      pawolf    06/05/2012 - Added grid support for sub regions (feature #936)
--      pawolf    06/18/2012 - Added region display points support (feature# #936)
--      pawolf    10/12/2012 - Added get_calendar (bug# 14328746)
--      pawolf    04/12/2013 - Added get_file_prefix (feature #1162)
--      hfarrell  06/27/2013 - Added get_dialog_page_template_id (feature #1204)
--      msewtz    08/09/2013 - Added get_nav_list_template_id (feature 1236)
--      msewtz    08/09/2013 - Added get_navigation_type (feature 1236)
--      pawolf    09/11/2014 - Added get_db_file_prefix (feature #1162)
--      pawolf    10/01/2014 - Added emit_theme_css, emit_theme_style_css and emit_theme_javascript (feature #1484)
--      pawolf    11/11/2014 - Added get_prefixed_icon_css_classes
--                           - Added get_prefixed_icon_css_classes (feature #1574)
--      pawolf    10/28/2015 - Added get_component_css_classes (features #1880)
--      pawolf    03/11/2016 - Added get_icon_library (feature #1851)
--      cczarski  07/15/2016 - added wwv_flow_theme_api functionlity here - wwv_flow_theme_api is public package (feature #1992)
--      cczarski  07/18/2016 - added enable_style_by_user_pref for wwv_flow_theme_api.enable|disable_user_style
--      cczarski  07/27/2016 - added clear_all_users_style_pref to clear all theme style user preferences for an application
--
--------------------------------------------------------------------------------

--==============================================================================
-- Global types
--==============================================================================
type t_display_point is record (
    placeholder      wwv_flow_theme_display_points.placeholder%type,
    has_grid_support boolean,
    max_columns      pls_integer );

type t_calendar is record (
    icon            wwv_flow_themes.calendar_icon%type,
    icon_attributes wwv_flow_themes.calendar_icon_attr%type );

--==============================================================================
-- Global constants
--==============================================================================

--==============================================================================
-- Global variables
--==============================================================================


--==============================================================================
-- Returns the id of the default page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_page_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the id of the default dialog page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_dialog_page_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the id of the default navigation list template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_nav_list_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the navigation type ([T]ab or [L]ist) of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_navigation_type (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the id of the error page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_error_page_template_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the id of the printer friendly page template of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_printer_friendly_templ_id (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return number;
--
--==============================================================================
-- Returns the default page transition of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_page_transition (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the default popup transition of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_popup_transition (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the icon library of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_icon_library (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the meta data of the passed display point stored for the theme.
-- If that display point is not defined, default values will be used.
-- p_max_fixed_grid_columns should be set to the available maximum columns of the
-- parent container.
--==============================================================================
function get_display_point (
    p_theme_id               in number default wwv_flow.g_flow_theme_id,
    p_application_id         in number default wwv_flow_security.g_flow_id,
    p_security_group_id      in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_grid_template          in wwv_flow_template.t_grid_template,
    p_page_template_id       in number,
    p_region_template_id     in number      default null,
    p_placeholder            in varchar2,
    p_has_grid_support       in boolean,
    p_max_fixed_grid_columns in pls_integer default null )
    return t_display_point;
--
--==============================================================================
-- Returns the calendar attributes of the specified theme.
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
-- Note: For all returned attributes, do_substitutions has already been called,
--       and icon contains the default /i/asfdcldr.gif if no icon has been set for
--       the theme.
--==============================================================================
function get_calendar (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return t_calendar;
--
--==============================================================================
-- Returns the file prefix to references files of the specified theme.
-- If file_prefix doesn't contain a value then the URL to access the theme file storage will be returned.
--
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_file_prefix (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the URL to access the theme file storage in the database.
--
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_db_file_prefix (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id )
    return varchar2;
--
--==============================================================================
-- Returns the prefixed and HTML attribute escaped icon css classes based on the
-- current theme icon library settings.
--
-- If p_theme_id is not specified then the theme of the current user interface
-- will be used.
--==============================================================================
function get_prefixed_icon_css_classes (
    p_theme_id          in number default wwv_flow.g_flow_theme_id,
    p_application_id    in number default wwv_flow_security.g_flow_id,
    p_security_group_id in number default wwv_flow_security.g_curr_flow_security_group_id,
    p_icon_css_classes  in varchar2 )
    return varchar2;
--
--==============================================================================
-- Returns the combined css classes of the manual specified classes and
-- template options.
--==============================================================================
function get_component_css_classes (
    p_component_id             in number,
    p_component_level          in number   default 1,
    p_css_classes              in varchar2,
    p_template_options         in varchar2,
    p_default_template_options in varchar2 )
    return varchar2;
--
--==============================================================================
-- Emits all css files (icon library, theme level css) of the current theme.
--==============================================================================
procedure emit_theme_css;
--
--==============================================================================
-- Emits all css files (css and theme roller css) of the current theme style.
--==============================================================================
procedure emit_theme_style_css;
--
--==============================================================================
-- Emits the javascript files of the of the current theme.
--==============================================================================
procedure emit_theme_javascript;
--
--==============================================================================
-- set current theme style for the current application. To be called from
-- wwv_flow_theme_api.set_current_style.
--==============================================================================
procedure set_current_style (
    p_theme_number   in wwv_flow_themes.theme_id%type,
    p_id             in wwv_flow_theme_styles.name%type
    );
--
--==============================================================================
-- sets a theme style user preference for the current user and application. To
-- be called from wwv_flow_theme_api.set_session_style_css
--==============================================================================
procedure set_session_style_css (
    p_theme_number   in wwv_flow_themes.theme_id%type            default wwv_flow.g_flow_theme_id,
    p_css_file_urls  in wwv_flow_theme_styles.css_file_urls%type
    );
--
--==============================================================================
-- sets a theme style user preference for the current user and application. To
-- be called from wwv_flow_theme_api.set_session_style
--==============================================================================
procedure set_session_style (
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_id             in wwv_flow_theme_styles.id%type
    );
procedure set_session_style (
    p_theme_number   in wwv_flow_themes.theme_id%type   default wwv_flow.g_flow_theme_id,
    p_name           in wwv_flow_theme_styles.name%type
    );

--
--==============================================================================
-- procedures to set, get and clear the theme style user preferences
--==============================================================================
procedure set_user_style_preference(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_id             in wwv_flow_theme_styles.id%type
);

function get_user_style_preference(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id
) return number;

procedure clear_user_style_preference(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_user           in wwv_flow.g_user%type          default wwv_flow.g_user,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id
);

--==============================================================================
-- procedure to clear all theme style user preferences for an application
--==============================================================================
procedure clear_all_users_style_pref(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id
);

--==============================================================================
-- procedure to enable or disable theme style selection by user preference
--==============================================================================
--
procedure enable_style_by_user_pref(
    p_application_id in wwv_flow.g_flow_id%type       default wwv_flow.g_flow_id,
    p_theme_number   in wwv_flow_themes.theme_id%type default wwv_flow.g_flow_theme_id,
    p_enable         in boolean                       default true
);
--
--==============================================================================
-- loads user styles into session state for all user interfaces of the
-- current application
--==============================================================================
procedure set_user_styles;
--
end wwv_flow_theme;
/
show errors

set define '^'
