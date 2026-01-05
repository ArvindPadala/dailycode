# Write your MySQL query statement below
select A.score, A.r as 'rank' from (select score, dense_rank() over (order by score desc) as r from Scores) as A 
