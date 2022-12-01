
{{ config(materialized='source') }}

CREATE SOURCE IF NOT EXISTS {{this}}
  FROM KAFKA CONNECTION kafka_connection (TOPIC 'driver_location')
  KEY FORMAT BYTES
  VALUE FORMAT BYTES
  ENVELOPE UPSERT
  WITH (SIZE = '3xsmall');

-- where id is not null
