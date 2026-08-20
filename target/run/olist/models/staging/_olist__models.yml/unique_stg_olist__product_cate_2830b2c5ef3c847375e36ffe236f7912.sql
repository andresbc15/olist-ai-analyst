
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    product_category_name_english as unique_field,
    count(*) as n_records

from "olist"."main_stg"."stg_olist__product_category_translation"
where product_category_name_english is not null
group by product_category_name_english
having count(*) > 1



  
  
      
    ) dbt_internal_test