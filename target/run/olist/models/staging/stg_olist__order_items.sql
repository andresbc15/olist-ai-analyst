
  
  create view "olist"."main_stg"."stg_olist__order_items__dbt_tmp" as (
    WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."order_items"
),
RENAMED AS (
    SELECT
        CAST(order_id AS VARCHAR) AS order_id,
        CAST(order_item_id AS INTEGER) AS order_item_id,
        CAST(product_id AS VARCHAR) AS product_id,
        CAST(seller_id AS VARCHAR) AS seller_id,
        CAST(shipping_limit_date AS TIMESTAMP) AS shipping_limit_date,
        CAST(price AS DECIMAL(10, 2)) AS price,
        CAST(freight_value AS DECIMAL(10, 2)) AS freight_value
    FROM SOURCE
)
SELECT * FROM RENAMED
  );
