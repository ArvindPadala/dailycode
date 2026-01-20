# Write your MySQL query statement below

select customer_id from (
select customer_id, round(sum(case when transaction_type='refund' then 1 else 0 end)/count(*)*100,2) as refund_ratio, 
datediff(max(transaction_date),min(transaction_date)) as days from customer_transactions group by customer_id having refund_ratio<20 and count(*)>2 and days>29) as s order by customer_id