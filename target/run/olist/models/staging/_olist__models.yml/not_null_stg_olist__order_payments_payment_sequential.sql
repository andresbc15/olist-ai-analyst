
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select payment_sequential
from "olist"."main_stg"."stg_olist__order_payments"
where payment_sequential is null



  
  
      
    ) dbt_internal_test