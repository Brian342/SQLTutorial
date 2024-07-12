SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[Temp_Employee]
@JobTitle NVARCHAR(100)
AS
CREATE table #temp_employee (
    JobTitle VARCHAR(100),
    EmployeesPerJob int,
    AvgAge int,
    AvgSalary int
) 

INSERT into #temp_employee
SELECT JobTitle, COUNT(JobTitle), AVG(Age), AVG(Salary)
from SqlTutorial..EmployeeDemographics emp
JOIN SqlTutorial..EmployeSalary sal
    ON emp.EmployeeID = sal.EmployeeID
    WHERE JobTitle = @JobTitle
GROUP by JobTitle

select *
from #temp_employee

GO
