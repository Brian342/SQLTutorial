-- subqueries a query withing another query

select *
from employee_demographics
WHERE employee_id IN 
					(SELECT employee_id
						FROM employee_salary
                        WHERE dept_id = 1)
;



-- subqueries with select statement
# get the salary of the salary column regardless of the groupby columns

SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary
) AS average_salary
FROM employee_salary
GROUP BY first_name, salary
;

-- subqueries with from statement
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender
;


-- SELECT gender, AVG(avg_max-- 
SELECT AVG(avg_max)
FROM
(SELECT gender, 
AVG(age) AS avg_age, 
MAX(age) AS avg_max, 
MIN(age) AS avg_min, 
COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_table
-- GROUP BY gender
