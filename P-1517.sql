select user_id, name, mail
from Users
where mail REGEXP '^[A-Za-z][A-Za-z0-9._-]*@leetcode\\.com$'
and mail LIKE BINARY'%@leetcode.com';