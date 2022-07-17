-- Procedimientos almacenados

CREATE OR REPLACE FUNCTION fnc_empleadonuevo(

-- Información del empleado nuevo
pnombre VARCHAR(30),
papp VARCHAR(30),
papm VARCHAR(30),
pnoss VARCHAR(11),
psexo VARCHAR(30),
pfecha_nac DATE,
prfc VARCHAR(13),
pfecha_inicio DATE,
ptelefono REAL,
psalario REAL,
phorario TEXT,
parea VARCHAR(20),

-- Puesto del empleado nuevo
ppuesto VARCHAR(30),

-- Atributos especificos de acuerdo al puesto de trabajo (referente a la tabla de dicho puesto de trabajo)
patributo_adicional VARCHAR(30),
patributo_adicional2 VARCHAR(30)
)
RETURNS VARCHAR
AS
$$
-- Declaración de variables
DECLARE vid_trabajador INTEGER;
        vpuesto INTEGER;
        vid_cajero INTEGER;
        vid_gerente INTEGER;
        vid_encargado_alm INTEGER;
        vid_empacador INTEGER;
        vid_encargado_os INTEGER;
        vid_trabajador_vig INTEGER;
        vid_trabajador_int INTEGER;
        vid_trabajador_cap INTEGER;

BEGIN

-- Definición de las variables:

-- (Cálculos automáticos de id's)
vid_trabajador = ( (SELECT MAX(id_trabajador) FROM empleado) + 1 );
vid_cajero = ( (SELECT MAX(id_cajero) FROM cajero) + 1 );
vid_gerente = ( (SELECT MAX(id_gerente) FROM gerente) + 1 );
vid_encargado_alm = ( (SELECT MAX(id_encargado_alm) FROM encargado_almacen) + 1 );
vid_empacador = ( (SELECT MAX(id_empacador) FROM empacador) + 1 );
vid_encargado_os = ( (SELECT MAX(id_encargado_os) FROM encargado_mostrador) + 1 );
vid_trabajador_vig = ( (SELECT MAX(id_trabajador_vig) FROM vigilancia) + 1 );
vid_trabajador_int = ( (SELECT MAX(id_trabajador_int) FROM intendencia) + 1 );
vid_trabajador_cap = ( (SELECT MAX(id_trabajador_cap) FROM capacitacion) + 1 );

-- (Cálculo automático del id_puesto de acuerdo al puesto del nuevo empleado)
vpuesto = (SELECT id_cpuesto FROM cpuesto WHERE puesto LIKE ppuesto);

-- Acciones:

-- 1. Tabla empleado
INSERT INTO empleado(id_trabajador, nombre, app, apm, noss, sexo, fecha_nac, rfc, fecha_inicio, telefono, salario,
                     horario, area)
VALUES (vid_trabajador, pnombre, papp, papm, pnoss, psexo, pfecha_nac, prfc, pfecha_inicio, ptelefono, psalario,
        phorario, parea);

-- 2. Tabla empleado_puesto:
INSERT INTO empleado_puesto(empleadoid_trabajador, cpuestoid_cpuesto) VALUES (vid_trabajador,vpuesto);

-- 3. Tabla respectiva del puesto de trabajo (según sea el caso)
    CASE
        WHEN (ppuesto = 'Cajero') THEN INSERT INTO cajero(id_cajero, no_caja, empleadoid_trabajador)
                                        VALUES (vid_cajero, CAST(patributo_adicional AS INTEGER), vid_trabajador);
        WHEN (ppuesto = 'Gerente') THEN INSERT INTO gerente(id_gerente, sucursal, empleadoid_trabajador)
                                        VALUES (vid_gerente, patributo_adicional, vid_trabajador);
        WHEN (ppuesto = 'Encargado de almacen') THEN INSERT INTO encargado_almacen(id_encargado_alm, no_computadora, empleadoid_trabajador)
                                        VALUES (vid_encargado_alm, CAST(patributo_adicional AS INTEGER), vid_trabajador);
        WHEN (ppuesto = 'Empacador') THEN INSERT INTO empacador(id_empacador, tipo_empacador, empleadoid_trabajador)
                                        VALUES (vid_empacador, patributo_adicional, vid_trabajador);
        WHEN (ppuesto = 'Encargado de mostrador') THEN INSERT INTO encargado_mostrador(id_encargado_os, no_ventas, empleadoid_trabajador)
                                        VALUES (vid_encargado_os, CAST(patributo_adicional AS INTEGER), vid_trabajador);
        WHEN (ppuesto = 'Vigilante') THEN INSERT INTO vigilancia(id_trabajador_vig, recorrido, equipo, empleadoid_trabajador)
                                        VALUES (vid_trabajador_vig, patributo_adicional, patributo_adicional2, vid_trabajador);
        WHEN (ppuesto = 'Encargado de Limpieza') THEN INSERT INTO intendencia(id_trabajador_int, materia_trabajo, uniformes_ototgados, empleadoid_trabajador)
                                        VALUES (vid_trabajador_int, patributo_adicional, patributo_adicional2, vid_trabajador);
        WHEN (ppuesto = 'Encargado de Capacitación') THEN INSERT INTO capacitacion(id_trabajador_cap, horas_completadas, zona_enfoque, empleadoid_trabajador)
                                        VALUES (vid_trabajador_cap, CAST(patributo_adicional AS INTEGER), patributo_adicional2, vid_trabajador);
        ELSE RETURN 'Puesto no encontrado';
        END CASE;
    RETURN 'Hecho';
END;
$$
LANGUAGE 'plpgsql';


--------------------------------------

CREATE OR REPLACE FUNCTION f_actualiz(
new_id_mayorista INTEGER,
pname VARCHAR
)
RETURNS INTEGER
AS
$$
BEGIN
    UPDATE mayorista
    set nombre = pname
    WHERE id_mayorista = new_id_mayorista;
    return 1;

end;
$$
LANGUAGE 'plpgsql' VOLATILE;
--COMPROBACIÓN:

SELECT * FROM f_actualiz(1,'Estratou');
SELECT * FROM mayorista WHERE id_mayorista=1;


---------------------
--Generalización:

CREATE OR REPLACE function fnc_update(ptabla varchar(30),
                                       patributo varchar(30),
                                       pvalor varchar(30),
                                       ptupla integer)
    returns integer
as
$$
BEGIN
    execute 'UPDATE ' || ptabla || ' SET ' || patributo || ' = ''' || pvalor || ''' WHERE id_' || ptabla || ' = ' ||
            ptupla || ';';
    return 1;
end;
$$
    language 'plpgsql' volatile;

SELECT * FROM fnc_update(ptabla := 'cliente', patributo := 'cliente_nuevo', pvalor :='b1', ptupla := 6);

SELECT * FROM cliente WHERE id_cliente=6;
