
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select price
from "olist"."main_stg"."stg_olist__order_items"
where price is null



  
  
      
    ) dbt_internal_test