# Write your MySQL query statement below
select distinct A.Numss as ConsecutiveNums
from
(select case 
when l1.num=l2.num and l2.num=l3.num then l1.num else null end as Numss 
from Logs l1 join Logs l2 on l2.id=l1.id+1 join Logs l3 on l3.id=l2.id+1) as A
where A.Numss is not null