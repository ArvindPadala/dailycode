# Write your MySQL query statement below
select max(A.num) as num from 
(select num from Mynumbers group by num having count(num)=1) as A