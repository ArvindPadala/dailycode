# Write your MySQL query statement below
select round(count(*)/(select count(distinct player_id) from Activity),2) as fraction from
(select player_id, min(event_date) as first from Activity group by player_id) as A
join 
Activity as B on A.player_id=B.player_id and B.event_date=A.first+ interval 1 day
