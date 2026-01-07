# Write your MySQL query statement below




with A as (select visited_on, sum(amount) as days_amount from Customer group by visited_on),

B as (select visited_on, 
sum(days_amount) over
(order by visited_on
rows between 6 preceding and current row) as amount,
round(avg(days_amount) over
(order by visited_on
rows between 6 preceding and current row),2) as average_amount from A)


select B.visited_on, B.amount, B.average_amount from B where B.visited_on>=((select min(visited_on) from Customer)+ interval 6 day) group by B.visited_on order by B.visited_on

