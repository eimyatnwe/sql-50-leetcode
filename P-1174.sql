select (
    round(100 * sum(
        case
            when order_date = customer_pref_delivery_date then 1 else 0 end) / count(*), 2)
) as immediate_percentage
from Delivery
where (customer_id, order_date) IN (
    select customer_id, MIN(order_date)
    from Delivery
    group by customer_id
);
