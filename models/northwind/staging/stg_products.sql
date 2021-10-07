with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            product_id
            , category_id
            , supplier_id
            , product_name			
            , unit_price		
            , quantity_per_unit
            , discontinued
            , units_in_stock
            , units_on_order
            , reorder_level	
            --, _sdc_table_version	
            --, _sdc_received_at		
            --, _sdc_sequence		
            --, _sdc_batched_at		
        from {{  source('northwind_etl_v2','products')  }}
    )

    select * from source_data