{{ config(materialized='table') }}

SELECT
  station_id,
  AVG(value) AS max_temperature
FROM {{ source('ghcnm', 'ghcnm_tmax') }}
GROUP BY station_id