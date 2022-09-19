@echo off
SETLOCAL
sqlcmd -U BANK -P Sorco789 -S 192.168.3.95,1444 -d support -i DisableFK_Multiple_Tables.sql

sortcl /SPECIFICATION=TRXN_CODE_UNIQUE.rcl
sortcl /SPECIFICATION=BRANCH_ID_UNIQUE.rcl
sortcl /SPECIFICATION=CUSTOMER_ID_UNIQUE.rcl
sortcl /SPECIFICATION=ACCOUNT_NUMBER_UNIQUE.rcl
sortcl /SPECIFICATION=TRXN_ID_UNIQUE.rcl
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "TRXN_CODE.sed" (
    echo file "TRXN_CODE.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "TRXN_CODE.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "BRANCH_ID.sed" (
    echo file "BRANCH_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "BRANCH_ID.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "CUSTOMER_ID.sed" (
    echo file "CUSTOMER_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "CUSTOMER_ID.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "ACCOUNT_NUMBER.sed" (
    echo file "ACCOUNT_NUMBER.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "ACCOUNT_NUMBER.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "TRXN_ID.sed" (
    echo file "TRXN_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "TRXN_ID.sed" found.
    echo:
)

sortcl /SPECIFICATION=BANK_TRXN_TYPE.rcl
sortcl /SPECIFICATION=BANK_BRANCH.rcl
sortcl /SPECIFICATION=BANK_CUSTOMER.rcl
sortcl /SPECIFICATION=BANK_ACCOUNT.rcl
sortcl /SPECIFICATION=BANK_TRXN.rcl
sqlcmd -U BANK -P Sorco789 -S 192.168.3.95,1444 -d support -i EnableFK_Multiple_Tables.sql

echo Job Ended