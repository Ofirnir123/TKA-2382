Rem
Rem $Header: ctx_src_2/src/dr/admin/ctx_oh_files.sql /main/2 2018/07/25 13:49:09 surman Exp $
Rem
Rem ctx_oh_files.sql
Rem
Rem Copyright (c) 2015, 2018, Oracle and/or its affiliates. 
Rem All rights reserved.
Rem
Rem    NAME
Rem      ctx_oh_files.sql
Rem
Rem    DESCRIPTION
Rem      This script will output to the screen a list of all files found
Rem      under ORACLE_HOME that are needed to support the Oracle Text
Rem      installation in the current database.  These include user filters,
Rem      the mail filter configuration file, and any knowledge base
Rem      files generated by ctxkbtc.
Rem
Rem      If this database is moved to a different ORACLE_HOME (for example via
Rem      unplug from one container and plug into a different container), the
Rem      files listed in the output of this script may need to be either copied
Rem      to the target ORACLE_HOME or regenerated there.
Rem
Rem      The script must be run by CTXSYS or a user with DBA privileges.
Rem
Rem    NOTES
Rem      All files are output relative to ORACLE_HOME, using forward slashes
Rem      to delineate directories.
Rem
Rem    BEGIN SQL_FILE_METADATA 
Rem    SQL_SOURCE_FILE: ctx_src_2/src/dr/admin/ctx_oh_files.sql 
Rem    SQL_SHIPPED_FILE: ctx/admin/ctx_oh_files.sql
Rem    SQL_PHASE: UTILITY
Rem    SQL_STARTUP_MODE: NORMAL 
Rem    SQL_IGNORABLE_ERRORS: NONE 
Rem    SQL_CALLING_FILE: NONE
Rem    END SQL_FILE_METADATA
Rem
Rem    MODIFIED   (MM/DD/YY)
Rem    surman      05/04/18 - 27464252: Set phase to UTILITY
Rem    surman      05/22/15 - 20960380: Creation
Rem    surman      05/22/15 - Created
Rem

SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET SERVEROUTPUT ON

@@?/rdbms/admin/sqlsessstart.sql
DECLARE
  PROCEDURE kbase(p_directory IN VARCHAR2, p_lang IN VARCHAR2) IS
  BEGIN
    dbms_output.put_line(
      'ctx/data/' || p_directory || '/dreld' || p_lang || '.dat');
    dbms_output.put_line(
      'ctx/data/' || p_directory || '/dreli' || p_lang || '.dat');                  dbms_output.put_line(
      'ctx/data/' || p_directory || '/drelk' || p_lang || '.dat');         
    dbms_output.put_line(
      'ctx/data/' || p_directory || '/drels' || p_lang || '.dat');
   IF p_directory != 'xxlx' THEN
      dbms_output.put_line(
        'ctx/data/' || p_directory || '/drefd' || p_lang || '.dat');
      dbms_output.put_line(
        'ctx/data/' || p_directory || '/drefi' || p_lang || '.dat');
   END IF;
  END kbase;
BEGIN
  -- Knowledge base files generated by ctxkbtc
  kbase('enlx', 'US');
  kbase('frlx', 'F');
  kbase('xxlx', 'AR');
  kbase('xxlx', 'AS');
  kbase('xxlx', 'BN');
  kbase('xxlx', 'PTB');
  kbase('xxlx', 'BG');
  kbase('xxlx', 'FRC');
  kbase('xxlx', 'CA');
  kbase('xxlx', 'HR');
  kbase('xxlx', 'CS');
  kbase('xxlx', 'DK');
  kbase('xxlx', 'NL');
  kbase('xxlx', 'EG');
  kbase('xxlx', 'GB');
  kbase('xxlx', 'ET');
  kbase('xxlx', 'SF');
  kbase('xxlx', 'DIN');
  kbase('xxlx', 'D');
  kbase('xxlx', 'EL');
  kbase('xxlx', 'GU');
  kbase('xxlx', 'IW');
  kbase('xxlx', 'HI');
  kbase('xxlx', 'HU');
  kbase('xxlx', 'IS');
  kbase('xxlx', 'IN');
  kbase('xxlx', 'I');
  kbase('xxlx', 'JA');
  kbase('xxlx', 'KN');
  kbase('xxlx', 'KO');
  kbase('xxlx', 'ESA');
  kbase('xxlx', 'LV');
  kbase('xxlx', 'LT');
  kbase('xxlx', 'MS');
  kbase('xxlx', 'ML');
  kbase('xxlx', 'MR');
  kbase('xxlx', 'ESM');
  kbase('xxlx', 'N');
  kbase('xxlx', 'OR');
  kbase('xxlx', 'PL');
  kbase('xxlx', 'PT');
  kbase('xxlx', 'PA');
  kbase('xxlx', 'RO');
  kbase('xxlx', 'RU');
  kbase('xxlx', 'ZHS');
  kbase('xxlx', 'SK');
  kbase('xxlx', 'SL');
  kbase('xxlx', 'E');
  kbase('xxlx', 'S');
  kbase('xxlx', 'TA');
  kbase('xxlx', 'TE');
  kbase('xxlx', 'TH');
  kbase('xxlx', 'ZHT');
  kbase('xxlx', 'TR');
  kbase('xxlx', 'UK');
  kbase('xxlx', 'VN');

  -- Files used by the stemmer
  dbms_output.put_line('ctx/data/enlx/dren.dct');
  dbms_output.put_line('ctx/data/frlx/drfr.dct');
  dbms_output.put_line('ctx/data/delx/drde.dct');
  dbms_output.put_line('ctx/data/itlx/drit.dct');
  dbms_output.put_line('ctx/data/nllx/drnl.dct');
  dbms_output.put_line('ctx/data/eslx/dres.dct');

  -- Files used by the korean_morph_lexer
  dbms_output.put_line('ctx/data/kolx/drk2udic.dat');
  dbms_output.put_line('ctx/data/kolx/drk2gram.dat');
  dbms_output.put_line('ctx/data/kolx/drk2xdic.dat');
  dbms_output.put_line('ctx/data/kolx/drk2sdic.dat'); 

  -- User filter
  FOR rec IN (SELECT ixv_value
                FROM ctxsys.ctx_index_values
                WHERE ixv_class = 'FILTER'
                and ixv_object = 'USER_FILTER'
                and ixv_attribute = 'COMMAND') LOOP
    dbms_output.put_line('ctx/bin/' || rec.ixv_value);
  END LOOP;

  -- Mail filter configuration file
  FOR rec IN (SELECT par_value
                FROM ctxsys.ctx_parameters
                WHERE par_name = 'MAIL_FILTER_CONFIG_FILE') LOOP
    dbms_output.put_line('ctx/config/' || rec.par_value);
  END LOOP;
END;
/


@?/rdbms/admin/sqlsessend.sql
