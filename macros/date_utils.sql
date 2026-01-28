{% macro get_season(x) %}
        case when month(to_timestamp_ntz({{x}})) in (12,1,2)
             then 'WINTER'
             WHEN month(to_timestamp_ntz({{x}})) in (3,4,5)
             THEN 'SUMMER'
             WHEN month(to_timestamp_ntz({{x}})) in (6,7,8)
             THEN 'RAINY'
             ELSE 'AUTUMN'
             END AS SEASON 
{% endmacro %}