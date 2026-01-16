# Write your MySQL query statement below


with A as (select request_at as Day, 
sum(case 
when status = 'cancelled_by_driver' and driver_id in (select users_id from Users where banned='No') and client_id in (select users_id from Users where banned='No') then 1
when status='cancelled_by_client' and client_id in (select users_id from Users where banned='No') and driver_id in (select users_id from Users where banned='No') then 1
else 0 end) as cnt from Trips group by request_at having count(id)>0),

B as (select request_at, count(id) as cnt from Trips where client_id in (select users_id from Users where banned='No') and driver_id in (select users_id from Users where banned='No') group by request_at)

select A.Day, round(A.cnt/B.cnt,2) as "Cancellation Rate" from A join B on A.Day=B.request_at where A.Day between "2013-10-01" and "2013-10-03"