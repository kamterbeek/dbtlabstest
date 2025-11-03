{{ config(materialized='table') }}

WITH t AS (
    SELECT
        s.id AS station_id,
        a.value1 / 100.0 AS temperature_c
    FROM {{ source('ghcnm', 'ghcnm_tavg') }} AS a
    JOIN {{ source('ghcnm', 'ghcnm_tavg_stations') }} AS s
      ON a.id = s.id
)

SELECT
    station_id,
    AVG(temperature_c) AS avg_temperature
FROM t
GROUP BY station_id
