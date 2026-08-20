WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."products"
),
RENAMED AS (
    SELECT
        CAST(product_id AS VARCHAR) AS product_id,
        CAST(product_category_name AS VARCHAR) AS product_category_name,
        CAST(product_name_lenght AS INTEGER) AS product_name_length,
        CAST(product_description_lenght AS INTEGER) AS product_description_length,
        CAST(product_photos_qty AS INTEGER) AS product_photos_qty,
        CAST(NULLIF(product_weight_g, 0) AS INTEGER) AS product_weight_g,
        CAST(NULLIF(product_length_cm, 0) AS INTEGER) AS product_length_cm,
        CAST(NULLIF(product_height_cm, 0) AS INTEGER) AS product_height_cm,
        CAST(NULLIF(product_width_cm, 0) AS INTEGER) AS product_width_cm
    FROM SOURCE
)
SELECT * FROM RENAMED