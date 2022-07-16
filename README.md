# Proyecto Base De Datos

A lo largo de este proyecto se busca implementar una base de datos para modelar
el flujo de trabajo en una papelería, así como el proceso de venta de productos 
y el control del almacén. Para ello, se comienza realizando un estudio de 
*análisis de requerimientos* para capturar las necesidades y problemas que busca solucionar
la papelería.

[Archivo: Análsis de requerimientos](Analisis_De_Requerimientos.pdf)

Posteriormente, con base en lo recabado en el análisis de requerimientos, creamos una lista 
de tablas candidatas. Esta lista describe cada una de las tablas que planeamos modelar, incluyendo los atributos de cada y los tipos de datos correspondientes.

[Archivo: Listado descriptivo](Listado_Descriptivo_Tablas.pdf)

Ahora bien, el siguiente paso es utilizar el listado descriptivo para crear el correspondiente
diagrama entidad relación.

[Archivo: Diagrama entidad relación](DiagramaEntidadRelacion/Diagrama_Entidad_Relacion.pdf)

[Link: Diagrama entidad relación en Miro](https://miro.com/app/board/o9J_lqlra88=/?share_link_id=144839627601)

Continuando, llevamos la estrcutura del diagrama entidad relación al diagrama relacional

[Archivo: Diagrama relaciona](Diagrama_Relacional.pdf)

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

