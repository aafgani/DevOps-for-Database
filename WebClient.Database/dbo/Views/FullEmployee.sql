CREATE VIEW [dbo].[FullEmployee]
	AS SELECT [e].[EmployeeId], [e].[Fullname], [e].[Department], [e].[Email], 
	[a].[StreetName], [a].[City], [a].[State]
	from Employee e 
	left join Address a on e.[EmployeeId] = a.EmployeeId
