-- union Allows one to combine rows together
use Parks_and_Recreation
;
-- Using Union with Distinct it removes all the duplicates values

SELECT first_name, last_name
	FROM employee_demographics
    UNION DISTINCT
SELECT first_name, last_name
	FROM employee_salary
;

-- Using Union with All returns duplicates values
SELECT first_name, last_name
	FROM employee_demographics
    UNION ALL
SELECT first_name, last_name
	FROM employee_salary
;

-- using union on where
SELECT first_name, last_name, 'Old Men' AS label
	FROM employee_demographics
	WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS label
	FROM employee_demographics
	WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS label
	FROM employee_salary
    WHERE salary > 70000
ORDER BY first_name, last_name
;