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
