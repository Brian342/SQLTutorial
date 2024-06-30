/*CTEs - Common Table Expressions used to manipulate complex data*/
WITH CTE_Employee as 
(SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
, AVG(Salary) OVER (PARTITION BY Gender) as AVGSalary
FROM SqlTutorial..EmployeeDemographics dem
JOIN SqlTutorial..EmployeSalary sal
    ON dem.EmployeeID = sal.EmployeeID
WHERE Salary > '45000'
)

SELECT FirstName, AVGSalary
FROM CTE_Employee