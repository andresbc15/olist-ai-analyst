WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."sellers"
),
RENAMED AS (
    SELECT
        CAST(seller_id AS VARCHAR) AS seller_id,
        CAST(seller_zip_code_prefix AS VARCHAR) AS seller_zip_code_prefix,
        CAST(TRIM(seller_city) AS VARCHAR) AS seller_city,
        CAST(seller_state AS VARCHAR) AS seller_state
    FROM SOURCE
)
SELECT * FROM RENAMED