@echo off
SETLOCAL
sqlcmd -U HealthCare -P Sorco789 -S 192.168.3.95,1444 -d support -i DisableFK_SQLServerHealthcare.sql

sortcl /SPECIFICATION=SQLServerDiffHealthcare_HEALTHCARE_DOCTOR.scl
sortcl /SPECIFICATION=SQLServerDiffHealthcare_HEALTHCARE_INSURANCE.scl
sortcl /SPECIFICATION=SQLServerDiffHealthcare_HEALTHCARE_PATIENT.scl
sqlcmd -U HealthCare -P Sorco789 -S 192.168.3.95,1444 -d support -i EnableFK_SQLServerHealthcare.sql

echo Job Ended