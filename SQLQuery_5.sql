/*
Group By, Order By 
*/
SELECT*
FROM EmployeeDemographics
-- ORDER BY AGE DESC, Gender DESC
ORDER BY 4 DESC, 5 DESC

-- SELECT Gender, COUNT(Gender) AS CounterGender
-- FROM EmployeeDemographics
-- WHERE Age > 31
--GROUP BY Gender, Age
-- GROUP BY Gender
--ORDER BY CounterGender DESC
-- ORDER BY Gender ASC
-- shows the unique value and roll them up
-- the count gender is a derived field based on the gender column