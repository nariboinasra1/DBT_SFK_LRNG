with cte as(
    select 
    distinct
    START_STATIO_ID AS STATION_ID,
    START_STATION_NAME AS STATION_NAME,
    START_LAT AS  STATION_LAT,
    START_LNG AS STATION_LNG
    from 
    {{ source('demo', 'bike') }}
    where ride_id !='ride_id'
)
select * from cte