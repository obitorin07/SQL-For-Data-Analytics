-- problem statement retrive these department name  , total revenue(order ammount) last 12 months revenue order by revenue in desc 

select
d.department_name,
-- o.order_amount,
sum(o.order_amount) as total_by_department_last_12_month
-- sum(o.order_amount) over(partition by d.department_id order by o.order_amount desc) as running_total
from 
departments d join
orders o
on
o.department_id = d.department_id
where o.order_date >= date_sub(now(), interval 12 Month)
group by d.department_name
order by total_by_department_last_12_month desc;
