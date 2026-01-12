# Write your MySQL query statement below




with A as(select *, rank() over(
    partition by employee_id
    order by review_date desc, rating desc
)as rn from performance_reviews ),

B as( select employee_id, max(case when rn=1 then rating end) as latest,
max(case when rn=2 then rating end) as middle,
max(case when rn=3 then rating end) as earliest 
from A group by employee_id)

select e.employee_id, e.name,
B.latest-B.earliest as improvement_score from employees e join B b on b.employee_id=e.employee_id 
where b.latest>b.middle
and b.middle>b.earliest 
order by improvement_score desc, name



