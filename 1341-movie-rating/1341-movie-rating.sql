# Write your MySQL query statement below






with A as (select u.name as first, count(r.user_id) as cnt from Movies m join MovieRating r on m.movie_id=r.movie_id join Users u on r.user_id=u.user_id group by r.user_id  order by cnt desc, first limit 1),

B as (select m.movie_id, m.title as secon, avg(r.rating) as rat from Movies m join MovieRating r on m.movie_id=r.movie_id join Users u on r.user_id=u.user_id where substring(r.created_at, 1,7)='2020-02' group by m.movie_id, m.title order by rat desc, secon limit 1)

select first as results from A 
union all
select secon as results from B where rat=(select max(rat) from B) 