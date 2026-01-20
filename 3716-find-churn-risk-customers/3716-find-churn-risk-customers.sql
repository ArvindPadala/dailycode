WITH x AS (
  SELECT
    user_id,
    plan_name,
    monthly_amount,
    event_type,
    event_date,
    ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_date DESC) AS rn,

    MAX(monthly_amount) OVER (PARTITION BY user_id) AS max_historical_amount,
    DATEDIFF(
      MAX(event_date) OVER (PARTITION BY user_id),
      MIN(event_date) OVER (PARTITION BY user_id)
    ) AS days_as_subscriber,
    SUM(event_type = 'downgrade') OVER (PARTITION BY user_id) AS downgrade_cnt
  FROM subscription_events
)
SELECT
  user_id,
  plan_name AS current_plan,
  monthly_amount AS current_monthly_amount,
  max_historical_amount,
  days_as_subscriber
FROM x
WHERE rn = 1
  AND days_as_subscriber > 59
  AND downgrade_cnt > 0
  AND (monthly_amount / max_historical_amount) * 100 < 50
  AND plan_name is not null
ORDER BY days_as_subscriber DESC, user_id;
