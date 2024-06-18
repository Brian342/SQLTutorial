/*Aliasing - temporary changing a column name or 
table name in the script */

-- use of As or not in columns
-- SELECT FirstName  Fname
-- FROM [SqlTutorial].[dbo].[EmployeeDemographics]


-- SELECT FirstName AS Fname
-- FROM [SqlTutorial].[dbo].[EmployeeDemographics]

-- SELECT FirstName + ' ' + LastName As FullName
-- FROM [SqlTutorial].[dbo].[EmployeeDemographics]

-- SELECT AVG(Age) AS AvgAge
-- FROM [SqlTutorial].[dbo].[EmployeeDemographics]

--Aliasing in table names
SELECT Demo.EmployeeID
FROM [SqlTutorial].[dbo].[EmployeeDemographics] As Demo
JOIN [SqlTutorial].[dbo].[EmployeSalary] As Sal
    ON Demo.EmployeeID = Sal.EmployeeID