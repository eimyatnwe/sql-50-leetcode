with cte as (
    select d.id,
    d.name as Department,
    salary as Salary,
    e.name as Employee,
    dense_rank() over (partition by d.id order by salary desc) as ranks
    from Department d
    join Employee e
    on d.id = e.departmentId
)

select Department, Employee, Salary
from cte
where ranks <= 3