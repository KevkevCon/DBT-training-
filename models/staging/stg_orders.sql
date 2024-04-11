select
    o.orderid,
    o.orderdate,
    o.shipdate,
    o.shipmode,
    o.ordersellingprice - o.ordercostprice as orderprofit, -- Corrected alias, removed the dot notation
    o.ordercostprice,
    o.ordersellingprice,
    c.customername,
    c.segment,
    c.country,
    p.category,
    p.productname
   
from {{ ref('raw_orders') }} as o -- Ensure 'raw_orders' is correctly named in your dbt project
left join {{ ref('raw_customer') }} as c on o.customerid = c.customerid
left join {{ ref('raw_product') }} as p on o.productid = p.productid