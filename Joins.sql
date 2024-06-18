/* Inner Joins, Full/left/right/outer Joins */

-- SELECT *
-- FROM SqlTutorial.dbo.EmployeeDemographics

-- SELECT *
-- FROM SqlTutorial.dbo.EmployeSalary


-- /* Using of Inner Join */
-- SELECT *
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- INNER JOIN SqlTutorial.dbo.EmployeSalary -- used to join elements that are common in table 1 and 2
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID

-- /* Use of Full Outer Join */
-- SELECT *
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- FULL OUTER JOIN SqlTutorial.dbo.EmployeSalary -- used to show values in table 1 and 2 regardless of it has a match or not
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID


-- /* Use of Left Outer Join */
-- SELECT *
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- LEFT OUTER JOIN SqlTutorial.dbo.EmployeSalary -- takes everything from the left table and everything that is overlapping on right table we do not want it
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID


-- /* Use of Right Outer Join */
-- SELECT *
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- RIGHT OUTER JOIN SqlTutorial.dbo.EmployeSalary -- takes everything from the Right table and everything that is overlapping on right table we do not want it
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID


-- SELECT EmployeeDemographics.EmployeeID,FirstName,LastName,JobTitle,salary
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- INNER JOIN SqlTutorial.dbo.EmployeSalary 
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID


-- SELECT EmployeeDemographics.EmployeeID,FirstName,LastName,JobTitle,salary
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- LEFT OUTER JOIN SqlTutorial.dbo.EmployeSalary 
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID
    

-- SELECT EmployeeDemographics.EmployeeID, FirstName,LastName,Salary
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- INNER JOIN SqlTutorial.dbo.EmployeSalary 
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID
-- WHERE FirstName <> 'Brian'
-- ORDER By Salary DESC


SELECT JobTitle, AVG(Salary)
FROM SqlTutorial.dbo.EmployeeDemographics
INNER JOIN SqlTutorial.dbo.EmployeSalary 
    ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID
WHERE JobTitle = 'Salesman'
GROUP BY JobTitle