Create database IF NOT EXISTS DWHADVENTURE;

CREATE TABLE IF NOT EXISTS DWHADVENTURE.dim_producto(
    producto_key  INT NOT NULL AUTO_INCREMENT,
    id_producto INT NOT NULL,
    nombre_producto VARCHAR(100) NOT NULL,
    numero_producto VARCHAR(25) NOT NULL,
    id_subcategoria INT NOT NULL,
    nombre_subcategoria VARCHAR(100) NOT NULL,
    id_categoria INT NOT NULL,
    nombre_categoria VARCHAR(100) NOT NULL,
    PRIMARY KEY (producto_key),
    UNIQUE KEY (id_producto)
);

CREATE TABLE IF NOT EXISTS DWHADVENTURE.dim_fecha(
    fecha_key  INT NOT NULL AUTO_INCREMENT,
    orderdate timestamp NOT NULL,
    anno_orden INT NOT NULL,
    mes_orden INT NOT NULL,
    dia_orden INT NOT NULL,
    hora_orden INT NOT NULL,
    minutos_orden INT NOT NULL,
    PRIMARY KEY (fecha_key),
    UNIQUE KEY (orderdate)
);



CREATE TABLE IF NOT EXISTS DWHADVENTURE.dim_cliente(
    cliente_key  INT NOT NULL AUTO_INCREMENT,
    customer_id  INT NOT NULL,
    nombre_cliente VARCHAR(300) NOT NULL,
    territory_id INT NOT NULL,
    PRIMARY KEY (cliente_key),
    UNIQUE KEY (customer_id)
);



CREATE TABLE IF NOT EXISTS DWHADVENTURE.dim_vendedor(
    vendedor_key  INT NOT NULL AUTO_INCREMENT,
    id_empleado  INT NOT NULL,
    identificacion BIGINT NOT NULL,
    nombre_empleado VARCHAR(300) NOT NULL,
    fecha_nac DATE NOT NULL,
    genero VARCHAR(2) NOT NULL,
    fecha_contratacion DATE NOT NULL,
    territory_id INT  NOT NULL,
    PRIMARY KEY (vendedor_key),
    UNIQUE KEY (id_empleado)
);


CREATE TABLE IF NOT EXISTS DWHADVENTURE.dim_territorio(
    territory_key  INT NOT NULL AUTO_INCREMENT,
    id_territory  INT NOT NULL,
    name_territory VARCHAR(100) NOT NULL,
    CountryRegionCode VARCHAR(3) NOT NULL,
    group_territory VARCHAR(50) NOT NULL, 
    PRIMARY KEY (territory_key),
    UNIQUE KEY (id_territory)
);


CREATE TABLE IF NOT EXISTS DWHADVENTURE.orden_detalle(
    orden_dtll_key INT NOT NULL AUTO_INCREMENT,
    id_dtll_venta  INT NOT NULL,
    cantidad INT NOT NULL,
    precio_unit decimal(19,4) NOT NULL,
    descuento_unit INT NOT NULL,
    dias_entrega INT NOT NULL,
    dias_envio INT NOT NULL,
    producto_key INT NOT NULL,
    fecha_key   INT NOT NULL,
    cliente_key    INT NOT NULL,
    vendedor_key    INT NOT NULL,
    territory_key  INT NOT NULL,
    PRIMARY KEY (orden_dtll_key),
    FOREIGN KEY (producto_key) REFERENCES dim_producto(producto_key),
    FOREIGN KEY (fecha_key) REFERENCES dim_fecha(fecha_key),
    FOREIGN KEY (cliente_key) REFERENCES dim_cliente(cliente_key),
    FOREIGN KEY (vendedor_key) REFERENCES dim_vendedor(vendedor_key),
    FOREIGN KEY (territory_key) REFERENCES dim_territorio(territory_key)
);


create index index_dtlle_key on DWHADVENTURE.orden_detalle(id_dtll_venta);
