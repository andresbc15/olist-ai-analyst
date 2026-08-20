-- REVENUE IS COMPUTED FROM ORDER ITEMS, SO A DELIVERED ORDER WITH NO ITEM ROWS
-- CONTRIBUTES NOTHING AND SILENTLY UNDERSTATES SALES.
SELECT
    o.order_id,
    o.order_status
FROM {{ ref('stg_olist__orders') }} AS o
LEFT JOIN {{ ref('stg_olist__order_items') }} AS i
    ON o.order_id = i.order_id
WHERE o.order_status = 'delivered'
  AND i.order_id IS NULL
