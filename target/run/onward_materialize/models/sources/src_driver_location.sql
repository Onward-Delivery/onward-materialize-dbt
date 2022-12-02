

--CREATE SOURCE IF NOT EXISTS "materialize"."public"."src_driver_location"
--  FROM KAFKA CONNECTION kafka_connection (TOPIC 'driver_location')
--  KEY FORMAT BYTES
--  VALUE FORMAT BYTES
--  ENVELOPE UPSERT
--  WITH (SIZE = '3xsmall');


  CREATE SOURCE IF NOT EXISTS "materialize"."public"."src_driver_location"
  FROM KAFKA CONNECTION kafka_connection (TOPIC 'driver_location')
  FORMAT BYTES
  WITH (SIZE = '3xsmall');


-- where id is not null