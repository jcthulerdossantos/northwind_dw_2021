with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            category_id	
            ,category_name	
            ,description	
            --,_sdc_sequence	
            --,_sdc_table_version	
            --,_sdc_received_at	
            --,_sdc_batched_at		
        from {{  source('northwind_etl_v2','categories')  }}
    )

    select * from source_data