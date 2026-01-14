with A as (select store_id, max(price) as ma, min(price) as mi, count(distinct product_name) as prod_cnt from inventory group by store_id),

B as (select A.store_id as id, 
max(case when i.price=ma then i.product_name end) as most_exp_product,
max(case when i.price=ma then i.quantity end) as exp_quantity,
max(case when i.price=mi then i.product_name end) as cheapest_product,
max(case when i.price=mi then i.quantity end) as cheap_quan
from A join inventory i 
on i.store_id=A.store_id 
where A.prod_cnt>=3
group by A.store_id)

select s.store_id, s.store_name, s.location, b.most_exp_product, b.cheapest_product, round(b.cheap_quan/b.exp_quantity,2) as imbalance_ratio 
from B b join stores s on s.store_id=b.id where b.cheap_quan>b.exp_quantity
order by 6 desc, 2