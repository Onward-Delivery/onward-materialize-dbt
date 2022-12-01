

with

src_driver_location as (
    select key, CONVERT_FROM(data, 'utf8')::jsonb as data from "materialize"."public"."src_driver_location"
)

,final as (

  SELECT
    CONVERT_FROM(key, 'utf8') as key,
    data->>'uid' AS uid,
    to_timestamp(cast(data->>'timestamp' as double)) AS timestamp,
    data->>'latitude' AS latitude,
    data->>'longitude' AS longitude,
    data->>'speed' AS speed
  FROM src_driver_location
)

select * from final