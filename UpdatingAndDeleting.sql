/* Updating And Deleting */
--Insert INTO creates a new row in your data
--Update Alter a pre existing row

SELECT *
FROM SqlTutorial.dbo.EmployeeDemographics

-- UPDATE SqlTutorial.dbo.EmployeeDemographics
-- SET Age  = 31, Gender = 'female'
-- -- SET EmployeeID = 1012
-- -- WHERE FirstName = 'Holly' AND LastName = 'flax'
-- WHERE EmployeeID = 1012


DELETE FROM SqlTutorial.dbo.EmployeeDemographics
WHERE EmployeeID = 1005