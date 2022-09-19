ALTER TABLE [BANK].[CUSTOMER] DROP CONSTRAINT [FK__CUSTOMER__BRANCH__748F2482]
GO

ALTER TABLE [BANK].[TRXN] DROP CONSTRAINT [FK__TRXN__ACCOUNT_NU__7C30464A]
GO

ALTER TABLE [BANK].[TRXN] DROP CONSTRAINT [FK__TRXN__TRXN_CODE__7D246A83]
GO

ALTER TABLE [BANK].[ACCOUNT] DROP CONSTRAINT [FK__ACCOUNT__CUSTOME__776B912D]
GO

ALTER TABLE [BANK].[TRXN_TYPE] DROP CONSTRAINT [PK__TRXN_TYP__786A774B5D63A732]
GO

ALTER TABLE [BANK].[CUSTOMER] DROP CONSTRAINT [PK__CUSTOMER__1CE12D37235E6380]
GO

ALTER TABLE [BANK].[ACCOUNT] DROP CONSTRAINT [PK__ACCOUNT__ECCCDF044488296F]
GO

ALTER TABLE [BANK].[TRXN] DROP CONSTRAINT [PK__TRXN__06077C0EC253FD50]
GO

ALTER TABLE [BANK].[BRANCH] DROP CONSTRAINT [PK__BRANCH__766E0D23DCCCDEC9]
GO

DROP TABLE [BANK].[TRXN_TYPE]
GO

DROP TABLE [BANK].[BRANCH]
GO

DROP TABLE [BANK].[TRXN]
GO

DROP TABLE [BANK].[CUSTOMER]
GO

DROP TABLE [BANK].[ACCOUNT]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [BANK].[TRXN_TYPE] (
	[TRXN_CODE] VARCHAR(6) NOT NULL,
	[TRXN_DESCRIPTION] VARCHAR(60),
	CONSTRAINT [PK__TRXN_TYP__786A774B5D63A732] PRIMARY KEY ([TRXN_CODE]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [BANK].[BRANCH] (
	[BRANCH_ID] VARCHAR(20) NOT NULL,
	[LOCATION] VARCHAR(70),
	[BRANCH_DETAIL] VARCHAR(30),
	[BRANCH_NAME] VARCHAR(80),
	CONSTRAINT [PK__BRANCH__766E0D23DCCCDEC9] PRIMARY KEY ([BRANCH_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [BANK].[TRXN] (
	[TRXN_ID] VARCHAR(14) NOT NULL,
	[ACCOUNT_NUMBER] VARCHAR(13) NOT NULL,
	[TRXN_CODE] VARCHAR(6) NOT NULL,
	[TRXN_DATE] DATE,
	[TRXN_AMOUNT] NUMERIC(8 , 2),
	CONSTRAINT [PK__TRXN__06077C0EC253FD50] PRIMARY KEY ([TRXN_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [BANK].[CUSTOMER] (
	[CUSTOMER_ID] VARCHAR(13) NOT NULL,
	[FULL_NAME] VARCHAR(50),
	[ADDRESS] VARCHAR(60),
	[PHONE_NUMBER] VARCHAR(25),
	[EMAIL] VARCHAR(40),
	[DATE_BECAME_MEMBER] DATE,
	[BRANCH_ID] VARCHAR(20) NOT NULL,
	[SSN] VARCHAR(11),
	CONSTRAINT [PK__CUSTOMER__1CE12D37235E6380] PRIMARY KEY ([CUSTOMER_ID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

CREATE TABLE [BANK].[ACCOUNT] (
	[ACCOUNT_NUMBER] VARCHAR(13) NOT NULL,
	[ACCOUNT_CODE] VARCHAR(12),
	[CODE_DESCRIPTION] VARCHAR(90),
	[ACCOUNT_TYPE] VARCHAR(45),
	[CUSTOMER_ID] VARCHAR(13) NOT NULL,
	[CURRENT_BALANCE] NUMERIC(8 , 2),
	CONSTRAINT [PK__ACCOUNT__ECCCDF044488296F] PRIMARY KEY ([ACCOUNT_NUMBER]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = OFF, ALLOW_PAGE_LOCKS = OFF)

)
GO

ALTER TABLE [BANK].[CUSTOMER] ADD CONSTRAINT [FK__CUSTOMER__BRANCH__748F2482] FOREIGN KEY ([BRANCH_ID])
	REFERENCES [BANK].[BRANCH] ([BRANCH_ID])
GO

ALTER TABLE [BANK].[TRXN] ADD CONSTRAINT [FK__TRXN__ACCOUNT_NU__7C30464A] FOREIGN KEY ([ACCOUNT_NUMBER])
	REFERENCES [BANK].[ACCOUNT] ([ACCOUNT_NUMBER])
GO

ALTER TABLE [BANK].[TRXN] ADD CONSTRAINT [FK__TRXN__TRXN_CODE__7D246A83] FOREIGN KEY ([TRXN_CODE])
	REFERENCES [BANK].[TRXN_TYPE] ([TRXN_CODE])
GO

ALTER TABLE [BANK].[ACCOUNT] ADD CONSTRAINT [FK__ACCOUNT__CUSTOME__776B912D] FOREIGN KEY ([CUSTOMER_ID])
	REFERENCES [BANK].[CUSTOMER] ([CUSTOMER_ID])
GO

SET ANSI_PADDING OFF
GO

