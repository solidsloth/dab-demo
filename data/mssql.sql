
/*
DROP TABLE dbo.Company
DROP TABLE dbo.Employee
*/

IF (NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Company'))
BEGIN
	CREATE TABLE dbo.Company (
		Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
		[Name] VARCHAR(MAX) NOT NULL
	)
END

IF (NOT EXISTS (SELECT 1 FROM sys.tables WHERE name = 'Employee'))
BEGIN
	CREATE TABLE dbo.Employee (
		Id INT PRIMARY KEY IDENTITY(1, 1) NOT NULL,
		[First] VARCHAR(500) NOT NULL,
		[Last] VARCHAR(500) NOT NULL,
		[CompanyId] INT NOT NULL
	)
END

IF NOT EXISTS ((SELECT * FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE CONSTRAINT_NAME = 'FK_dbo.Employee_dbo.Company'))
BEGIN
	ALTER TABLE dbo.Employee
	ADD CONSTRAINT [FK_dbo.Employee_dbo.Company] FOREIGN KEY ([CompanyId])
		REFERENCES dbo.Company ([Id])
END

IF (NOT EXISTS (SELECT 1 FROM Company))
BEGIN
	INSERT INTO Company ([Name]) VALUES
	('RSM'),
	('RSM!'),
	('RSM!!')
END

IF (NOT EXISTS (SELECT 1 FROM Employee))
BEGIN
	INSERT INTO dbo.Employee ([First], [Last], [CompanyId]) VALUES
	('Mark', 'Escher', (SELECT Id FROM Company WHERE Name = 'RSM'))
END
