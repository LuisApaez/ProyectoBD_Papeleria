--DELETES
--minorista
DELETE FROM minorista WHERE id_minorista = 6;
DELETE FROM minorista WHERE id_minorista = 13;
--cmembresia
DELETE FROM cmembresia WHERE nombre= 'Becario';
DELETE FROM cmembresia WHERE nombre= 'Exemp';
--miembros
DELETE FROM miembros WHERE id_miembro = 6;
DELETE FROM miembros WHERE id_miembro = 11;
--telefono_miembros
DELETE FROM telefono_miembros WHERE telefono = '6381106470';
DELETE FROM telefono_miembros WHERE telefono = '7456893243';
--telefono_min
DELETE FROM telefono_min WHERE minorista_onlineid_minorista_on=10;
DELETE FROM telefono_min WHERE minorista_onlineid_minorista_on=11;
--correo_min
DELETE FROM correo_min WHERE correo =  'asuthernsk@jis.com';
DELETE FROM correo_min WHERE correo =  'lfej@tripadvisor.com';
--dir_minorista
DELETE FROM dir_minorista WHERE numero = '3';
DELETE FROM dir_minorista WHERE colonia = 'Zapotitla';
--tipo_de_tarjeta
DELETE FROM tipo_de_tarjeta WHERE tipo = 'Crédito';
DELETE FROM tipo_de_tarjeta WHERE id_tipo_de_tarjeta = '0';
--tarjetas_registradas
DELETE FROM tarjetas_registradas WHERE emisora_tarjetaid_emisora ='3';
DELETE FROM tarjetas_registradas WHERE emisora_tarjetaid_emisora = '5';
--mayorista
DELETE FROM mayorista WHERE nombre = 'PPLR';
DELETE FROM mayorista WHERE id_mayorista = 7;
--telefono_may
DELETE FROM telefono_may WHERE mayoristaid_mayorista=1;
DELETE FROM telefono_may WHERE telefono='868525659';
--correo_may
DELETE FROM correo_may WHERE CORREO='dmandreya@dion.ne.jp';
DELETE FROM correo_may WHERE mayoristaid_mayorista=1;
--rfc_empresa
DELETE FROM rfc_empresa WHERE mayoristaid_mayorista<3;
DELETE FROM rfc_empresa WHERE mayoristaid_mayorista=16;
--representantes
DELETE FROM representantes WHERE mayoristaid_mayorista=1;
DELETE FROM representantes WHERE id_representantes=9;
--dir_mayorista
DELETE FROM dir_mayorista WHERE estado='Puebla';
DELETE FROM dir_mayorista WHERE cp=37218;
--empleado
DELETE FROM empleado WHERE id_trabajador= 300;
DELETE FROM empleado WHERE rfc= 'TEGS7406098R5';
--c_puesto
DELETE FROM cpuesto WHERE puesto = 'Repartidor';
DELETE FROM cpuesto WHERE id_cpuesto = 1;
--empleado_puesto
DELETE FROM empleado_puesto WHERE empleadoid_trabajador = 299;
DELETE FROM empleado_puesto WHERE empleadoid_trabajador = 300;

--local_nacional

--repartidor
DELETE FROM repartidor WHERE id_repartidor = 15;
DELETE FROM repartidor WHERE no_licencia = 996857;
--cajero
DELETE  FROM cajero WHERE no_caja =16;
DELETE  FROM cajero WHERE no_caja =17;
--capacitacion
DELETE FROM capacitacion WHERE id_trabajador_cap = 43;
DELETE FROM capacitacion WHERE id_trabajador_cap = 44;
--empacador
DELETE FROM empacador WHERE empleadoid_trabajador = 277;
DELETE FROM empacador WHERE empleadoid_trabajador = 282;
--encargado_almacen
DELETE  FROM encargado_almacen WHERE empleadoid_trabajador =17;
DELETE FROM encargado_almacen  WHERE empleadoid_trabajador =112;
--encargado_mostrador
DELETE FROM encargado_mostrador WHERE empleadoid_trabajador =30;
DELETE  FROM encargado_mostrador WHERE empleadoid_trabajador =98;
--vigilancia
DELETE FROM vigilancia WHERE recorrido = 'Salida de Emergencia';
DELETE FROM vigilancia WHERE id_trabajador_vig = 7;
--intendencia
DELETE FROM intendencia WHERE id_trabajador_int = 15;
DELETE FROM intendencia WHERE id_trabajador_int = 14;
--gerente
DELETE FROM gerente WHERE sucursal = 'Iztapalapa';
DELETE FROM gerente WHERE sucursal = 'Tijuana';
--proveedor
DELETE FROM proveedor WHERE nombre_proveedor='Pritt';
DELETE FROM proveedor WHERE nombre_proveedor='Norma';
--gerente_proveedor
DELETE FROM gerente_proveedor WHERE id_encargo_proveedor = 4;
DELETE FROM gerente_proveedor WHERE id_encargo_proveedor = 13;
--encargo_seguimiento
DELETE FROM encargo_seguimiento WHERE gerente_proveedorid_encargo_proveedor = 8;
DELETE FROM encargo_seguimiento WHERE gerente_proveedorid_encargo_proveedor = 13;
--encargo_orden
DELETE FROM encargo_orden WHERE no_orden=7;
DELETE FROM encargo_orden WHERE gerente_proveedorid_encargo_proveedor=10;
--producto_proveedor
DELETE FROM producto_proveedor WHERE nombre_prod_proveedor='Mochila Chenson';
DELETE FROM producto_proveedor WHERE nombre_prod_proveedor='Papel Facia';
--producto_proveedor_precio
DELETE FROM prod_proveedor_precio WHERE precio=200;
DELETE FROM prod_proveedor_precio WHERE producto_proveedorid_prod_proveedor=15;
--producto_proveedor_tipo
DELETE FROM prod_proveedor_tipo WHERE tipo_producto='cuaderno';
DELETE FROM prod_proveedor_tipo WHERE tipo_producto='gomas';
--compra
DELETE FROM compra WHERE EXTRACT(YEAR FROM fecha)<2020;
DELETE FROM compra WHERE clienteid_cliente=5;
--cmodalidad
DELETE FROM cmodalidad WHERE dependencia='Cualquier banco';
DELETE FROM cmodalidad WHERE id_modalidad=11;
--tipo_pago
DELETE FROM tipo_pago WHERE cmodalidadid_modalidad = 14;
DELETE FROM tipo_pago WHERE cmodalidadid_modalidad = 15;
--compra_tipo_compra
DELETE FROM compra_tipo_compra WHERE cmodalidadid_modalidad=5;
DELETE FROM compra_tipo_compra WHERE compraid_compra=24 AND compraid_compra=11;
--envio
DELETE FROM envio WHERE compraid_compra = 74;
DELETE FROM envio WHERE compraid_compra = 75;
--categoria
DELETE FROM categoria WHERE id_categoria=1;
DELETE FROM categoria WHERE nombre_categoria='Herramientas de cómputo';
--catalogo_categoria
DELETE FROM catalogo_categoria WHERE articulo = 'cuadro chico';
DELETE FROM catalogo_categoria WHERE id_cat_categoria=10;
--producto
DELETE FROM producto WHERE id_producto=49;
DELETE FROM producto WHERE categoriaid_categoria=15;
--promociones
DELETE FROM promociones WHERE tipo_promocion= 'descuento en envio';
DELETE FROM promociones WHERE fecha_inicio= '2021-10-10';
--promociones_producto
DELETE FROM promociones_producto WHERE promocionesid_promocion=16;
DELETE FROM promociones_producto WHERE promocionesid_promocion=17;
--producto_compra
DELETE FROM producto_compra WHERE cantidad<2;
DELETE FROM producto_compra WHERE compraid_compra=60;

--cliente
DELETE FROM cliente WHERE id_cliente=74;
DELETE FROM cliente WHERE id_cliente=73;

--minorista_online
DELETE FROM minorista_online WHERE id_minorista_on = 20;

/*La siguiente eliminación es necesaria para eliminar el id_minorista_on=3
de la tabla minorista_online:*/
DELETE FROM correo_min WHERE minorista_onlineid_minorista_on=3;

DELETE FROM minorista_online WHERE id_minorista_on = 3;

--emisora_tarjeta
DELETE FROM emisora_tarjeta WHERE emisora = 'BBVA';
/*La siguiente eliminación es necesaria para eliminar el id_emisora=6
de la tabla emisora_tarjeta:*/
DELETE FROM tarjetas_registradas WHERE emisora_tarjetaid_emisora=6;

DELETE FROM emisora_tarjeta WHERE id_emisora = '6';