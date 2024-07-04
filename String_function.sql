/* String_functions TRIM, LTRIM, Replace, Substring, Upper, Lower */ 

-- Drop Table EmployeeErrors;

CREATE TABLE EmployeeErrors (
    EmployeeID VARCHAR(50),
    FirstName  VARCHAR(50),
    LastName  VARCHAR(50)

)

INSERT into EmployeeErrors VALUES
('1001 ', 'Jimbo ', 'Halbert'),
(' 1002', 'pamela', 'Beasely'),
('1005', 'TOby', 'Flenderson - Fired')

SELECT *
FROM EmployeeErrors

-- Using Trim, Ltrim, Rtrim

SELECT EmployeeID, TRIM(EmployeeID) as IDTrim -- generally removes spaces 
FROM EmployeeErrors 

--Ltrim

SELECT EmployeeID, LTRIM(EmployeeID) as IDRTrim --removes spaces on the left side
FROM EmployeeErrors 

--Rtrim

SELECT EmployeeID, RTRIM(EmployeeID) as IDLTriM -- Removes spaces on the right side
FROM EmployeeErrors 

-- Using Replace

SELECT LastName, REPLACE(LastName, '- Fired', '') as LastNameFixed
FROM EmployeeErrors 

-- Using Substring

-- SELECT SUBSTRING(FirstName, 1, 3) 
-- FROM EmployeeErrors 

SELECT err.FirstName, SUBSTRING(err.FirstName, 1, 3), dem.FirstName, SUBSTRING(dem.FirstName, 1, 3)
FROM EmployeeErrors err
JOIN EmployeeDemographics dem 
     ON SUBSTRING(err.FirstName, 1, 3) = SUBSTRING(dem.FirstName, 1, 3)


-- Using Upper, Lower Takes all character in a text and makes them upper or lower cases
SELECT FirstName, LOWER(FirstName)
FROM EmployeeErrors 

SELECT FirstName, Upper(FirstName)
FROM EmployeeErrors 