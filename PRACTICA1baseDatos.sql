create database practica1henry;
use practica1henry;
select @@global.secure_file_priv;
DROP TABLE IF EXISTS precios;
CREATE TABLE precios (
	precio varchar(250),
    producto_id varchar(225),
    sucursal_id varchar(225)
    /*foreign key(producto_id) references productos(producto_id),*/
   /* foreign key(sucursal_id) references sucursal(sucursal_id)*/
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_spanish_ci;
LOAD DATA INFILE 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\PrecioUnidos.csv' 
INTO TABLE precios
FIELDS TERMINATED BY ',' ENCLOSED BY '"'  ESCAPED BY '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;





DROP TABLE IF EXISTS `sucursal`;
create table `sucursal` (
    `sucursal_id`  varchar(255) primary key,
    `comercioId`  int(10),
    `banderaId`   varchar(100),
    `banderaDescripcion` varchar(250),
    `comercioRazonSocial` varchar(250),
    `provincia` varchar(250),
    `localidad` varchar(250),
    `direccion`  varchar(250),
    `lat` varchar(250),
    `lng` varchar(250),
    `sucursalNombre`   varchar(250),
    `sucursalTipo`  varchar(250)
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_spanish_ci;
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Sucursal5.csv'  
into table `sucursal` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' escaped by '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;


DROP TABLE IF EXISTS `productos`;
create table `productos` (
    `producto_id`  varchar(255) primary key,
    `marca`  varchar(100),
    `nombre`   varchar(200),
    `presentacion` varchar(50)     
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_spanish_ci;
load data infile 'C:\\ProgramData\\MySQL\\MySQL Server 8.0\\Uploads\\Productos6.csv'  
into table `productos` 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' escaped by '"'
LINES TERMINATED BY '\n' IGNORE 1 LINES;



select count(sucursal_id) from sucursal;
select count(sucursal_id),provincia from sucursal group by provincia;
select p.marca, pr.sucursal_id from precios pr
join productos p on(pr.producto_id=p.producto_id)
where p.marca = 'MAYO';

