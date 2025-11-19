select em.name,b.bonus
from Employee em
left join Bonus b
on em.empId = b.empId
where b.bonus < 1000 or b.bonus is NULL;