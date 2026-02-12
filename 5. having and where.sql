-- having used when you want to obtain results in aggregated functions
--  and where

SELECT gender, AVG(age)
	FROM Parks_and_Recreation.employee_demographics
    GROUP BY gender
    HAVING AVG(age) > 40
;

-- using having and where in one query
SELECT occupation, AVG(salary)
	FROM Parks_and_Recreation.employee_salary
    WHERE occupation LIKE '%manager%'
    GROUP BY occupation
    HAVING AVG(salary) > 75000
;