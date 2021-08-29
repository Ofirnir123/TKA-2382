Rem
Rem $Header: ctx_src_2/src/dr/admin/ctxu1202.sql /main/6 2018/02/28 22:49:17 boxia Exp $
Rem
Rem ctxu1202.sql
Rem
Rem Copyright (c) 2014, 2018, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      ctxu1202.sql - upgrade from 12.2.0.0.0
Rem
Rem    DESCRIPTION
Rem      upgrade from 12.2.0.0.0 to latest version 
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem
Rem    BEGIN SQL_FILE_METADATA 
Rem      SQL_SOURCE_FILE: ctx_src_2/src/dr/admin/ctxu1202.sql 
Rem      SQL_SHIPPED_FILE: ctx/admin/ctxu1202.sql
Rem      SQL_PHASE: UPGRADE
Rem      SQL_STARTUP_MODE: NORMAL 
Rem      SQL_IGNORABLE_ERRORS: NONE 
Rem      SQL_CALLING_FILE: NONE
Rem    END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    boxia       02/09/18 - Bug 27495209: add upgrade to 19.1
Rem    boxia       11/29/16 - Bug 25172618: add s1202020
Rem    snetrava    11/02/16 - Added Upgrade to 12.2.0.2.0
Rem    surman      01/26/15 - 20411134: Add SQL metadata tags
Rem    boxia       04/02/14 - Created
Rem

SET ECHO ON
SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100

@@?/rdbms/admin/sqlsessstart.sql

REM ========================================================================
REM set schema, Registry to upgrading state
REM ========================================================================

ALTER SESSION SET CURRENT_SCHEMA = CTXSYS;

begin
dbms_registry.upgrading('CONTEXT','Oracle Text','validate_context','CTXSYS');
end;
/

REM ========================================================================
REM
REM ******************* Begin SYS changes **********************************
REM
REM ========================================================================

ALTER SESSION SET CURRENT_SCHEMA = SYS;
@@s1202020.sql
@@s1901000.sql
ALTER SESSION SET CURRENT_SCHEMA = CTXSYS;

REM ========================================================================
REM
REM ******************* End SYS changes ************************************
REM
REM ========================================================================

REM ========================================================================
REM
REM ******************* Begin CTXSYS schema changes ************************
REM
REM ========================================================================

REM ========================================================================
REM Pre-upgrade steps
REM ========================================================================

@@ctxpreup.sql

REM ========================================================================
REM 12.2 to 12.2.0.2(alias to 18.1)
REM ========================================================================

@@u1202020.sql
@@t1202020.sql

REM ========================================================================
REM 18.1 to 19.1
REM ========================================================================

@@u1901000.sql
@@t1901000.sql

REM ========================================================================
REM Post-upgrade steps
REM ========================================================================

@@ctxposup.sql

REM ========================================================================
REM
REM ****************  End CTXSYS schema change *****************************
REM
REM ========================================================================

REM ========================================================================
REM Registry to upgraded state, reset schema
REM ========================================================================

begin
  dbms_registry.loaded('CONTEXT');
  dbms_registry.valid('CONTEXT');
end;
/

ALTER SESSION SET CURRENT_SCHEMA = SYS;

@?/rdbms/admin/sqlsessend.sql
