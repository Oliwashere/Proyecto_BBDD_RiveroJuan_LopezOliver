--Indexación de algunos atributos de tablas para mejorar el rendimiento a la hora de buscar

USE Ambientales;

-- Entidad_Responsable
CREATE INDEX idx_nombre_entidad_responsable ON Entidad_Responsable(Nombre);


-- Departamento
CREATE INDEX idx_nombre_departamento ON Departamento(Nombre);
CREATE INDEX idx_id_entidad_departamento ON Departamento(ID_Entidad);


-- Parque
CREATE INDEX idx_nombre_parque ON Parque(Nombre);
CREATE INDEX idx_fecha_declaracion_parque ON Parque(Fecha_Declaracion);


-- Departamento_Parque
CREATE INDEX idx_id_departamento_parque ON Departamento_Parque(ID_Departamento);
CREATE INDEX idx_id_parque_departamento_parque ON Departamento_Parque(ID_Parque);


-- Area
CREATE INDEX idx_nombre_area ON Area(Nombre);
CREATE INDEX idx_id_parque_area ON Area(ID_Parque);


-- Especie
CREATE INDEX idx_denominacion_cientifica_especie ON Especie(Denominacion_Cientifica);
CREATE INDEX idx_denominacion_vulgar_especie ON Especie(Denominacion_Vulgar);


-- Especie_Area
CREATE INDEX idx_id_especie_area ON Especie_Area(ID_Especie);
CREATE INDEX idx_id_area_especie_area ON Especie_Area(ID_Area);


-- Alojamiento
CREATE INDEX idx_categoria_alojamiento ON Alojamiento(Categoria);
CREATE INDEX idx_id_parque_alojamiento ON Alojamiento(ID_Parque);


-- Visitante
CREATE INDEX idx_nombre_visitante ON Visitante(Nombre);
CREATE INDEX idx_profesion_visitante ON Visitante(Profesion);


-- Visitante_Alojamiento
CREATE INDEX idx_id_visitante_alojamiento ON Visitante_Alojamiento(ID_Visitante);
CREATE INDEX idx_id_alojamiento_visitante_alojamiento ON Visitante_Alojamiento(ID_Alojamiento);


-- Personal
CREATE INDEX idx_numero_cedula_personal ON Personal(Numero_Cedula);
CREATE INDEX idx_nombre_personal ON Personal(Nombre);
CREATE INDEX idx_tipo_personal_personal ON Personal(Tipo_Personal);
CREATE INDEX idx_id_parque_personal ON Personal(ID_Parque);


-- Personal_Gestion
CREATE INDEX idx_id_entrada_personal_gestion ON Personal_Gestion(ID_Entrada);


-- Entrada
CREATE INDEX idx_id_parque_entrada ON Entrada(ID_Parque);


-- Vehiculo
CREATE INDEX idx_tipo_vehiculo ON Vehiculo(Tipo_Vehiculo);
CREATE INDEX idx_marca_vehiculo ON Vehiculo(Marca_Vehiculo);


-- Personal_Vigilancia
CREATE INDEX idx_id_area_personal_vigilancia ON Personal_Vigilancia(ID_Area);
CREATE INDEX idx_id_vehiculo_personal_vigilancia ON Personal_Vigilancia(ID_Vehiculo);


-- Personal_Conservacion
CREATE INDEX idx_id_area_personal_conservacion ON Personal_Conservacion(ID_Area);
CREATE INDEX idx_especialidad_personal_conservacion ON Personal_Conservacion(Especialidad);


-- Proyecto_Investigacion
CREATE INDEX idx_nombre_proyecto_investigacion ON Proyecto_Investigacion(Nombre);


-- Personal_Investigador
CREATE INDEX idx_titulacion_personal_investigador ON Personal_Investigador(Titulacion);


-- Investigador_Proyecto
CREATE INDEX idx_id_proyecto_investigador_proyecto ON Investigador_Proyecto(ID_Proyecto);
CREATE INDEX idx_id_especie_investigador_proyecto ON Investigador_Proyecto(ID_Especie);

