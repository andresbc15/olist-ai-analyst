
  
  create view "olist"."main_stg"."stg_olist__geolocation__dbt_tmp" as (
    WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."geolocation"
),
RENAMED AS (
    SELECT
        CAST(geolocation_zip_code_prefix AS VARCHAR) AS geolocation_zip_code_prefix,
        CAST(geolocation_lat AS DOUBLE) AS geolocation_lat,
        CAST(geolocation_lng AS DOUBLE) AS geolocation_lng,
        CAST(TRIM(geolocation_city) AS VARCHAR) AS geolocation_city,
        CAST(geolocation_state AS VARCHAR) AS geolocation_state
    FROM SOURCE
),
DEDUPLICATED AS (
    SELECT DISTINCT * FROM RENAMED
)
SELECT * FROM DEDUPLICATED
  );
