# Proyecto Base De Datos: Papelería

<ul>
  <li><a href="#Descripcion">Descipción</a></li>
  
  <li><a href="#Implementacion">Programación SQL</a></li>
</ul>

---
## Descripción <a id="Descripcion"></a>
A lo largo de este proyecto se busca implementar una base de datos para modelar
el flujo de trabajo en una papelería, así como el proceso de venta de productos 
y el control del almacén. Para ello, se comienza realizando un estudio de 
*análisis de requerimientos* para capturar las necesidades y problemas que se busca solucionar
la papelería.

[Archivo: Análsis de requerimientos](Analisis_De_Requerimientos.pdf)

Posteriormente, con base en lo recabado en el análisis de requerimientos, creamos una lista 
de tablas candidatas. Esta lista describe cada una de las tablas que planeamos modelar, incluyendo los atributos de cada una y los tipos de datos correspondientes.

[Archivo: Listado descriptivo](Listado_Descriptivo_Tablas.pdf)

Ahora bien, el siguiente paso es utilizar el listado descriptivo para crear el correspondiente
diagrama entidad relación.

[Archivo: Diagrama entidad relación](DiagramaEntidadRelacion/Diagrama_Entidad_Relacion.pdf)

[Link: Diagrama entidad relación en Miro](https://miro.com/app/board/o9J_lqlra88=/?share_link_id=144839627601)

Continuando, llevamos la estructura del diagrama entidad relación al diagrama relacional

[Archivo: Diagrama relacional](Diagrama_Relacional.pdf)

Después, se procede a normalizar cada una de las tablas, para lo cual se explica brevemente el proceso de normalización
utilizando dependencias funcionales y las primeras tres formas normales, además de utilizar la forma normal de Boyce Codd. 

[Archivo: Normalización](Normalizacion.pdf)

De lo anterior, implementamos las tablas ya normalizadas en el diagrama relacional, lo cual nos arroja el diagrama relacional
normalizado.

[Imagen: Diagrama relacional normalizado](Diagrama_Relacional_Normalizado.jpg)

Gracias a este último diagrama podemos implementar la creación de la base de datos de nuestras tablas, para lo cual
utilizaremos SQL en PostgreSQL. Para ello

1. Creación de las tablas:

  [Script: Creación de las tablas](Crea_Tablas.sql)

2. Integridad:

  [Script: Implementación de restricciones](Crea_Integridad.sql)

3. Inserción de datos. Para este punto generamos datos aleatorios utilizando la página web [mockaroo](https://www.mockaroo.com/).

  [Script: Inserciones](Inserciones.sql)

## Programación SQL <a id="Implementacion"></a>

Utilizando la base de datos creada anteriormente, implementaremos algunas sentencias SQL en ella, las cuales abarcan temas
desde consultas básicas, subconsultas, joins, consultas avanzadas, crosstab, vistas, índices, funciones de ventana y procedimeintos almacenados.

1. Consultas básicas utilizando la cláusula ``WHERE``.

[Script: Consultas básicas](Where_Update_Delete/ConsultasWhere.sql)

2. Actualización y eliminación de información utilizando ``UPDATE`` y ``DELETE``. 

[Script: Actualizaciones](Where_Update_Delete/Update.sql)

[Script: Eliminaciones](Where_Update_Delete/deletes.sql)

3. Paginación y uniones de tablas (joins).

[Script: Paginación y Joins](Paginacion_y_Joins.sql)

4. Consultas avanzadas utilizando uniones.

[Script: Consultas avanzadas](Consultas_Avanzadas.sql)

5. Índices y expresiones comunes de tabla (o CTEs).

[Script: Índices y CTEs](Indices_y_ctes.sql)

6. Procedimientos almacenados o SP (Storage Procedure)

[Script: SP](Procedimientos_Almacenados.sql)
