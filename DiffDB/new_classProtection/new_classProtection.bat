@echo off
SETLOCAL
sqlplus ROLDOS/sorco78@overflow:1521/ORCL < "DisableFK_OracleOverflowROLDOS.sql"
@if ""%DB2CLP%""=="""" db2cmd /c /i /w ""%0"" %* && goto :EOF
db2 connect to SAMPLE user kevinr using Fla35kr8
db2 -tf DisableFK_DB2ExploderKR.sql
db2 terminate
sortcl /SPECIFICATION=DB2_Exploder_KR_KEVINR_BRANCH.scl
sortcl /SPECIFICATION=DB2_Exploder_KR_KEVINR_CUSTOMER.scl
sortcl /SPECIFICATION=Oracle_Overflow_Roldos_ROLDOS_CUSTOMER.scl
sqlplus ROLDOS/sorco78@overflow:1521/ORCL < "EnableFK_OracleOverflowROLDOS.sql"
@if ""%DB2CLP%""=="""" db2cmd /c /i /w ""%0"" %* && goto :EOF
db2 connect to SAMPLE user kevinr using Fla35kr8
db2 -tf EnableFK_DB2ExploderKR.sql
db2 terminate
echo Job Ended