# Write your MySQL query statement below
#select * from Delivery where order_date=customer_pref_delivery_date group by customer_id order by order_date
select round(count(*)/(select count(distinct customer_id) from Delivery)*100,2) as immediate_percentage from
(select customer_id, min(order_date) as initial from Delivery group by customer_id) as A
join
(select customer_id, order_date as same from Delivery where order_date=customer_pref_delivery_date) as B
on A.customer_id=B.customer_id and A.initial=B.same
