/*Subqueries they are query withing a query uses the select
From and where statement */

SELECT *
FROM EmployeSalary

-- subquery in select
SELECT EmployeeID, Salary, (select AVG(Salary)From EmployeSalary) as AllAvgSalary
FROM EmployeSalary

-- How to do it with partition By
SELECT EmployeeID, Salary, AVG(Salary)OVER () as AllAvgSalary
FROM EmployeSalary

-- Why group by doesn't work
SELECT EmployeeID, Salary, AVG(Salary) as AllAvgSalary
FROM EmployeSalary
GROUP BY EmployeeID, salary
ORDER BY 1,2

--subqueries in from

SELECT a.EmployeeID, AllAvgSalary
FROM (SELECT EmployeeID, Salary, AVG(Salary)OVER () as AllAvgSalary
      FROM EmployeSalary) a


-- subquery in where
SELECT EmployeeID, JobTitle, Salary
FROM EmployeSalary
WHERE EmployeeID in (
    select EmployeeID
    FROM EmployeeDemographics
    WHERE Age > 30
)