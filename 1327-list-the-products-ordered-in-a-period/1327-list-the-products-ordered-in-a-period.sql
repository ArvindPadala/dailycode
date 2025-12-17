# Write your MySQL query statement below

select A.product as product_name, A.cnt as unit from 
(select p.product_name as product, sum(o.unit) as cnt from Products p join Orders o on p.product_id=o.product_id where substr(o.order_date,1,7)='2020-02' group by o.product_id, p.product_name) as A where A.cnt>=100