WITH SOURCE AS (
    SELECT * FROM {{ source('raw', 'customers') }}
),
RENAMED AS (
    SELECT
        CAST(customer_id AS VARCHAR) AS customer_id,
        CAST(customer_unique_id AS VARCHAR) AS customer_unique_id,
        CAST(customer_zip_code_prefix AS VARCHAR) AS customer_zip_code_prefix,
        CAST(TRIM(customer_city) AS VARCHAR) AS customer_city,
        CAST(customer_state AS VARCHAR) AS customer_state
    FROM SOURCE
)
SELECT * FROM RENAMED
