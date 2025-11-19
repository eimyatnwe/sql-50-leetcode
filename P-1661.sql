select a.machine_id, ROUND(AVG(b.timestamp - a.timestamp ),3) AS processing_time
from Activity a
inner join
Activity b
on a.machine_id = b.machine_id
and a.process_id = b.process_id
and a.activity_type != b.activity_type
and a.activity_type = 'start'
group by machine_id;