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

-- Trim, LTrim, RTrim takes white space either front or back of the space
SELECT TRIM('             Sky            ') AS trim_space
;

-- Ltrim
SELECT LTRIM('             Sky            ') AS Ltrim_space
;

-- Rtrim
SELECT RTRIM('             Sky            ') AS Rtrim_space
;

-- 
SELECT first_name, LEFT(first_name, 4), -- how many characters we want from the left string
	right(first_name, 4),
	SUBSTRING(first_name, 3, 2), -- start at position 3 and stop at position 2
    birth_date,
    SUBSTRING(birth_date, 6, 2) birth_months
    FROM employee_demographics
;

-- replace specific characters
SELECT first_name, REPLACE(first_name, 'a', 'z') replace_letters
	FROM employee_demographics
;

-- locate letter
SELECT LOCATE('a', 'Brian')
;

SELECT first_name, LOCATE('An', first_name) locate_letters
	FROM employee_demographics
;

-- Concatenation
SELECT first_name, last_name,
	concat(first_name,' ',last_name) full_names
	FROM employee_demographics
;








