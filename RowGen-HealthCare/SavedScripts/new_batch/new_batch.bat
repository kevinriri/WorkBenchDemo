@echo off
SETLOCAL
sqlcmd -U HealthCare -P Sorco789 -S 192.168.3.95,1444 -d support -i DisableFK_Multiple_Tables.sql

sortcl /SPECIFICATION=INSURANCE_ID_UNIQUE.rcl
sortcl /SPECIFICATION=DOCTOR_ID_UNIQUE.rcl
sortcl /SPECIFICATION=PRESCRIPTION_ID_UNIQUE.rcl
sortcl /SPECIFICATION=PATIENT_ID_UNIQUE.rcl
sortcl /SPECIFICATION=APPOINTMENT_NUMBER_UNIQUE.rcl
sortcl /SPECIFICATION=PATIENT_PRESCRIPTION_NUMBER_UNIQUE.rcl
sortcl /SPECIFICATION=BILL_NUMBER_UNIQUE.rcl
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "INSURANCE_ID.sed" (
    echo file "INSURANCE_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "INSURANCE_ID.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "DOCTOR_ID.sed" (
    echo file "DOCTOR_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "DOCTOR_ID.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "PRESCRIPTION_ID.sed" (
    echo file "PRESCRIPTION_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "PRESCRIPTION_ID.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "PATIENT_ID.sed" (
    echo file "PATIENT_ID.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "PATIENT_ID.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "APPOINTMENT_NUMBER.sed" (
    echo file "APPOINTMENT_NUMBER.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "APPOINTMENT_NUMBER.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "PATIENT_PRESCRIPTION_NUMBER.sed" (
    echo file "PATIENT_PRESCRIPTION_NUMBER.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "PATIENT_PRESCRIPTION_NUMBER.sed" found.
    echo:
)
ping 192.0.2.0 -n 1 -w 3000 >NUL
if not exist "BILL_NUMBER.sed" (
    echo file "BILL_NUMBER.sed" not found.
    echo Job terminated
    exit
) else (
    echo file "BILL_NUMBER.sed" found.
    echo:
)

sortcl /SPECIFICATION=HEALTHCARE_INSURANCE.rcl
sortcl /SPECIFICATION=HEALTHCARE_DOCTOR.rcl
sortcl /SPECIFICATION=HEALTHCARE_PRESCRIPTION.rcl
sortcl /SPECIFICATION=HEALTHCARE_PATIENT.rcl
sortcl /SPECIFICATION=HEALTHCARE_APPOINTMENT.rcl
sortcl /SPECIFICATION=HEALTHCARE_PATIENT_PRESCRIPTION.rcl
sortcl /SPECIFICATION=HEALTHCARE_BILL.rcl
sqlcmd -U HealthCare -P Sorco789 -S 192.168.3.95,1444 -d support -i EnableFK_Multiple_Tables.sql

echo Job Ended