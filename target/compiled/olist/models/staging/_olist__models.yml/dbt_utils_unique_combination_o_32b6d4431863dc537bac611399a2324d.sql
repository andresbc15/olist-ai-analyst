





with validation_errors as (

    select
        order_id, order_item_id
    from "olist"."main_stg"."stg_olist__order_items"
    group by order_id, order_item_id
    having count(*) > 1

)

select *
from validation_errors


