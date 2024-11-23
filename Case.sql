-- Case Statement adds logic in your statements like the if else statements

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age between 31 and 50 then 'old'
    when age >= 50 then "On Death's Door"
END as Age_Bracket
FROM employee_demographics
;


-- Task
# Pay increase and bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance > 10%


# checking who are in the finance department
select *
from employee_salary
;
select *
from parks_departments
;

select first_name, 
last_name, 
salary, 
CASE
	When salary < 50000 then salary + (salary * 0.05)
    when salary > 50000 then salary + (salary * 0.05)
END AS New_salary,
CASE
	WHEN dept_id = 6 Then salary * 10
END AS Bonus
from employee_salary

