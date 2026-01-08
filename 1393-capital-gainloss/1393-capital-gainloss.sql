# Write your MySQL query statement below
with A as(select stock_name, sum(price) as s from Stocks where operation = 'Buy' group by stock_name),
B as (select stock_name, sum(price) as s from Stocks where operation = 'Sell' group by stock_name)

select A.stock_name, B.s-A.s as capital_gain_loss from A join B on A.stock_name=B.stock_name
