@echo off

"C:\WINDOWS.X64_193000_db_home\jdk\jre\\bin\java" -classpath "C:\WINDOWS.X64_193000_db_home\jdk\jre\\lib\rt.jar;C:\WINDOWS.X64_193000_db_home\jlib\srvm.jar;C:\WINDOWS.X64_193000_db_home\jlib\srvmasm.jar;C:\WINDOWS.X64_193000_db_home\oui\jlib\OraInstaller.jar;C:\WINDOWS.X64_193000_db_home\oui\jlib\OraPrereqChecks.jar;C:\WINDOWS.X64_193000_db_home\inventory\prereqs\oui\OraPrereqChecks.jar;C:\WINDOWS.X64_193000_db_home\jlib\share.jar;C:\WINDOWS.X64_193000_db_home\rdbms\jlib\diagsetup.jar;" -D"oracle.diagsetup.oraclehome=C:\WINDOWS.X64_193000_db_home" -D"ORACLE_HOME=C:\WINDOWS.X64_193000_db_home" oracle.diagfw.adr.diagsetup.DiagSetup %*
