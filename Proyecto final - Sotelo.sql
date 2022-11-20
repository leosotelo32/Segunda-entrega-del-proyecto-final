# Segunda-entrega-del-proyecto-final.sql

-- CREACION DE BASE DE DATOS CON SUS TABLAS

DROP DATABASE IF EXISTS estetica_am;
CREATE DATABASE IF NOT EXISTS estetica_am;

USE estetica_am;

CREATE TABLE IF NOT EXISTS proveedores (
    PRIMARY KEY(id_proveedor), 
    id_proveedor INT NOT NULL AUTO_INCREMENT,
    contacto VARCHAR(100) NOT NULL,
    envio VARCHAR(100) NOT NULL,
    nombre_proveedor VARCHAR(100) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS insumos (
	PRIMARY KEY(id_insumo),
	id_insumo INT NOT NULL AUTO_INCREMENT,
	tipo_insumo VARCHAR(100),
	insumo_servicio VARCHAR(50),
    stock_insumo INT NOT NULL,
	precio_insumos DECIMAL(11,2) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS compras (
	PRIMARY KEY(id_compra),
    id_compra INT NOT NULL AUTO_INCREMENT,
	cantidad NUMERIC(7,2),
    id_insumo INT NOT NULL,
    FOREIGN KEY(id_insumo) REFERENCES insumos(id_insumo)
		ON DELETE CASCADE 
    );
    
CREATE TABLE IF NOT EXISTS estetica (
    PRIMARY KEY(id_estetica),
    id_estetica INT NOT NULL AUTO_INCREMENT,
    dias_abierto VARCHAR(100) NOT NULL,
    horarios_abierto VARCHAR(100) NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS empleados (
	PRIMARY KEY(id_empleado),
    id_empleado INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    puesto VARCHAR(30),
    genero VARCHAR(30),
    dni_empleado INT NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS ventas (
    PRIMARY KEY(id_venta),
	id_venta INT NOT NULL AUTO_INCREMENT,
    fecha_venta DATE NOT NULL,
    hora_venta DATETIME NOT NULL
    );
    
CREATE TABLE IF NOT EXISTS servicios (
    PRIMARY KEY(id_servicio),
    id_servicio INT NOT NULL AUTO_INCREMENT,
    nombre_servicio VARCHAR(30) NOT NULL,
    precio_servicio NUMERIC(50) NOT NULL,
    id_venta INT NOT NULL,
    FOREIGN KEY(id_venta) REFERENCES ventas(id_venta)
		ON DELETE CASCADE 
    );
    
CREATE TABLE IF NOT EXISTS tipo_servicios (
    PRIMARY KEY(id_tipo_servicio),
    id_tipo_servicio INT NOT NULL AUTO_INCREMENT,
    pestanias TINYINT NOT NULL,
    depilacion TINYINT NOT NULL,
    cejas TINYINT NOT NULL,
    masajes TINYINT NOT NULL,
    id_servicio INT NOT NULL,
    FOREIGN KEY(id_servicio) REFERENCES servicios(id_servicio)
		ON DELETE CASCADE 
    );
    
CREATE TABLE IF NOT EXISTS turnos (
	PRIMARY KEY(id_turno),
	id_turno INT NOT NULL AUTO_INCREMENT,
	id_tipo_servicio INT NOT NULL,
    fecha_turno DATE NOT NULL,
    hora_turno DATETIME NOT NULL,
    FOREIGN KEY(id_tipo_servicio) REFERENCES tipo_servicios(id_tipo_servicio)
		ON DELETE CASCADE
    );

CREATE TABLE IF NOT EXISTS clientes (
	PRIMARY KEY(id_cliente),
	id_cliente INT NOT NULL AUTO_INCREMENT,
	genero VARCHAR(30),
	edad VARCHAR(20) NOT NULL,
	nombre VARCHAR(50) NOT NULL,
	apellido VARCHAR(50) NOT NULL,
    id_turno INT NOT NULL,
    FOREIGN KEY(id_turno) REFERENCES turnos(id_turno)
		ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS pagos (
	PRIMARY KEY(id_pago),
	id_pago INT NOT NULL AUTO_INCREMENT,
	monto_pago DECIMAL(11,2),
	id_cliente INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente)
		ON DELETE CASCADE 
);

CREATE TABLE IF NOT EXISTS tipo_pago (
	PRIMARY KEY(id_tipo_pago),
    id_tipo_pago INT NOT NULL AUTO_INCREMENT,
	debito BOOLEAN,
    credito BOOLEAN,
    efectivo BOOLEAN,
    codigo_qr BOOLEAN,
    transferencia BOOLEAN,
    id_pago INT NOT NULL,
    FOREIGN KEY(id_pago) REFERENCES pagos(id_pago)
		ON DELETE CASCADE 
    );
    
    -- INSERCION DE DATOS EN LAS TABLAS --
    
    INSERT INTO proveedores (id_proveedor, envio, contacto, nombre_proveedor) VALUES
		(NULL,'12345', 'pestaniasxsiempre@gmail.com', 'Claudio'),
        (NULL,'67891','1158276922','Rony'),
        (NULL,'32165','pabloproveedor@hotmail.com','Pablo'),
        (NULL,'15849','1178563215','Alejandra'),
        (NULL,'78777','1148547899','Roberto'),
        (NULL,'88954','1122567893','Super proveedor show'),
        (NULL,'97635','leonelsotelomw@gmail.com','Leonel'),
        (NULL,'87879','proveecarlos@gmail.com','Carlos'),
        (NULL,'85525','superproveedorspa@gmail.com','Super mayorista spa'),
		(NULL,'34333','granmayoristaestetica@gmail.com','Mario'),
        (NULL,'22658','jegerardomayorista@gmail.com','Gerardo'),
        (NULL,'21548','1147885985','Stella'),
        (NULL,'25255','1122334455','Aesthetic group'),
        (NULL,'11111','1522668855','Super mayorista de estetica'),
        (NULL,'22222','prodermic@gmail.com','Prodermic');
        
INSERT INTO insumos (id_insumo, tipo_insumo, insumo_servicio, precio_insumos, stock_insumo) VALUES
		('1','Pegamento de pestanias','Extension pxp','600','100'),
        ('2','Pestanias','Extension pxp','500','300'),
        ('3','Cremas faciales','Skin care','1200','30'),
        ('4','Cera depilatoria','Depilacion','2000','15'),
        ('5','Gel de limpieza facial','Skin care','2000','25'),
        ('6','Biduguies','Lifting','250','100'),
        ('7','Servilletas','Depilacion','300','300'),
        ('8','Crema corporal','Masajes','3500','20'),
        ('9','Gel para depilacion','Depilacion','1400','50'),
        ('10','Tintura de cejas','Henna','900','80'),
        ('11','Pinzas cejas','Perfilado cejas','1000','50'),
        ('12','Crema adelgazante','Masajes','4000','35'),
        ('13','Pestanias con color','Lifting','900','200'),
        ('14','Navajas para cejas','Perfilado','800','75'),
        ('15','Pinzas para pestanias','Extension pxp','950','100');
        
INSERT INTO compras (id_compra, cantidad, id_insumo) VALUES
		('16','50','1'),
        ('17','30','2'),
        ('18','25','3'),
        ('19','50','4'),
        ('20','48','5'),
        ('21','100','6'),
        ('22','50','7'),
        ('23','45','8'),
        ('24','55','9'),
        ('25','35','10'),
        ('26','25','11'),
        ('27','85','12'),
        ('28','45','13'),
        ('29','50','14'),
        ('30','72','15');

INSERT INTO estetica (id_estetica, dias_abierto, horarios_abierto) VALUES
		('32','Lunes a Sabados','Desde 9 AM hasta 20 PM');
        
INSERT INTO empleados (id_empleado, nombre, apellido, puesto, genero, dni_empleado) VALUES
		('100','Marta','Sanchez','Extensionista','Femenino','42256588'),
        ('101','Rolando','Ampuero','Masajista','Masculino','47888999'),
        ('102','Pepe','Argenti','Masajista','Masculino','41555666'),
        ('103','Estefania','Kraktov','Extensionista','Femenino','44555666'),
        ('104','Camila','Jimenez','Masajes','Femenino','41222333'),
        ('105','Roberta','Rodriguez','Lifting','Femenino','47888999'),
        ('106','Valentina','Larocca','Perfilado de cejas','Femenino','39666111'),
        ('107','Micaela','Wilson','Perfilado de cejas','Femenino','38555264'),
        ('108','Exequiel','Contreras','Depilacion','Masculino','45444667'),
        ('109','Ciro','Marincola','Repartido de volante','Masculino','44777889'),
        ('110','Alejandro','Gomez','Administracion','Masculino','25159489'),
        ('111','Kevin','Roldan','Organizador','Masculino','42357845'),
        ('112','Ernestina','Perez','Extensionista','Femenino','25465798'),
        ('113','Morena','Fernandez','Limpieza','Femenino','40123654'),
        ('114','Paola','Argento','Cajera','Femenino','44159852');

INSERT INTO ventas (id_venta, fecha_venta, hora_venta) VALUES
		('100','2022-05-01','2022-05-01 14:01:00'),
        ('101','2022-05-02','2022-05-02 13:02:00'),
        ('102','2022-05-03','2022-05-03 19:03:05'),
        ('103','2022-05-04','2022-05-04 15:22:07'),
        ('104','2022-05-05','2022-05-05 16:45:12'),
        ('105','2022-05-06','2022-05-06 13:26:33'),
        ('106','2022-05-07','2022-05-07 12:55:12'),
        ('107','2022-05-08','2022-05-08 11:45:12'),
        ('108','2022-05-09','2022-05-09 16:12:17'),
        ('109','2022-05-10','2022-05-10 16:47:05'),
        ('110','2022-05-11','2022-05-11 09:45:12'),
        ('111','2022-05-12','2022-05-12 16:01:13'),
        ('112','2022-05-13','2022-05-13 18:32:14'),
        ('113','2022-05-14','2022-05-14 10:45:16'),
        ('114','2022-05-15','2022-05-15 14:35:12');

INSERT INTO servicios (id_servicio, nombre_servicio, precio_servicio, id_venta) VALUES
		('450','Pestanias','1540','100'),
        ('451','Masajes','2300','101'),
        ('452','Cejas','2500','102'),
        ('453','Depilacion','3500','103'),
        ('454','Pestanias','1540','104'),
		('455','Pestanias','1540','105'),
		('456','Masajes','2300','106'),
		('457','Masajes','2300','107'),
		('458','Masajes','2300','108'),
		('459','Pestanias','1540','109'),
		('460','Pestanias','1540','110'),
		('461','Pestanias','1540','111'),
		('462','Pestanias','1540','112'),
		('463','Cejas','2500','113'),
		('464','Cejas','2500','114');
	
        
INSERT INTO tipo_servicios (id_tipo_servicio, id_servicio, pestanias, depilacion, cejas, masajes) VALUES
		('30','450','1','0','0','0'),
        ('31','451','0','0','0','1'),
        ('32','452','0','0','1','0'),
        ('33','453','0','1','0','0'),
        ('34','454','0','0','0','1'),
        ('35','455','0','0','1','0'),
        ('36','456','0','1','0','0'),
        ('37','457','0','0','0','1'),
        ('38','458','0','1','0','0'),
        ('39','459','0','0','1','0'),
        ('40','460','1','0','0','0'),
        ('41','461','1','0','0','0'),
        ('42','462','1','0','0','0'),
        ('43','463','1','0','0','0'),
        ('44','464','0','1','0','0');
 
 INSERT INTO turnos (id_turno, id_tipo_servicio, fecha_turno, hora_turno) VALUES
		('40','30','2022-05-01','2022-05-01 13:01:00'),
        ('41','31','2022-05-01','2022-05-01 14:01:00'),
        ('42','32','2022-05-01','2022-05-01 15:01:00'),
        ('43','33','2022-05-01','2022-05-01 16:01:00'),
        ('44','34','2022-05-01','2022-05-01 17:01:00'),
        ('45','35','2022-05-01','2022-05-01 18:01:00'),
        ('46','36','2022-05-01','2022-05-02 14:01:00'),
        ('47','37','2022-05-01','2022-05-03 14:01:00'),
        ('48','38','2022-05-01','2022-05-04 14:01:00'),
        ('49','39','2022-05-01','2022-05-05 14:01:00'),
        ('50','40','2022-05-01','2022-05-06 14:01:00'),
        ('51','41','2022-05-01','2022-05-07 14:01:00'),
        ('52','42','2022-05-01','2022-05-08 14:01:00'),
        ('53','43','2022-05-01','2022-05-09 14:01:00'),
        ('54','44','2022-05-01','2022-05-10 14:01:00');
        
INSERT INTO clientes (id_cliente, nombre, apellido, edad, id_turno) VALUES
		('1','Camila','Minervini','23','40'),
		('2','Mercedes','Gonzalez','35','41'),
		('3','Eugenia','Vilchez','42','42'),
		('4','Maria','Sotelo','24','43'),
		('5','Roberto','Salas','26','44'),
		('6','Elias','Gomez','51','45'),
		('7','Diego','Rodriguez','21','46'),
		('8','Maria','Moreira','23','47'),
		('9','Lucas','Moreira','25','48'),
		('10','Leonel','Sotelo','22','49'),
		('11','Juan','Pereyra','29','50'),
		('12','Agustina','Salomon','41','51'),
		('13','Elton','Tito','33','52'),
		('14','Carlos','Tevez','32','53'),
		('15','Laura','Vazquez','40','54');
    
INSERT INTO pagos (id_pago, id_cliente, monto_pago) VALUES
		(NULL,'1','3500'),
        (NULL,'2','4800'),
        (NULL,'3','4555'),
        (NULL,'4','8600'),
        (NULL,'5','3500'),
        (NULL,'6','2500'),
        (NULL,'7','1500'),
        (NULL,'8','4200'),
        (NULL,'9','3600'),
        (NULL,'10','7200'),
        (NULL,'11','8000'),
        (NULL,'12','2000'),
        (NULL,'13','3500'),
        (NULL,'14','1500'),
        (NULL,'15','1000');
        
INSERT INTO tipo_pago(id_tipo_pago, id_pago, debito, credito, efectivo, transferencia, codigo_qr) VALUES
		(NULL, 1,'1','0','0','0','0'),
        (NULL, 2,'1','0','0','0','0'),
        (NULL, 3,'0','0','0','0','1'),
        (NULL, 4,'0','1','0','0','0'),
        (NULL, 5,'0','0','1','0','0'),
        (NULL, 6,'0','0','0','1','0'),
        (NULL, 7,'1','0','0','0','0'),
        (NULL, 8,'0','1','0','0','0'),
        (NULL, 9,'0','0','1','0','0'),
        (NULL, 10,'1','0','0','0','0'),
        (NULL, 11,'0','0','0','0','1'),
        (NULL, 12,'1','0','0','0','0'),
        (NULL, 13,'1','0','0','0','0'),
        (NULL, 14,'1','0','0','0','0'),
        (NULL, 15,'1','0','0','0','0');
        
-- CREACION DE VISTAS  

USE estetica_am;

DELIMITER $$

CREATE VIEW clientes_view 
AS (
SELECT *
FROM clientes
)$$

CREATE VIEW empleados_view
AS (
SELECT *
FROM empleados
)$$

CREATE VIEW proveedores_view
AS (
SELECT * 
FROM proveedores
)$$

CREATE VIEW compras_view
AS (
SELECT *
FROM compras
)$$

CREATE VIEW pagos_view 
AS (
SELECT *
    FROM pagos)$$

DELIMITER ;

-- CREACIÓN DE FUNCIONES

-- FUNCIÓN PARA CONCATENAR NOMBRE Y APELLIDO DE LOS CLIENTES

DELIMITER $$
DROP FUNCTION IF EXISTS `nombre_y_apellido_cliente`$$
CREATE FUNCTION `nombre_y_apellido_cliente` (nombre INT, apellido INT)
RETURNS VARCHAR(80)
READS SQL DATA
BEGIN
	DECLARE nombre VARCHAR(40);
    DECLARE apellido VARCHAR(40);
    DECLARE nombre_completo VARCHAR(80);
    SET nombre = (SELECT nombre FROM clientes WHERE id_cliente = id_cliente);
    SET apellido = (SELECT last_name FROM users WHERE id_user = id_cliente);
    SET nombre_completo = concat(nombre, ' ', apellido);
    RETURN nombre_completo;
END$$
DELIMITER ;

-- FUNCIÓN PARA CONCATENAR NOMBRE Y APELLIDO DE LOS EMPLEADOS

DELIMITER $$
DROP FUNCTION IF EXISTS `nombre_y_puesto_empleado`$$
CREATE FUNCTION `nombre_y_puesto_empleado` (nombre VARCHAR(50), puesto VARCHAR(80))
RETURNS VARCHAR(100)
READS SQL DATA
BEGIN
	DECLARE nombre VARCHAR(50);
    DECLARE puesto VARCHAR(80);
    DECLARE empleado_puesto VARCHAR(80);
    SET nombre = (SELECT nombre FROM empleados WHERE id_empleado = id_empleado);
    SET puesto = (SELECT puesto FROM empleados WHERE id_empleado = id_empleado);
    SET empleado_puesto = concat(nombre, ' ', puesto);
    RETURN empleado_puesto;
END$$
DELIMITER ;

DELIMITER $$
DROP FUNCTION IF EXISTS `calcular_iva`$$
CREATE FUNCTION `calcular_iva` (total DECIMAL(11,2)) RETURNS DECIMAL(11,2)
NO SQL
BEGIN
	DECLARE resultado DECIMAL(11,2);
    DECLARE iva INT;
    SET iva = 21;
    SET resultado = total *((iva / 100) + 1);
    RETURN resultado;
END$$

DELIMITER ;

-- CREACIÓN DE STORE PROCEDURES

-- STORE PROCEDURE PARA ORDERNAR LOS INSUMOS EN FORMA DESCENDENTE

USE `estetica_am`;
DROP PROCEDURE IF EXISTS `sp_nombre_insumo`;

DELIMITER $$
USE `estetica_am`$$
CREATE PROCEDURE `sp_nombre_insumo`(IN field VARCHAR(20))
BEGIN

	-- CREACION DEL PARAMETRO DE ORDENAMIENTO DEL SELECT DE MANERA DESCENDIENTE
    IF LENGTH(field) > 0 THEN
		SET @tipo_insumo = CONCAT_WS(' ', 'ORDER BY', field);
	ELSE
		SET @tipo_insumo = '';
	END IF;
    
    SET @clausula = CONCAT_WS(' ', 'SELECT * FROM insumos', @tipo_insumo);
    
    PREPARE ejecutar FROM @clausula;
    EXECUTE ejecutar;
    DEALLOCATE PREPARE ejecutar;
    
END$$

DELIMITER ;

-- CREACION E IMPLEMENTACION DE TRIGGERS

USE estetica_am;

DELIMITER $$
DROP TRIGGER IF EXISTS `tr_log_empleados`$$
CREATE TRIGGER `tr_log_empleados`
AFTER INSERT ON empleados
FOR EACH ROW
    BEGIN
        INSERT INTO empleados(usuario)
        VALUES(SESSION_USER());
	END$$
    
DELIMITER ;

