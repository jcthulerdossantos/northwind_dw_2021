{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_employees')}}
    )
    , transformed as (
        select
            row_number() over (order by employee_id) as employee_sk -- auto-incremental surrogate key
            , employee_id
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
        from staging
    )

    select * from transformed