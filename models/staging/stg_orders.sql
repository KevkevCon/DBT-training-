select
    -- from raw_orders
    orderid,
    orderdate,
    shipdate,
    shipmode,
    o.customer,
    o.productid,
    ordersellingprice,
    ordercostprice,
    -- from raw_customer
    c.customerid,
    customername,
    segment,
    country,
    -- from raw_product
    
    category,
    productname,
    subcategorie,
    ordersellingprice - ordercostprice as orderprofit
from {{ ref("raw_orders") }} as o
left join {{ ref("raw_customer") }} as c on o.customer = c.customerid
left join {{ ref("raw_product") }} as p on o.productid = p.productid
