----(PAGINACION)----

/* De la tabla producto descartamos las primeras 10 tuplas y vemos las primeras
5 tuplas después del descarte */
SELECT *
FROM producto
ORDER BY id_producto
OFFSET 10 ROWS FETCH NEXT 5 ROWS ONLY;

--Conocer la fecha de las primeras 20 compras que se realizaron en la empresa
SELECT id_compra, fecha FROM compra
ORDER BY id_compra LIMIT 20;

----Conocer los nombres y las fechas de incio de los primeros 5  empleados que ingresaron a la compañía 
SELECT  nombre,app, apm, fecha_inicio FROM empleado
ORDER BY fecha_inicio LIMIT 5;

/* Obtener el nombre completo y tipo de membresia de los 9 miembros mas antiguos
*/
SELECT 
  (nombre ||' '|| app ||' '|| apm) as NombreCompleto,
  cmembresianombre as TipoMembresia
 FROM miembros
 ORDER BY fecha_inicio
 LIMIT 9;
 
 -- Obtener las 3 membresías con más miembros inscritos
 SELECT e.nombre, COUNT(m.id_miembro)
 FROM cmembresia AS e JOIN miembros as m
 ON m.cmembresianombre = e.nombre
 GROUP BY e.nombre
 ORDER BY COUNT(m.id_miembro) DESC
 LIMIT 3;
 

--------------------------------------------------------------------------------------
----(JOINS)----

--Conocer el numero de envios que ha tenido cada repartidor
SELECT id_repartidor, count(id_compra)
FROM compra LEFT JOIN repartidor on compra.empleadoid_trabajador = repartidor.empleadoid_trabajador
GROUP BY id_repartidor;

--Conocer el nombre de la categoría de un producto:
SELECT id_producto, categoriaid_categoria, nombre_categoria
FROM producto INNER JOIN categoria
ON producto.categoriaid_categoria = categoria.id_categoria;


-- Forma de pago efectuado en cada compra
SELECT compraid_compra, cmodalidadid_modalidad, nombre_modalidad
FROM compra_tipo_compra INNER JOIN cmodalidad
ON compra_tipo_compra.cmodalidadid_modalidad = cmodalidad.id_modalidad;

--Conocer los teléfonos de los mayoristas
SELECT *
FROM  mayorista INNER JOIN telefono_may
ON mayorista.id_mayorista = telefono_may.mayoristaid_mayorista;

--Conocer el puesto de cada empleado
SELECT empleadoid_trabajador, puesto
FROM empleado_puesto RIGHT JOIN cpuesto ON empleado_puesto.cpuestoid_cpuesto = cpuesto.id_cpuesto;

--Conocer el tipo de entregas que hace cada repartidor
SELECT empleadoid_trabajador, puesto
FROM empleado_puesto RIGHT JOIN cpuesto ON empleado_puesto.cpuestoid_cpuesto = cpuesto.id_cpuesto;


--------------------------------------------------------------------------------
---(JOIN CON TABLAS RENOMBRADAS)---

--- Permite relacionar la tuplas de mayorista con dir_mayorista aunque no tengan el mismo nombre asignado en sus atributos.
--- Conocer las direcciones de cada empresa compradora mayorista 
SELECT*
FROM mayorista m INNER JOIN dir_mayorista dm 
ON m.id_mayorista = dm.mayoristaid_mayorista;

--- Este operador JOIN mantiene todas la tuplas de miembros y a través de la condición expuesta, lo relaciona con su correspondencia en minorista
--- Concer los datos de los miembros y el tipo de membresia que tienen
SELECT*
FROM  miembros m LEFT JOIN minorista mi 
ON  m.minoristaid_minorista = mi.id_minorista;

