

/*------------------ producto com mayor valor DE VENTA--------------------------*/

WITH VENTA AS(
select dp.id_producto,  dp.nombre_producto, sum(od.cantidad * od.precio_unit) AS SUM 
from orden_detalle od
join dim_producto as dp on dp.producto_key = od.producto_key
group by dp.id_producto,  dp.nombre_producto
),MAYOR_VALOR AS(
SELECT V.nombre_producto, V.SUM VALOR_VENTA
FROM VENTA V
ORDER BY SUM  DESC 
LIMIT 1
)
SELECT * FROM MAYOR_VALOR;  



/*------------------5 PRODUCTOS MAS VENDIDO -------------------------*/

WITH VENTA AS(
select dp.id_producto,  dp.nombre_producto, sum(od.cantidad ) AS TOTAL
from orden_detalle od
join dim_producto as dp on dp.producto_key = od.producto_key
group by dp.id_producto,  dp.nombre_producto
),MAYOR_VALOR AS(
SELECT V.nombre_producto, V.TOTAL
FROM VENTA V
ORDER BY V.TOTAL  DESC 
LIMIT 5
)
SELECT * FROM MAYOR_VALOR;  


/*-------------------------PRODUCTO MAS VENDIDO POR TERRITORIO------------------------------------*/

WITH VENTA AS(
select dt.name_territory , dp.nombre_producto, sum(od.cantidad) AS CANTIDAD 
from orden_detalle od
join dim_producto as dp on dp.producto_key = od.producto_key
JOIN dim_territorio AS dt ON dt.territory_key = od.territory_key
group by dt.name_territory, dp.nombre_producto
), 
prod_terr as(
SELECT v.name_territory , MAX(v.CANTIDAD) AS MAX_CANT
FROM VENTA v 
GROUP BY  v.name_territory 
), PP AS(
SELECT pt.name_territory, v.nombre_producto,  pt.MAX_CANT
FROM prod_terr as pt 
join VENTA as v on v.CANTIDAD = pt.MAX_CANT and v.name_territory = pt.name_territory
order by MAX_CANT desc
)
SELECT * FROM PP 
;

/*-----------------------------------------------------------------------------------------*/


WITH VENTA AS(
select dt.name_territory , dp.nombre_producto, sum(od.cantidad) AS CANTIDAD 
from orden_detalle od
join dim_producto as dp on dp.producto_key = od.producto_key
JOIN dim_territorio AS dt ON dt.territory_key = od.territory_key
JOIN dim_vendedor AS DV ON DV.vendedor_key = od.vendedor_key
group by dt.name_territory, dp.nombre_producto
), 
prod_terr as(
SELECT v.name_territory , MAX(v.CANTIDAD) AS MAX_CANT
FROM VENTA v 
GROUP BY  v.name_territory 
), PP AS(
SELECT pt.name_territory, v.nombre_producto,  pt.MAX_CANT
FROM prod_terr as pt 
join VENTA as v on v.CANTIDAD = pt.MAX_CANT and v.name_territory = pt.name_territory
order by MAX_CANT desc
)
SELECT * FROM PP 
;



