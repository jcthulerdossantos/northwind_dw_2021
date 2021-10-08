with 
    source_data as (
        select --selecionar primeiros as keys e em uma ordem que faça sentido
            employee_id
            , title	
            , title_of_courtesy		
            , first_name
            , last_name
            , address
            , postal_code
            , city	
            , country
            , region
            , birth_date	
            , hire_date	
            , home_phone	
            , reports_to
            --, extension		         
            --, notes
            --, photo_path	
            --, _sdc_batched_at
            --, _sdc_received_at	
            --, _sdc_sequence
            --, _sdc_table_version				
        from {{  source('northwind_etl_v2','employees')  }}
    )

    select * from source_data