
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select seller_state
from "olist"."main_stg"."stg_olist__sellers"
where seller_state is null



  
  
      
    ) dbt_internal_test