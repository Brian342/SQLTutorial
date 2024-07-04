-- CREATE TABLE EmployeeDemographics
-- (EmployeeID INT,
-- FirstName varchar(50),
-- LastName varchar(50),
-- Age int,
-- Gender VARCHAR(50)
-- )


-- USE master;
-- GO
-- IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'WareHouseEmployeeDemographic')
-- DROP DATABASE [WareHouseEmployeeDemographic];
-- GO


-- CREATE TABLE EmployeSalary
-- (EmployeeID int,
-- JobTitle varchar(50),
-- Salary int)

-- INSERT INTO EmployeeDemographics VALUES
-- (1001, 'Brian', 'San', 25, 'Male'),
-- (1002, 'Pam', 'Beasley',30, 'Female'),
-- (1003, 'Dwight', 'Schrute', 29, 'Male'),
-- (1004, 'Angela', 'Martin', 31, 'Female'),
-- (1005, 'Toby', 'Fienderson', 32, 'Male'),
-- (1006, 'Michael', 'Scott', 35, 'Male'),
-- (1007, 'Meredith', 'Palmer', 32, 'Female'),
-- (1008, 'Stanley', 'Hudson', 38, 'Male'),
-- (1009, 'Kelvin','Malone', 31,'Male')
-- (1010, 'Jim', 'Paul', 31, 'Male')


-- INSERT INTO EmployeSalary VALUES
-- (1002, 'Receptionist', 36000),
-- (1003, 'Salesman', 63000),
-- (1004, 'Accountant', 47000),
-- (1005, 'HR', 50000),
-- (1006, 'Regional Manager', 65000),
-- (1007, 'Supplier Relations', 41000),
-- (1009, 'Salesman', 48000),
-- (1009, 'Accountant', 42000)



/* Select Statement
Top, Distinct, Count, As, Max, Min, Avg */

-- SELECT FirstName, LastName -- Display the selected columns
-- FROM EmployeeDemographics

-- SELECT * -- selects all the columns
-- FROM EmployeeDemographics

-- SELECT TOP 5 * --returns top 5 elements in the database
-- FROM EmployeeDemographics

-- SELECT DISTINCT(Gender) -- selects a specific column
-- FROM EmployeeDemographics

-- SELECT COUNT(LastName) AS LastNameCount
-- FROM EmployeeDemographics

-- SELECT MAX(Salary) AS MaxSalary --returns the highest salary on the column table
-- FROM EmployeSalary

-- SELECT MIN(Salary) AS MinSalary --returns the lowest salary on the column table
-- FROM EmployeSalary

-- SELECT AVG(Salary) AS AverageSalary -- returns the average salary on the employesalary table
-- FROM EmployeSalary


-- SELECT * -- when you change the database name make sure you specify the location on the from statement
-- FROM SqlTutorial.dbo.EmployeSalary


--WareHouseDataBase
-- CREATE TABLE WareHouseEmployeeDemographic
--     (EmployeeID INT,
--     FirstName varchar(50),
--     LastName varchar(50),
--     Age INT,
--     Gender varchar(50))

-- INSERT INTO WareHouseEmployeeDemographic VALUES
-- (1001, 'John', 'paul', 25, 'Male'),
-- (1002, 'water', 'drink',30, 'Female'),
-- (1003, 'Rock', 'Stone', 29, 'Male'),
-- (1004, 'Villa', 'zayn', 31, 'Female')

Select * from WareHouseEmployeeDemographic