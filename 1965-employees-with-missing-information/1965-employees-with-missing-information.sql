# Write your MySQL query statement below
select A.e as employee_id from 
(
select employee_id as e from employees where employee_id not in (select employee_id from Salaries)
union all 
select employee_id as e from Salaries where employee_id not in (select employee_id from Employees))as A order by A.e