

select dp.id_producto, od.cantidad ,  od.precio_unit
from orden_detalle od
join dim_producto as dp on dp.producto_key = od.producto_key
WHERE dp.id_producto = 876; 


