/* Union Union All */
--Union select data from both tables and put them on one table

SELECT *
FROM SqlTutorial.dbo.EmployeeDemographics
UNION
SELECT *
FROm SqlTutorial.dbo.WareHouseEmployeeDemographic

-- SELECT *
-- FROM SqlTutorial.dbo.EmployeeDemographics
-- FULL OUTER JOIN SqlTutorial.dbo.EmployeSalary
--     ON EmployeeDemographics.EmployeeID = EmployeSalary.EmployeeID