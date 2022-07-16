
ALTER TABLE cliente ADD CONSTRAINT pk_cliente PRIMARY KEY (id_cliente);
ALTER TABLE minorista ADD CONSTRAINT pk_minorista
  PRIMARY KEY (id_minorista);
ALTER TABLE miembros ADD CONSTRAINT pk_miembros
  PRIMARY KEY (id_miembro);
ALTER TABLE cmembresia ADD CONSTRAINT pk_cmembresia
  PRIMARY KEY (nombre);
ALTER TABLE telefono_miembros ADD CONSTRAINT pk_telefono_miembros
  PRIMARY KEY (miembrosid_miembro,telefono);
ALTER TABLE minorista_online ADD CONSTRAINT pk_minorista_online
  PRIMARY KEY (id_minorista_on);
ALTER TABLE telefono_min ADD CONSTRAINT pk_telefono_min2
  PRIMARY KEY (minorista_onlineid_minorista_on);

--------------------------------------------------

ALTER TABLE correo_min ADD CONSTRAINT pk_correo_minorista_onlineid_minorista_on
  PRIMARY KEY (minorista_onlineid_minorista_on);
ALTER TABLE dir_minorista ADD CONSTRAINT pk_dir_minorista_id_minorista_on
    PRIMARY KEY (minoristaonlineid_minorista_on);
ALTER TABLE tarjetas_registradas ADD CONSTRAINT pk_tarjetas_registradas_minorista_onlineid_minorista_on
  PRIMARY KEY (minorista_onlineid_minorista_on);
ALTER TABLE tipo_de_tarjeta ADD CONSTRAINT pk_tipo_de_tarjeta_id_tipo_de_tarjeta
  PRIMARY KEY (id_tipo_de_tarjeta);
ALTER TABLE emisora_tarjeta ADD CONSTRAINT pk_emisora_tarjeta_id_emisora
  PRIMARY KEY (id_emisora);
ALTER TABLE mayorista ADD CONSTRAINT pk_mayorista_id_mayorista
  PRIMARY KEY (id_mayorista);

--------------------------------------------------

ALTER TABLE telefono_may ADD CONSTRAINT pk_telefono_may_mayoristaid_mayorista
  PRIMARY KEY (mayoristaid_mayorista);
ALTER TABLE correo_may ADD CONSTRAINT pk_correo_may_mayoristaid_mayorista
  PRIMARY KEY (mayoristaid_mayorista);
ALTER TABLE rfc_empresa ADD CONSTRAINT pk_rfc_empresa_mayoristaid_mayorista
  PRIMARY KEY (mayoristaid_mayorista);
ALTER TABLE representantes ADD CONSTRAINT pk_representantes_id_representantes
  PRIMARY KEY (id_representantes);
ALTER TABLE dir_mayorista ADD CONSTRAINT pk_dir_mayorista_mayoristaid_mayorista
  PRIMARY KEY (mayoristaid_mayorista);
ALTER TABLE compra ADD CONSTRAINT pk_compra_id_compra PRIMARY KEY (id_compra);

--------------------------------------------------

ALTER TABLE compra_tipo_compra ADD CONSTRAINT pk_compra_tipo_compra
  PRIMARY KEY (compraid_compra, cmodalidadid_modalidad);
ALTER TABLE cmodalidad ADD CONSTRAINT pk_cmodalidad
  PRIMARY KEY (id_modalidad);
ALTER TABLE producto_compra ADD CONSTRAINT pk_producto_compra
  PRIMARY KEY (compraid_compra, productoid_producto);
ALTER TABLE producto ADD CONSTRAINT pk_producto
  PRIMARY KEY (id_producto);
ALTER TABLE categoria ADD CONSTRAINT pk_categoria
  PRIMARY KEY (id_categoria);

--------------------------------------------------

ALTER TABLE catalogo_categoria  ADD CONSTRAINT  pk_catalogo_categoria_id_cat_categoria
  PRIMARY KEY (id_cat_categoria);
ALTER TABLE promociones_producto ADD CONSTRAINT pk_promociones_producto
  PRIMARY KEY(productoid_producto, promocionesid_promocion);
ALTER TABLE promociones  ADD CONSTRAINT  pk_promociones_id_promocion
  PRIMARY KEY (id_promocion);
ALTER TABLE envio ADD CONSTRAINT pk_envio_id_envio
  PRIMARY KEY (id_envio);
ALTER TABLE empleado ADD CONSTRAINT pk_empleado_id_trabajador
  PRIMARY KEY  (id_trabajador);

--------------------------------------------------

ALTER TABLE empleado_puesto ADD CONSTRAINT pk_empleado_puesto
  PRIMARY KEY(empleadoid_trabajador, cpuestoid_cpuesto);
ALTER TABLE cpuesto ADD CONSTRAINT pk_cpuesto_id_cpuesto
  PRIMARY KEY  (id_cpuesto);
ALTER TABLE repartidor ADD CONSTRAINT pk_repartidor_id_repartidor
  PRIMARY KEY  (id_repartidor);
ALTER TABLE local_nacional ADD CONSTRAINT pk_local_nacional_id_loc_nac
  PRIMARY KEY  (id_loc_nal);
ALTER TABLE tipo_unidad ADD CONSTRAINT pk_tipo_unidad
  PRIMARY KEY (local_nacionalid_loc_nal);

--------------------------------------------------

ALTER TABLE cajero ADD CONSTRAINT pk_cajero_id_cajero
  PRIMARY KEY (id_cajero);
ALTER TABLE capacitacion ADD CONSTRAINT pk_capacitacion_id_trabajador_cap
  PRIMARY KEY (id_trabajador_cap);
ALTER TABLE empacador ADD CONSTRAINT pk_empacador_id_empacador
  PRIMARY KEY (id_empacador);
ALTER TABLE encargado_almacen ADD CONSTRAINT pk_encargado_almacen_id_encargado_alm
  PRIMARY KEY (id_encargado_alm);
ALTER TABLE encargado_mostrador ADD CONSTRAINT pk_encargado_mostrador_id_encargado_mos
  PRIMARY KEY (id_encargado_mos);

--------------------------------------------------

ALTER TABLE vigilancia ADD CONSTRAINT pk_vigilancia_id_trabajador_vig
  PRIMARY KEY (id_trabajador_vig);
ALTER TABLE intendencia ADD CONSTRAINT pk_intendencia_id_trabajador_int
  PRIMARY KEY (id_trabajador_int);
ALTER TABLE gerente ADD CONSTRAINT pk_gerente_id_gerente
  PRIMARY KEY (id_gerente);
ALTER TABLE gerente_proveedor ADD CONSTRAINT pk_gerente_proveedor_id_encargado_proveedor
  PRIMARY KEY (id_encargo_proveedor);
ALTER TABLE encargo_seguimiento ADD CONSTRAINT pk_encargo_seguimiento_gerente_proveedorid_encargo_proveedor
  PRIMARY KEY (gerente_proveedorid_encargo_proveedor);

--------------------------------------------------

ALTER TABLE encargo_orden  ADD CONSTRAINT  pk_encargo_orden
  PRIMARY KEY (gerente_proveedorid_encargo_proveedor);
ALTER TABLE proveedor  ADD CONSTRAINT  pk_proveedor
  PRIMARY KEY (id_proveedor);
ALTER TABLE producto_proveedor ADD CONSTRAINT pk_producto_proveedor
  PRIMARY KEY (id_prod_proveedor);
ALTER TABLE prod_proveedor_precio ADD CONSTRAINT pk_prod_proveedor
  PRIMARY KEY  (producto_proveedorid_prod_proveedor);
ALTER TABLE prod_proveedor_tipo ADD CONSTRAINT pk_prod_proveedor_tipo
  PRIMARY KEY (producto_proveedorid_prod_proveedor);

-----------------------------------------

--Llaves foráneas--

ALTER TABLE minorista ADD CONSTRAINT fk_minorista_clienteid_cliente_cliente_id_cliente
	FOREIGN KEY (clienteid_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE minorista_online ADD CONSTRAINT fk_minorista_clienteid_cliente_cliente_id_cliente
	FOREIGN KEY (clienteid_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE miembros ADD CONSTRAINT fk_miembros_minoristaid_minorista_minorista_id_minorista
	FOREIGN KEY (minoristaid_minorista) REFERENCES minorista(id_minorista);
ALTER TABLE miembros ADD CONSTRAINT fk_miembros_cmembresianombre_cmembresia_nombre
	FOREIGN KEY (cmembresianombre) REFERENCES cmembresia(nombre);
ALTER TABLE telefono_miembros ADD CONSTRAINT fk_telefono_miembros_miembros_id_miembro
	FOREIGN KEY (miembrosid_miembro) REFERENCES miembros(id_miembro);
ALTER TABLE telefono_min ADD CONSTRAINT fk_telefono_min_minorista_online_id_minorista_on
	FOREIGN KEY (minorista_onlineid_minorista_on) REFERENCES minorista_online(id_minorista_on);

--------------------------------------------------

ALTER TABLE correo_min ADD CONSTRAINT fk_correo_id_minorista_on_minorista_online_id_minorista_on
	FOREIGN KEY (minorista_onlineid_minorista_on) REFERENCES minorista_online (id_minorista_on);
ALTER TABLE dir_minorista ADD CONSTRAINT fk_dir_minorista_id_minorista_on__id_minorista_on
	FOREIGN KEY(minoristaonlineid_minorista_on) REFERENCES minorista_online (id_minorista_on);
ALTER TABLE tarjetas_registradas ADD CONSTRAINT fk_tarj_regis_minorista_onlineid_minorista_on_id_minorista_on
	FOREIGN KEY (minorista_onlineid_minorista_on) REFERENCES minorista_online (id_minorista_on);
ALTER TABLE tarjetas_registradas ADD CONSTRAINT fk_tarjetas_registradas_tipo_de_tarjeta_id_tipo_de_tarjeta
	FOREIGN KEY (tipo_de_tarjetaid_tipo_de_tarjeta) REFERENCES tipo_de_tarjeta(id_tipo_de_tarjeta);
ALTER TABLE tarjetas_registradas ADD CONSTRAINT fk_tarjetas_registradas_emisora_tarjeta_id_emisora
	FOREIGN KEY (emisora_tarjetaid_emisora) REFERENCES emisora_tarjeta(id_emisora);
ALTER TABLE mayorista ADD CONSTRAINT fk_mayorista_clienteid_cliente_cliente_id_cliente
	FOREIGN KEY (clienteid_cliente) REFERENCES cliente(id_cliente);

--------------------------------------------------

ALTER TABLE telefono_may ADD constraint fk_telefono_may_mayoristaid_mayorista_mayorista_id_mayorista
	FOREIGN KEY (mayoristaid_mayorista) REFERENCES mayorista(id_mayorista);
ALTER TABLE correo_may ADD constraint fk_correo_may_mayoristaid_mayorista_mayorista_id_mayorista
	FOREIGN KEY (mayoristaid_mayorista) REFERENCES mayorista(id_mayorista);
ALTER TABLE representantes ADD constraint fk_representantes_mayoristaid_mayorista_mayorista_id_mayorista
	FOREIGN KEY (mayoristaid_mayorista) REFERENCES mayorista(id_mayorista);
ALTER TABLE rfc_empresa ADD constraint fk_rfc_empresa_mayoristaid_mayorista_mayorista_id_mayorista
	FOREIGN KEY (mayoristaid_mayorista) REFERENCES mayorista(id_mayorista);
ALTER TABLE dir_mayorista ADD constraint fk_dir_mayorista_mayoristaid_mayorista_mayorista_id_mayorista
	FOREIGN KEY (mayoristaid_mayorista) REFERENCES mayorista(id_mayorista);
ALTER TABLE compra ADD constraint fk_compra_clienteid_cliente_cliente_id_cliente
	FOREIGN KEY (clienteid_cliente) REFERENCES cliente(id_cliente);
ALTER TABLE compra ADD constraint fk_compra_id_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);

--------------------------------------------------

ALTER TABLE compra_tipo_compra ADD CONSTRAINT fk_compra_tipo_compra_compraid_compra
	FOREIGN KEY (compraid_compra) REFERENCES compra(id_compra);
ALTER TABLE compra_tipo_compra ADD CONSTRAINT fk_compra_tipo_compra_tipo_compraid_tipo_pago
	FOREIGN KEY (cmodalidadid_modalidad) REFERENCES cmodalidad (id_modalidad);
ALTER TABLE producto_compra ADD CONSTRAINT fk_producto_compra_productoid_producto
	FOREIGN KEY (productoid_producto) REFERENCES producto(id_producto);
ALTER TABLE producto_compra ADD CONSTRAINT fk_producto_compra_compraid_compra
	FOREIGN KEY (compraid_compra) REFERENCES compra(id_compra);
ALTER TABLE producto ADD CONSTRAINT fk_producto_categoriaid_categoria
	FOREIGN KEY (categoriaid_categoria) REFERENCES  categoria(id_categoria);

--------------------------------------------------

ALTER TABLE catalogo_categoria ADD constraint fk_catalogo_categoria_categoria_id_categoria
	FOREIGN KEY (categoriaid_categoria) REFERENCES categoria(id_categoria);
ALTER TABLE promociones_producto ADD CONSTRAINT fk_promociones_producto_id_producto
	FOREIGN KEY (productoid_producto) references producto(id_producto);
ALTER TABLE promociones_producto ADD CONSTRAINT fk_promociones_producto__id_promocion
	FOREIGN KEY (promocionesid_promocion) references promociones(id_promocion);
ALTER TABLE envio ADD CONSTRAINT fk_envio_compraid_compra_compra_id_compra
	foreign key (compraid_compra) references compra(id_compra);
ALTER TABLE envio ADD CONSTRAINT fk_envio_repartidorid_repartidor_repartidor_id_repartidor
	foreign key (repartidorid_repartidor) references repartidor(id_repartidor);

--------------------------------------------------

ALTER TABLE empleado_puesto ADD constraint fk_empleado_puesto_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE empleado_puesto ADD constraint fk_empleado_puesto_cpuestoid_cpuesto_cpuesto_id_cpuesto
	FOREIGN KEY (cpuestoid_cpuesto) REFERENCES cpuesto(id_cpuesto);
ALTER TABLE repartidor ADD constraint fk_repartidor_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE repartidor ADD constraint fk_repartidor_local_nacionalid_loc_nac
	FOREIGN KEY (local_nacionalid_loc_nal) REFERENCES local_nacional(id_loc_nal);
ALTER TABLE tipo_unidad ADD constraint fk_tipo_unidad_local_nacional_id_loc_nac
	FOREIGN KEY (local_nacionalid_loc_nal) REFERENCES local_nacional(id_loc_nal);

-----------------------------------------------------------------

ALTER TABLE cajero ADD constraint fk_cajero_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE capacitacion ADD constraint fk_capacitacion_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE empacador ADD constraint fk_empacador_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE encargado_almacen ADD constraint fk_encargado_almacen_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE encargado_mostrador ADD constraint fk_encargado_mostrador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);

-----------------------------------------------------------------

ALTER TABLE vigilancia ADD CONSTRAINT fk_vigilancia_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE intendencia ADD CONSTRAINT fk_intendencia_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE gerente ADD CONSTRAINT fk_gerente_empleadoid_trabajador_empleado_id_trabajador
	FOREIGN KEY (empleadoid_trabajador) REFERENCES empleado(id_trabajador);
ALTER TABLE gerente_proveedor ADD CONSTRAINT fk_gerente_proveedor_gerenteid_gerente_gerente_id_gerente
	FOREIGN KEY (gerenteid_gerente) REFERENCES gerente(id_gerente);
ALTER TABLE gerente_proveedor ADD CONSTRAINT fk_gerente_proveedor_proveedor_id_proveedor
	FOREIGN KEY (proveedorid_proveedor) REFERENCES proveedor(id_proveedor);
ALTER TABLE encargo_seguimiento ADD CONSTRAINT fk_encargo_seguimiento_gerente_proveedor_id_encargo_proveedor
	FOREIGN KEY (gerente_proveedorid_encargo_proveedor) REFERENCES gerente_proveedor(id_encargo_proveedor);

--------------------------------------------------

ALTER TABLE encargo_orden ADD CONSTRAINT fk_encargo_orden_gerente_proveedor_id_encargo_proveedor
	FOREIGN KEY (gerente_proveedorid_encargo_proveedor) references gerente_proveedor(id_encargo_proveedor);
ALTER TABLE producto_proveedor ADD CONSTRAINT fk_producto_proveedor__id_proveedor
	FOREIGN KEY (proveedorid_proveedor) references proveedor(id_proveedor);
ALTER TABLE prod_proveedor_precio ADD CONSTRAINT fk_producto_proveedor_precio_producto_prov_id_prod_proveedor
	FOREIGN KEY (producto_proveedorid_prod_proveedor) references producto_proveedor(id_prod_proveedor);
ALTER TABLE prod_proveedor_tipo ADD CONSTRAINT fk_producto_proveedor_tipo_producto_proveedor_id_prod_proveedor
	FOREIGN KEY (producto_proveedorid_prod_proveedor) references producto_proveedor(id_prod_proveedor);


--NOT NULL y CHECK
--------------------------------------------------

ALTER TABLE cliente ALTER COLUMN  cliente_nuevo SET NOT NULL;

--------------------------------------------------

ALTER TABLE miembros ADD CONSTRAINT chk_miembro_sexo CHECK (sexo IN ('Mujer', 'Hombre', 'Otro') );
ALTER TABLE minorista_online ADD CONSTRAINT chk_minorista_online_sexo CHECK (sexo= 'Mujer' OR sexo='Hombre'
  OR sexo='Otro');

--------------------------------------------------

ALTER TABLE proveedor ADD CONSTRAINT chk_proveedor_rfc
    CHECK (rfc ~ '[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][0-9][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][0-9][A-Z]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]');

--------------------------------------------------

ALTER TABLE cmodalidad ALTER COLUMN nombre_modalidad SET NOT NULL;
ALTER TABLE producto_compra ADD CONSTRAINT chk_producto_compra_cantidad CHECK (cantidad > 0);
ALTER TABLE producto_compra ALTER COLUMN cantidad SET NOT NULL;
ALTER TABLE categoria ALTER COLUMN nombre_categoria SET NOT NULL;

--------------------------------------------------

ALTER TABLE catalogo_categoria ALTER COLUMN precio SET NOT NULL;
ALTER TABLE catalogo_categoria ALTER COLUMN tipo_producto SET NOT NULL;
ALTER TABLE catalogo_categoria ALTER COLUMN marca SET NOT NULL;
ALTER TABLE catalogo_categoria ALTER COLUMN articulo SET NOT NULL;
ALTER TABLE catalogo_categoria ALTER COLUMN cantidad SET NOT NULL;
ALTER TABLE catalogo_categoria ALTER COLUMN tamanio SET NOT NULL;
--ALTER TABLE promociones ALTER COLUMN fecha_incio SET NOT NULL;
ALTER TABLE promociones ALTER COLUMN fecha_inicio SET NOT NULL;
ALTER TABLE promociones ALTER COLUMN tipo_promocion SET NOT NULL;
ALTER TABLE empleado ADD CONSTRAINT chk_empleado_sexo CHECK (sexo IN ('Femenino', 'Masculino','Otro'));
ALTER TABLE empleado ADD CONSTRAINT chk_empleado_rfc
    CHECK (rfc ~ '[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][0-9][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][0-9][A-Z]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][0-9]' OR rfc ~
'[A-Z][A-Z][A-Z][A-Z][0-9][0-9][0-9][0-9][0-9][0-9][A-Z][A-Z][A-Z]');

ALTER TABLE empleado ALTER COLUMN nombre SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN app SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN apm SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN fecha_nac SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN fecha_inicio SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN telefono SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN salario SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN horario SET NOT NULL;
ALTER TABLE empleado ALTER COLUMN area SET NOT NULL;
ALTER TABLE empleado ADD CONSTRAINT chk_empleado_noss
  CHECK(noss ~ '[0-9]{11}$');

-----------------------------------------------------------------

ALTER TABLE local_nacional ADD CONSTRAINT chk_local_nacional_tipo CHECK (tipo IN ('Local','Nacional'));

-----------------------------------------------------------------

ALTER TABLE capacitacion ALTER COLUMN zona_enfoque SET NOT NULL;

-----------------------------------------------------------------

ALTER TABLE vigilancia ALTER COLUMN equipo SET NOT NULL;
ALTER TABLE vigilancia ALTER COLUMN recorrido SET NOT NULL;
ALTER TABLE intendencia ALTER COLUMN uniformes_otorgados SET NOT NULL;
ALTER TABLE intendencia ALTER COLUMN material_trabajo SET NOT NULL;
ALTER TABLE encargo_orden ALTER COLUMN  no_orden SET NOT NULL;


