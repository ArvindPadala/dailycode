# Write your MySQL query statement below
select employee_id, 
case 
    when employee_id%2!=0 then case 
                                when name regexp '^[M]' then 0 
                                else salary 
                                end
    else 0 
    end as bonus 
from Employees order by employee_id