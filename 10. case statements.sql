-- Case Statements
use Parks_and_Recreation
;

SELECT first_name,
	last_name,
    age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "Elders"
END as age_group
FROM employee_demographics
;

/* Pay Increase and Bonus
	< 50000 = 5%
    > 50000 = 7%
    Finance = 10% Bonus
*/
SELECT *
	FROM employee_salary
;


SELECT 
	first_name,
	last_name,
    salary,
    dept_id,
CASE 
	WHEN salary < 50000 THEN salary + (salary * 0.05)
    WHEN salary > 50000 THEN salary + (salary * 0.07)    
END as new_salary,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
	FROM employee_salary
;






