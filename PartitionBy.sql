/* partition By*/

SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
FROM SqlTutorial..EmployeeDemographics dem
JOIN SqlTutorial..EmployeSalary sal
    ON dem.EmployeeID = sal.EmployeeID



SELECT FirstName, LastName, Gender, Salary,COUNT(Gender) 
FROM SqlTutorial..EmployeeDemographics dem
JOIN SqlTutorial..EmployeSalary sal
    ON dem.EmployeeID = sal.EmployeeID
GROUP BY FirstName, LastName, Gender, Salary