


# Write your MySQL query statement below
select A.person_name from
(select turn, person_name, 
sum(weight) over(order by turn)  as Total_weight from Queue order by turn) as A 
where total_weight<=1000 order by A.turn desc limit 1
