# Write your MySQL query statement below

select A.customer_id from
(select customer_id, count(distinct product_key) as cnt from Customer group by customer_id) as A
where A.cnt=(select count(*) from product)