
with B as (select employee_id, count(week_start) as cnt from(
SELECT
    employee_id,
    DATE_SUB(meeting_date, INTERVAL WEEKDAY(meeting_date) DAY) AS week_start,
    COUNT(*) AS meetings_count,
    SUM(duration_hours) AS total_hours
FROM Meetings
GROUP BY employee_id, week_start
ORDER BY employee_id, week_start) 
as A where A.total_hours>20 
group by employee_id)

select e.employee_id, e.employee_name, e.department, B.cnt as meeting_heavy_weeks from employees e join B on e.employee_id=B.employee_id
where B.cnt >1 order by 4 desc, 2