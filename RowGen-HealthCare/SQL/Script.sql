ALTER TABLE [HEALTHCARE].[APPOINTMENT] DROP CONSTRAINT [FK__APPOINTME__DOCTO__0662F0A3]
GO

ALTER TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION] DROP CONSTRAINT [FK__PATIENT_P__PRESC__038683F8]
GO

ALTER TABLE [HEALTHCARE].[APPOINTMENT] DROP CONSTRAINT [FK__APPOINTME__PATIE__075714DC]
GO

ALTER TABLE [HEALTHCARE].[PATIENT] DROP CONSTRAINT [FK__PATIENT__INSURANCE__0A338187]
GO

ALTER TABLE [HEALTHCARE].[BILL] DROP CONSTRAINT [FK__BILL__APPOINTMEN__0A338187]
GO

ALTER TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION] DROP CONSTRAINT [FK__PATIENT_P__PATIE__02925FBF]
GO

ALTER TABLE [HEALTHCARE].[PATIENT] DROP CONSTRAINT [PK__PATIENT__AA0B6068CF0AB4AA]
GO

ALTER TABLE [HEALTHCARE].[INSURANCE] DROP CONSTRAINT [PK__INSURANC__F95F60DC49A9E1BE]
GO

ALTER TABLE [HEALTHCARE].[PRESCRIPTION] DROP CONSTRAINT [PK__PRESCRIP__83756B5F6443BDDC]
GO

ALTER TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION] DROP CONSTRAINT [PK__PATIENT___CEF21AA9C35E8528]
GO

ALTER TABLE [HEALTHCARE].[DOCTOR] DROP CONSTRAINT [PK__DOCTOR__596ABDB026EFB1D8]
GO

ALTER TABLE [HEALTHCARE].[APPOINTMENT] DROP CONSTRAINT [PK__APPOINTM__5671945222DE079E]
GO

ALTER TABLE [HEALTHCARE].[BILL] DROP CONSTRAINT [PK__BILL__009D37199639A2CC]
GO

DROP TABLE [HEALTHCARE].[DOCTOR]
GO

DROP TABLE [HEALTHCARE].[INSURANCE]
GO

DROP TABLE [HEALTHCARE].[PRESCRIPTION]
GO

DROP TABLE [HEALTHCARE].[BILL]
GO

DROP TABLE [HEALTHCARE].[PATIENT]
GO

DROP TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION]
GO

DROP TABLE [HEALTHCARE].[APPOINTMENT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [HEALTHCARE].[DOCTOR] (
	[DOCTOR_ID] VARCHAR(13) NOT NULL,
	[DOCTOR_NAME] VARCHAR(60),
	[DOCTOR_EMAIL] VARCHAR(60),
	[DOCTOR_PHONE_NUMBER] VARCHAR(10),
	CONSTRAINT [PK__DOCTOR__596ABDB026EFB1D8] PRIMARY KEY ([DOCTOR_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [HEALTHCARE].[INSURANCE] (
	[INSURANCE_ID] VARCHAR(10) NOT NULL,
	[INSURANCE_NAME] VARCHAR(50),
	[INSURANCE_PHONE_NUMBER] VARCHAR(10),
	CONSTRAINT [PK__INSURANC__F95F60DC49A9E1BE] PRIMARY KEY ([INSURANCE_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [HEALTHCARE].[PRESCRIPTION] (
	[PRESCRIPTION_ID] VARCHAR(9) NOT NULL,
	[PRESCRIPTION_NAME] VARCHAR(50),
	[PRICE] DECIMAL(8 , 2),
	CONSTRAINT [PK__PRESCRIP__83756B5F6443BDDC] PRIMARY KEY ([PRESCRIPTION_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [HEALTHCARE].[BILL] (
	[BILL_NUMBER] VARCHAR(9) NOT NULL,
	[APPOINTMENT_NUMBER] VARCHAR(9) NOT NULL,
	[AMOUNT_BILLED] DECIMAL(8 , 2),
	[AOUNT_PAID] DECIMAL(8 , 2),
	[BILL_CREATED] DATE,
	[BILL_DUE] DATE,
	CONSTRAINT [PK__BILL__009D37199639A2CC] PRIMARY KEY ([BILL_NUMBER]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [HEALTHCARE].[PATIENT] (
	[PATIENT_ID] VARCHAR(13) NOT NULL,
	[FIRST_NAME] VARCHAR(50),
	[LAST_NAME] VARCHAR(50),
	[MIDDLE_INITIAL] VARCHAR(1),
	[STREET] VARCHAR(60),
	[CITY] VARCHAR(50),
	[STATE] VARCHAR(2),
	[ZIP] VARCHAR(5),
	[EMAIL] VARCHAR(60),
	[PHONE] VARCHAR(10),
	[SSN] VARCHAR(9),
	[INSURANCE_ID] VARCHAR(10) NOT NULL,
	[DOB] DATE,
	CONSTRAINT [PK__PATIENT__AA0B6068CF0AB4AA] PRIMARY KEY ([PATIENT_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION] (
	[PATIENT_PRESCRIPTION_NUMBER] VARCHAR(9) NOT NULL,
	[APPOINTMENT_NUMBER] VARCHAR(9) NOT NULL,
	[PRESCRIPTION_ID] VARCHAR(9) NOT NULL,
	[DATE_STARTED] DATE,
	[DOSAGE] VARCHAR(5),
	[SPECIAL_INSTRUCTIONS] VARCHAR(255),
	CONSTRAINT [PK__PATIENT___CEF21AA9C35E8528] PRIMARY KEY ([PATIENT_PRESCRIPTION_NUMBER]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [HEALTHCARE].[APPOINTMENT] (
	[APPOINTMENT_NUMBER] VARCHAR(9) NOT NULL,
	[PATIENT_ID] VARCHAR(13) NOT NULL,
	[DOCTOR_ID] VARCHAR(13) NOT NULL,
	[REASON_TYPE] VARCHAR(50),
	[SCHEDULED_TIME] TIME,
	[SCHEDULED_DATE] DATE,
	[APPIONTMENT_NOTES] VARCHAR(255),
	CONSTRAINT [PK__APPOINTM__5671945222DE079E] PRIMARY KEY ([APPOINTMENT_NUMBER]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

ALTER TABLE [HEALTHCARE].[APPOINTMENT] ADD CONSTRAINT [FK__APPOINTME__DOCTO__0662F0A3] FOREIGN KEY ([DOCTOR_ID])
	REFERENCES [HEALTHCARE].[DOCTOR] ([DOCTOR_ID])
GO

ALTER TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION] ADD CONSTRAINT [FK__PATIENT_P__PRESC__038683F8] FOREIGN KEY ([PRESCRIPTION_ID])
	REFERENCES [HEALTHCARE].[PRESCRIPTION] ([PRESCRIPTION_ID])
GO

ALTER TABLE [HEALTHCARE].[APPOINTMENT] ADD CONSTRAINT [FK__APPOINTME__PATIE__075714DC] FOREIGN KEY ([PATIENT_ID])
	REFERENCES [HEALTHCARE].[PATIENT] ([PATIENT_ID])
GO

ALTER TABLE [HEALTHCARE].[PATIENT] ADD CONSTRAINT [FK__PATIENT__INSURANCE__0A338187] FOREIGN KEY ([INSURANCE_ID])
	REFERENCES [HEALTHCARE].[INSURANCE] ([INSURANCE_ID])
GO

ALTER TABLE [HEALTHCARE].[BILL] ADD CONSTRAINT [FK__BILL__APPOINTMEN__0A338187] FOREIGN KEY ([APPOINTMENT_NUMBER])
	REFERENCES [HEALTHCARE].[APPOINTMENT] ([APPOINTMENT_NUMBER])
GO

ALTER TABLE [HEALTHCARE].[PATIENT_PRESCRIPTION] ADD CONSTRAINT [FK__PATIENT_P__PATIE__02925FBF] FOREIGN KEY ([APPOINTMENT_NUMBER])
	REFERENCES [HEALTHCARE].[APPOINTMENT] ([APPOINTMENT_NUMBER])
GO

SET ANSI_PADDING OFF
GO

