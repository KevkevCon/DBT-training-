{{
    config(
        materialized='table'
    )
}}


Select *
From raw.GLOBALMART.customer
