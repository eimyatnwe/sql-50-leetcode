with cte as (
    select person_name, turn, sum(weight) over (order by turn) as cum_weight
    from Queue
)

select person_name 
from cte
where cum_weight <= 1000
order by turn desc
limit 1