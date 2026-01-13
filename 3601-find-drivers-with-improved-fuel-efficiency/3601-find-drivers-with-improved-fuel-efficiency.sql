# Write your MySQL query statement below



with A as(select driver_id, avg(distance_km/fuel_consumed) as firs from trips where month(trip_date) in (01,02,03,04,05,06) group by driver_id),

B as (select driver_id, avg(distance_km/fuel_consumed) as secon from trips where month(trip_date) in (07,08,09,10,11,12) group by driver_id)

select d1.driver_id, d1.driver_name, 
round(a.firs,2) as first_half_avg, 
round(b.secon,2) as second_half_avg, 
round(b.secon-a.firs, 2) as efficiency_improvement from drivers d1 join A a on a.driver_id=d1.driver_id
join B on a.driver_id=b.driver_id 
where (b.secon-a.firs)>0
order by 5 desc, 2