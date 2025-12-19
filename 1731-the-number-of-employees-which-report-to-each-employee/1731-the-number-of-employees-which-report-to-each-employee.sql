# Write your MySQL query statement below




select m.employee_id, m.name, count(e.reports_to) as reports_count, round(avg(e.age)) as average_age from Employees e join Employees m on e.reports_to = m.employee_id group by m.employee_id, m.name having count(e.reports_to)>=1 order by employee_id