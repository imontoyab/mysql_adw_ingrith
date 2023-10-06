select * from Sales_SalesOrderHeader sh, DWHADVENTURE.dim_vendedor dm
where dm.id_empleado  = sh.SalesPersonID
 limit 5; 


