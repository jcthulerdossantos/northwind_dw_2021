with 
source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
        customer_id
        , address
        , postal_code	
        , city
        , country
        , region	
        , phone
        , fax
        , company_name	
        , contact_name			
        , contact_title	
        --, _sdc_table_version			
        --, _sdc_received_at		
        --, _sdc_sequence
        --, _sdc_batched_at	
        from {{  source('northwind_etl_v2','customers')  }}
)
    select * from source_data