


# Write your MySQL query statement below
 select A.p as product_id, A.y as first_year, s.quantity, s.price from
(select product_id as p, min(year) as y from sales group by product_id)
as A
join 
(select product_id, year, quantity, price from Sales) 
as s
on A.p=s.product_id and A.y=s.year