{{ config(materialized='table') }}

WITH t AS (
    SELECT
        m.id,
        m.value1 / 100.0 AS temperature_c
    FROM {{ source('ghcnm', 'ghcnm_tmax') }} AS m
)

SELECT
    id,
    MAX(temperature_c) AS max_temperature
FROM t
GROUP BY id
