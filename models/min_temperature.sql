{{ config(materialized='table') }}

WITH t AS (
    SELECT
        m.id,
        m.value1 / 100.0 AS temperature_c
    FROM {{ source('ghcnm', 'ghcnm_tmin') }} AS m
)

SELECT
    id,
    MIN(temperature_c) AS min_temperature
FROM t
GROUP BY id
