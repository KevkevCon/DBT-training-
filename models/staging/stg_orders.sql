o.oselectorderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
c.customername,
c.segment,
c.country,
p.category,
p.productname,
p.shipmode
from {{ ref('raw_orders') }} as o
left join {{ ref('raw_customer') }} as c
o.customerid = c.customerid
left join {{ ref('raw_product') }} as p 
on o.productid= p.productid