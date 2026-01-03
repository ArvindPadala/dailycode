# Write your MySQL query statement below
with A as (select user_id, count(prompt) as prompt_count, round(avg(tokens),2) as avg_tokens from prompts group by user_id having prompt_count>=3),

B as (select user_id, tokens from prompts group by user_id having max(tokens)>avg(tokens))

select A.user_id, A.prompt_count, A.avg_tokens from A join B on A.user_id=B.user_id order by A.avg_tokens desc, A.user_id