{{ config(materialized='materializedview') }}


SELECT
    key,
    data->>'uid' AS uid,
    cast(data->>'timestamp' as timestamp) AS timestamp,
    data->>'latitude' AS latitude,
    data->>'longitude' AS longitude,
    data->>'speed' AS speed
FROM (SELECT CONVERT_FROM(key, 'utf8') as key, CONVERT_FROM(data, 'utf8')::jsonb AS data FROM {{ref('src_driver_location')}})

