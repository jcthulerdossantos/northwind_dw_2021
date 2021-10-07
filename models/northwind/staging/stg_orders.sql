with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            order_id	
            , customer_id
            , employee_id
            , order_date
            , required_date			
            , shipped_date
            , ship_name
            , ship_address	
            , ship_postal_code	
            , ship_city
            , ship_region
            , ship_country	
            , freight	
            , ship_via	
            --, _sdc_table_version	
            --, _sdc_sequence	
            --, _sdc_received_at	
            --, _sdc_batched_at		
        from {{  source('northwind_etl_v2','orders')  }}
    )

    select * from source_data