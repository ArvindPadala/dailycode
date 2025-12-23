# Write your MySQL query statement below
with A as (select 
count(case when income < 20000 then 1 end) as Low,
count(case when income between 20000 and 50000 then 1 end) as Aveg,
count(case when income >50000 then 1  end) as high
from Accounts)
select 'Low Salary' as category, Low as accounts_count from A 
union all
select 'Average Salary' as category, Aveg as accounts_count from A
union all 
select 'High Salary' as category, high as accounts_count from A
