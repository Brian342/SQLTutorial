-- CTEs Common Table Expressions


WITH CTE_examples(Gender,AVG_sal, MAX_sal, MIN_sal, COUNT_sal) AS
(
SELECT gender, AVG(salary) avg_sal ,MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count_sal
	FROM employee_demographics dem
    JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
	GROUP BY gender
)
SELECT *
	FROM CTE_examples
-- SELECT AVG(avg_sal)
-- 	FROM CTE_examples
;


-- creating multiple CTES
WITH CTE_examples AS
(
SELECT employee_id, gender, birth_date
	FROM employee_demographics 
    WHERE birth_date > '1985-01-01'
),
CTE_example2 AS
(
SELECT employee_id, salary
	FROM employee_salary
    WHERE salary > 50000
)
SELECT *
	FROM CTE_examples
    JOIN CTE_example2
    ON CTE_examples.employee_id = CTE_example2.employee_id
;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
