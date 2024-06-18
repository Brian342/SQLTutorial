/* partition By*/

SELECT *
FROM SqlTutorial..EmployeeDemographics
JOIN SqlTutorial..EmployeSalary sal
    ON dem.EmployeeID = sal.EmployeeID