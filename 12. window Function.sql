SELECT dem.first_name, dem.last_name,gender, AVG(salary) AS avg_salary
	FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
    GROUP BY gender,dem.first_name, dem.last_name
;

-- using window function
SELECT dem.first_name, dem.last_name,gender, 
SUM(salary) OVER(PARTITION BY gender) -- works almost similar as group by function
	FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
;

-- Roll on starts at a specific value and add on values from subsequent rows based off of your partition
SELECT dem.first_name, dem.last_name,gender, salary,
SUM(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total -- works almost similar as group by function
	FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
;


-- row number
SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER()
	FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
;

SELECT dem.employee_id, dem.first_name, dem.last_name,gender, salary,
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num, -- Provides the row numbers based on the partition
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num, -- rank provides a duplicate values based on the partition clause and skips the number eg if duplicate is 5,5 the next number will be 7
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_num -- dense_rank provides a duplicate values based on the partition clause and does not skip the number eg if duplicate is 5,5 the next number will be 6
	FROM employee_demographics dem
    JOIN employee_salary sal
    ON dem.employee_id = sal.employee_id
;














