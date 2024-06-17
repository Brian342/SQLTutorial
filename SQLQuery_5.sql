/* Where Statement - helps limit the amount of data and specify the data you want to return
=, <>, <, >, And, Or, Like, Null, Not Null, In */

-- SELECT *
-- FROM EmployeeDemographics
-- WHERE FirstName <> 'Brian' -- = sign returns the name <> returns every value except the name Brian

/*The AND Command*/
-- SELECT *
-- FROM EmployeeDemographics
-- WHERE Age <= 32 AND Gender = 'Male'

/*The Or Command*/
-- SELECT *
-- FROM EmployeeDemographics
-- WHERE Age <= 32 OR Gender = 'Male'

 /* The Like Command */
-- SELECT *
-- FROM EmployeeDemographics --The percentage sign means wildcard
-- WHERE LastName LIKE '%S%' -- (s%)every lastname where we start with an s. (%s%) returns every name that contains an s anywhere in the name

-- SELECT *
-- FROM EmployeeDemographics --The percentage sign means wildcard
-- WHERE LastName LIKE 'S%c%ott%'

-- SELECT *
-- FROM EmployeeDemographics
-- WHERE FirstName is Not NULL --looks at the whole column and checks if it is null or not

SELECT *
FROM EmployeeDemographics
WHERE FirstName IN ('Brian','Michael') --The IN can be used in place of equal sign