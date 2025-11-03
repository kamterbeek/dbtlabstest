{{ config(materialized='table') }}

select
    id as station_id,
    value1 / 100.0 as avg_temperature
from {{ source('ghcnm', 'ghcnm_tavg') }}
