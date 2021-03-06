Rem $Header: ctx_src_2/src/dr/admin/ctxtab.sql /main/66 2017/08/31 11:58:17 nspancha Exp $
Rem
Rem ctxtab.sql
Rem
Rem Copyright (c) 2002, 2017, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      ctxtab.sql 
Rem
Rem    DESCRIPTION
Rem      creates tables, populates static tables
Rem
Rem    NOTES
Rem
Rem
Rem    BEGIN SQL_FILE_METADATA 
Rem      SQL_SOURCE_FILE: ctx_src_2/src/dr/admin/ctxtab.sql 
Rem      SQL_SHIPPED_FILE: ctx/admin/ctxtab.sql
Rem      SQL_PHASE: CTXTAB
Rem      SQL_STARTUP_MODE: NORMAL 
Rem      SQL_IGNORABLE_ERRORS: NONE 
Rem      SQL_CALLING_FILE: ctx/admin/catctx.sql
Rem    END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    nspancha    08/24/17 - Bug 26634281: Mismatch between fresh and upgraded
Rem                           pdb
Rem    boxia       03/17/17 - Bug 25468759: add idx_auto_opt_para_degree,
Rem                           ixp_auto_opt_para_degree
Rem    nspancha    01/24/17 - Bug25444956: Stopwords should be 255 bytes
Rem    snetrava    01/20/17 - only read priv to dr$policy_tab
Rem    snetrava    01/19/17 - Remove FILE_ACCESS_ROLE revoke trigger
Rem    boxia       01/17/17 - Bug 25390928: add ixp_auto_opt_type,
Rem                           ixp_auto_opt_interval to dr$index_partition
Rem                           to dr$index_partition
Rem    snetrava    01/09/17 - Revoke FILE_ACCESS_ROLE trigger on drop role
Rem    boxia       11/19/16 - Bug 25172618: add col idx_auto_opt_type,
Rem                           idx_auto_opt_interval to dr$index
Rem    nspancha    10/21/16 - Bug 22068230: Expanding token size to 255 bytes
Rem    boxia       06/30/16 - Bug 23732847: add unique constraint for dr$sga
Rem    nspancha    12/22/15 - Bug 22445358:Replacing select with read privelege
Rem    boxia       11/19/15 - Bug 21930951: upd idx_option to varchar2(64)
Rem    surman      01/26/15 - 20411134: Add SQL metadata tags
Rem    thbaby      06/25/14 - 19064729: remove sharing=object from dr$ tables
Rem    yyding      05/02/14 - lrg 11729101
Rem    yyding      03/31/14 - long identifier continued
Rem    shuroy      03/25/14 - Alter dr$preference_value : prv_value as
Rem                           varchar2(4000)
Rem    yyding      03/19/14 - long identifier
Rem    gauryada    08/12/13 - Bug#14744257
Rem    surman      03/15/13 - 16473661: Common start and end scripts
Rem    thbaby      01/10/12 - create index drx$sga_id
Rem    thbaby      01/10/12 - remove primary key for dr$section_group_attribute
Rem    thbaby      01/10/12 - sga_value size increase from 500 to 4000
Rem    hsarkar     12/12/11 - Asynchronous update project
Rem    rkadwe      11/15/11 - ATG integration
Rem    thbaby      06/14/11 - table to hold section group attributes
Rem    hsarkar     06/01/11 - Bug 12615145
Rem    rpalakod    05/26/11 - pluggable db
Rem    gauryada    05/12/11 - Added configuration column to dr$index
Rem    hsarkar     03/24/11 - Date and Pattern Stopclass project
Rem    rpalakod    12/01/10 - section specific attributes
Rem    surman      05/26/10 - 9523887: Make dr$waiting an IOT
Rem    rkadwe      03/31/10 - Document Level Lexer
Rem    rpalakod    07/17/09 - autooptimize
Rem    nenarkhe    06/25/09 - dr$tree
Rem    nenarkhe    04/23/09 - remove dr$mvdata_update
Rem    rpalakod    01/22/08 - Reduce maximum entity length to 512
Rem    rpalakod    01/09/08 - Add compiled column to entdict tabs
Rem    rpalakod    01/02/08 - type array in entdict
Rem    rpalakod    12/28/07 - user_extract_rule
Rem    rpalakod    12/28/07 - new dictionary
Rem    rpalakod    10/19/07 - second set of entity extraction tables
Rem    rpalakod    10/16/07 - first set of entity extraction tables
Rem    ymatsuda    01/18/07 - name search
Rem    wclin       12/08/06 - clob sqe
Rem    skabraha    08/15/06 - add dr$activelogs
Rem    skabraha    07/25/06 - add dr$slowqrys
Rem    skabraha    05/23/06 - add dr$freqtoks
Rem    ymatsuda    02/17/06 - add sec_datatype 
Rem    wclin       02/16/06 - modify dr$sdata_update 
Rem    yucheng     01/20/06 - add idx_other to dr$index 
Rem    gkaminag    10/24/05 - sdata update 
Rem    gkaminag    09/29/05 - cdi indexing 
Rem    oshiowat    05/13/05 - feature usage tracking 
Rem    surman      11/13/03 - 3242708: Remove server tables 
Rem    yucheng     08/11/03 - add ixp_option to dr$index_partition 
Rem    yucheng     07/01/03 - migrate to scheduler
Rem    yucheng     05/01/03 - add sync attributes to dr$index and dr$index_partition
Rem    yucheng     03/28/03 - remove idx_roption
Rem    wclin       02/26/03 - drop dr$part_stats
Rem    ehuang      12/16/02 - dbo table
Rem    smuralid    12/23/02 - add dr$nvtab; remove dr$index.idx_roption
Rem    yucheng     11/14/02 - add idx_roption column to dr$index
Rem    smuralid    11/18/02 - add number_sequence
Rem    wclin       10/03/02 - add smplsz column to dr$stats
Rem    ehuang      07/02/02 - security overhaul changes
Rem    ehuang      06/17/02 - ehuang_component_upgrade
Rem    ehuang      06/11/02 - Created - component upgrade
Rem    gkaminag    06/07/02 - security overhaul phase 1.
Rem    gkaminag    02/08/02 - different key compress check method.
Rem    gkaminag    02/06/02 - handle key compressed indexes not available
Rem    yucheng     12/24/01 - online support
Rem    gkaminag    10/23/01 - add policy tables and views.
Rem    wclin       09/26/01 - ctxxpath index type
Rem    gkaminag    10/08/01 - ver_dict to 9.2.0.0.0.
Rem    ehuang      08/08/01 - add lock failure column to dr$pending
Rem    mfaisal     01/04/01 - user-defined lexer
Rem    gkaminag    04/19/01 - version to 9.0.1
Rem    gkaminag    04/10/01 - add partition information into pending
Rem    gkaminag    02/21/01 - version to 9.0.0
Rem    wclin       09/19/00 - chng dr$temp_stats to dr$part_stats
Rem    wclin       09/05/00 - add dr$temp_stats
Rem    gkaminag    08/28/00 -
Rem    gkaminag    08/28/00 - dynamic ctx_version view
Rem    gkaminag    08/14/00 - partition support
Rem    gkaminag    08/14/00 - partitioning support
Rem    gkaminag    08/10/00 - partitioning support
Rem    yucheng     08/08/00 - local domain index support
Rem    salpha      06/26/00 - ctxrule implementation
Rem    gkaminag    06/28/00 - adjust ctx_version view
Rem    ehuang      03/27/00 - grant insert on thes tables to ctxapp
Rem    gkaminag    02/21/00 - implement ctxcat type
Rem    gkaminag    12/21/99 - add thesaurus views
Rem    gkaminag    11/01/99 - multi stoplist
Rem    gkaminag    10/11/99 - keyless index
Rem    gkaminag    08/09/99 - bug 957734
Rem    gkaminag    06/21/99 - format and charset columns
Rem    gkaminag    06/11/99 - attr sections
Rem    gkaminag    06/09/99 - prompt typo
Rem    gkaminag    06/07/99 - multi-lingual lexer
Rem    gkaminag    05/27/99 - stop section bugs
Rem    gkaminag    05/21/99 - add max length for string attributes
Rem    ymatsuda    04/27/99 - parallel indexing
Rem    gkaminag    01/28/99 - make ctx_object_attribute_lov public
Rem    gkaminag    10/15/98 - make object dictionary public
Rem    ehuang      10/14/98 -
Rem    ehuang      10/13/98 - add ctx_version
Rem    gkaminag    10/09/98 - add index id to index views
Rem    wclin       10/07/98 - change dr$stats table
Rem    wclin       09/01/98 - create dr$sqe IOT with overflow clause
Rem    dyu         08/09/98 - Fix integration error
Rem    ehuang      08/06/98 - add dr$ths_fphrase
Rem    gkaminag    07/29/98 - increase length of text column name in dr$index
Rem    gkaminag    07/02/98 - independent sqe's
Rem    gkaminag    06/30/98 - new views, correct ctx_classes
Rem    gkaminag    06/13/98 - lov translations
Rem    wclin       06/04/98 - modify dr$stats
Rem    gkaminag    06/05/98 - sentpara sections
Rem    gkaminag    06/04/98 - add err_timestamp
Rem    gkaminag    06/03/98 - unique column constraint
Rem    gkaminag    05/30/98 - field section visibility
Rem    gkaminag    05/29/98 - remove idx_owner
Rem    gkaminag    05/28/98 - stoplist count
Rem    gkaminag    05/22/98 - add optimize columns to dr$index
Rem    ehuang      05/18/98 - add sec_type sec_fid to dr$section
Rem    gkaminag    05/19/98 - system preferences
Rem    ehuang      05/14/98 - add cla_system to dr$class
Rem    wclin       05/13/98 - add dr$stats
Rem    gkaminag    05/11/98 - use object and user id's
Rem    gkaminag    05/05/98 - table owner in dr$index
Rem    cbhavsar    04/29/98 - Trusted callout messaging
Rem    gkaminag    04/17/98 - new stopword types
Rem    wclin       04/07/98 - Add dr$delete
Rem    gkaminag    04/16/98 - fix view sql
Rem    dyu         04/08/98 - ctx_column_indexes ctx_indexes
Rem    ehuang      04/06/98 - merge index/text_index, drop text_index_log
Rem    dyu         04/06/98 - dr$indexx -> dr$index
Rem    ehuang      03/30/98 - dr$policy->dr$index
Rem    gkaminag    04/02/98 - section groups now have type
Rem    dyu         04/01/98 - dr$preference_value key should be unique
Rem    dyu         03/29/98 - fix synonym ctx_class
Rem    mfaisal     03/26/98 - Adding Hierarchical Query Feedback
Rem    ehuang      03/25/98 - rm reference to CTXADMIN, CTXUSER roles
Rem    gkaminag    03/24/98 - normalize section group table
Rem    dyu         03/23/98 - Fix ctx_user_section_groups
Rem    dyu         03/23/98 - create ctx_user_index_errors
Rem    ehuang      03/20/98 - new dr$sqe schema
Rem    gkaminag    03/17/98 - preference system change
Rem    dyu         03/16/98 -
Rem    gkaminag    03/14/98 - change services queue schema
Rem    gkaminag    03/12/98 - cleanup
Rem    ehuang      03/03/98 - 8.1 preference system
Rem    jkud        03/04/98 - remove settings
Rem    ehuang      02/27/98 - new stoplist objects
Rem    gkaminag    02/24/98 - dml redesign
Rem    gkaminag    12/09/97 - add pol_text_length
Rem    cbhavsar    08/22/97 - Bug 532975
Rem    gkaminag    07/31/97 - eliminate dr$lexicon for 2.3.4.
Rem    gkaminag    07/15/97 - new DML queue
Rem    ehuang      06/18/97 - add dr$lexicon
Rem    ymatsuda    06/25/97 - remove dr$bind
Rem    ehuang      06/10/97 - Bug 503897
Rem    ehuang      05/23/97 - Bug 496155
Rem    ehuang      05/14/97 - add txi_trigger to dr$text_index
Rem    gkaminag    05/13/97 - add dbid to dr$server
Rem    gkaminag    05/08/97 - index on nls_message
Rem    gkaminag    05/05/97 - remove binning
Rem    gkaminag    04/29/97 - increase txi_name length
Rem    ehuang      04/09/97 - added Section Search objects
Rem    gkaminag    04/04/97 - creation of all data dictionary TABLES
Rem    gkaminag    04/04/97 - Created
Rem

@@?/rdbms/admin/sqlsessstart.sql

REM ===================================================================
REM OBJECT DICTIONARY TABLES
REM
REM These tables define the objects in the ConText framework
REM They are static, populated at install time
REM ===================================================================


-- set this parameter for creating common objects in consolidated database
alter session set "_oracle_script"= TRUE;

REM -------------------------------------------------------------------
REM  dr$system_param 
REM -------------------------------------------------------------------

PROMPT ... creating table dr$parameter

create table dr$parameter(
  par_name    varchar2(128)  primary key
 ,par_value   varchar2(500)
)
organization index;

REM -------------------------------------------------------------------
REM  dr$class - 
REM -------------------------------------------------------------------

rem  This table contains an entry for each object class
rem 
rem    cla_id     - class id 
rem    cla_name   - the class name. 
rem    cla_desc   - the description of the class
rem    cla_system - Y if it's a system class,unaccessible to user, N otherwise'
rem 

PROMPT ... creating table dr$class
CREATE TABLE dr$class 
(
  cla_id                         NUMBER
 ,cla_name                       VARCHAR2(128)
 ,cla_desc                       VARCHAR2(80)
 ,cla_system                     VARCHAR2(1)
 ,CONSTRAINT drc$cla_key         PRIMARY KEY (cla_id)
                                  USING INDEX STORAGE (INITIAL 5K NEXT 5K)
)
STORAGE (INITIAL 1K NEXT 1K);

REM -------------------------------------------------------------------
REM  dr$object - 
REM -------------------------------------------------------------------

rem  This table contains instances of the classes described in dr$class. 
rem 
rem    obj_id           - object id (unique within classes)
rem    obj_cla_id       - class id of the object
rem    obj_name         - the object name(unique across all objects)
rem    obj_desc         - the descriptions of this object
rem    obj_system       - if 'Y', users not allowed to create prefs using
rem                       this object. Object also hidden in all views.

PROMPT ... creating table dr$object
CREATE TABLE dr$object 
(
  obj_cla_id                NUMBER
 ,obj_id                    NUMBER
 ,obj_name                  VARCHAR2(128)
 ,obj_desc                  VARCHAR2(80)
 ,obj_system                CHAR(1) 
 ,CONSTRAINT drc$obj_key    PRIMARY KEY (obj_cla_id, obj_id)
                             USING INDEX STORAGE (INITIAL 5K NEXT 5K)
 ,CONSTRAINT drc$obj_name   UNIQUE(obj_name)
                             USING INDEX STORAGE (INITIAL 5K NEXT 5K)
)
STORAGE (INITIAL 10K NEXT 10K);

REM -------------------------------------------------------------------
REM  dr$object_attribute - 
REM -------------------------------------------------------------------

rem  definition of each attribute of a TILE (or framework object)
rem 
rem    oat_id       - object attribute ID (unique across all obj attr)
rem    oat_cla_id   - class
rem    oat_obj_id   - object
rem    oat_att_id   - attribute id (unique within object)
rem    oat_name     - attribute name
rem    oat_desc     - description of the attribute
rem    oat_required - if 'Y'. a value for this attribute must by provided
rem                   for all preferences using this object
rem    oat_system   - if 'Y', user cannot set this attribute. Attribute and
rem                   attributes values also hidden in all views. If 
rem                   obj_system is true for this object. ALL attributes 
rem                   should also have oat_system  = 'Y'
rem    oat_static   - if 'Y', users can reset this attribute without having
rem                   to reindex
rem    oat_datatype - 'S' = string, 'I' = integer, 'B' for boolean
rem    oat_default  - default value for attribute
rem    oat_upper    - for string attributes, if 'Y' then values are 
rem                   automatically uppercased
rem    oat_val_min  - for integer attributes. range min
rem    oat_val_max  - for integer attributes, range max
rem    oat_lov      - if 'Y', an LOV exists for this attribute

PROMPT ... creating table dr$object_attribute
CREATE TABLE dr$object_attribute 
(
  oat_id                    NUMBER
 ,oat_cla_id                NUMBER
 ,oat_obj_id                NUMBER
 ,oat_att_id                NUMBER
 ,oat_name                  VARCHAR2(128)
 ,oat_desc                  VARCHAR2(80)
 ,oat_required              CHAR(1) 
 ,oat_system                CHAR(1)
 ,oat_static                CHAR(1)
 ,oat_datatype              CHAR(1)
 ,oat_default               VARCHAR2(500)
 ,oat_val_min               NUMBER
 ,oat_val_max               NUMBER
 ,oat_lov                   CHAR(1)
 ,CONSTRAINT  drc$oat_key   PRIMARY KEY (oat_id)
                             USING INDEX STORAGE (INITIAL 10K NEXT 10K) 
 ,CONSTRAINT  drc$oat_name  UNIQUE (oat_cla_id, oat_obj_id, oat_name)
                             USING INDEX STORAGE (INITIAL 10K NEXT 10K) 
)
STORAGE (INITIAL 20K NEXT 20K);

rem this grant is needed for parallel optimize
grant read on dr$object_attribute to public;

REM -------------------------------------------------------------------
REM  dr$object_attribute_lov - 
REM -------------------------------------------------------------------

REM NOTE: even though oal_value is really a number, it should be
REM a varchar2 here or the ctx_ views may get ORA errors.

PROMPT ... creating table dr$object_attribute_lov
CREATE TABLE dr$object_attribute_lov 
(
  oal_oat_id                NUMBER
 ,oal_label                 VARCHAR2(128)
 ,oal_value                 VARCHAR2(10)
 ,oal_desc                  VARCHAR2(80)
)
STORAGE (INITIAL 5K NEXT 5K);

CREATE INDEX drx$oal_id 
  ON dr$object_attribute_lov(oal_oat_id)
  STORAGE (INITIAL 1K NEXT 1K);

REM ===================================================================
REM PREFERENCE TABLES
REM
REM These tables store customer settings in groups called 
REM preferences.  These tables will be populated over the life
REM of the system
REM ===================================================================



REM -------------------------------------------------------------------
REM  dr$preference - 
REM -------------------------------------------------------------------

rem  A preference references a framework object. It describes how a referenced
rem  object is to be used (or fine tuned). 
rem
rem  A object can be referenced by one or more preferences which reference a 
rem  same framework object e.g. there are several preferences referencing a 
rem  particular lexer.  Each preference would reference the lexer with
rem  different options
rem  
rem  pre_id         - preference id
rem  pre_owner      - preference owner
rem  pre_name       - preference name (unique within owner)
rem  pre_cla_id     - peference class
rem  pre_obj_id     - preference object
rem  pre_valid      - if 'N' preference needs to be validated
rem

PROMPT ... creating table dr$preference
CREATE TABLE dr$preference(
  pre_id                    NUMBER
 ,pre_owner#                NUMBER
 ,pre_name                  VARCHAR2(128)
 ,pre_obj_id                NUMBER
 ,pre_cla_id                NUMBER
 ,pre_valid                 CHAR(1)
 ,CONSTRAINT drc$pre_key    PRIMARY KEY (pre_id)
 ,CONSTRAINT drc$pre_name   UNIQUE      (pre_owner#, pre_name)
);

REM -------------------------------------------------------------------
REM  dr$preference_value - 
REM -------------------------------------------------------------------

rem  This table keeps track of the value(s) assigned to each preference
rem  attribute, for each preference.  For instance, if I create a
rem  preference for OSFILE, it has an attribute PATH, with a value of
rem  '/data/files'.  The value '/data/files' is stored in this table.
rem

PROMPT ... creating table dr$preference_value

CREATE TABLE dr$preference_value(
  prv_pre_id                NUMBER
 ,prv_oat_id                NUMBER
 ,prv_value                 VARCHAR2(4000)
 ,constraint drc$prv_key primary key (prv_pre_id, prv_oat_id)
);

REM -------------------------------------------------------------------
REM  dr$index - 
REM -------------------------------------------------------------------

rem  This table contains both templates and index that have been assigned
rem  to to column; we will call the latter column indexes.
rem
rem  A column index can not be updated if index has already been created for
rem  it. 
rem  
rem   a) DR_TEMPLATES_INDEXES      -  system view on all template indexes, 
rem                                   i.e. 
rem                                   those that have not been assigned to any
rem                                   specific colum
rem   b) CTX_COLUMN_INDEXES        - user view of all column indexes,
rem   c) CTX_USER_TEMPLATE_INDXES  - user view of template indexes,
rem   d) CTX_USER_COLUMN_INDEXES   - user view of column indexes 
rem COLUMNS:
rem  idx_id             - the TEXTILE id of the policy,
rem  idx_owner          - the name of the user who is the owner of the table,
rem  idx_name           - the name of the policy. If the pol_tablename is not
rem                       null, then this field is the name of the text column
rem                       in the text table,
rem  idx_table          - text table name
rem  idx_key_name       - the name of the primary key column in the table
rem                       identified by pol_tablename,
rem  idx_key_type       - the datatype of the primary key column
rem  idx_text_name      - type nane of the text column
rem  idx_text_type      - the datatype of the text column
rem  idx_text_length    - the maximum length of the text column
rem  idx_docid_count    - number of documents associated with the policy
rem  idx_status         - indexing status
rem  idx_version        -
rem  idx_nextid         -
rem  idx_src_name       - used by a shadow index
rem                       to store source index name.
rem  idx_src_id         - source index id
rem  idx_auto_opt_type        - the auto optimize type
rem  idx_auto_opt_interval    - the repeat interval for auto optimize
rem  idx_auto_opt_para_degree - the parallel degree of auto optimize
rem  
rem CONSTRAINTS:
rem  a) idx_id is unique system wide
rem  b) unique constraint on idx_owner, idx_name. idx_name must be unique
rem     per user.
rem 
PROMPT ... creating table dr$index
CREATE TABLE dr$index
(
 idx_id                   NUMBER(38,0)     NOT NULL,
 idx_owner#               NUMBER           NOT NULL,
 idx_name                 VARCHAR2(128)     NOT NULL,
 idx_table_owner#         NUMBER           NOT NULL,
 idx_table#               NUMBER           NOT NULL,
 idx_key_name             VARCHAR2(256),
 idx_key_type             NUMBER,
 idx_text_name            VARCHAR2(256)    NOT NULL,
 idx_text_type            NUMBER           NOT NULL,
 idx_text_length          NUMBER           DEFAULT 0,
 idx_docid_count          NUMBER           DEFAULT 0,
 idx_status               VARCHAR2(12)     NOT NULL,
 idx_version              NUMBER, 
 idx_nextid               NUMBER,
 idx_opt_token            VARCHAR2(255),
 idx_opt_type             NUMBER,
 idx_opt_count            NUMBER,
 idx_language_column      VARCHAR2(256),
 idx_format_column        VARCHAR2(256),
 idx_charset_column       VARCHAR2(256),
 idx_type                 NUMBER           NOT NULL,
 idx_option               VARCHAR2(64), 
 idx_sync_type            VARCHAR2(20)     DEFAULT NULL,
 idx_sync_memory          VARCHAR2(100)    DEFAULT NULL,
 idx_sync_para_degree     NUMBER           DEFAULT NULL,
 idx_sync_interval        VARCHAR2(2000)   DEFAULT NULL,
 idx_sync_jobname         VARCHAR2(128)    DEFAULT NULL,
 idx_src_name             VARCHAR2(128)    DEFAULT NULL,
 idx_src_id               NUMBER           DEFAULT 0,
 idx_config_column        VARCHAR2(256),
 idx_auto_opt_type        VARCHAR2(20)     DEFAULT NULL,
 idx_auto_opt_interval    VARCHAR2(2000)   DEFAULT NULL,
 idx_auto_opt_para_degree NUMBER           DEFAULT NULL,
 CONSTRAINT drc$idx_key     PRIMARY KEY ( idx_id ),
 CONSTRAINT drc$idx_colspec UNIQUE   ( idx_owner#, idx_name )
);

create index drc$idx_column on dr$index(idx_table#, idx_text_name);


REM -------------------------------------------------------------------
REM  dr$index_partition  
REM -------------------------------------------------------------------

rem  This table contains all the index partitions. 
rem
rem COLUMNS:
rem  ixp_id                  - index partition id,
rem  ixp_name                - index partition name,
rem  ixp_idx_id              - index id,
rem  ixp_tablepartition_id   - table partition id,
rem  ixp_docid_count         - number of documents associated with 
rem                            the partition 
rem  ixp_nextid              -
rem  ixp_opt_token       
rem  ixp_opt_type
rem  ixp_opt_count
rem  
rem CONSTRAINTS:
rem 
PROMPT ... creating table dr$index_partition
CREATE TABLE dr$index_partition
(
  ixp_id                   NUMBER(38,0)  NOT  NULL,
  ixp_name                 VARCHAR2(128)  NOT  NULL,
  ixp_idx_id               NUMBER(38,0)  NOT  NULL,
  ixp_table_partition#     NUMBER(38,0)  NOT  NULL,
  ixp_docid_count          NUMBER(38,0)  DEFAULT 0,
  ixp_status               VARCHAR2(12)  NOT NULL,
  ixp_nextid               NUMBER(38,0),
  ixp_opt_token            VARCHAR2(255),
  ixp_opt_type             NUMBER(38,0),
  ixp_opt_count            NUMBER(38,0),
  ixp_sync_type            VARCHAR2(20)     DEFAULT NULL,
  ixp_sync_memory          VARCHAR2(100)    DEFAULT NULL,
  ixp_sync_para_degree     NUMBER           DEFAULT NULL,
  ixp_sync_interval        VARCHAR2(2000)   DEFAULT NULL,
  ixp_sync_jobname         VARCHAR2(128)    DEFAULT NULL,
  ixp_option               VARCHAR2(40),
  ixp_auto_opt_type        VARCHAR2(20)     DEFAULT NULL,
  ixp_auto_opt_interval    VARCHAR2(2000)   DEFAULT NULL,
  ixp_auto_opt_para_degree NUMBER           DEFAULT NULL,
 CONSTRAINT drc$ixp_key    PRIMARY KEY (ixp_idx_id, ixp_id)
);

create unique index drx$ixp_name 
on dr$index_partition(ixp_idx_id, ixp_name);

REM -------------------------------------------------------------------
REM  dr$index_value - 
REM -------------------------------------------------------------------
rem   
rem  This table contains the attribute and attribute values of
rem  a policy
rem  
rem   
rem  COLUMNS:
rem   ixv_idx_id     - index id (policy id)
rem   ixv_oat_id     - attribute id
rem   ixv_value      - attribute value
rem   
PROMPT ... creating table dr$index_value
CREATE TABLE dr$index_value
(
  ixv_idx_id                NUMBER(38,0),   
  ixv_oat_id                NUMBER(38,0), 
  ixv_value                 VARCHAR2(4000) NOT NULL,
  ixv_sub_group             NUMBER(38,0) default 0,
  ixv_sub_oat_id            NUMBER(38,0) default 0
);

create index drx$ixv_key 
on dr$index_value(ixv_idx_id, ixv_oat_id, ixv_sub_group, ixv_sub_oat_id);

REM -------------------------------------------------------------------
REM  dr$policy_tab
REM -------------------------------------------------------------------

rem  This table is a dummy table for use by policies
rem
rem COLUMNS:
rem  plt_policy - dummy column
rem 
PROMPT ... creating table dr$policy_tab
CREATE TABLE dr$policy_tab
(
 plt_policy               CHAR(1),
 plt_langcol              CHAR(1)
);

GRANT read ON dr$policy_tab to public;

REM -------------------------------------------------------------------
REM  dr$index_object - 
REM -------------------------------------------------------------------
rem
rem  COLUMNS:
rem   ixo_idx_id     - index id (policy id)
rem   ixo_cla_id     - class id
rem   ixo_obj_id     - object id
rem   ixo_acnt       -  
PROMPT ... creating table dr$index_object
CREATE TABLE dr$index_object
(
  ixo_idx_id                 NUMBER(38,0),  
  ixo_cla_id                 NUMBER(38,0), 
  ixo_obj_id                 NUMBER(38,0),
  ixo_acnt                   NUMBER(38,0),
  CONSTRAINT drc$ixo_key PRIMARY KEY (ixo_idx_id, ixo_cla_id)
)
ORGANIZATION INDEX;


REM -------------------------------------------------------------------
REM  dr$sqe - 
REM -------------------------------------------------------------------

rem  COLUMNS:
rem   sqe_owner#         - owner of the SQE
rem   sqe_name           - Name of the SQE
rem   sqe_query          - query text 
rem  NOTES:
 
PROMPT ... creating table dr$sqe
 
CREATE TABLE dr$sqe(
 sqe_owner#               NUMBER         NOT NULL,
 sqe_name                 VARCHAR2(128)   NOT NULL,
 sqe_query                CLOB NOT NULL,
 PRIMARY KEY (sqe_owner#, sqe_name)
)
organization index overflow
/

REM -------------------------------------------------------------------
REM  dr$ths - 
REM -------------------------------------------------------------------

prompt ... creating table dr$ths

CREATE TABLE dr$ths (
    ths_id        NUMBER         PRIMARY KEY
  , ths_name      VARCHAR2(128)   UNIQUE NOT NULL
  , ths_owner#    NUMBER         NOT NULL
  , ths_case      VARCHAR2(1)    DEFAULT 'N' NOT NULL 
                                  CHECK(ths_case IN ('Y','N'))
);

grant read on dr$ths to public;
grant insert on dr$ths to ctxapp;

REM -------------------------------------------------------------------
REM  dr$ths_phrase - 
REM -------------------------------------------------------------------

prompt ... creating table dr$ths_phrase
CREATE TABLE dr$ths_phrase (
  thp_id        NUMBER         PRIMARY KEY
, thp_thsid     NUMBER         REFERENCES dr$ths(ths_id)
                                 ON DELETE CASCADE
, thp_phrase    VARCHAR2(256)  NOT NULL
, thp_qualify   VARCHAR2(256)
, thp_note      VARCHAR2(2000)
, thp_ringid    NUMBER
);

grant read on dr$ths_phrase to public;
grant insert on dr$ths_phrase to ctxapp;
grant update on dr$ths_phrase to ctxapp;

REM dr_uniq_ths_phrase has compress on by default.  But standard edition does 
REM not support compress.  v$option is not a consistent way to check for
REM such support, so instead we just try to create it with compress, and
REM if this fails, then we create it without compress.
 
declare
  val number;
  stm varchar2(256) := 
      'create unique index dr_uniq_ths_phrase '||
      'on dr$ths_phrase(thp_thsid, thp_phrase, thp_qualify)';
  unsupported exception;
  pragma exception_init(unsupported, -439);
begin
  execute immediate stm || ' compress 1';
exception
  when unsupported then
    execute immediate stm;
end;
/
create index dr_ths_ringid on dr$ths_phrase(thp_ringid);

REM -------------------------------------------------------------------
REM  dr$ths_fphrase - 
REM -------------------------------------------------------------------

prompt ... creating table dr$ths_fphrase

CREATE TABLE dr$ths_fphrase (
  thf_thp_id     NUMBER        REFERENCES dr$ths_phrase(thp_id)
                                 ON DELETE CASCADE
, thf_phrase    VARCHAR2(256)  NOT NULL
, thf_type      VARCHAR2(10)   NOT NULL
, PRIMARY KEY(thf_thp_id, thf_phrase, thf_type)
) 
organization index;

grant insert on dr$ths_fphrase to ctxapp;

REM -------------------------------------------------------------------
REM  dr$ths_bt - 
REM -------------------------------------------------------------------

prompt ... creating table dr$ths_bt
CREATE TABLE dr$ths_bt (
  thb_thp_id    NUMBER         REFERENCES dr$ths_phrase(thp_id)
                                 ON DELETE CASCADE
, thb_type      VARCHAR2(3)    NOT NULL
, thb_bt        NUMBER         REFERENCES dr$ths_phrase(thp_id)
                                 ON DELETE CASCADE
);

grant insert on dr$ths_bt to ctxapp;

create unique index dr_uniq_ths_bt on dr$ths_bt(thb_thp_id, thb_type, thb_bt);
create index dr_ths_bt on dr$ths_bt(thb_bt, thb_type);

REM -------------------------------------------------------------------
REM  dr$section_group - 
REM -------------------------------------------------------------------

rem  This table is used to hold all the section group names
rem
rem  COLUMNS:
rem
rem     sgp_id     -  unique numeric identifier of the section group
rem     sgp_name   -  section group name
rem     sgp_owner  -  owner of the section group
rem 
rem  NOTES:
rem

PROMPT ... creating table dr$section_group
CREATE TABLE dr$section_group(
   sgp_id       NUMBER,       
   sgp_owner#   NUMBER       NOT NULL,
   sgp_name     VARCHAR2(128) NOT NULL,
   sgp_obj_id   NUMBER,   
   CONSTRAINT drc$sgp_key primary key (sgp_id),
   CONSTRAINT drc$sgp_uniqe unique (sgp_name, sgp_owner#)
)
/

rem This table holds section group specific attribute values

PROMPT ... creating table dr$section_group_attribute
create table dr$section_group_attribute
(
  sga_id        number,
  sga_sgat_id   number,
  sga_value     varchar2(4000),
  CONSTRAINT drc$sga_uniqe unique (sga_id, sga_sgat_id)
);

REM -------------------------------------------------------------------
REM  dr$section - 
REM -------------------------------------------------------------------

rem  This table is used to hold all the sections
rem
rem  COLUMNS:
rem
rem    sec_id         -  unique numeric identifier of the section 
rem    sec_name       -  name of the section
rem    sec_sgp_id     -  secton group the section belongs to
rem    sec_tag        -  a pattern which marks the start of a section

PROMPT ... creating table dr$section
CREATE TABLE dr$section(
   sec_id           NUMBER,        
   sec_type         NUMBER,       
   sec_name         VARCHAR2(128)  NOT NULL,
   sec_sgp_id       NUMBER,
   sec_tag          VARCHAR2(256),
   sec_fid          NUMBER,
   sec_visible      CHAR(1),
   sec_datatype     NUMBER,
   CONSTRAINT drc$sec_key primary key (sec_id) 
)
/

create index drx$sec_tag on dr$section(sec_tag, sec_sgp_id);

create index drx$sec_name on dr$section(sec_name, sec_sgp_id);

REM ------------------------------------------------------------------------
REM dr$section_attribute
REM ------------------------------------------------------------------------

rem This table holds section specific attribute values

PROMPT ... creating table dr$section_attribute
create table dr$section_attribute
(
  sca_sgp_id number,
  sca_sec_id number,
  sca_sat_id number,
  sca_value  varchar2(500),
  primary key(sca_sgp_id, sca_sec_id, sca_sat_id)
) organization index;

REM -------------------------------------------------------------------
REM  dr$stoplist - 
REM -------------------------------------------------------------------

rem This table holds the stoplists
rem
rem COLUMNS:
rem   slist_id      -   unique numeric identifier of the stoplist
rem   slist_name    -   owner of the stoplist
rem   slist_owner   -   name of the stoplist

PROMPT ... creating table dr$stoplist
CREATE TABLE dr$stoplist(
   spl_id          NUMBER       constraint dr_stoplist_pk PRIMARY KEY,
   spl_owner#      NUMBER       NOT NULL,
   spl_name        VARCHAR2(128) NOT NULL,
   spl_count       NUMBER       NOT NULL,
   spl_type        NUMBER       NOT NULL,
CONSTRAINT dr_stoplist_uniq UNIQUE(spl_name, spl_owner#)
)
/

REM -------------------------------------------------------------------
REM  dr$stopword - 
REM -------------------------------------------------------------------

rem This table holds all the stopwords for all the stoplists
rem
rem COLUMNS
rem
rem  sword_slist_id  -  stoplist the stopword belongs to
rem  sword           -  stopword

PROMPT ... creating table dr$stopword
CREATE TABLE dr$stopword(
   spw_spl_id    NUMBER       NOT NULL,
   spw_type      NUMBER       NOT NULL,
   spw_language  VARCHAR2(30) NOT NULL,
   spw_word      VARCHAR2(255) NOT NULL,
   spw_lang_dependent CHAR(1),
   spw_pattern   VARCHAR2(512) DEFAULT NULL,
   PRIMARY KEY (spw_spl_id, spw_type, spw_language, spw_word)
)  ORGANIZATION INDEX;

REM -------------------------------------------------------------------
REM  dr$sub_lexer - 
REM -------------------------------------------------------------------

rem This table holds all the sub-lexer references for multi-lingual lexers
rem
rem COLUMNS
rem
rem  slx_pre_id      - id of referencing lexer
rem  slx_language    - language of sub lexer
rem  slx_sub_pre_id  - id of sub lexer
rem  slx_alt_value   - alternate value of language 
rem  slx_lang_dependent - is the sublexer language dependent?

PROMPT ... creating table dr$sub_lexer
CREATE TABLE dr$sub_lexer(
   slx_pre_id     NUMBER       NOT NULL,
   slx_language   VARCHAR2(30) NOT NULL,
   slx_alt_value  VARCHAR2(30),
   slx_sub_pre_id NUMBER       NOT NULL,
   slx_lang_dependent CHAR(1),
   constraint drc$slx_key PRIMARY KEY (slx_pre_id, slx_language)
);

create index drx$slx_sub_pre_id
on dr$sub_lexer(slx_sub_pre_id);

REM -------------------------------------------------------------------
REM  dr$index_set - 
REM -------------------------------------------------------------------

rem  This table is used to hold all the index set names
rem
rem  COLUMNS:
rem
rem     ixs_id     -  unique numeric identifier of the index set
rem     ixs_name   -  index set name
rem     ixs_owner  -  owner of the index set
rem 
rem  NOTES:
rem

PROMPT ... creating table dr$index_set
CREATE TABLE dr$index_set(
   ixs_id       NUMBER,       
   ixs_owner#   NUMBER       NOT NULL,
   ixs_name     VARCHAR2(128) NOT NULL,
   CONSTRAINT drc$ixs_key primary key (ixs_id),
   CONSTRAINT drc$ixs_name unique (ixs_name, ixs_owner#)
)
/

REM -------------------------------------------------------------------
REM  dr$index_set_index - 
REM -------------------------------------------------------------------

rem  This table is used to hold all the indexes in an index set
rem
rem  COLUMNS:
rem
rem    ixx_ixs_id     -  unique numeric identifier of the index set 
rem    ixx_collist    -  column list of the index
rem    ixx_storage    -  storage clause of the index

PROMPT ... creating table dr$index_set_index
CREATE TABLE dr$index_set_index(
   ixx_ixs_id       NUMBER,        
   ixx_collist      VARCHAR2(500)  NOT NULL,
   ixx_storage      VARCHAR2(500),
   CONSTRAINT drc$ixx_key primary key (ixx_ixs_id, ixx_collist)
)
/

REM ===================================================================
REM ADMINISTRATION TABLES
REM
REM These are tables necessary for communication, process management,
REM and other internal details of context server
REM ===================================================================


REM -------------------------------------------------------------------
REM  dr$pending
REM -------------------------------------------------------------------

PROMPT ... creating table dr$pending

create table dr$pending (
  pnd_cid           number  NOT NULL,
  pnd_pid           number  default 0 NOT NULL,
  pnd_rowid         rowid   NOT NULL,
  pnd_timestamp     date,
  pnd_lock_failed   char(1) default 'N',
  primary key (pnd_cid, pnd_pid, pnd_rowid)
) 
organization index 
storage (freelists 10);

REM -------------------------------------------------------------------
REM  dr$waiting
REM -------------------------------------------------------------------

PROMPT ... creating table dr$waiting

create table dr$waiting (
  wtg_cid       number  NOT NULL,
  wtg_rowid     rowid,
  wtg_pid       number default 0,
  primary key (wtg_cid, wtg_pid, wtg_rowid)
)
organization index;

REM -------------------------------------------------------------------
REM  dr$online_pending
REM -------------------------------------------------------------------

PROMPT ... creating table dr$online_pending

create table dr$online_pending (
  onl_cid             number not null,
  onl_rowid           varchar(18) not null,
  onl_indexpartition  varchar(128) default null,
  primary key (onl_cid, onl_rowid)
)
organization index
storage (freelists 10);

REM -------------------------------------------------------------------
REM  dr$delete
REM -------------------------------------------------------------------

PROMPT ... creating table dr$delete

create table dr$delete (
  del_idx_id    number,
  del_ixp_id    number,
  del_docid     number,
  del_updated   char(1) default 'N',
  constraint drc$del_key primary key (del_idx_id, del_ixp_id, del_docid)
)
organization index;


REM -------------------------------------------------------------------
REM  dr$unindexed
REM -------------------------------------------------------------------

PROMPT ... creating table dr$unindexed

create table dr$unindexed (
  unx_idx_id    number,
  unx_ixp_id    number,
  unx_rowid     rowid,
  constraint drc$unx_key primary key (unx_idx_id, unx_ixp_id, unx_rowid)
)
organization index;

REM -------------------------------------------------------------------
REM  dr$index_error - 
REM -------------------------------------------------------------------

PROMPT ... creating table dr$index_error

CREATE TABLE dr$index_error(
  err_idx_id      number,
  err_timestamp   date,
  err_textkey     varchar2(18),
  err_text        varchar2(4000)
);

REM -------------------------------------------------------------------
REM  dr$parallel
REM -------------------------------------------------------------------

PROMPT ... creating table dr$parallel

CREATE TABLE DR$PARALLEL (
  P_IDX_ID     NUMBER,         -- index id
  P_SLAVE_ID   NUMBER,         -- slave id
  P_JOB        NUMBER,         -- job number
  P_PARTITION  VARCHAR2(128),   -- partition name
  P_STATUS     VARCHAR2(10),   -- status
  P_ERROR      VARCHAR2(2000), -- error message
  PRIMARY KEY (P_IDX_ID, P_SLAVE_ID)) ORGANIZATION INDEX OVERFLOW;

REM -------------------------------------------------------------------
REM  dr$stats 
REM -------------------------------------------------------------------

PROMPT ... creating table dr$stats

CREATE TABLE dr$stats(
 idx_id          NUMBER(38,0)     primary key, 
 smplsz          NUMBER           default 0
);


REM -------------------------------------------------------------------
REM  dr$number_sequence
REM  Contains integers from 1..2048. Used for parallel optimize
REM  DO NOT increase beyond 3600 before changing drvddl.CursorToBitVector
REM -------------------------------------------------------------------

CREATE TABLE dr$number_sequence(num number);
DECLARE
  i INTEGER;
BEGIN
  FOR i IN 1..2048 LOOP
    INSERT INTO dr$number_sequence VALUES(i);
  END LOOP;
  COMMIT;
END;
/
GRANT read ON dr$number_sequence TO PUBLIC;

REM -------------------------------------------------------------------
REM  dr$dbo
REM -------------------------------------------------------------------

CREATE TABLE dr$dbo(
  dbo_name  varchar2(128),
  dbo_type  varchar2(30),
  primary key (dbo_name, dbo_type)
) organization index;

REM ===================================================================
REM SEQUENCES
REM
REM All sequence creations in this section
REM ===================================================================

rem 
rem Create sequences used for dr_ids. The range number between 1-1000
rem is reserved for used by Framework Classes and Objects. This sequence is
rem used for items such as preferences, column/template indexes etc.
rem It is important not to overlap the class/object ids with preferences.
rem

create sequence dr_id_seq start with  1000;
create sequence mesg_id_seq start with  1000;
create sequence ths_seq;

REM ===================================================================
REM ORACLE OBJECT TYPES
REM ===================================================================

PROMPT ... creating named data type ctx_feedback_item_type
CREATE OR REPLACE TYPE ctx_feedback_item_type AS OBJECT
(text        VARCHAR2(80),
 cardinality NUMBER,
 score       NUMBER,
 MAP MEMBER FUNCTION rank RETURN REAL,
 PRAGMA RESTRICT_REFERENCES (rank, RNDS, WNDS, RNPS, WNPS)
)
/
 
CREATE OR REPLACE TYPE BODY ctx_feedback_item_type AS
   MAP MEMBER FUNCTION rank RETURN REAL IS
   BEGIN
      RETURN score;
   END rank;
END;
/
GRANT EXECUTE ON ctx_feedback_item_type TO PUBLIC;
 
PROMPT ... creating named data type ctx_feedback_type
CREATE OR REPLACE TYPE ctx_feedback_type AS TABLE OF ctx_feedback_item_type
/
GRANT EXECUTE ON ctx_feedback_type TO PUBLIC;


REM -------------------------------------------------------------------
REM  dr$nvtab
REM  Contains hash keys and values
REM -------------------------------------------------------------------

CREATE TABLE dr$nvtab(
  name  VARCHAR2(256) PRIMARY KEY,
  val   sys.ANYDATA
);

REM -------------------------------------------------------------------
REM  dr$index_cdi_column
REM  Contains CDI column metadata
REM  cdi_column_type and cdi_column_type# contain essentially the
REM  same information, but it's easier to use if split up '
REM -------------------------------------------------------------------

CREATE TABLE dr$index_cdi_column (
  cdi_idx_id          number,
  cdi_column_position number,
  cdi_column_name     varchar2(256),
  cdi_column_type     varchar2(30),
  cdi_column_type#    number,
  cdi_column_length   number,
  cdi_section_name    varchar2(128),
  cdi_section_type    number,
  cdi_section_id      number,
  cdi_sort_order      varchar2(8),
  primary key (cdi_idx_id, cdi_column_position, cdi_column_name)
)
organization index;

REM -------------------------------------------------------------------
REM dr$sdata_update
REM -------------------------------------------------------------------

create table dr$sdata_update (
  sdu_idx_id    number,
  sdu_ixp_id    number,
  sdu_sdata_id  number,
  sdu_docid     number,
  sdu_nv_type   varchar2(30), 
  sdu_nv_ndata  number,
  sdu_nv_ddata  date,
  sdu_nv_cdata  varchar2(250),
  sdu_nv_rdata  raw(250),
  constraint drc$sdu_key 
    primary key (sdu_idx_id, sdu_ixp_id, sdu_sdata_id, sdu_docid)
)
organization index;

REM -------------------------------------------------------------------
REM dr$feature_used
REM -------------------------------------------------------------------

create table dr$feature_used
(
  feature_name varchar2(1000),
  feature_type number,
  feature_used number default NULL,
  constraint dr$feat_key primary key (feature_name, feature_type)
);

REM -------------------------------------------------------------------
REM dr$freqtoks
REM -------------------------------------------------------------------

rem This table stores away the information on frequently queried tokens.

create table dr$freqtoks (
   fqt_idx_id     number,
   fqt_ixp_id     number,
   fqt_flush_id   number,
   fqt_token      varchar2(255),
   fqt_tktype     number,
   fqt_numocc     number
);

create index idx1_dr$freqtoks on dr$freqtoks(fqt_idx_id, fqt_ixp_id);

create index idx2_dr$freqtoks on dr$freqtoks(fqt_flush_id);

REM -------------------------------------------------------------------
REM dr$slowqrys
REM -------------------------------------------------------------------

rem This table stores away the information on slowest running queries.

create table dr$slowqrys (
   sq_idx_id     number,
   sq_ixp_id     number,
   sq_qry_hash   number,
   sq_text_qry   varchar2(100),
   sq_tqry_len   number,
   sq_when_run   date,
   sq_time_taken number,
   sq_query      varchar2(4000),
   sq_qry_len    number
);

create index idx1_dr$slowqrys on dr$slowqrys(sq_idx_id, sq_ixp_id);

REM -------------------------------------------------------------------
REM dr$activelogs
REM -------------------------------------------------------------------

rem This table stores away the information on logs which are currently active

create table dr$activelogs (
   alogs_sid           number,         /* session id */
   alogs_sno           number,         /* serial no: */
   alogs_filename      varchar2(4000)
);


REM -------------------------------------------------------------------
REM dr$user_extract_rule
REM -------------------------------------------------------------------

rem This table stores information on user added rules

create table dr$user_extract_rule (
   erl_pol_id          number(38),     /* extract policy id */
   erl_rule_id         integer,        /* extract rule id */
   erl_language        varchar2(30),   /* extract rule language text */
   erl_rule            varchar2(512),  /* extract rule contents */
   erl_modifier        varchar2(8),    /* Modifiers for regex */
   erl_type            varchar2(4000), /* list of tuples
                                          {<backref,type>}*/
   erl_status          number,         /* compiled, not compiled, 
            to be deleted*/
   erl_comments        varchar2(4000),   /* comments */ 
   primary key (erl_pol_id, erl_rule_id)
);

REM -------------------------------------------------------------------
REM dr$user_extract_stop_entity
REM -------------------------------------------------------------------

rem This table stores information on user added stop entities

create table dr$user_extract_stop_entity (
   ese_pol_id          number(38),     /* extract policy id */
   ese_name            varchar2(512), /* stop entity name */
   ese_type            varchar2(30),   /* stop entity type */
   ese_status          number,         /* compiled, not compiled, 
            to be deleted, subset*/
   ese_comments        varchar2(4000),  /* comments */ 
   unique (ese_pol_id, ese_name, ese_type)
);


REM -----------------------------------------------------------------
REM dr$user_extract_tkdict
REM -----------------------------------------------------------------

rem This table stores tokens and bigrams from the user dictionary

create table dr$user_extract_tkdict (
  etd_polid        number,        /* dictionary bound to extract policy */
  etd_txt          varchar2(128), /* either a token or bigram */
  etd_soe          number,        /* token is an soe */
  etd_eoe          number,        /* token is an eoe */
  etd_bigram       number,        /* text is a bigram */
  etd_status       number,        /* compiled, not compiled, to be deleted */
  primary key (etd_polid, etd_txt)
);

REM -----------------------------------------------------------------
REM dr$user_extract_entdict
REM -----------------------------------------------------------------

rem This table stores the completed entities from the user dictionary

create table dr$user_extract_entdict (
  eed_polid        number,       /* dictionary bound to extract policy */
  eed_entid        number,       /* entry id */
  eed_lang         varchar2(30), /* entry language */
  eed_mention      varchar2(512), /* entity mention */
  eed_type         varchar2(3000), /* entity type */
  eed_normid       number,       /* normal form */
  eed_altcnt       number,       /* number of alternate forms */
  eed_status       number,       /* compiled, not compiled, to be deleted */
  primary key (eed_polid, eed_entid, eed_normid)
);

REM -----------------------------------------------------------------
REM dr$tree
REM -----------------------------------------------------------------
rem This table stores the metadata of the tree information on MVDATA sections

create table dr$tree (
   idxid    number,          /* Index id containing the MVDATA section */
   secid number,          /* MVDATA section id over which tree is built */
   node_seq  number,          /* Next node for a newly allocated node */
   primary key(idxid, secid)
)organization index;


REM ------------------------------------------------------------------
REM dr$autoopt
REM ------------------------------------------------------------------

rem This table contains indexes registered for auto optimize

create table dr$autoopt (
  aoi_idxid number,
  aoi_partid number,
  aoi_ownid number,
  aoi_ownname varchar2(128),
  aoi_idxname varchar2(128),
  aoi_partname varchar2(128),
  constraint drc$autoopt_un unique (aoi_idxid, aoi_partid, aoi_ownid)
);

REM ------------------------------------------------------------------
REM DR$DICTIONARY
REM ------------------------------------------------------------------

rem contains dictionary info of current user 

create table DR$DICTIONARY(
  dict_owner# NUMBER,
  dict_name  VARCHAR2(128),
  dict_lang  VARCHAR2(30),
  dict_lob   CLOB,
  primary key(dict_owner#, dict_name, dict_lang)
);
 grant select on dr$dictionary to ctxapp;
 grant delete on dr$dictionary to ctxapp;
 grant insert on dr$dictionary to ctxapp;
 grant update on dr$dictionary to ctxapp;

REM ------------------------------------------------------------------
REM DR$IDX_DICTIONARY
REM ------------------------------------------------------------------

rem contains info of all dictionaries by all users 

create table DR$IDX_DICTIONARIES(
  idx_id     NUMBER,
  dict_lang  VARCHAR2(30),
  dict_lob   CLOB,
  primary key(idx_id, dict_lang)
);

@?/rdbms/admin/sqlsessend.sql
