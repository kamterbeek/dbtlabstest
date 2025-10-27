-- models/weather_summary.sql

WITH source_data AS (
    SELECT *
    FROM `bigquery-public-data.noaa_gsod.gsod2022`
    WHERE station IS NOT NULL
),
daily_summary AS (
    SELECT
        station,
        COUNT(*) AS num_records,
        AVG(mean_temp) AS avg_temp,
        MAX(max_temp) AS max_temp,
        MIN(min_temp) AS min_temp
    FROM source_data
    GROUP BY station
)
SELECT *
FROM daily_summary
