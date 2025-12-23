# Write your MySQL query statement below
select 
(case 
    when id%2!=0 then case when id!=(select max(id) from Seat) then id+1 else id end
    when id%2=0 then id-1
end) as id, 
student from Seat order by id

