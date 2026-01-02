# Write your MySQL query statement below
#select p.product_id, p.product_name from Product p join Sales s on p.product_id=s.product_id where p.product_id not in (select product_id from Sales where sale_date>'2019-03-31' and sale date<'2019-01-01') and s.sale_date between '2019-01-01' and '2019-03-31'


select product_id, product_name from Product where product_id not in((select product_id from Sales where sale_date>'2019-03-31')union (select product_id from Sales where sale_date<'2019-01-01' )) and product_id in (select distinct product_id from sales)
