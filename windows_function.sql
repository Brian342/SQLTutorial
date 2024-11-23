-- windows function allows us to look for a partition or a group and each keep their unique row in the output

-- group by rows every up into one row
SELECT dem.first_name, dem.last_name,gender, AVG(salary) AS avg_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY dem.first_name, dem.last_name, gender

;

-- window function
SELECT dem.first_name, dem.last_name, gender, AVG(salary) OVER(PARTITION BY gender) # looks for average salary of everybody
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id

;


SELECT dem.first_name, dem.last_name, gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS rolling_total # looks for average salary of everybody
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;



SELECT dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, # gives a row number based on the partititon by command
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
;