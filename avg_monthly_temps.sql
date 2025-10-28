with avg_temp AS (
    SELECT 
    id AS station_id,
    year,
    month,
    value / 100.0 AS avg_temp_celsious
    FROM {{ source('dbtlabsprojects', 'ghcnm_tavg') }}
    WHERE value IS NOT NULL
),

station AS (
    SELECT id AS station_id,
    name,
    latitude,
    longitude,
    name,
    stnelev,
    FROM {{ source('dbtlabsprojects', 'ghcnm_tavg_stations') }}
)

SELECT
s.name AS station_name,
a.year,
a.month,
ROUND(AVG(a.avg_temp_celsious), 2) AS mean_monthly_temp
FROM avg_temp a 
JOIN stations s 
ON a.station_id = s.station_id
GROUP BY s.name, a.year, a.month
ORDER BY a.year, a.month;