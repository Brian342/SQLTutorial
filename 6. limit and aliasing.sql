-- Aliasing and limit clause
SELECT *
	FROM Parks_and_Recreation.employee_demographics
    ORDER BY age DESC
    LIMIT 3
;

SELECT *
	FROM Parks_and_Recreation.employee_demographics
    ORDER BY age DESC
    LIMIT 2, 1 -- start at position 2 and return the one after
;