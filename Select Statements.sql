/*
Select Statements
* Limit Distinct, Count, As, Max, Min, Avg
*/
SELECT *
	FROM EmployeeDemographics
	ORDER BY FirstName 
    DESC LIMIT 5;


-- Distinct
SELECT DISTINCT GENDER
	FROM EmployeeDemographics;
    
-- COUNT
SELECT COUNT(LastName) AS LastNameCount
	FROM EmployeeDemographics;
	
	
