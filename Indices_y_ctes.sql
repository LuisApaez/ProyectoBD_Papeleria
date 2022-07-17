
-----vista de las compras del 2020

CREATE VIEW compras2020(nombre,id_cliente,fecha) AS
SELECT nombre, id_cliente,fecha
FROM compra inner join empleado on compra.empleadoid_trabajador=empleado.id_trabajador
inner join cliente on compra.clienteid_cliente=cliente.id_cliente
WHERE fecha between '2020-01-01' AND '2020-12-31'
order by fecha;


--Catalogos
CREATE INDEX idx_id_modalidad ON cmodalidad(id_modalidad);
CREATE INDEX idx_id_cpuesto ON cpuesto(id_cpuesto);
CREATE INDEX idx_id_cat_categoria ON catalogo_categoria(id_cat_categoria);
CREATE INDEX idx_nombre_membresia ON cmembresia(nombre);

--Otros
CREATE INDEX idx_id_compra ON compra(id_compra);
CREATE INDEX idx_id_producto ON producto(id_producto);
CREATE INDEX idx_id_promocion ON promociones(id_promocion);
CREATE INDEX idx_id_cliente ON cliente(id_cliente);
CREATE INDEX idx_id_trabajador ON empleado(id_trabajador);

--Número de envios que tiene cada repartidor.
WITH cte_repartidores AS (
    SELECT
    id_repartidor,
    empleadoid_trabajador,
    nombre,
    app,
    apm
    FROM repartidor INNER JOIN empleado e on e.id_trabajador = repartidor.empleadoid_trabajador
)
SELECT nombre, app, apm, COUNT(compraid_compra) as envios
FROM cte_repartidores INNER JOIN envio ON cte_repartidores.id_repartidor = envio.repartidorid_repartidor
GROUP BY nombre, app, apm;

--Numero de horas maximas que hizo un empleado de cada zona en capacitacion
with cte_horasmax as (
    select nombre, app, apm, id_trabajador, max(horas_completadas) horas, zona_enfoque
    from empleado INNER JOIN capacitacion ON empleado.id_trabajador = capacitacion.empleadoid_trabajador
    group by zona_enfoque,id_trabajador, nombre,app, apm
)select distinct zona_enfoque, horas
from cte_horasmax
group by zona_enfoque,horas;

--Chris
/*Este CTE se encarga de eliminar los registros de productos con tamanio chico de la tabla
  catalogo_categoria; a su vez regresa e inserta las mismas tuplas eliminadas en una nueva
  tabla creada previamente (catalogo_categoria_prod_chicos)
*/

CREATE TABLE catalogo_categoria_prod_chicos (
   id_prod_chicos SERIAL,
   precio REAL,
   tipo_producto VARCHAR(30),
   marca VARCHAR(30),
   articulo VARCHAR(30),
   cantidad INTEGER,
   tamanio VARCHAR(20),
   foky INTEGER

);

ALTER TABLE catalogo_categoria_prod_chicos ADD CONSTRAINT pk_catalogo_categoria_prod_chicos_id_prod_chicos
  PRIMARY KEY (id_prod_chicos);

WITH cte_cat_categoria AS (
    DELETE FROM catalogo_categoria
        WHERE
            tamanio = 'chico'
        RETURNING *
)
INSERT INTO catalogo_categoria_prod_chicos
SELECT * FROM cte_cat_categoria;

SELECT *
FROM catalogo_categoria_prod_chicos;
