
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select payment_installments
from "olist"."main_stg"."stg_olist__order_payments"
where payment_installments is null



  
  
      
    ) dbt_internal_test