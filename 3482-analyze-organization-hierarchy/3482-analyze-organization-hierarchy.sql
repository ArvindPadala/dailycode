# Write your MySQL query statement below
WITH RECURSIVE org AS (
  -- 1) Anchor: start at CEO(s)
  SELECT
    employee_id,
    employee_name,
    manager_id,
    salary,
    department,
    1 AS level
  FROM Employees
  WHERE manager_id IS NULL

  UNION ALL

  -- 2) Recursive: attach direct reports
  SELECT
    e.employee_id,
    e.employee_name,
    e.manager_id,
    e.salary,
    e.department,
    o.level + 1 AS level
  FROM Employees e
  JOIN org o
    ON e.manager_id = o.employee_id
),
pair as(
   SELECT
    manager_id,
    employee_id
  FROM Employees
  WHERE manager_id IS not NULL

  UNION ALL

  -- 2) Recursive: attach direct reports
  SELECT
    p.manager_id,
    e.employee_id
  FROM Employees e
  JOIN pair p
    ON e.manager_id = p.employee_id
),

details as(select p.manager_id, count(distinct p.employee_id) as team_size, sum(e.salary) as desc_salary from employees e join pair p on e.employee_id=p.employee_id group by p.manager_id)

SELECT
  o.employee_id,
  o.employee_name,
  o.level,
  COALESCE(r.team_size, 0) AS team_size,
  (o.salary + COALESCE(r.desc_salary, 0)) AS budget
FROM org o
LEFT JOIN details r
  ON r.manager_id = o.employee_id
ORDER BY
  o.level ASC,
  budget DESC,
  o.employee_name ASC;






