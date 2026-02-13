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

-- Aliasing changing name of columns

SELECT gender, AVG(age) AS avg_age
	FROM Parks_and_Recreation.employee_demographics
    GROUP BY gender
    HAVING avg_age > 41
;
