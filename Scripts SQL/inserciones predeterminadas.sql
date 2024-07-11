-- ###################################################
-- ### PROYECTO BBDD - Inserciones predeterminadas ###
-- ###################################################

INSERT INTO entidad_responsable (ID_Entidad, Nombre)
VALUES ('1', 'Entidad predeterminada');

INSERT INTO Departamento (ID_Departamento, Nombre, ID_Entidad)
VALUES ('1', 'Departamento predeterminado', '1'); 

INSERT INTO Parque (ID_Parque, Nombre, Fecha_Declaracion, Superficie_Total)
VALUES ('1', 'Parque predeterminado', '1111/11/11', '11.1');

INSERT INTO Departamento_parque (ID_Departamento, ID_Parque)
VALUES ('1','1');

INSERT INTO Area (ID_Area, Nombre, Extension, ID_Parque)
VALUES (1, 'Área Predeterminada', 100.00, 1);

INSERT INTO Especie (ID_Especie, Denominacion_Cientifica, Denominacion_Vulgar, Tipo)
VALUES ('1', 'Especie predeterminada', 'Especie predeterminada', 'Predeterminado');

INSERT INTO Especie_area (ID_Especie, ID_Area, Numero_Individuos)
VALUES ('1', '1', '10');

INSERT INTO Alojamiento (ID_Alojamiento, Capacidad, Categoria, ID_Parque)
VALUES ('1', '10', 'Predeterminado', '1');

INSERT INTO Visitante (ID_Visitante, Nombre, Direccion, Profesion)
VALUES ('1', 'Visitante predeterminado', 'Dirección predeterminada', 'Profesión predeterminada');

INSERT INTO Visitante_alojamiento (ID_Visitante, ID_Alojamiento)
VALUES ('1', '1');

INSERT INTO Personal (ID_Personal, Numero_Cedula, Nombre, Direccion, Telefonos, Movil, Sueldo, ID_Parque)
VALUES ('1', '1111111111', 'Personal predeterminado', 'Dirección predeterminada', '111111', '1111111111', 1000.1, '1' );

INSERT INTO Personal_Gestion (ID_Personal, ID_Entrada)
VALUES ('1', '1');

INSERT INTO Entrada (ID_Entrada, ID_Parque)
VALUES ('1', '1');

INSERT INTO Vehiculo (ID_Vehiculo, Tipo_Vehiculo, Marca_Vehiculo)
VALUES ('1', 'Tipo predeterminado', 'Marca predeterminada');

INSERT INTO Personal_Vigilancia (ID_Personal, ID_Area, ID_Vehiculo)
VALUES ('1', '1', '1');

INSERT INTO personal_conservacion (ID_Personal, ID_Area, Especialidad)
VALUES ('1', '1', 'Especialidad Predeterminada');

INSERT INTO proyecto_investigacion (ID_Proyecto, Nombre)
VALUES ('1', 'Proyecto predeterminado');

INSERT INTO personal_investigador (ID_Personal, Titulacion)
VALUES ('1', 'TItulación predeterminada');

INSERT INTO investigador_proyecto (ID_Personal, ID_Proyecto, ID_Especie)
VALUES ('1', '1', '1');

-- Desarrollado por:
-- Juan rivero / T.I 1096701639
-- Oliver López / T.I 1097911715