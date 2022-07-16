
CREATE TABLE cliente(
    	id_cliente      SERIAL,
    	cliente_nuevo   BIT
);

CREATE TABLE minorista (
	id_minorista            SERIAL,
	clienteid_cliente       INTEGER
);

CREATE TABLE cmembresia (
	nombre          	VARCHAR(30),
	descripcion     	VARCHAR(100),
   	precio          	REAL
);

CREATE TABLE miembros (
	    id_miembro              SERIAL,
	    nombre              	VARCHAR(30),
    	app                     VARCHAR(30),
    	apm                     VARCHAR(30),
    	sexo                    VARCHAR(15),
    	fecha_inicio            DATE,
    	minoristaid_minorista   INTEGER,
        cmembresianombre        VARCHAR(20)
);


CREATE TABLE telefono_miembros
(
    miembrosid_miembro INTEGER,
    telefono           VARCHAR(10)
);



CREATE TABLE minorista_online (
	id_minorista_on       	INTEGER,
	nombre                  VARCHAR(30),
	app                     VARCHAR(30),
    	apm                    	VARCHAR(30),
    	sexo                   	VARCHAR(15),
	fecha_nac         	DATE,
	clienteid_cliente   	INTEGER
);

CREATE TABLE telefono_min (
	minorista_onlineid_minorista_on     INTEGER,
	telefono                	    VARCHAR(10)
);

--------------------------------------------------

CREATE TABLE correo_min(
    minorista_onlineid_minorista_on 	SERIAL,
    correo 				VARCHAR(20)
);
CREATE TABLE dir_minorista(
    minoristaonlineid_minorista_on 	INTEGER,
    numero 		INTEGER,
    calle 		VARCHAR(30),
    colonia 		VARCHAR(20),
    delegacion 		VARCHAR(20),
    cp 			INTEGER
);

CREATE TABLE tipo_de_tarjeta(
    id_tipo_de_tarjeta 	SERIAL,
    tipo 		VARCHAR(32)
);

CREATE TABLE emisora_tarjeta(
    id_emisora 		SERIAL,
    emisora 		VARCHAR(20)
);

CREATE TABLE tarjetas_registradas(
    minorista_onlineid_minorista_on 	INTEGER,
    tipo_de_tarjetaid_tipo_de_tarjeta 	INTEGER,
    emisora_tarjetaid_emisora 		INTEGER
);

CREATE TABLE mayorista(
    id_mayorista 			SERIAL,
    nombre 				VARCHAR(30),
    clienteid_cliente 			INTEGER
);

--------------------------------------------------

CREATE TABLE telefono_may (
	mayoristaid_mayorista 	INTEGER,
	telefono 		VARCHAR(10)
);
CREATE TABLE correo_may (
	mayoristaid_mayorista 	INTEGER,
	correo 			VARCHAR(30)
);
CREATE TABLE rfc_empresa (
	mayoristaid_mayorista 	INTEGER,
	rfc 			VARCHAR(13)
);
CREATE TABLE representantes (
	Id_representantes 	SERIAL,
	nombre 			VARCHAR(20),
	app			VARCHAR(20),
	apm			VARCHAR(20),
    mayoristaid_mayorista INTEGER
);
CREATE TABLE dir_mayorista(
	mayoristaid_mayorista	INTEGER,
	numero 			INTEGER,
	calle 			VARCHAR(30),
	colonia			VARCHAR(20),
	estado 			VARCHAR(20),
	cp			INTEGER,
	municipio		VARCHAR(20)
);

CREATE TABLE compra(
	id_compra 		SERIAL,
	fecha			DATE,
	clienteid_cliente	INTEGER,
	empleadoid_trabajador		INTEGER
);

--------------------------------------------------

CREATE TABLE compra_tipo_compra(
  compraid_compra 		INTEGER,
  cmodalidadid_modalidad 	INTEGER
);

CREATE TABLE cmodalidad(
    id_modalidad 	SERIAL,
    nombre_modalidad 	VARCHAR(50),
    descripcion 	VARCHAR(100),
    dependencia 	VARCHAR(255)
);

CREATE TABLE producto_compra(
    compraid_compra 	INTEGER,
    productoid_producto INTEGER,
    cantidad 		SMALLINT
);

CREATE TABLE producto(
    id_producto 		SERIAL,
    categoriaid_categoria 	INTEGER
);

CREATE TABLE categoria(
    id_categoria 	SERIAL,
    nombre_categoria 	VARCHAR(50)
);

--------------------------------------------------

create table catalogo_categoria (
    id_cat_categoria  		SERIAL,
	precio 			REAL,
	tipo_producto 		VARCHAR(256),
	marca 			VARCHAR(32),
	articulo 		VARCHAR(32),
	cantidad 		INTEGER,
	tamanio 		VARCHAR(20),
	categoriaid_categoria 	INTEGER
);

create table promociones_producto (
    productoid_producto 	INTEGER,
    promocionesid_promocion 	INTEGER
);

create table promociones (
    id_promocion 	SERIAL,
    fecha_inicio 	DATE,
    fecha_fin 		DATE,
    cantidad_descuento 	REAL,
    tipo_promocion 	VARCHAR(256)
);

CREATE TABLE envio (
    id_envio 			SERIAL,
    compraid_compra 		INTEGER,
    repartidorid_repartidor 	INTEGER
);

CREATE TABLE empleado (
    id_trabajador 	SERIAL,
    nombre 		VARCHAR(30),
    app 		VARCHAR(30),
    apm 		VARCHAR(30),
    noss 		VARCHAR(11),
    sexo 		VARCHAR(30),
    fecha_nac 		DATE,
    rfc 		VARCHAR(13),
    fecha_inicio 	DATE,
    fecha_fin 		DATE,
    telefono 		REAL,
    salario 		REAL,
    horario 		TEXT,
    area 		VARCHAR(20)
);

--------------------------------------------------

CREATE TABLE empleado_puesto(
	empleadoid_trabajador 	INTEGER,
	cpuestoid_cpuesto 	INTEGER
);

CREATE TABLE cpuesto(
	id_cpuesto 	INTEGER,
	puesto 		VARCHAR(30)
);

CREATE TABLE repartidor(
	id_repartidor 			INTEGER,
	puesto 				VARCHAR(30),
	no_licencia 			INTEGER,
	empleadoid_trabajador		INTEGER,
	local_nacionalid_loc_nal	INTEGER
);

CREATE TABLE local_nacional(
	id_loc_nal 	INTEGER,
	tipo 		VARCHAR(30)
);

CREATE TABLE tipo_unidad(
	local_nacionalid_loc_nal 	INTEGER,
	tipo_unidad 			VARCHAR(30)
);

--------------------------------------------------

CREATE TABLE cajero (
	id_cajero      		INTEGER,
	no_caja        		SMALLINT,
	empleadoid_trabajador 	INTEGER
);

CREATE TABLE capacitacion (
	id_trabajador_cap 	INTEGER,
	horas_completadas	SMALLINT,
	zona_enfoque            VARCHAR(255),
	empleadoid_trabajador   INTEGER
);

CREATE TABLE empacador (
        id_empacador            SMALLINT,
	tipo_empacador          VARCHAR(30),
	empleadoid_trabajador   INTEGER
);

CREATE TABLE encargado_almacen (
        id_encargado_alm    	INTEGER,
	no_computadora          SMALLINT,
	empleadoid_trabajador   INTEGER
);

CREATE TABLE encargado_mostrador (
    id_encargado_mos    		INTEGER,
	empleadoid_trabajador   INTEGER
);

--------------------------------------------------

CREATE TABLE vigilancia (
 id_trabajador_vig 		SERIAL,
    recorrido 			VARCHAR(30),
    equipo 			VARCHAR(50),
    empleadoid_trabajador 	INTEGER
);

CREATE TABLE intendencia (
  id_trabajador_int 		SERIAL,
     material_trabajo 		VARCHAR(50),
     uniformes_otorgados 	VARCHAR(20),
  empleadoid_trabajador 	INTEGER
);

CREATE TABLE gerente (
   id_gerente			SERIAL,
      sucursal 			VARCHAR(50),
   empleadoid_trabajador 	INTEGER
);

CREATE TABLE gerente_proveedor (
   id_encargo_proveedor 	SERIAL,
   gerenteid_gerente 		INTEGER,
   proveedorid_proveedor 	INTEGER
);

CREATE TABLE encargo_seguimiento (
   gerente_proveedorid_encargo_proveedor SERIAL,
    no_seguimiento			 INTEGER
);

-----------------------------------------

CREATE TABLE encargo_orden(
    gerente_proveedorid_encargo_proveedor 	SERIAL,
    no_orden 					INTEGER
);


CREATE TABLE proveedor(
    id_proveedor 	SERIAL,
    nombre_proveedor 	VARCHAR(50),
    rfc 		VARCHAR(13),
    telefono 		VARCHAR(10)
);

CREATE TABLE producto_proveedor(
    id_prod_proveedor		SERIAL,
    nombre_prod_proveedor	VARCHAR(50),
    proveedorid_proveedor 	INTEGER
);


CREATE TABLE prod_proveedor_precio(
    producto_proveedorid_prod_proveedor SERIAL,
    precio 				INTEGER
);

CREATE TABLE prod_proveedor_tipo(
    producto_proveedorid_prod_proveedor SERIAL,
    tipo_producto 			VARCHAR(50)
);
