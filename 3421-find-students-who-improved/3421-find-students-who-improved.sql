# Write your MySQL query statement below
with A as(select student_id, subject, min(exam_date) as mi, max(exam_date) as ma from Scores group by student_id, subject)

select s.student_id, s.subject, 
max(case when s.exam_date=A.mi then s.score end) as first_score,
max(case when s.exam_date=A.ma then s.score end) as latest_score from Scores s join A on s.student_id=A.student_id and s.subject=A.subject  group by s.student_id, s.subject having latest_score>first_score order by s.student_id, s.subject