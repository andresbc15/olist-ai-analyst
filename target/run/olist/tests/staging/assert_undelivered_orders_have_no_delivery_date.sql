
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- THE INVERSE INVARIANT: AN ORDER THAT IS NOT DELIVERED MUST NOT CARRY A
-- CUSTOMER DELIVERY DATE. WHEN IT DOES, ORDER_STATUS CANNOT BE TRUSTED AS THE
-- SOLE FILTER FOR COMPLETED ORDERS.
SELECT
    order_id,
    order_status,
    order_delivered_customer_date
FROM "olist"."main_stg"."stg_olist__orders"
WHERE order_status <> 'delivered'
  AND order_delivered_customer_date IS NOT NULL
  
  
      
    ) dbt_internal_test