# Write your MySQL query statement below
select * from products where description regexp '(^|[^a-zA-Z0-9])SN[0-9]{4}-[0-9]{4}([^0-9]|$)' and description like binary '%SN%' order by product_id