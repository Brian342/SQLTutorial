-- subqueries - a query within a query
use Parks_and_Recreation
;

SELECT *
	FROM employee_demographics
		WHERE employee_id IN (
								SELECT employee_id
									FROM employee_salary
                                    WHERE dept_id = 1)
;

SELECT first_name, salary, AVG(salary)
	FROM employee_salary
    GROUP BY first_name, salary
;

SELECT first_name, salary,
	( SELECT AVG(salary)
		FROM employee_salary
	) AS salary_avg
	FROM employee_salary
    GROUP BY first_name, salary
;

-- subqueries on the from statement clause
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
	FROM employee_demographics
    GROUP BY gender
;

SELECT AVG(`MAX(age)`), AVG(`MIN(age)`)
	FROM (
    SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
	FROM employee_demographics
    GROUP BY gender
    ) AS agg_table
;

SELECT AVG(max_age), AVG(min_age)
	FROM (
    SELECT gender, AVG(age) AS avg_age, MAX(age) AS max_age, MIN(age) AS min_age, COUNT(age) AS count_age
	FROM employee_demographics
    GROUP BY gender
    ) AS agg_table
;












