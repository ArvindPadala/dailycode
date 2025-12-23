# Write your MySQL query statement below


(select name as results from Users u join MovieRating r on u.user_id=r.user_id group by r.user_id order by count(*) desc, name limit 1)
union all
(select m.title as results from MovieRating r join Movies m on r.movie_id=m.movie_id where substring(created_at,1,7)='2020-02' group by r.movie_id order by avg(rating) desc, title limit 1)


