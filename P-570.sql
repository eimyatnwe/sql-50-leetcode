select name 
from Employee 
where id IN (
    select managerId
    from Employee
    where managerID is not NULL
    group by managerId
    having count(*) >= 5
);
