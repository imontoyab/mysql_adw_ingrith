SELECT det.SalesOrderID id_dtll_venta, 
year(sh.OrderDate) as anno_orden,
month(sh.OrderDate) as mes_orden,
dayofweek(sh.OrderDate) as dia_orden,
hour(sh.OrderDate)as hora_orden,
minute(sh.OrderDate) as minutos_orden
FROM  Sales_SalesOrderDetail as det
JOIN Sales_SalesOrderHeader AS sh on sh.SalesOrderID = det.SalesOrderID
limit 5; 
