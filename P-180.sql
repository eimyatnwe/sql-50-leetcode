with cte as (
    SELECT id, num, LEAD(num) OVER (ORDER BY id) AS next_num, LAG(num) OVER (ORDER BY id) as prev_num
    FROM Logs
)

select distinct num as ConsecutiveNums
from cte
where num = next_num and num = prev_num;
