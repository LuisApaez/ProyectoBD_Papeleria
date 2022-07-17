--Updates

--cliente
UPDATE  cliente SET cliente_nuevo=B'1' WHERE id_cliente=8;
UPDATE  cliente SET cliente_nuevo=B'0' WHERE id_cliente=71;
--minorista
UPDATE minorista SET id_minorista= 21 WHERE clienteid_cliente = 38;
UPDATE minorista SET id_minorista= 32 WHERE clienteid_cliente = 49;
--cmembresia
UPDATE cmembresia SET nombre='ArquiStar' WHERE descripcion = 'Estudiantes de arq';
UPDATE cmembresia SET nombre='Provisional' WHERE descripcion = 'Provisional corto plazo';
--miembros
UPDATE miembros SET id_miembro= 4 WHERE cmembresianombre = 'Becario';
UPDATE miembros SET id_miembro= 9 WHERE cmembresianombre = 'Basica';
--telefono_miembros
UPDATE telefono_miembros SET telefono = '5543625293' WHERE miembrosid_miembro = 1;
UPDATE telefono_miembros SET telefono = '5543625293' WHERE miembrosid_miembro = 15;
--minorista_online
UPDATE minorista_online SET nombre='Alejandra' WHERE id_minorista_on = 1;
UPDATE minorista_online SET nombre='Pablo' WHERE id_minorista_on = 2;
--telefono_min
UPDATE telefono_min SET telefono='1058662267' WHERE minorista_onlineid_minorista_on=8;
UPDATE telefono_min SET telefono='2348542167' WHERE minorista_onlineid_minorista_on=14;
--correo_min
UPDATE correo_min SET correo = 'happy@gmail.com' WHERE minorista_onlineid_minorista_on = '2';
UPDATE correo_min SET correo = 'soul@gmail.com' WHERE minorista_onlineid_minorista_on = '3';
--dir_minorista
UPDATE dir_minorista SET numero = '66' WHERE calle = 'Cornelio Hispano';
UPDATE dir_minorista SET calle = 'Del mar' WHERE numero = '20';
--tipo_de_tarjeta
UPDATE tipo_de_tarjeta SET tipo='Tarjeta débito' WHERE id_tipo_de_tarjeta=1;
UPDATE tipo_de_tarjeta SET tipo='Tarjeta crédito' WHERE id_tipo_de_tarjeta=2;
--emisora_tarjeta
UPDATE emisora_tarjeta SET emisora = 'Bansi' WHERE id_emisora = '1';
UPDATE emisora_tarjeta SET emisora = 'Credit Suisse' WHERE id_emisora = '3';
--tarjetas_registradas
UPDATE tarjetas_registradaS SET tipo_de_tarjetaid_tipo_de_tarjeta = '1' WHERE minorista_onlineid_minorista_on = '15';
UPDATE tarjetas_registradas SET  emisora_tarjetaid_emisora = '10' WHERE minorista_onlineid_minorista_on = '11';
--mayorista
UPDATE mayorista SET nombre = 'La pape' WHERE id_mayorista = 6;
UPDATE mayorista SET nombre = 'Las flores' WHERE id_mayorista = 3;
--telefono_may
UPDATE telefono_may SET telefono='248675399' WHERE mayoristaid_mayorista=5;
UPDATE telefono_may SET telefono='788495141' WHERE mayoristaid_mayorista=9;

--rfc_empresa
UPDATE rfc_empresa SET rfc='RESI901239YGB' WHERE mayoristaid_mayorista=11;
UPDATE rfc_empresa SET rfc='ELPI891201WD9' WHERE mayoristaid_mayorista=16;
--representantes
UPDATE representantes SET nombre='Havram' WHERE mayoristaid_mayorista=1;
UPDATE representantes SET nombre='Marise' WHERE mayoristaid_mayorista=24;
--dir_mayorista
UPDATE dir_mayorista SET numero=11894 WHERE mayoristaid_mayorista=15;
UPDATE dir_mayorista SET calle='Grande Gauss' WHERE mayoristaid_mayorista=6;
--empleado
UPDATE empleado SET sexo = 'Otro' WHERE rfc = 'KUBX890207QE0';
UPDATE empleado SET salario = '5000' WHERE nombre = 'Evonne';
--c_puesto
UPDATE cpuesto SET puesto ='Encargado de Limpieza' WHERE id_cpuesto = 8;
UPDATE cpuesto SET puesto ='Encargado de Capacitación' WHERE id_cpuesto = 9;
--empleado_puesto
UPDATE empleado_puesto SET cpuestoid_cpuesto = 3 WHERE empleadoid_trabajador = 299;
UPDATE empleado_puesto SET cpuestoid_cpuesto = 6 WHERE empleadoid_trabajador = 300;

--local_nacional
 
--repartidor
UPDATE repartidor SET no_licencia = 987655 WHERE id_repartidor = 2;
UPDATE repartidor SET local_nacionalid_loc_nal = 0 WHERE empleadoid_trabajador = 73;
--cajero
UPDATE cajero SET no_caja= 16 WHERE id_cajero = 14;
UPDATE cajero SET no_caja= 17 WHERE id_cajero = 15;
--capacitacion
UPDATE capacitacion SET zona_enfoque = 'repartidor' WHERE id_trabajador_cap = 5;
UPDATE capacitacion SET zona_enfoque = 'repartidor' WHERE id_trabajador_cap = 12;
--empacador
UPDATE empacador SET tipo_empacador = 'nacional' WHERE empleadoid_trabajador =277;
UPDATE empacador SET tipo_empacador = 'local' WHERE empleadoid_trabajador =282;
--encargado_almacen
update encargado_almacen SET no_computadora =6 WHERE empleadoid_trabajador =17;
UPDATE encargado_almacen  SET no_computadora =6 WHERE empleadoid_trabajador =112;
--encargado_mostrador
update encargado_mostrador SET no_ventas= 0 WHERE empleadoid_trabajador =30;
UPDATE encargado_mostrador SET no_ventas = 0 WHERE empleadoid_trabajador =98;
--vigilancia
UPDATE vigilancia SET recorrido= 'Estacionamiento' WHERE id_trabajador_vig = 4;
UPDATE vigilancia SET equipo= 'Macana, chaleco antibalas, pistola' WHERE id_trabajador_vig = 5;
--intendencia
UPDATE intendencia SET materia_trabajo= 'fabuloso, cloro, zacates, escoba' WHERE id_trabajador_int = 12;
UPDATE intendencia SET uniformes_ototgados= 'Careta, Camison' WHERE id_trabajador_int = 12;
--gerente
UPDATE gerente SET sucursal= 'Oaxaca' WHERE id_gerente = 6;
UPDATE gerente SET sucursal= 'CD Juarez' WHERE id_gerente = 9;
--proveedor
UPDATE proveedor SET nombre_proveedor='Sharpie' WHERE id_proveedor=14;
UPDATE proveedor SET nombre_proveedor='Rayter' WHERE id_proveedor=10;

--gerente_proveedor

--encargo_seguimiento
UPDATE encargo_seguimiento SET no_seguimiento = '123456789' WHERE gerente_proveedorid_encargo_proveedor = 15;
UPDATE encargo_seguimiento SET no_seguimiento = '210116202' WHERE gerente_proveedorid_encargo_proveedor = 14;
--encargo_orden
UPDATE encargo_orden SET no_orden=16 WHERE gerente_proveedorid_encargo_proveedor=2;
UPDATE encargo_orden SET no_orden=17 WHERE gerente_proveedorid_encargo_proveedor=1;
--producto_proveedor
UPDATE producto_proveedor SET nombre_prod_proveedor='Paquete pluma Sharpie' WHERE id_prod_proveedor=2;
UPDATE producto_proveedor SET nombre_prod_proveedor='Block de notas Rayter' WHERE id_prod_proveedor=14;
--producto_proveedor_precio
UPDATE prod_proveedor_precio SET precio=40 WHERE producto_proveedorid_prod_proveedor=3;
UPDATE prod_proveedor_precio SET precio=650 WHERE producto_proveedorid_prod_proveedor=1;
--producto_proveedor_tipo
UPDATE prod_proveedor_tipo SET tipo_producto='plumas de color' WHERE producto_proveedorid_prod_proveedor=2;
UPDATE prod_proveedor_tipo SET tipo_producto='pegamento liquido' WHERE producto_proveedorid_prod_proveedor=8;
--compra
UPDATE compra SET empleadoid_trabajador=51 WHERE clienteid_cliente=1;
UPDATE compra SET empleadoid_trabajador=18 WHERE id_compra=26;
--cmodalidad
UPDATE cmodalidad SET descripcion='pago con tarjeta' WHERE id_modalidad=1;
UPDATE cmodalidad SET dependencia='Cualquier banco' WHERE id_modalidad=13;
--tipo_pago
UPDATE tipo_pago SET fisico_online = B'0' WHERE cmodalidadid_modalidad = 14;
UPDATE tipo_pago SET fisico_online = B'0' WHERE cmodalidadid_modalidad = 15;
--compra_tipo_compra
UPDATE compra_tipo_compra SET cmodalidadid_modalidad=5 WHERE compraid_compra=24;
UPDATE compra_tipo_compra SET cmodalidadid_modalidad=2 WHERE compraid_compra=11;
--envio
UPDATE envio SET repartidorid_repartidor = 1 WHERE compraid_compra = 75;
UPDATE envio SET repartidorid_repartidor = 2 WHERE compraid_compra = 74;
--categoria
UPDATE categoria SET nombre_categoria='printing zone' WHERE id_categoria=15;
UPDATE categoria SET nombre_categoria='no especificado' WHERE id_categoria=17;
--catalogo_categoria
UPDATE catalogo_categoria SET precio = 155.90 WHERE articulo = 'Luz blanca';
UPDATE catalogo_categoria SET precio = 259 WHERE articulo = 'cuadro chico';
--producto
UPDATE producto SET categoriaid_categoria=11 WHERE id_producto=45;
UPDATE producto SET categoriaid_categoria=16 WHERE id_producto=24;
--promociones
UPDATE promociones SET cantidad_descuento = .25 WHERE id_promocion = 2;
UPDATE promociones SET fecha_fin = '2022-02-28' WHERE fecha_inicio = '2021-11-12';
--promociones_producto
UPDATE promociones_producto SET productoid_producto = 19 WHERE promocionesid_promocion = 15;
UPDATE promociones_producto SET productoid_producto = 19 WHERE promocionesid_promocion = 14;
--producto_compra
UPDATE producto_compra SET cantidad=9 WHERE compraid_compra=1;
UPDATE producto_compra SET cantidad=1 WHERE compraid_compra=39;
-------
