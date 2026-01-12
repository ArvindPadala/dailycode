# Write your MySQL query statement below


with A as (select patient_id, min(test_date) as first_p
from covid_tests 
where result='Positive' 
group by patient_id),

B as (select c.patient_id, a.first_p,
min(test_date) as first_n
from covid_tests c join A a 
on a.patient_id=c.patient_id 
where c.result='Negative' 
and c.test_date>a.first_p 
group by c.patient_id, a.first_p)

select p.patient_id, P.patient_name, p.age, 
datediff(b.first_n,b.first_p) as recovery_time
from patients p join B b
on p.patient_id=b.patient_id
order by 4, 2
