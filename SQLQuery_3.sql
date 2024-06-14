SELECT DISTINCT(Gender) 
FROM EmployeeDemographics
-- SELECT FirstName, LastName // retruns the column with FirstName and LastName
-- FROM EmployeeDemographics
-- SELECT TOP 5 * // returns all the top 5 elements in the database
-- FROM EmployeeDemographics
-- SELECT DISTINCT(Gender) 
-- FROM EmployeeDemographics
-- DISTINCT return the unique elements
-- SELECT COUNT(LastName) AS LastNameCount
-- FROM EmployeeDemographics
-- -- count show all non known values
SELECT MAX(salary) AS MaxSalary
FROM EmployeeSalary
SELECT MIN(salary) AS MinSalary
FROM EmployeeSalary
SELECT AVG(Salary)  AS AvgSalary
FROM EmployeeSalary
--run of Database in a diffrent place.
SELECT * 
FROM master .dbo.EmployeeSalary --run database from different database