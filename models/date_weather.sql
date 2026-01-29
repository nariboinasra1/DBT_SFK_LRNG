with daily_weather as (
    select date(time) as date_weather,
    temp,
    weather,
    pressure,
    humidity,
    clouds
    from {{ source('demo', 'weather') }}
),
--SELECT * from daily_weather
cte2 as(
    select 
    date_weather,
    weather,
    round(avg(temp),2) as avg_temp,
    round(avg(pressure),2) as avg_pressure,
    round(avg(humidity),2) as avg_humidty,
    round(avg(clouds),2) as avg_clouds
    -- row_number() over(partition by date_weather order by count(weather) desc) as rn
    from daily_weather
    group by weather , date_weather
    qualify row_number() over(partition by date_weather order by count(weather) desc)=1
)
select * from cte2 