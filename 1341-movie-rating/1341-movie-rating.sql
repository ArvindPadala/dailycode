# Write your MySQL query statement below


(select name as results from Users join MovieRating using(user_id) group by user_id order by count(*) desc, name limit 1)
union all
(select title as results from MovieRating  join Movies using(movie_id) where substring(created_at,1,7)='2020-02' group by movie_id order by avg(rating) desc, title limit 1)


