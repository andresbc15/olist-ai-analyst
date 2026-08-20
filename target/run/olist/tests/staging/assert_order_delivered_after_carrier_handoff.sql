
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- AN ORDER CANNOT REACH THE CUSTOMER BEFORE THE SELLER HANDS IT TO THE
-- CARRIER. VIOLATIONS ARE PHYSICALLY IMPOSSIBLE AND INDICATE CORRUPT
-- TIMESTAMPS, WHICH PRODUCE NEGATIVE DELIVERY DURATIONS DOWNSTREAM.
SELECT
    order_id,
    order_delivered_carrier_date,
    order_delivered_customer_date
FROM "olist"."main_stg"."stg_olist__orders"
WHERE order_delivered_customer_date < order_delivered_carrier_date
  
  
      
    ) dbt_internal_test