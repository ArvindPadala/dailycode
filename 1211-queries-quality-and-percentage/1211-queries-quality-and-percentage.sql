# Write your MySQL query statement below

select A.query_name, A.quality, case when B.cnt is null then 0 else round(B.cnt/A.totalcnt*100, 2) end as poor_query_percentage  from
(select query_name, round(avg(rating/position),2) as quality, count(*) as totalcnt from Queries group by query_name) as A
left join
(select query_name, count(*) as cnt from Queries where rating < 3 group by query_name) as B
on 
A.query_name=B.query_name