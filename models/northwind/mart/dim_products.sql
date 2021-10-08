{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_products')}}
    )
    , transformed as (
        select
            row_number() over (order by product_id) as product_sk -- auto-incremental surrogate key
            , product_id
            , category_id
            , supplier_id
            , product_name			
            , unit_price		
            , quantity_per_unit
            , discontinued
            , units_in_stock
            , units_on_order
            , reorder_level	
        from staging
    )

    select * from transformed