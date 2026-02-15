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
- right outer joins takes everything from the right table even if their is no match on the table and return matches to the left table

*/

SELECT *
	FROM Parks_and_Recreation.employee_demographics as dem
    LEFT JOIN Parks_and_Recreation.employee_salary as sal
    ON dem.employee_id = sal.employee_id
;






