with cte1 as
(select employee_id,department_id 
from Employee
where primary_flag = 'Y'
),

cte2 as
(select employee_id,department_id
from Employee
group by employee_id
having count(*) = 1)

select employee_id, department_id
from cte1
union
select employee_id, department_id
from cte2;
