@echo off
SETLOCAL
sqlplus ROLDOS/sorco78@overflow:1521/ORCL < DisableFK_OracleOverflowROLDOS.sql
sortcl /SPECIFICATION=OracleOverflowRoldos_ROLDOS_ACCOUNT.scl
sortcl /SPECIFICATION=OracleOverflowRoldos_ROLDOS_BRANCH.scl
sortcl /SPECIFICATION=OracleOverflowRoldos_ROLDOS_CUSTOMER.scl
sqlplus ROLDOS/sorco78@overflow:1521/ORCL < EnableFK_OracleOverflowROLDOS.sql
echo Job Ended