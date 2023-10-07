/*SELECT distinct 
sh.OrderDate   orderdate,
year(sh.OrderDate) as anno_orden,
month(sh.OrderDate) as mes_orden,
dayofweek(sh.OrderDate) as dia_orden,
hour(sh.OrderDate)as hora_orden,
minute(sh.OrderDate) as minutos_orden
FROM Sales_SalesOrderHeader as sh; */


/*WITH fechas as  (
SELECT DISTINCT sh.OrderDate AS FECHA
FROM Sales_SalesOrderHeader as sh
), FECHA_VENTA AS (
SELECT 
F.FECHA   orderdate,
year(F.FECHA) as anno_orden,
month(F.FECHA) as mes_orden,
dayofweek(F.FECHA) as dia_orden,
hour(F.FECHA)as hora_orden,
minute(F.FECHA) as minutos_orden
FROM fechas as F)
SELECT * FROM FECHA_VENTA
limit 5; */



INSERT INTO DWHADVENTURE.dim_fecha(
    orderdate, anno_orden, mes_orden, dia_orden,  hora_orden, minutos_orden
)
WITH fechas as  (
SELECT DISTINCT sh.OrderDate AS FECHA
FROM Sales_SalesOrderHeader as sh
), FECHA_VENTA AS (
SELECT 
F.FECHA   orderdate,
year(F.FECHA) as anno_orden,
month(F.FECHA) as mes_orden,
dayofweek(F.FECHA) as dia_orden,
hour(F.FECHA)as hora_orden,
minute(F.FECHA) as minutos_orden
FROM fechas as F)
SELECT * FROM FECHA_VENTA;
