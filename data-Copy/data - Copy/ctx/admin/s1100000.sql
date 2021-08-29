Rem
Rem $Header: ctx_src_2/src/dr/admin/s1100000.sql /main/5 2018/07/25 13:49:08 surman Exp $
Rem
Rem s1100000.sql
Rem
Rem Copyright (c) 2005, 2018, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      s1100000.sql - <one-line expansion of the name>
Rem
Rem    DESCRIPTION
Rem      upgrade SYS data dictionary from version 11.0.0.0 to current
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem
Rem    BEGIN SQL_FILE_METADATA 
Rem      SQL_SOURCE_FILE: ctx_src_2/src/dr/admin/s1100000.sql 
Rem      SQL_SHIPPED_FILE: ctx/admin/s1100000.sql
Rem      SQL_PHASE: UPGRADE
Rem      SQL_STARTUP_MODE: NORMAL 
Rem      SQL_IGNORABLE_ERRORS: NONE 
Rem      SQL_CALLING_FILE: ctx/admin/ctxu817.sql
Rem    END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    surman      05/04/18 - 27464252: Set phase to UPGRADE
Rem    surman      01/26/15 - 20411134: Add SQL metadata tags
Rem    surman      03/15/13 - 16473661: Common start and end scripts
Rem    gkaminag    10/17/05 - gkaminag_upg_051018
Rem    gkaminag    10/16/05 - Created
Rem

@@?/rdbms/admin/sqlsessstart.sql


@?/rdbms/admin/sqlsessend.sql
