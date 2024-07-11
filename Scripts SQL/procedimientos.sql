-- ######################################
-- ### PROYECTO BBDD - Procedimientos ###
-- ######################################

-- ## Número de parques naturales que tiene un departamento específico, ##
DELIMITER //

CREATE PROCEDURE Num_Parques_Departamento (
    IN p_id_departamento INT
)
BEGIN
    SELECT COUNT(*) AS Numero_Parques
    FROM Departamento_Parque
    WHERE ID_Departamento = p_id_departamento;
END //

DELIMITER ;

-- ## superficie total declarada de un parque natural específico ##
DELIMITER //

CREATE PROCEDURE Superficie_Total_Parque (
    IN p_id_parque INT
)
BEGIN
    SELECT SUM(Superficie_Total) AS Superficie_Total
    FROM Parque
    WHERE ID_Parque = p_id_parque;
END //

DELIMITER ;

-- ## todas las especies y su cantidad por área en un parque natural ##
DELIMITER //

CREATE PROCEDURE Especies_Area (
    IN p_id_parque INT
)
BEGIN
    SELECT a.Nombre AS Nombre_Area, e.Denominacion_Cientifica, e.Denominacion_Vulgar, ea.Numero_Individuos
    FROM Area a
    INNER JOIN Especie_Area ea ON a.ID_Area = ea.ID_Area
    INNER JOIN Especie e ON ea.ID_Especie = e.ID_Especie
    WHERE a.ID_Parque = p_id_parque;
END //

DELIMITER ;

-- ## cantidad de visitantes alojados en cada alojamiento de un parque ##
DELIMITER //

CREATE PROCEDURE Cant_Visitantes_Alojados_Parque (
    IN p_id_parque INT
)
BEGIN
    SELECT a.ID_Alojamiento, COUNT(va.ID_Visitante) AS Numero_Visitantes
    FROM Alojamiento a
    LEFT JOIN Visitante_Alojamiento va ON a.ID_Alojamiento = va.ID_Alojamiento
    WHERE a.ID_Parque = p_id_parque
    GROUP BY a.ID_Alojamiento;
END //

DELIMITER ;

-- ## todos los proyectos de investigación en un parque natural ##
DELIMITER //

CREATE PROCEDURE Proyectos_Investigacion (
    IN p_id_parque INT
)
BEGIN
    SELECT pi.ID_Proyecto, pi.Nombre AS Nombre_Proyecto
    FROM Proyecto_Investigacion pi
    INNER JOIN Investigador_Proyecto ip ON pi.ID_Proyecto = ip.ID_Proyecto
    INNER JOIN Personal p ON ip.ID_Personal = p.ID_Personal
    WHERE p.ID_Parque = p_id_parque
    GROUP BY pi.ID_Proyecto;
END //

DELIMITER ;

-- ## todo el personal de un tipo específico en un parque natural ##
DELIMITER //

CREATE PROCEDURE Personal_Tipo (
    IN p_tipo_personal ENUM('001', '002', '003', '004'),
    IN p_id_parque INT
)
BEGIN
    SELECT *
    FROM Personal
    WHERE Tipo_Personal = p_tipo_personal
    AND ID_Parque = p_id_parque;
END //

DELIMITER ;

-- ## las áreas de un parque natural que no tienen especies registradas ##
DELIMITER //

CREATE PROCEDURE Areas_Sin_Especie (
    IN p_id_parque INT
)
BEGIN
    SELECT a.Nombre AS Nombre_Area
    FROM Area a
    LEFT JOIN Especie_Area ea ON a.ID_Area = ea.ID_Area
    WHERE ea.ID_Especie IS NULL
    AND a.ID_Parque = p_id_parque;
END //

DELIMITER ;

-- ## alojamientos disponibles y su capacidad restante en un parque natural ##
DELIMITER //

CREATE PROCEDURE Alojamientos_Disponibles (
    IN p_id_parque INT
)
BEGIN
    SELECT a.ID_Alojamiento, a.Capacidad, COUNT(va.ID_Visitante) AS Visitantes_Actuales, (a.Capacidad - COUNT(va.ID_Visitante)) AS Capacidad_Disponible
    FROM Alojamiento a
    LEFT JOIN Visitante_Alojamiento va ON a.ID_Alojamiento = va.ID_Alojamiento
    WHERE a.ID_Parque = p_id_parque
    GROUP BY a.ID_Alojamiento;
END //

DELIMITER ;

-- ## entidades responsables de los parques en un departamento específico ##
DELIMITER //

CREATE PROCEDURE Entidades_Responsables (
    IN p_id_departamento INT
)
BEGIN
    SELECT er.Nombre AS Nombre_Entidad, d.Nombre AS Nombre_Departamento
    FROM Entidad_Responsable er
    INNER JOIN Departamento d ON er.ID_Departamento = d.ID_Departamento
    WHERE d.ID_Departamento = p_id_departamento;
END //

DELIMITER ;

-- ## personal asignado a cada área de un parque natural ##
DELIMITER //

CREATE PROCEDURE Personal_Area (
    IN p_id_parque INT
)
BEGIN
    SELECT a.Nombre AS Nombre_Area, p.Nombre AS Nombre_Personal, p.Tipo_Personal
    FROM Personal p
    INNER JOIN Area a ON p.ID_Parque = a.ID_Parque AND p.ID_Area = a.ID_Area
    WHERE p.ID_Parque = p_id_parque;
END //

DELIMITER ;

-- Desarrollado por:
-- Juan rivero / T.I 1096701639
-- Oliver López / T.I 1097911715