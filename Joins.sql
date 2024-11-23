-- joins allow one to bind two tables or more together if they have same column(the data in the column is same)
SELECT *
FROM employee_demographics
;

SELECT *
FROM employee_salary
;

-- inner joins returns rows that are the same in both columns in both tables
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id # showing which column you want to join 
    # (first employee_id is for the employee_demographics and the second is for the employee_salary
;

# selecting specific columns
SELECT dem.employee_id, age, occupation
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id # showing which column you want to join 
    # (first employee_id is for the employee_demographics and the second is for the employee_salary
;


-- outer joins
-- left outer join takes everything from the left table even if their is no match on the join then return match from the right table
-- right outer join takes everything from the right table if no match on the left table it will have nulls
SELECT *
FROM employee_demographics AS dem
RIGHT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id # showing which column you want to join 
    # (first employee_id is for the employee_demographics and the second is for the employee_salary
;


SELECT *
FROM employee_demographics AS dem
LEFT OUTER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id # showing which column you want to join 
    # (first employee_id is for the employee_demographics and the second is for the employee_salary
;


-- self join join where you tire a table to itself
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_name,
emp2.first_name AS first_name_emp,
emp2.last_name AS last_name_emp
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;


-- Joining Multiple Tables together
SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id # showing which column you want to join 
    # (first employee_id is for the employee_demographics and the second is for the employee_salary
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_departments;

