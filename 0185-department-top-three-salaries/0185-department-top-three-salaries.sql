# Write your MySQL query statement below
with A as(select *, dense_rank() over (
    partition by departmentId order by salary desc
) as rn from Employee)

select d.name as Department, a.name as Employee, a.Salary 
from A a join Department d on a.departmentId=d.id where a.rn<4