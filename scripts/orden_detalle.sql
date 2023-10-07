/*SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
DATEDIFF(oh.DueDate ,oh.OrderDate ) as dias_entrega,
DATEDIFF(oh.ShipDate ,oh.OrderDate ) as dias_envio        
FROM  Sales_SalesOrderDetail as det
join Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
limit 50;*/
/*DATEDIFF(oh.DueDate ,oh.OrderDate ) as dias_entrega,
DATEDIFF(oh.ShipDate ,oh.OrderDate ) as dias_envio  */      

/*

WITH ventas AS(

SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
oh.DueDate ,
oh.OrderDate , 
oh.ShipDate,
dp.producto_key,
df.fecha_key,
dc.cliente_key,
dv.vendedor_key,
dt.territory_key 
FROM  Sales_SalesOrderDetail as det
JOIN Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
JOIN DWHADVENTURE.dim_cliente as dc on dc.customer_id = oh.CustomerID
JOIN DWHADVENTURE.dim_vendedor AS dv on dv.vendedor_key = oh.SalesPersonID
JOIN DWHADVENTURE.dim_territorio as dt on dt.territory_key = oh.TerritoryID
JOIN DWHADVENTURE.dim_fecha AS df on  df.orderdate = oh.OrderDate 
JOIN DWHADVENTURE.dim_producto AS dp on dp.id_producto = det.ProductID   
)
select * from  ventas
limit 10;*/


INSERT INTO DWHADVENTURE.orden_detalle (id_dtll_venta, cantidad, precio_unit,  descuento_unit,  dias_entrega, dias_envio, producto_key,  fecha_key, cliente_key, vendedor_key, territory_key 
)
with fact as(
SELECT det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
oh.DueDate ,
oh.OrderDate , 
oh.ShipDate,
dp.producto_key as producto_key,
df.fecha_key as fecha_key,
dc.cliente_key as cliente_key,
dm.vendedor_key as vendedor_key,
dt.territory_key  as territory_key
FROM  Sales_SalesOrderDetail as det
JOIN Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
JOIN DWHADVENTURE.dim_cliente as dc on dc.customer_id = oh.CustomerID
JOIN DWHADVENTURE.dim_vendedor as dm  on dm.id_empleado = IFNULL(oh.SalesPersonID,00)
JOIN DWHADVENTURE.dim_territorio as dt on dt.id_territory = oh.TerritoryID
JOIN DWHADVENTURE.dim_fecha AS df on  df.orderdate = oh.OrderDate
JOIN DWHADVENTURE.dim_producto AS dp on dp.id_producto = det.ProductID
), fact_consol as(
select f.id_dtll_venta,
f.cantidad, 
f.precio_unit,
f.descuento_unit,
DATEDIFF(f.DueDate ,f.OrderDate ) as dias_entrega,
DATEDIFF(f.ShipDate ,f.OrderDate ) as dias_envio ,  
f.producto_key,
f.fecha_key,
f.cliente_key,
f.vendedor_key,
f.territory_key
from fact as f
)
select * from fact_consol dd ; 





/*
SELECT count(1) 
det.SalesOrderID id_dtll_venta,
det.OrderQty cantidad, 
det.UnitPrice precio_unit,
det.UnitPriceDiscount descuento_unit,
oh.DueDate ,
oh.OrderDate , 
oh.ShipDate,
dp.producto_key as producto_key,
df.fecha_key as fecha_key,
dc.cliente_key as cliente_key,
dm.vendedor_key as vendedor_key,
dt.territory_key  as territory_key
FROM  Sales_SalesOrderDetail as det
JOIN Sales_SalesOrderHeader as oh on oh.SalesOrderID = det.SalesOrderID
JOIN DWHADVENTURE.dim_cliente as dc on dc.customer_id = oh.CustomerID
JOIN DWHADVENTURE.dim_vendedor as dm  on dm.id_empleado = IFNULL(oh.SalesPersonID,00)
JOIN DWHADVENTURE.dim_territorio as dt on dt.id_territory = oh.TerritoryID
JOIN DWHADVENTURE.dim_fecha AS df on  df.orderdate = oh.OrderDate
JOIN DWHADVENTURE.dim_producto AS dp on dp.id_producto = det.ProductID;*/