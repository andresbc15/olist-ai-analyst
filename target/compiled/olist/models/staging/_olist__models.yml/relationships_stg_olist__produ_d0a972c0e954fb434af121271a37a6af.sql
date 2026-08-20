
    
    

with child as (
    select product_category_name as from_field
    from "olist"."main_stg"."stg_olist__products"
    where product_category_name is not null
),

parent as (
    select product_category_name as to_field
    from "olist"."main_stg"."stg_olist__product_category_translation"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null


