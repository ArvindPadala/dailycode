WITH x AS (
  SELECT
    id,
    visit_date,
    people,
    id - ROW_NUMBER() OVER (ORDER BY id) AS grp
  FROM Stadium
  WHERE people >= 100
),
good AS (
  SELECT grp
  FROM x
  GROUP BY grp
  HAVING COUNT(*) >= 3
)
SELECT x.id, x.visit_date, x.people
FROM x
JOIN good USING (grp)
ORDER BY x.visit_date;