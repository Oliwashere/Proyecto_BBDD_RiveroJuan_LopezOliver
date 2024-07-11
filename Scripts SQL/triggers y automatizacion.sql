-- #################################################
-- ### PROYECTO BBDD - Triggers y Automatización ###
-- #################################################

-- ## Usar la base de datos ## 
use Ambientales; 

-- ## Añadir nuevo personal ##
DELIMITER //

CREATE TRIGGER after_personal_insert
AFTER INSERT ON Personal
FOR EACH ROW
BEGIN
    IF NEW.Tipo_Personal = '001' THEN
        INSERT INTO Personal_Gestion (ID_Personal) VALUES (NEW.ID_Personal);
    ELSEIF NEW.Tipo_Personal = '002' THEN
        INSERT INTO Personal_Vigilancia (ID_Personal) VALUES (NEW.ID_Personal);
    ELSEIF NEW.Tipo_Personal = '003' THEN
        INSERT INTO Personal_Conservacion (ID_Personal) VALUES (NEW.ID_Personal);
    ELSEIF NEW.Tipo_Personal = '004' THEN
        INSERT INTO Personal_Investigador (ID_Personal) VALUES (NEW.ID_Personal);
        INSERT INTO Investigador_Proyecto (ID_Personal, ID_Proyecto, ID_Especie) VALUES (NEW.ID_Personal, 1, 1);
    END IF;
END;

//

DELIMITER ;

-- ## Eliminar personal ##
DELIMITER //

CREATE TRIGGER delete_personal_insert
BEFORE DELETE ON Personal
FOR EACH ROW
BEGIN
    DELETE FROM Personal_Gestion WHERE ID_Personal = OLD.ID_Personal;
    DELETE FROM Personal_Vigilancia WHERE ID_Personal = OLD.ID_Personal;
    DELETE FROM Personal_Conservacion WHERE ID_Personal = OLD.ID_Personal;
    DELETE FROM Personal_Investigador WHERE ID_Personal = OLD.ID_Personal;
    DELETE FROM Investigador_Proyecto WHERE ID_Personal = OLD.ID_Personal;
END;

//

DELIMITER ;

-- ## Añadir nueva especie ##
DELIMITER //

CREATE TRIGGER after_especie_insert
AFTER INSERT ON Especie
FOR EACH ROW
BEGIN
    INSERT INTO Especie_Area (ID_Especie, ID_Area) 
    VALUES (NEW.ID_Especie, 1);
END;

//

DELIMITER ;

-- ## Eliminar especie ##
DELIMITER //

CREATE TRIGGER delete_especie_insert
BEFORE DELETE ON Especie
FOR EACH ROW
BEGIN
    DELETE FROM Especie_Area WHERE ID_Especie = OLD.ID_Especie;
    UPDATE Investigador_Proyecto SET ID_Especie = 1 WHERE ID_Especie = OLD.ID_Especie;
END;

//

DELIMITER ;

-- ## Añadir nuevo visitante ##
DELIMITER //

CREATE TRIGGER after_visitante_insert
AFTER INSERT ON Visitante
FOR EACH ROW
BEGIN
    INSERT INTO Visitante_Alojamiento (ID_Visitante, ID_Alojamiento) 
    VALUES (NEW.ID_Visitante, 1);
END;

//

DELIMITER ;

-- ## Eliminar visitante ##
DELIMITER //

CREATE TRIGGER delete_visitante_insert
BEFORE DELETE ON Visitante
FOR EACH ROW
BEGIN
    DELETE FROM Visitante_Alojamiento WHERE ID_Visitante = OLD.ID_Visitante;
END;

//

DELIMITER ;

-- ## Eliminar proyecto ##
DELIMITER //

CREATE TRIGGER delete_proyecto_insert
BEFORE DELETE ON Proyecto_Investigacion
FOR EACH ROW
BEGIN
    UPDATE Investigador_Proyecto SET ID_Proyecto = 1 WHERE ID_Proyecto = OLD.ID_Proyecto;
END;

//

DELIMITER ;

-- ###############
-- ## Funciones ##
-- ###############

-- ## Insertar personal ##
DELIMITER //

CREATE PROCEDURE insertar_personal(
    IN p_Numero_Cedula VARCHAR(20),
    IN p_Nombre VARCHAR(255),
    IN p_Direccion VARCHAR(255),
    IN p_Telefonos VARCHAR(255),
    IN p_Movil VARCHAR(20),
    IN p_Sueldo DECIMAL(10,2),
    IN p_Tipo_Personal ENUM('001', '002', '003', '004'),
    IN p_ID_Parque INT
)
BEGIN
    DECLARE new_ID_Personal INT;

    INSERT INTO Personal (
        Numero_Cedula, Nombre, Direccion, Telefonos, Movil, Sueldo, Tipo_Personal, ID_Parque
    ) VALUES (
        p_Numero_Cedula, p_Nombre, p_Direccion, p_Telefonos, p_Movil, p_Sueldo, p_Tipo_Personal, p_ID_Parque
    );

    SET new_ID_Personal = LAST_INSERT_ID();

    SELECT new_ID_Personal AS ID_Nuevo_Personal;
END;

//

DELIMITER ;

-- ## Insertar visitante ##
DELIMITER //

CREATE PROCEDURE insertar_visitante(
    IN p_Nombre VARCHAR(255),
    IN p_Direccion VARCHAR(255),
    IN p_Profesion VARCHAR(255),
    IN p_ID_Alojamiento INT
)
BEGIN
    DECLARE new_ID_Visitante INT;

    INSERT INTO Visitante (
        Nombre, Direccion, Profesion
    ) VALUES (
        p_Nombre, p_Direccion, p_Profesion
    );

    SET new_ID_Visitante = LAST_INSERT_ID();

    INSERT INTO Visitante_Alojamiento (
        ID_Visitante, ID_Alojamiento
    ) VALUES (
        new_ID_Visitante, p_ID_Alojamiento
    );

    SELECT new_ID_Visitante AS ID_Nuevo_Visitante;
END;

//

DELIMITER ;

-- ## Insertar especie ##
DELIMITER //

CREATE PROCEDURE insertar_especie(
    IN p_Denominacion_Cientifica VARCHAR(255),
    IN p_Denominacion_Vulgar VARCHAR(255),
    IN p_Tipo ENUM('Vegetal', 'Animal', 'Mineral'),
    IN p_ID_Area INT
)
BEGIN
    DECLARE new_ID_Especie INT;

    INSERT INTO Especie (
        Denominacion_Cientifica, Denominacion_Vulgar, Tipo
    ) VALUES (
        p_Denominacion_Cientifica, p_Denominacion_Vulgar, p_Tipo
    );

    SET new_ID_Especie = LAST_INSERT_ID();

    INSERT INTO Especie_Area (
        ID_Especie, ID_Area, Numero_Individuos
    ) VALUES (
        new_ID_Especie, p_ID_Area, NULL
    );

    SELECT new_ID_Especie AS ID_Nueva_Especie;
END;

//

DELIMITER ;

-- ## Insertar proyecto ##
DELIMITER //

CREATE PROCEDURE insertar_proyecto(
    IN p_Nombre VARCHAR(255)
)
BEGIN
    DECLARE new_ID_Proyecto INT;

    INSERT INTO Proyecto_Investigacion (
        Nombre
    ) VALUES (
        p_Nombre
    );

    -- Obtener el ID del nuevo registro
    SET new_ID_Proyecto = LAST_INSERT_ID();

    -- Devolver el ID del nuevo registro
    SELECT new_ID_Proyecto AS ID_Nuevo_Proyecto;
END;

//

DELIMITER ;

-- Desarrollado por:
-- Juan rivero / T.I 1096701639
-- Oliver López / T.I 1097911715