-- SELLERS ARE EXPECTED TO DISPATCH ONLY AFTER PAYMENT CLEARS. A MINORITY OF
-- ORDERS SHIP FIRST, WHICH IS OPERATIONALLY PLAUSIBLE RATHER THAN CORRUPT, SO
-- THIS WARNS INSTEAD OF FAILING. A SUDDEN RISE MEANS UPSTREAM TIMESTAMP DRIFT.

SELECT
    order_id,
    order_approved_at,
    order_delivered_carrier_date
FROM "olist"."main_stg"."stg_olist__orders"
WHERE order_delivered_carrier_date < order_approved_at