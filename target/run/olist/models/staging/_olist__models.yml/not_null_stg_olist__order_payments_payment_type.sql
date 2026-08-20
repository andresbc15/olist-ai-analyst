
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select payment_type
from "olist"."main_stg"."stg_olist__order_payments"
where payment_type is null



  
  
      
    ) dbt_internal_test