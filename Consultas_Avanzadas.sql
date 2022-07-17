
--Nombre de los clientes minoristas que compran en línea que compraron 10 o más articulos
SELECT nombre, app, apm
FROM minorista_online INNER JOIN (
    SELECT clienteid_cliente
    FROM compra INNER JOIN producto_compra
    ON compra.id_compra = producto_compra.compraid_compra
    WHERE cantidad >= 10
          ) T1 ON minorista_online.clienteid_cliente = T1.clienteid_cliente;
          
--Conocer las Gerentes que ganen más de 20,000
SELECT id_trabajador,app,apm,salario,sucursal FROM empleado INNER JOIN gerente
ON empleado.id_trabajador = gerente.empleadoid_trabajador
WHERE salario>20000
AND (sexo = 'Femenino')
ORDER BY salario;

---Saber el nombre de los clientes que son miembros con el tipo de membresia 'Basico', con fecha de inicio el primero de enro del 2020 y hasta el 30 de Octubre de este año
SELECT  miembros.nombre, app, apm FROM miembros  LEFT JOIN cmembresia
ON miembros.cmembresianombre = cmembresia.nombre
WHERE (cmembresia.nombre = 'Basico')
AND (fecha_inicio BETWEEN '2020-01-01' AND '2021-10-31');

---Información sobre los salarios por área área
SELECT area,COUNT(id_trabajador) AS Numero_de_empleados, MIN(salario) AS Salario_Minimo, MAX(salario) AS Salario_Maximo, AVG(salario) AS Salario_Promedio
FROM empleado
GROUP BY area;


--Número de trabajadores por puesto--
SELECT puesto, count(empleadoid_trabajador)
FROM empleado_puesto ep INNER JOIN cpuesto c
ON ep.cpuestoid_cpuesto = c.id_cpuesto
GROUP BY puesto;

---Información sobre los salarios por sexo
SELECT sexo, COUNT(id_trabajador) AS Numero_de_empleados, 
MIN(salario) AS Salario_Minimo,
MAX(salario) AS Salario_Maximo, 
AVG(salario) AS Salario_Promedio
FROM empleado
GROUP BY sexo;

-- Top 10 de clientes de acuerdo a su ticket total promedio en compras de al menos 2 artículos
SELECT id_cliente, AVG(total) as ticket_promedio
FROM (
    SELECT c.clienteid_cliente  as id_cliente , c.id_Compra as id_compra, SUM(p.cantidad*cat.precio) as total
    FROM compra as c INNER JOIN
    producto_compra as p 
    ON p.compraid_Compra = c.id_Compra
    INNER JOIN producto as pro 
    on p.productoid_producto = pro.id_producto
    INNER JOIN catalogo_categoria as cat 
    ON pro.categoriaid_categoria  =
    cat.categoriaid_categoria 
    GROUP BY(c.id_Compra,c.clienteid_cliente)
    HAVING SUM(p.cantidad)>1
) as tickets
GROUP BY id_cliente
ORDER BY AVG(total) DESC
LIMIT 10
;

/*
 Obtener el total de compras que hubo entre las fechas 2019-01-01 y 2020-12-31,
 Obtener el numero de compras realizadas de acuerdo a cada modalidad
 obtener la procion de compras de acuerdo al total para cada modalidad
 */
select distinct modalidad, totalc, (cast(totalc * 100 as decimal) / total) porcentaje, total
from (select c2.id_modalidad                                          idmod,
             count(compra.id_compra) over (partition by id_modalidad) totalc,
             nombre_modalidad                                         modalidad,
             count(id_compra) over ()                                 total
      from compra
               left join compra_tipo_compra ctc on compra.id_compra = ctc.compraid_compra
               left join cmodalidad c2 on ctc.cmodalidadid_modalidad = c2.id_modalidad
      where fecha BETWEEN '2019-01-01' AND '2020-12-31'
      group by c2.id_modalidad, id_compra
     ) T1;