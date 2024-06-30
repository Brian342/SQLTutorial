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

INSERT INTO #temp_employee
select *
FROM SqlTutorial..employesalary