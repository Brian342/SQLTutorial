use Parks_and_Recreation
;
-- Joins
SELECT *
	FROM Parks_and_Recreation.employee_demographics
;

SELECT *
	FROM Parks_and_Recreation.employee_salary
;

-- inner joins is used to return both columns found in both table
SELECT *
	FROM Parks_and_Recreation.employee_demographics as dem
    INNER JOIN Parks_and_Recreation.employee_salary as sal
    ON dem.employee_id = sal.employee_id
;

/* Outer Joins 
- left outer joins takes everything from the left table even if their is no match on the table and return matches to the right table
- right outer joins takes everything from the right table even if their is no match on the table and return matches to the left table returns null if their
is no match
*/

-- left join
SELECT *
	FROM Parks_and_Recreation.employee_demographics as dem
    LEFT JOIN Parks_and_Recreation.employee_salary as sal
    ON dem.employee_id = sal.employee_id
;

-- right join
SELECT *
	FROM Parks_and_Recreation.employee_demographics as dem
    RIGHT JOIN Parks_and_Recreation.employee_salary as sal
    ON dem.employee_id = sal.employee_id
;

-- self join type of join where you tire the table to itself
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_,
emp2.first_name AS first_name,
emp2.last_name AS last_name
	FROM employee_salary emp1
    JOIN employee_salary emp2
    ON emp1.employee_id + 1= emp2.employee_id
;

-- Joining Multiple Tables Together
SELECT *
	FROM Parks_and_Recreation.employee_demographics as dem
    INNER JOIN Parks_and_Recreation.employee_salary as sal
    ON dem.employee_id = sal.employee_id 
    INNER JOIN Parks_departments pd
    ON sal.dept_id = pd.department_id
;

SELECT *
	FROM Parks_departments
;





