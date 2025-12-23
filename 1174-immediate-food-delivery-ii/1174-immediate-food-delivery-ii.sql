# Write your MySQL query statement below

select round(avg(t.first)*100,2) as immediate_percentage from (select customer_id, (min(order_date)=min(customer_pref_delivery_date))as first from delivery group by customer_id) as t
