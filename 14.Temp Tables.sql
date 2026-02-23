-- Temporary tables tables that are only visible to the session they are created in

-- first method to create a temporary table
CREATE TEMPORARY TABLE temp_table
(
first_name VARCHAR(50),
last_name VARCHAR(50),
favourite_movie VARCHAR(100)
);

SELECT *
	FROM temp_table
;

INSERT INTO temp_table
VALUES('John', 'Doe', 'The Conjuring')
;

SELECT *
	FROM temp_table
;

-- second method to create a temporary table

CREATE TEMPORARY TABLE salary_over_50k
SELECT *
	FROM employee_salary
    WHERE salary >= 50000
;


SELECT *
	FROM salary_over_50k
;















