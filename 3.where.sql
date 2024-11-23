-- where clause returns rows that fulfill specific conditions

SELECT *
FROM employee_demographics
WHERE first_name = 'leslie';


SELECT *
FROM employee_salary
WHERE salary  <= 50000;

select *
from employee_demographics
where gender != 'female';

select *
from employee_demographics
where birth_date > '1985-01-01';

-- Logical Operators (AND, OR, NOT) allow us to have different logic

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;


-- like statements looks for specific patterns
-- % means anything and  _ means specific value
SELECT *
FROM employee_demographics
WHERE first_name LIKE '%er%';

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%'; # means it start with a and two mo


SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%' # means it start with a and two mo