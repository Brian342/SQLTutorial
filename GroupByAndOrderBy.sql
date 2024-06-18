/* Group By Order By*/

SELECT *
FROM EmployeeDemographics



SELECT Gender, Age, COUNT(Gender)
FROM EmployeeDemographics
GROUP BY Gender,Age