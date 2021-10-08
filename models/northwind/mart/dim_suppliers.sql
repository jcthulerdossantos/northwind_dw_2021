{{ config(materialized='table') }}

with
    staging as (
        select *
        from {{ref('stg_suppliers')}}
    )
    , transformed as (
        select
            row_number() over (order by supplier_id) as supplier_sk -- auto-incremental surrogate key
            , supplier_id 
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
        from staging
    )

    select * from transformed