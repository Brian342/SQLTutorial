/* Having Clause */

-- SELECT JobTitle, COUNT(JobTitle)
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- JOIN SqlTutorial.dbo.EmployeSalary
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID
-- GROUP BY JobTitle
-- HAVING COUNT(JobTitle) > 1

SELECT JobTitle, AVG(Salary)
FROM SqlTutorial.dbo.EmployeeDemographics
JOIN SqlTutorial.dbo.EmployeSalary
    ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID
GROUP BY JobTitle
HAVING AVG(Salary) > 45000
ORDER BY AVG(Salary)
