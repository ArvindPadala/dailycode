# Write your MySQL query statement below
 with A as (SELECT
    user_id,
    reaction,
    COUNT(*) AS reaction_count,
    ROW_NUMBER() OVER (
      PARTITION BY user_id
      ORDER BY COUNT(*) DESC, reaction
    ) AS rn
  FROM reactions
  GROUP BY user_id, reaction),

  B as (select user_id, count(*) as total, count(distinct content_id) as cnt from reactions group by user_id)

select A.user_id, A.reaction as dominant_reaction, round((A.reaction_count/B.total),2) as reaction_ratio from A join B using(user_id) where A.rn=1 and B.total>4 and (A.reaction_count/B.total)*100>59 order by 3 desc, 1
