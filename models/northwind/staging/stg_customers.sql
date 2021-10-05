with source_data as (
    select
    country
    , city
    , fax
    , postal_code
    -- , _sdc_table_verion
    , address
    , region
    -- , sdc_received_at
    , customer_id
    -- , sdc_sequence
    , contact_name
    , phone
    , company_name
    , contact_title
    -- , sdc_batched_at
    -- , sdc_extracted_at
    from {{  source('northwind_etl_v2','customers')  }}
)
    select * from source_data