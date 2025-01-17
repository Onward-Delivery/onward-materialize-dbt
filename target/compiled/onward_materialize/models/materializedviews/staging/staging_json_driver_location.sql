--SELECT
--    CONVERT_FROM(key, 'utf8') as key,
--    data->>'uid' AS uid,
--    to_timestamp(cast(data->>'timestamp' as double)) AS timestamp,
--    data->>'latitude' AS latitude,
--    data->>'longitude' AS longitude,
--    data->>'speed' AS speed
--  FROM (SELECT key, CONVERT_FROM(data, 'utf8')::jsonb AS data FROM "materialize"."public"."src_driver_location")


 SELECT
    key,
    data->>'uid' AS uid,
    cast(data->>'timestamp' as timestamp) AS timestamp,
    data->>'latitude' AS latitude,
    data->>'longitude' AS longitude,
    data->>'speed' AS speed,
    data->>'routeNumber' as routeNumber,
    data->>'routeKey' as routeKey
  FROM (SELECT CONVERT_FROM(key, 'utf8') as key, CONVERT_FROM(data, 'utf8')::jsonb AS data FROM "materialize"."public"."staging_src_driver_location")
  where data->>'routeKey' is not null