with CTE AS (
    SELECT 
    to_timestamp_ntz(started_at) started_at,
    hour(to_timestamp_ntz(started_at)) hour,
    case when dayname(to_timestamp_ntz(started_at)) in ('Sat','sun')
         then 'Weekend'
         else 'Business_Day'
         end as dayname,
    month(to_timestamp_ntz(started_at)) month 

    FROM {{ source('demo', 'bike') }}
    where started_at!='started_at'
)
select * from cte 