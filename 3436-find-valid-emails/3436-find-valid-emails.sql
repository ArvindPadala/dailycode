# Write your MySQL query statement below
select user_id, email from Users where email regexp '^[a-zA-Z0-9][a-zA-Z0-9_]*@[a-zA-Z]*\\.com$' and email like binary '%.com' order by user_id