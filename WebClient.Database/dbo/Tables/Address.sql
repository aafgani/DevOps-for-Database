CREATE TABLE [dbo].[Address]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [EmployeeId] INT NOT NULL, 
    [StreetName] NVARCHAR(50) NULL, 
    [City] NVARCHAR(50) NULL, 
    [State] NVARCHAR(50) NULL, 
    CONSTRAINT [FK_Address_ToEmployee] FOREIGN KEY ([EmployeeId]) REFERENCES [Employee]([EmployeeId])
)
