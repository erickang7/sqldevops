/*    ==Scripting Parameters==

    Source Server Version : Version130 (13.0.1601)
    Source Database Engine Edition : Enterprise
    Source Database Engine Type : Standalone

    Target Server Version : Version130
    Target Database Engine Edition : Enterprise
    Target Database Engine Type : Standalone
*/
/****** Object:  View [HumanResources].[vEmployeeDepartmentHistory]    Script Date: 7/16/17 5:38:14 PM ******/

GO

GO

CREATE VIEW [HumanResources].[vEmployeeDepartmentHistory] 
AS 
SELECT 
    e.[BusinessEntityID] 
    ,p.[Title] 
    ,p.[FirstName] 
    ,p.[MiddleName] 
    ,p.[LastName] 
    ,p.[Suffix] 
    ,s.[Name] AS [Shift]
    ,d.[Name] AS [Department] 
    ,d.[GroupName] 
    ,edh.[StartDate] 
    ,edh.[EndDate]
FROM [HumanResources].[Employee] e
	INNER JOIN [Person].[Person] p
	ON p.[BusinessEntityID] = e.[BusinessEntityID]
    INNER JOIN [HumanResources].[EmployeeDepartmentHistory] edh 
    ON e.[BusinessEntityID] = edh.[BusinessEntityID] 
    INNER JOIN [HumanResources].[Department] d 
    ON edh.[DepartmentID] = d.[DepartmentID] 
    INNER JOIN [HumanResources].[Shift] s
    ON s.[ShiftID] = edh.[ShiftID];
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Returns employee name and current and previous departments.' , @level0type=N'SCHEMA',@level0name=N'HumanResources', @level1type=N'VIEW',@level1name=N'vEmployeeDepartmentHistory'
GO
