-- Triggers and events
# Triggers a block of code that runs automatically when an event takes place on a specific table

SELECT *
FROM employee_demographics
;


SELECT *
FROM employee_salary
;



DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW 
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation,
salary, dept_id)
VALUES(13, 'Jean-Ralphio', 'Saperstein', 'Entertainment 720 CEO', 1000000, NULL)
;



-- EVENTS - it takes place when it is scheduled(most used for automation in general)
SELECT *
FROM employee_demographics


DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO 
BEGIN
    SELECT *
	FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;
;

SHOW VARIABLES LIKE 'event%';



