# Write your MySQL query statement below

with A as(select *, row_number() over (
    partition by user_id
    order by event_date desc
) as rn from subscription_events),

B as(select A.user_id as user_id, min(rn) as mi from A group by user_id)

select t.user_id, t.current_plan, t.current_monthly_amount, t.max_historical_amount, t.days_as_subscriber from( 
select A.user_id as user_id, case when A.rn=B.mi then A.plan_name end as current_plan,sum(case when event_type='downgrade' then 1 else 0 end) as cnt,
case when A.rn=B.mi then A.monthly_amount end as current_monthly_amount, max(A.monthly_amount) as max_historical_amount, datediff(max(A.event_date),min(A.event_date)) as days_as_subscriber from A join B using(user_id) group by A.user_id) as t 
where t.days_as_subscriber>59 and t.cnt>0 and (t.current_monthly_amount/t.max_historical_amount)*100<50 and t.current_plan is not null order by 5 desc, 1 