-- String functions

SELECT length('Sky') # used to diplay the number of charaters on a string
;

SELECT first_name, length(first_name)
FROM employee_demographics
order by 2
;

SELECT upper('sky')
;
select lower('SKY')
;

SELECT first_name, UPPER(first_name)
FROM employee_demographics
;

select LTRIM('              sky           ') # removes from the left hand side 
;
select RTRIM('             SKY        ') # removes from the right hand side
;
select TRIM('         sky        ') # removes all the white spaces on the string
;

select first_name, 
LEFT(first_name , 4), # specifies how many characters from the left hand side we want to select
RIGHT(first_name, 4), # specifies how many characters from the right hand side we want to select
SUBSTRING(first_name, 3, 2), # start position 3 then specify how many characters we want to go
birth_date,
substring(birth_date, 6, 2) AS birth_date
from employee_demographics
;



-- replace used to replace a certain character with the charater you want
 SELECT first_name, REPLACE(first_name, 'a', 'z')
 FROM employee_demographics
;

-- locate
SELECT LOCATE('R', 'BRIAN')

;

SELECT first_name, last_name,
CONCAT(first_name, '  ', last_name) # used to combine 2 string together
FROM employee_demographics
