
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select geolocation_lat
from "olist"."main_stg"."stg_olist__geolocation"
where geolocation_lat is null



  
  
      
    ) dbt_internal_test