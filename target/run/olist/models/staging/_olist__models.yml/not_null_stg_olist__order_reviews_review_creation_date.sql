
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select review_creation_date
from "olist"."main_stg"."stg_olist__order_reviews"
where review_creation_date is null



  
  
      
    ) dbt_internal_test