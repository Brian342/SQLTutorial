/*Case Statement - allows one to specify condition and 
allows what should be retured if the condition is meet*/

-- SELECT FirstName,LastName,Age,
-- CASE
--     WHEN Age > 30 THEN 'Old'
--     WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--     ELSE 'Baby'
-- END
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- WHERE Age is NOT NULL 
-- ORDER BY Age 

-- SELECT FirstName,LastName,Age,
-- CASE
--     WHEN Age = 38 THEN 'Stanley'
--     WHEN Age > 30 THEN 'Old'
--     ELSE 'Baby'
-- END
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- WHERE Age is NOT NULL 
-- ORDER BY Age 

SELECT FirstName, LastName, JobTitle, Salary,
CASE 
    WHEN JobTitle = 'Salesman' THEN Salary + (Salary * .10)
    WHEN JobTitle = 'Accountant' THEN Salary + (Salary * .05)
    WHEN JobTitle = 'HR' THEN Salary + (Salary * .000001)
    ELSE Salary + (Salary * .03)
END AS SalaryAfterRaise
FROM SqlTutorial.dbo.EmployeeDemographics
JOIN SqlTutorial.dbo.EmployeSalary
    ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID
