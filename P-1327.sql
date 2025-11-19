select p.product_name,sum(o.unit) as unit
from Products p 
join Orders o
on p.product_id = o.product_id
where YEAR(o.order_date) = 2020 and MONTH(o.order_date) = 2
group by p.product_id
having sum(o.unit) >= 100;