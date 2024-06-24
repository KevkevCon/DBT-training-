select 
    
    productname,
    category,
    subcategorie,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    
    productname,
    category,
    subcategorie

    --test