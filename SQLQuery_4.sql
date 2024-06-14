/* where Statement
=, <>, <, >, And, Or, Like,Null, Not,Null,In */
SELECT * 
FROM EmployeeDemographics
--WHERE FirstName = 'Jim'
--WHERE FirstName <>'Jim'
--WHERE Age >= 30
--WHERE Age <= 32 And Gender = 'Male'
--WHERE Age <= 32 Or Gender = 'Male'
--WHERE LastName LIKE 's%c%ott%' --returns the name
-- WHERE FirstName is Not NULL
WHERE FirstName  IN ('Jim', 'Nichael')









