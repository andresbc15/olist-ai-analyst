-- A DELIVERED ORDER MUST CARRY THE TIMESTAMPS THAT PROVE IT WAS DELIVERED.
-- WITHOUT THEM, ANY DELIVERY-TIME METRIC FILTERING ON ORDER_STATUS SILENTLY
-- DROPS THE ROW AND UNDERSTATES BOTH VOLUME AND LEAD TIME.
--
-- KNOWN BASELINE: 23 ROWS. THE SOURCE IS A FROZEN 2018 EXPORT THAT WILL NEVER
-- BE CORRECTED UPSTREAM, SO THIS WARNS RATHER THAN FAILING THE BUILD. THE
-- VALUE IS THE BASELINE ITSELF — IF THIS EVER MOVES OFF 23, SOMETHING CHANGED.
-- DOWNSTREAM MODELS MUST GATE ON IS_DELIVERY_MEASURABLE, NOT ON ORDER_STATUS.
{{ config(severity = 'warn') }}
SELECT
    order_id,
    order_status,
    order_approved_at,
    order_delivered_carrier_date,
    order_delivered_customer_date
FROM {{ ref('stg_olist__orders') }}
WHERE order_status = 'delivered'
  AND (
      order_delivered_customer_date IS NULL
      OR order_delivered_carrier_date IS NULL
      OR order_approved_at IS NULL
  )
