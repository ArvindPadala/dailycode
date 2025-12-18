# Write your MySQL query statement below
select A.class from 
(select class, count(distinct student) as cnt from Courses group by class) as A
where A.cnt >=5