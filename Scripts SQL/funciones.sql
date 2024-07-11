-- #################################
-- ### PROYECTO BBDD - Funciones ###
-- #################################

-- ## Insertar personal ##

CALL insertar_personal(
    '1234567890',            -- Numero_Cedula
    'Personal ejemplo',      -- Nombre
    'Direccion ejemplo 123', -- Direccion
    '123-1234',              -- Telefonos
    '123-1234',              -- Movil
    1000.00,                 -- Sueldo
    '4',                     -- Tipo_Personal
    1                        -- ID_Parque
);

-- ## Insertar visitante ##
CALL insertar_visitante(
    'Visitante ejemplo',             -- Nombre
    'Direccion ejemplo 123', -- Dirección 
    'Profesión ejemplo',               -- Profesión
    1                          -- ID del alojamiento destinado
);

-- ## Insertar especie ##
CALL insertar_especie(
    'Cientifico ejemplo',            -- Nombre científico
    'Vulgar ejemplo',                    -- Nombre vulgar
    'Animal',                  -- Tipo
    1                          -- ID del area destinada
);

-- ## Insertar proyecto ##
CALL insertar_proyecto(
    'Proyecto ejemplo'  -- Nombre del proyecto
);

-- ## Eliminar Proyecto ##
DELETE FROM Proyecto_Investigacion WHERE ID_Proyecto = '2';

-- ## Eliminar personal ##
DELETE FROM Personal WHERE ID_Personal = 'id';

-- ## Eliminar visitante ##
DELETE FROM Visitante WHERE ID_Visitante ='id';

-- ## Eliminar especie ##
DELETE FROM Especie WHERE ID_Especie = 'id';

-- ## Ver y actualizar personal ##
select * from Personal;

-- ## Ver y actualizar Especie ##
select * from Especie;

-- ## Ver y actualizar visitantes ##
select * from Visitante;

-- ## Ver y actualizar Personal ##
select * from Personal;

-- ## Ver y actualizar Proyecto_Investigacion ##
select * from Proyecto_Investigacion;

-- Desarrollado por:
-- Juan rivero / T.I 1096701639
-- Oliver López / T.I 1097911715