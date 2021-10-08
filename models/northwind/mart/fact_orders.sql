{{ config(materialized='table') }}

with
    customers_with_sk as (
        select
            customer_sk
            , customer_id
        from {{  ref('dim_customers')  }}
    )

    , employees_with_sk as (
        select
            employee_sk
            , employee_id
        from {{  ref('dim_employees')  }}
    )

    , orders_with_sk as (
        select
            orders.order_id	
            , customers_with_sk.customer_sk as customer_fk
            , employees_with_sk.employee_sk as employee_fk
            , orders.order_date
            , orders.required_date			
            , orders.shipped_date
            , orders.ship_name
            , ship_address	
            , orders.ship_postal_code	
            , orders.ship_city
            , orders.ship_region
            , orders.ship_country	
            , orders.freight	
            , orders.ship_via	
        from {{  ref('stg_orders')  }} orders
        left join customers_with_sk
        on orders.customer_id = customers_with_sk.customer_id
        left join employees_with_sk
        on orders.employee_id = employees_with_sk.employee_id
    )

    select * from orders_with_sk