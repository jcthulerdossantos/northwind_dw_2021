with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            supplier_id 
            , address
            , postal_code            	
            , city
            , region
            , country         	
            , phone
            , fax	
            , homepage            	           	
            , company_name
            , contact_name	
            , contact_title
            --, _sdc_table_version	
            --, _sdc_received_at	
            --, _sdc_sequence	
            --, _sdc_batched_at		
        from {{  source('northwind_etl_v2','suppliers')  }}
    )

    select * from source_data