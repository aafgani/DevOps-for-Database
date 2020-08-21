CREATE PROCEDURE [dbo].[spEmployee_FilterByLastDepartment]
	@Department nvarchar(50)
AS
BEGIN
	SELECT [EmployeeId], Fullname, Department, Email
	FROM Employee 
	WHERE Department = @Department;
END
