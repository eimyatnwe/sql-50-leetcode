with dailySales as (
    select visited_on, sum(amount) as daily
    from Customer
    group by visited_on
)

select d1.visited_on, sum(d2.daily) as amount, round(sum(d2.daily) / 7.0, 2) as average_amount
from dailySales d1
join dailySales d2
on d2.visited_on between date_sub(d1.visited_on, interval 6 day) and d1.visited_on
group by d1.visited_on
having count(d2.visited_on) = 7
order by d1.visited_on 