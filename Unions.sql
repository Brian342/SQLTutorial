-- unions Allows you to combine rows together from same table or different table

SELECT first_name, last_name
FROM employee_demographics
UNION dISTINCT # distinct only unique values i.e removing duplicates
SELECT first_name, last_name
FROM employee_salary
;

# union all
SELECT first_name, last_name
FROM employee_demographics
UNION ALL #  all displays all values including the duplicates
SELECT first_name, last_name
FROM employee_salary
;


SELECT first_name, last_name, 'Old man' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'male'
UNION
SELECT first_name, last_name, 'Old lady' as Label
FROM employee_demographics
WHERE age > 40 AND gender = 'female'
UNION 
SELECT first_name, last_name, 'Highly paid Employee' as Label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;