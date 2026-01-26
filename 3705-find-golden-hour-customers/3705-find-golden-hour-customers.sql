# Write your MySQL query statement below
select customer_id, count(*) as total_orders,
round(sum(case 
when date_format(order_timestamp, '%H:%i') between '11:00' and '14:00' then 1 
when date_format(order_timestamp, '%H:%i') between '18:00' and '21:00' then 1
else 0 end)/ count(*)*100) as peak_hour_percentage, 
round(avg(order_rating),2) as average_rating 
from restaurant_orders 
group by customer_id 
having total_orders>2 
and average_rating>=4.0 
and peak_hour_percentage>=60 
and sum(case when order_rating is not null then 1 else 0 end)>total_orders/2
order by average_rating desc, customer_id desc