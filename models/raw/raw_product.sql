{{
    config(
        materialized='table'
    )
}}

Select *
From {{ source('globalmart', 'product') }}