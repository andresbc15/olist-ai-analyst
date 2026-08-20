WITH SOURCE AS (
    SELECT * FROM {{ source('raw', 'product_category_name_translation') }}
),
RENAMED AS (
    SELECT
        CAST(product_category_name AS VARCHAR) AS product_category_name,
        CAST(product_category_name_english AS VARCHAR) AS product_category_name_english
    FROM SOURCE
)
SELECT * FROM RENAMED
