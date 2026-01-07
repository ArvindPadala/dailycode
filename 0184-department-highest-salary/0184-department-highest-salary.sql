# Write your MySQL query statement below


select d.name as Department, e.name as Employee, e.salary from Employee e join Department d on e.departmentId =d.ID where (d.name,e.salary) in (select d1.name, max(salary) from Employee e join Department d1 on e.departmentId=d1.id group by d1.name)