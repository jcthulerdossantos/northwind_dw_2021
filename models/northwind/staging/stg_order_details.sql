with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            order_id
            , product_id	
            , unit_price	
            , quantity
            , discount		
            --, _sdc_sequence	
            --, _sdc_table_version	
            --, _sdc_received_at	
            --, _sdc_batched_at	
        from {{  source('northwind_etl_v2','order_details')  }}
    )

    select * from source_data