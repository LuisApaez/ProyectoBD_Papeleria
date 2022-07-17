--CONSULTAS

--cliente
SELECT count(id_cliente) FROM cliente WHERE cliente_nuevo=B'0';
SELECT * FROM cliente WHERE id_cliente<25;
--minorista
SELECT id_minorista FROM minorista WHERE clienteid_cliente = 51;
SELECT id_minorista FROM minorista WHERE clienteid_cliente = 17;
--cmembresia
SELECT * FROM cmembresia WHERE precio < 400;
SELECT * FROM cmembresia WHERE descripcion = 'Para cliente frecuente';
--miembros
SELECT cmembresianombre FROM miembros WHERE id_miembro = '13';
SELECT cmembresianombre FROM miembros WHERE id_miembro = '2';
--telefono_miembros
SELECT * FROM telefono_miembros WHERE miembrosid_miembro = 8;
SELECT * FROM telefono_miembros WHERE miembrosid_miembro = 7;
--minorista_online
SELECT * FROM minorista_online;
SELECT fecha_nac FROM minorista_online WHERE id_minorista_on = 1;
--telefono_min
SELECT * FROM telefono_min ;
SELECT telefono FROM telefono_min WHERE minorista_onlineid_minorista_on=14;
--correo_min
SELECT correo FROM correo_min;
SELECT minorista_onlineid_minorista_on FROM correo_min;
--dir_minorista
SELECT numero, calle FROM dir_minorista;
SELECT colonia FROM dir_minorista;
--tipo_de_tarjeta
SELECT tipo FROM tipo_de_tarjeta;
SELECT id_tipo_de_tarjeta FROM tipo_de_tarjeta;
--emisora_tarjeta
SELECT emisora FROM emisora_tarjeta;
SELECT id_emisora FROM emisora_tarjeta WHERE id_emisora = '5';
--tarjetas_registradas
SELECT emisora_tarjetaid_emisora FROM tarjetas_registradas;
SELECT minorista_onlineid_minorista_on FROM tarjetas_registradas WHERE emisora_tarjetaid_emisora = '11';
--mayorista
SELECT nombre FROM mayorista;
SELECT nombre FROM mayorista WHERE id_mayorista = 1;
--telefono_may
SELECT * FROM telefono_may;
SELECT telefono FROM telefono_may WHERE mayoristaid_mayorista=16;
--correo_may
SELECT * FROM correo_may;
SELECT correo FROM correo_may WHERE mayoristaid_mayorista=15;
--rfc_empresa
SELECT * FROM rfc_empresa;
SELECT mayoristaid_mayorista FROM rfc_empresa WHERE rfc='BLOG070918RTY';
--representantes
SELECT * FROM representantes;
SELECT * FROM representantes WHERE mayoristaid_mayorista=8;
--dir_mayorista
SELECT * FROM dir_mayorista WHERE estado='Jalisco';
SELECT count(mayoristaid_mayorista) FROM dir_mayorista WHERE estado='Jalisco';
--empleado
SELECT nombre, apm FROM empleado WHERE salario> 1000;
SELECT salario, area FROM empleado WHERE sexo = 'Masculino';
--c_puesto
SELECT puesto FROM cpuesto WHERE id_cpuesto = 1;
SELECT puesto FROM cpuesto WHERE id_cpuesto = 4;
--empleado_puesto
SELECT cpuestoid_cpuesto FROM empleado_puesto WHERE empleadoid_trabajador = 7;
SELECT cpuestoid_cpuesto FROM empleado_puesto WHERE empleadoid_trabajador = 25;
--local_nacional
SELECT tipo FROM local_nacional WHERE id_loc_nal = 1;
SELECT tipo FROM local_nacional WHERE id_loc_nal = 0;
--tipo_unidad
SELECT tipo_unidad FROM tipo_unidad WHERE local_nacionalid_loc_nal = 1;
SELECT tipo_unidad FROM tipo_unidad WHERE local_nacionalid_loc_nal = 0;
--repartidor
SELECT no_licencia FROM repartidor WHERE id_repartidor = 5;
SELECT local_nacionalid_loc_nal FROM repartidor WHERE no_licencia = 520148;
--cajero
SELECT * FROM cajero WHERE no_caja = 15;
SELECT * FROM cajero WHERE no_caja = 14;
--capacitacion
SELECT * FROM capacitacion WHERE zona_enfoque = 'repartidor';
SELECT * FROM capacitacion WHERE zona_enfoque = 'limpieza';
--empacador
SELECT * FROM empacador WHERE tipo_empacador = 'local';
SELECT * FROM empacador WHERE tipo_empacador = 'nacional';
--encargado_almacen
SELECT * FROM encargado_almacen WHERE empleadoid_trabajador =17;
SELECT * FROM encargado_almacen WHERE empleadoid_trabajador =112;
--encargado_mostrador
SELECT * FROM encargado_mostrador WHERE empleadoid_trabajador =30;
SELECT * FROM encargado_almacen WHERE empleadoid_trabajador =98;
--vigilancia
SELECT recorrido FROM vigilancia WHERE id_trabajador_vig = 10;
SELECT equipo FROM vigilancia WHERE id_trabajador_vig = 11;
--intendencia
SELECT materia_trabajo FROM intendencia WHERE id_trabajador_int = 1;
SELECT uniformes_ototgados FROM intendencia WHERE id_trabajador_int = 13;
--gerente
SELECT sucursal FROM gerente WHERE id_gerente = 2;
SELECT sucursal FROM gerente WHERE id_gerente = 7;
--proveedor
SELECT nombre_proveedor FROM proveedor;
SELECT nombre_proveedor FROM proveedor WHERE id_proveedor=1;
--gerente_proveedor
SELECT proveedorid_proveedor FROM gerente_proveedor WHERE id_encargo_proveedor = 11;
SELECT proveedorid_proveedor FROM gerente_proveedor WHERE id_encargo_proveedor = 8;
--encargo_seguimiento
SELECT no_seguimiento FROM encargo_seguimiento WHERE gerente_proveedorid_encargo_proveedor = 9;
SELECT no_seguimiento FROM encargo_seguimiento WHERE gerente_proveedorid_encargo_proveedor = 1;
--encargo_orden
SELECT *
FROM encargo_orden WHERE no_orden=2;
SELECT * FROM encargo_orden WHERE no_orden>4;
--producto_proveedor
SELECT nombre_prod_proveedor FROM producto_proveedor;
SELECT * FROM producto_proveedor WHERE id_prod_proveedor=3;
--producto_proveedor_precio
SELECT * FROM prod_proveedor_precio WHERE precio>20;
SELECT * FROM prod_proveedor_precio WHERE precio=650;
--producto_proveedor_tipo
sELECT tipo_producto FROM prod_proveedor_tipo;
SELECT tipo_producto FROM prod_proveedor_tipo WHERE producto_proveedorid_prod_proveedor=2;
--compra
SELECT * FROM compra WHERE EXTRACT(YEAR FROM fecha)=2019;
SELECT * FROM compra WHERE empleadoid_trabajador=131;
--cmodalidad
SELECT * FROM cmodalidad WHERE id_modalidad=14;
SELECT * FROM cmodalidad WHERE id_modalidad<5;
--tipo_pago
SELECT * FROM tipo_pago;
SELECT cmodalidadid_modalidad FROM tipo_pago WHERE fisico_online = B'0';
--compra_tipo_compra
SELECT  * FROM compra_tipo_compra;
SELECT * FROM compra_tipo_compra WHERE cmodalidadid_modalidad=8;
--envio
SELECT * FROM envio;
SELECT * FROM envio WHERE compraid_compra<20;
--categoria
SELECT * FROM categoria;
SELECT nombre_categoria FROM categoria WHERE id_categoria=2;
--catalogo_categoria
SELECT * FROM catalogo_categoria WHERE precio>400;
SELECT * FROM catalogo_categoria WHERE marca = 'Norma';
--producto
SELECT * FROM producto WHERE categoriaid_categoria=16;
SELECT percentile_cont(0.5) WITHIN GROUP ( ORDER BY categoriaid_categoria ) FROM producto;
--promociones
SELECT tipo_promocion FROM promociones WHERE fecha_fin= '2021-07-12';
SELECT * FROM promociones WHERE id_promocion = 12;
--promociones_producto
SELECT * FROM promociones_producto;
SELECT * FROM promociones_producto WHERE promocionesid_promocion = 13;
--producto_compra
SELECT * FROM producto_compra;
SELECT sum(CANTIDAD)  FROM producto_compra;