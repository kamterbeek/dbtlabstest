{{ config(materialized='table') }}

SELECT
  station_id,
  AVG(value) AS avg_temperature
FROM {{ source('ghcnm', 'ghcnm_tavg') }}
GROUP BY station_id


