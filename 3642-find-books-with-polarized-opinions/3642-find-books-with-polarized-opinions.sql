# Write your MySQL query statement below
with A as (select book_id from reading_sessions where session_rating>=4 group by book_id 
intersect
select book_id from reading_sessions where session_rating<=2 group by book_id 
intersect
select book_id from reading_sessions group by book_id having count(book_id)>=5),

B as (select book_id, max(session_rating)-min(session_rating) as rating_spread from reading_sessions group by book_id),

C as (select book_id, sum(case when session_rating>=4 or session_rating<=2 then 1 else 0 end)/count(book_id) as score from reading_sessions group by book_id)

select d.book_id, d.title, d.author, d.genre, d.pages, B.rating_spread, round(C.score,2) as polarization_score from books d join A on d.book_id=A.book_id join B on A.book_id=B.book_id join C on B.book_id=C.book_id where C.score >=0.6 order by polarization_score desc, title desc