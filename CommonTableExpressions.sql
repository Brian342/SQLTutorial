-- CTEs (Common Table Expressions allow you to define a subquery block which you may use it in the main query)


WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
-- SELECT AVG(avg_sal)
SELECT *
FROM CTE_Example
;

-- Alising on the CTE header

WITH CTE_Example(Gender, Avg_sal, Max_sal, Min_sal, Count_sal) AS
(
SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
-- SELECT AVG(avg_sal)
SELECT *
FROM CTE_Example
;

# uses of CTE help in solving complex mathematics
# helps in code readability eg using subquery
# use cte immediately after the bracket using it after the query will have an error
SELECT AVG(avg_sal)
FROM (SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;


-- creating multiple CTE together
WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics 
WHERE birth_date > '1985-01-01'
),
CTE_Example2 AS(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000 
)
SELECT *
FROM CTE_Example
JOIN CTE_Example2
	ON CTE_Example.employee_id = CTE_Example2.employee_id
;

