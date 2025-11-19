select r.contest_id,ROUND(COUNT(DISTINCT r.user_id) / (SELECT COUNT(*) FROM Users) * 100, 2) AS percentage

from Users u
inner join Register r
on u.user_id = r.user_id
group by r.contest_id
order by percentage desc, contest_id asc;
