-- Group by - gropus together rows that have same values in the
			#specified column(s) that you are grouping on. once grouped by you can use the aggregate function

SELECT *
FROM employee_demographics;


SELECT gender, avg(age), Max(age), min(age), count(age)
FROM employee_demographics
GROUP BY gender;


SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary;



-- order by - Sort the result set in either ascending or descending order
SELECT *
FROM employee_demographics
ORDER BY gender, age DESC	
;


SELECT *
FROM employee_demographics
ORDER BY 5, 4 	 # ordering with the position argument for 5 rep the gender column and the 4 rep the age column
