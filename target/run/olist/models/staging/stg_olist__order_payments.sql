
  
  create view "olist"."main_stg"."stg_olist__order_payments__dbt_tmp" as (
    WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."order_payments"
),
RENAMED AS (
    SELECT
        CAST(order_id AS VARCHAR) AS order_id,
        CAST(payment_sequential AS INTEGER) AS payment_sequential,
        CAST(payment_type AS VARCHAR) AS payment_type,
        CAST(payment_installments AS INTEGER) AS payment_installments,
        CAST(payment_value AS DECIMAL(10, 2)) AS payment_value
    FROM SOURCE
)
SELECT * FROM RENAMED
  );
