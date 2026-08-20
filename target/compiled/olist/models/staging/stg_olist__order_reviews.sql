WITH SOURCE AS (
    SELECT * FROM "olist"."raw"."order_reviews"
),
RENAMED AS (
    SELECT
        CAST(review_id AS VARCHAR) AS review_id,
        CAST(order_id AS VARCHAR) AS order_id,
        CAST(review_score AS INTEGER) AS review_score,
        CAST(NULLIF(TRIM(review_comment_title), '') AS VARCHAR) AS review_comment_title,
        CAST(NULLIF(TRIM(review_comment_message), '') AS VARCHAR) AS review_comment_message,
        CAST(review_creation_date AS TIMESTAMP) AS review_creation_date,
        CAST(review_answer_timestamp AS TIMESTAMP) AS review_answer_timestamp
    FROM SOURCE
)
SELECT * FROM RENAMED