-- Having - used to filter aggregated functions after the group by function happens
-- vs
#  Where - used to filter values aggregated function before the group by function

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(age) > 40
;


SELECT *
FROM employee_salary
;



SELECT occupation, avg(salary)
FROM employee_salary
WHERE occupation like '%manager'
GROUP BY occupation
HAVING AVG(salary) > 75000




;