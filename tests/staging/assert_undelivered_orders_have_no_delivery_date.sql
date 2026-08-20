-- THE INVERSE INVARIANT: AN ORDER THAT IS NOT DELIVERED MUST NOT CARRY A
-- CUSTOMER DELIVERY DATE. WHEN IT DOES, ORDER_STATUS CANNOT BE TRUSTED AS THE
-- SOLE FILTER FOR COMPLETED ORDERS.
SELECT
    order_id,
    order_status,
    order_delivered_customer_date
FROM {{ ref('stg_olist__orders') }}
WHERE order_status <> 'delivered'
  AND order_delivered_customer_date IS NOT NULL
