





with validation_errors as (

    select
        review_id, order_id
    from "olist"."main_stg"."stg_olist__order_reviews"
    group by review_id, order_id
    having count(*) > 1

)

select *
from validation_errors


