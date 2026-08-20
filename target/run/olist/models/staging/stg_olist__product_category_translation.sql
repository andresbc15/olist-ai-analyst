
  
  create view "olist"."main_stg"."stg_olist__product_category_translation__dbt_tmp" as (
    WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."product_category_name_translation"
),
RENAMED AS (
    SELECT
        CAST(product_category_name AS VARCHAR) AS product_category_name,
        CAST(product_category_name_english AS VARCHAR) AS product_category_name_english
    FROM SOURCE
)
SELECT * FROM RENAMED
  );
