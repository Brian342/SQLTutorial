-- limit and Aliasing

select*
from employee_demographics
;

select *
from employee_demographics
order by age desc
limit 2, 1 # start at position, the row you want after it that is the row below
;

select *
from employee_demographics
order by age desc
limit 2, 1 # start at position, the row you want after it that is the row below
;

-- Alising used to change the name of a column

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having	avg(age) > 40

