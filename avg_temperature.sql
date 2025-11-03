{{ config(materialized='table') }}

SELECT
station_id,
AVG(value) AS avg_temperature
FROM 'dbtlabsprojects.10_25_tavg'
GROUP BY station_id