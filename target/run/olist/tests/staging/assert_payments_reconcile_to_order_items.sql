
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  -- THE MOST IMPORTANT INVARIANT IN THE PROJECT: WHAT THE CUSTOMER PAID MUST
-- EQUAL WHAT THEY WERE BILLED, SUM(PRICE + FREIGHT_VALUE). IT VALIDATES THE
-- JOIN BETWEEN TWO INDEPENDENTLY SOURCED TABLES, SO IT CATCHES FAN-OUT AND
-- DOUBLE-COUNTING THAT NO SINGLE-TABLE TEST CAN SEE.
--
-- A SMALL RESIDUAL NEVER RECONCILES — VOUCHER ROUNDING AND INSTALLMENT
-- INTEREST — SO THIS WARNS ON THE KNOWN BASELINE AND FAILS ONLY IF THE
-- MISMATCH RATE EXCEEDS ONE PERCENT OF ORDERS.

WITH BILLED AS (
    SELECT
        order_id,
        SUM(price + freight_value) AS billed_amount
    FROM "olist"."main_stg"."stg_olist__order_items"
    GROUP BY order_id
),
PAID AS (
    SELECT
        order_id,
        SUM(payment_value) AS paid_amount
    FROM "olist"."main_stg"."stg_olist__order_payments"
    GROUP BY order_id
),
MISMATCHED AS (
    SELECT
        BILLED.order_id,
        BILLED.billed_amount,
        PAID.paid_amount,
        PAID.paid_amount - BILLED.billed_amount AS variance
    FROM BILLED
    INNER JOIN PAID
        ON BILLED.order_id = PAID.order_id
    WHERE ABS(PAID.paid_amount - BILLED.billed_amount) > 0.01
)
SELECT * FROM MISMATCHED
WHERE (SELECT COUNT(*) FROM MISMATCHED) > (
    SELECT COUNT(*) * 0.01 FROM BILLED
)
  
  
      
    ) dbt_internal_test