--SELECT
--    CONVERT_FROM(key, 'utf8') as key,
--    data->>'uid' AS uid,
--    to_timestamp(cast(data->>'timestamp' as double)) AS timestamp,
--    data->>'latitude' AS latitude,
--    data->>'longitude' AS longitude,
--    data->>'speed' AS speed
--  FROM (SELECT key, CONVERT_FROM(data, 'utf8')::jsonb AS data FROM {{ref('src_driver_location')}})


 SELECT
    data->>'uid' AS uid,
    to_timestamp(cast(data->>'timestamp' as double)) AS timestamp,
    data->>'latitude' AS latitude,
    data->>'longitude' AS longitude,
    data->>'speed' AS speed,
    data->>'routeNumber' as routeNumber,
    data->>'routeKey' as routeKey
  FROM (SELECT CONVERT_FROM(data, 'utf8')::jsonb AS data FROM {{ref('src_driver_location')}})

