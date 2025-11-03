{{ config(materialized='table') }}

SELECT
  station_id,
  AVG(value) AS min_temperature
FROM {{ source('ghcnm', 'ghcnm_tmin') }}
GROUP BY station_id
