Rem
Rem $Header: ctx_src_2/src/dr/admin/ctxtyp.sql /main/5 2017/02/06 21:05:03 stanaya Exp $
Rem
Rem ctxtyp.sql
Rem
Rem Copyright (c) 2002, 2017, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      ctxtyp.sql
Rem
Rem    DESCRIPTION
Rem      create type specifications
Rem
Rem    NOTES
Rem      <other useful comments, qualifications, etc.>
Rem
Rem
Rem    BEGIN SQL_FILE_METADATA 
Rem      SQL_SOURCE_FILE: ctx_src_2/src/dr/admin/ctxtyp.sql 
Rem      SQL_SHIPPED_FILE: ctx/admin/ctxtyp.sql
Rem      SQL_PHASE: CTXTYP
Rem      SQL_STARTUP_MODE: NORMAL 
Rem      SQL_IGNORABLE_ERRORS: NONE 
Rem      SQL_CALLING_FILE: ctx/admin/catctx.sql
Rem    END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    surman      01/26/15 - 20411134: Add SQL metadata tags
Rem    surman      03/15/13 - 16473661: Common start and end scripts
Rem    ehuang      07/09/02 - 
Rem    ehuang      06/17/02 - ehuang_component_upgrade
Rem    ehuang      06/11/02 - Created
Rem

@@?/rdbms/admin/sqlsessstart.sql

PROMPT ... creating CONTEXT interface
@@dr0type.pkh

PROMPT ... creating CTXCAT interface
@@dr0typec.pkh

PROMPT ... creating CTXRULE interface
@@dr0typer.pkh

PROMPT ... creating CTXXPATH interface
@@dr0typex.pkh

@?/rdbms/admin/sqlsessend.sql
