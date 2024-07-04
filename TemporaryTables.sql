/* Temp Tables */

CREATE Table #temp_employee (
    EmployeeID int,
    JobTitle VARCHAR(100),
    Salary int
)

SELECT *
FROM #temp_employee

INSERT INTO #temp_employee VALUEs (
    '1001', 'HR', '45000'

)
/*Insert data from one tabble to a temp table*/
INSERT INTO #temp_employee
select *
FROM SqlTutorial..employesalary

/*putting data inside it */
DROP TABLE IF EXISTS #temp_employee2
CREATE TABLE #temp_employee2 (
    JobTitle VARCHAR(50),
    EmployeePerJob int,
    AVGAge int,
    AVGSalary int
)

INSERT INTO #temp_employee2 
SELECT JobTitle,COUNT(JobTitle), AVG(Age), AVG(Salary)
FROM SqlTutorial..EmployeeDemographics emp
JOIN SqlTutorial..employesalary sal
    ON emp.EmployeeID = sal.EmployeeID
group by JobTitle

SELECT *
from #temp_employee2