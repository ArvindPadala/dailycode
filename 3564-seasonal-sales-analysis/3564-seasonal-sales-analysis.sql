# Write your MySQL query statement below
with A as(select 
case 
when month(sale_date) in (12,01,02) then 'Winter'
when month(sale_date) in (03,04,05) then 'Spring'
when month(sale_date) in (06,07,08) then 'Summer'
when month(sale_date) in (09,10,11) then 'Fall'
end as season,
p.category, 
sum(s.quantity) as total_quantity, 
sum(s.quantity*s.price) as total_revenue
from Sales s join products p 
on s.product_id=p.product_id 
group by season,p.category)

select season, category, total_quantity, total_revenue from (
    select *, row_number() over(
        partition by season
        order by total_quantity desc, total_revenue desc, category 
    ) as rn from A
)t 
where rn=1
order by season


