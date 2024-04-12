select 
    productid,
    productname,
    category,
    subcategorie,
    sum(orderprofit) as profit
from {{ ref('stg_orders') }}
group by 
    productid,
    productname,
    category,
    subcategorie