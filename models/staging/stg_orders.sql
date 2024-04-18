select
-- from raw_orders
{{ dbt_utils.generate_surrogate_key(['o.orderid', 'c.customerid', 'p.productid']) }} as sk_orders,
orderid,
orderdate,
shipdate,
o.shipmode,
o.ordersellingprice - o.ordercostprice as orderprofit,
ordersellingprice,
ordercostprice,
-- from raw_customer
c.customerid,
customername,
segment,
country,
-- from raw_product
p.category,
p.productname,
p.subcategorie, 
{{ markup('ordersellingprice', 'ordercostprice')}} as markup,
FROM
    {{ ref("raw_orders") }} as o
LEFT JOIN
    {{ ref("raw_customer") }} as c 
    ON o.customer = c.customerid
LEFT JOIN
    {{ ref("raw_product") }} as p 
    ON o.productid = p.productid

