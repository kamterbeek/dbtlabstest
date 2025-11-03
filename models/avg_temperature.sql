{{ config(materialized='table') }}

with tavg_data as (

    select
        s.id as station_id,
        t.tavg
    from {{ source('ghcnm', 'ghcnm_tavg') }} t
    left join {{ source('ghcnm', 'ghcnm_tavg_stations') }} s
    on t.id = s.id

)

select
    station_id,
    avg(tavg) as avg_temperature
from tavg_data
group by station_id
