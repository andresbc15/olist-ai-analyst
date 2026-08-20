
    
    

select
    order_id as unique_field,
    count(*) as n_records

from "olist"."main_stg"."stg_olist__orders"
where order_id is not null
group by order_id
having count(*) > 1


