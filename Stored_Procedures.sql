/* Stored procedures- a group of sql statements 
being created and stored in a database */

-- CREATE PROCEDURE TEST
-- AS
-- SELECT *
-- FROM EmployeeDemographics

-- EXEC TEST

CREATE PROCEDURE Temp_Employee
AS
CREATE table #temp_employee (
    JobTitle VARCHAR(100),
    EmployeesPerJob int,
    AvgAge int,
    AvgSalary int
) 

Insert into #temp_employee
SELECT JobTitle,COUNT(JobTitle), AVG(age), AVG(Salary)
FROM SqlTutorial..EmployeeDemographics emp
JOIN SqlTutorial..EmployeSalary sal
     ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

SELECT *
FROM #temp_employee

EXEC Temp_Employee @JobTitle = 'Salesman'