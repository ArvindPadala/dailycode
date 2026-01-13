WITH heavy_weeks AS (
  SELECT
      employee_id,
      DATE_SUB(meeting_date, INTERVAL WEEKDAY(meeting_date) DAY) AS week_start
  FROM Meetings
  GROUP BY employee_id, week_start
  HAVING SUM(duration_hours) > 20
),
cnts AS (
  SELECT
      employee_id,
      COUNT(*) AS meeting_heavy_weeks
  FROM heavy_weeks
  GROUP BY employee_id
  HAVING COUNT(*) > 1
)
SELECT
    e.employee_id,
    e.employee_name,
    e.department,
    c.meeting_heavy_weeks
FROM Employees e
JOIN cnts c
  ON e.employee_id = c.employee_id
ORDER BY 4 DESC, 2