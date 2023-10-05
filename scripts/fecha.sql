
/*SELECT 
sh.OrderDate   orderdate,
year(sh.OrderDate) as anno_orden,
month(sh.OrderDate) as mes_orden,
dayofweek(sh.OrderDate) as dia_orden,
hour(sh.OrderDate)as hora_orden,
minute(sh.OrderDate) as minutos_orden
FROM Sales_SalesOrderHeader as sh
limit 5; */


INSERT INTO DWHADVENTURE.dim_fecha(
    orderdate, anno_orden, mes_orden, dia_orden,  hora_orden, minutos_orden
)
SELECT distinct 
sh.OrderDate   orderdate,
year(sh.OrderDate) as anno_orden,
month(sh.OrderDate) as mes_orden,
dayofweek(sh.OrderDate) as dia_orden,
hour(sh.OrderDate)as hora_orden,
minute(sh.OrderDate) as minutos_orden
FROM Sales_SalesOrderHeader as sh; 

