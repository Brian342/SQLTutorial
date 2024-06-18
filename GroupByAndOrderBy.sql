/* Group By Order By*/

-- SELECT *
-- FROM EmployeeDemographics
-- ORDER BY Age DESC ,Gender DESC

SELECT *
FROM EmployeeDemographics
ORDER BY 4 DESC ,5 DESC --4 represent the column 4 and the 5 represent the column 5


-- SELECT Gender, Age, COUNT(Gender) AS CountGender
-- FROM EmployeeDemographics
-- WHERE Age > 31
-- GROUP BY Gender,Age
-- ORDER BY CountGender --used to arrange elements in asc or desc order