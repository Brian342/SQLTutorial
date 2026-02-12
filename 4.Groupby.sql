SELECT *
	FROM Parks_and_Recreation.employee_demographics;
    
    
SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
	FROM Parks_and_Recreation.employee_demographics
	GROUP BY gender
;
    

SELECT occupation, salary
	FROM Parks_and_Recreation.employee_salary
    GROUP BY occupation, salary
;

-- ORDER BY
SELECT *
	FROM Parks_and_Recreation.employee_demographics
    ORDER BY first_name DESC
;

SELECT gender, first_name
	FROM Parks_and_Recreation.employee_demographics
    ORDER BY gender, first_name
;

SELECT *
	FROM Parks_and_Recreation.employee_demographics
    ORDER BY 5, 4
;
    
