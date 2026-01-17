# Write your MySQL query statement below


#select d.name as Department, e.name as Employee, e.salary from Employee e join Department d on e.departmentId =d.ID where (d.ID,e.salary) in (select departmentId, max(salary) from Employee group by departmentId )

with A as (select *, rank() over (partition by departmentId order by salary desc) as rnk
    from Employee)

select D.name as Department, A.name as Employee, A.salary from A a join Department D on A.departmentId=D.id where A.rnk=1

