with user_account as (
    select u.user_id, u.name as user_name, count(*) as rating
    from MovieRating r
    join Users u
    on r.user_id = u.user_id
    group by u.user_id,u.name
),

best_user as (
    select user_name
    from user_account
    order by rating desc,user_name asc
    limit 1
),


movie_avg as (
    select m.movie_id, m.title as movie_title, avg(mr.rating) as avg_rating
    from MovieRating mr
    join Movies m
    on m.movie_id = mr.movie_id
    where mr.created_at between '2020-02-01' and '2020-02-29'
    group by m.movie_id, m.title
),

best_movie as (
    select movie_title
    from movie_avg
    order by avg_rating desc, movie_title asc
    limit 1
)

select * from (
    select user_name as results from best_user
    union all
    select movie_title as results from best_movie
) as results;