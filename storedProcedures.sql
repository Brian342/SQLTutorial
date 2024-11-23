-- Stored Procedures - ways to store sql code that can be used again and again

SELECT *
FROM employee_salary
WHERE salary >= 50000
;

# Creating a stores procedure
CREATE procedure large_salaries()
SELECT *
FROM employee_salary
WHERE salary >= 50000
;

CALL large_salaries()
;


DELIMITER &&
CREATE procedure large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END &&
DELIMITER ;

CALL large_salaries3()
;

# parameter  variables passed in as input and stored in procedures

DELIMITER &&
CREATE procedure large_salaries4(first_index INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id  = first_index
;
END &&
DELIMITER ;

CALL large_salaries4(1)
;


# Parameter example taking 2 parameters
DELIMITER &&
CREATE procedure large_salaries5(first_index INT, first_index_name VARCHAR(50), Last_index_name VARCHAR(50))
BEGIN
	SELECT first_name, last_name, salary
	FROM employee_salary
    WHERE employee_id  = first_index AND first_name = first_index_name ANd last_name = Last_index_name
;
END &&
DELIMITER ;

CALL large_salaries5(1, 'Leslie', 'Knope')
;

