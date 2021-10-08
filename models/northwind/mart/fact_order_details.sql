{{ config(materialized='table') }}

with
    categories_with_sk as (
        select
            category_sk
            , category_id
        from {{  ref('dim_categories')  }}
    )

    , suppliers_with_sk as (
        select
            supplier_sk
            , supplier_id
        from {{  ref('dim_suppliers')  }}
    )

    , products_with_sk as (
        select
            product_sk
            , product_id
            , category_id
            , supplier_id
        from {{  ref('dim_products')  }} 
    )

    , order_details_with_sk as (
        select
            order_details.order_id
            , products_with_sk.product_sk as product_fk
            , categories_with_sk.category_sk as category_fk
            , suppliers_with_sk.supplier_sk as supplier_fk	
            , order_details.unit_price	
            , order_details.quantity
            , order_details.discount	
        from {{  ref('stg_order_details')  }} order_details
        left join products_with_sk
        on order_details.product_id = products_with_sk.product_id
        left join categories_with_sk
        on products_with_sk.category_id = categories_with_sk.category_sk
        left join suppliers_with_sk
        on products_with_sk.supplier_id = suppliers_with_sk.supplier_sk
    )

    select * from order_details_with_sk