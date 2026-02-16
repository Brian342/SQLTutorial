-- String functions
use Parks_and_Recreation
;
-- length
SELECT length('skyfall')
;

SELECT first_name, length(first_name) AS Name_Length
	FROM Employee_demographics
ORDER BY 2
;

-- using upper and lower functions
SELECT upper('sky');
SELECT lower('SKY');

SELECT first_name, UPPER(first_name) AS caps_name
	FROM Employee_demographics
;

-- Trim, LTrim, RTrim
