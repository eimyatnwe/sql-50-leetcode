with 
cte1 as
(
    select
    country,
    DATE_FORMAT(trans_date, '%Y-%m') AS month, 
    count(*) as approved_count, 
    sum(amount) as approved_total_amount
    from Transactions
    where state = 'approved'
    group by country, DATE_FORMAT(trans_date, '%Y-%m')
),
cte2 as 
(
    select 
    country,
    DATE_FORMAT(trans_date, '%Y-%m') AS month, 
    count(*) as trans_count, 
    sum(amount) as trans_total_amount
    from Transactions
    group by country, DATE_FORMAT(trans_date, '%Y-%m')
)

select 
    cte2.month,
    cte2.country, 
    cte2.trans_count,
    COALESCE(cte1.approved_count, 0) AS approved_count,
    cte2.trans_total_amount,
    COALESCE(cte1.approved_total_amount, 0) AS approved_total_amount
    from cte2
    left join cte1
    on 
    cte2.month = cte1.month 
    and
    cte2.country <=> cte1.country;

