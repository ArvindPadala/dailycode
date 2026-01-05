# Write your MySQL query statement below
with A as 
(select requester_id as id from RequestAccepted 
union all
select accepter_id as id from RequestAccepted)

select A.id, count(*) as num from A group by A.id order by num desc limit 1



#select requester_id as id, count(accepter_id) as c1 from RequestAccepted group by requester_id 
#select accepter_id as id, count(requester_id) as c1 from RequestAccepted group by accepter_id