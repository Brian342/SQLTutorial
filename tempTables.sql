-- Temporary tables - tables only visible to the sections they are created in

# ways to create a temp table 
# 1) 
CREATE TEMPORARY TABLE temp_table
(first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

SELECT *
FROM temp_table
;

INSERT INTO temp_table
VALUES('Brian', 'Kimanzi', 'Game Of Thrones')
;

SELECT *
FROM temp_table
;

# Way 2 of creating temp tables
SELECT *
FROM employee_salary
;

CREATE temporary table salary_over_50k
SELECT *
FROM employee_salary
WHERE salary >= 50000
;
SELECT *
FROM salary_over_50k
;