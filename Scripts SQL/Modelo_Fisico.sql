-- ##########################################################
-- ### PROYECTO BBDD - Creación de tablas (Modelo físico) ###
-- ##########################################################

CREATE DATABASE IF NOT EXISTS Ambientales;

USE Ambientales;

CREATE TABLE Entidad_Responsable (
   ID_Entidad INT NOT NULL PRIMARY KEY,
   Nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Departamento (
   ID_Departamento INT NOT NULL PRIMARY KEY,
   Nombre VARCHAR(60) NOT NULL,
   ID_Entidad INT,
   FOREIGN KEY (ID_Entidad) REFERENCES Entidad_Responsable(ID_Entidad)
);

CREATE TABLE Parque (
    ID_Parque INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(255) NOT NULL,
    Fecha_Declaracion DATE NOT NULL,
    Superficie_Total DECIMAL(10,2) NOT NULL,
    Num_Entradas int
);

CREATE TABLE Departamento_Parque (
    ID_Departamento INT NOT NULL,
    ID_Parque INT NOT NULL,
    PRIMARY KEY (ID_Departamento, ID_Parque),
    FOREIGN KEY (ID_Departamento) REFERENCES Departamento(ID_Departamento),
    FOREIGN KEY (ID_Parque) REFERENCES Parque(ID_Parque)
);

CREATE TABLE Area (
    ID_Area INT PRIMARY KEY auto_increment,
    Nombre VARCHAR(255) NOT NULL,
    Extension DECIMAL(10,2) NOT NULL,
    ID_Parque INT NOT NULL,
    FOREIGN KEY (ID_Parque) REFERENCES Parque(ID_Parque)
);

CREATE TABLE Especie (
    ID_Especie INT PRIMARY KEY auto_increment,
    Denominacion_Cientifica VARCHAR(255) NOT NULL,
    Denominacion_Vulgar VARCHAR(255) NOT NULL,
    Tipo ENUM('Predeterminado', 'Vegetal', 'Animal', 'Mineral') NOT NULL
);

CREATE TABLE Especie_Area (
    ID_Especie INT,
    ID_Area INT,
    Numero_Individuos INT,
    PRIMARY KEY (ID_Especie, ID_Area),
    FOREIGN KEY (ID_Especie) REFERENCES Especie(ID_Especie),
    FOREIGN KEY (ID_Area) REFERENCES Area(ID_Area)
);

CREATE TABLE Alojamiento (
    ID_Alojamiento INT NOT NULL PRIMARY KEY,
    Capacidad INT NOT NULL,
    Categoria VARCHAR(60) NOT NULL,
    ID_Parque INT NOT NULL,
    FOREIGN KEY (ID_Parque) REFERENCES Parque(ID_Parque)
);

CREATE TABLE Visitante (
    ID_Visitante INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    Profesion VARCHAR(255) NOT NULL
);

CREATE TABLE Visitante_Alojamiento (
    ID_Visitante INT NOT NULL,
    ID_Alojamiento INT,
    PRIMARY KEY (ID_Visitante, ID_Alojamiento),
    FOREIGN KEY (ID_Visitante) REFERENCES Visitante(ID_Visitante),
    FOREIGN KEY (ID_Alojamiento) REFERENCES Alojamiento(ID_Alojamiento)
);

CREATE TABLE Personal (
    ID_Personal INT NOT NULL PRIMARY KEY auto_increment,
    Numero_Cedula VARCHAR(20) NOT NULL,
    Nombre VARCHAR(255) NOT NULL,
    Direccion VARCHAR(255) NOT NULL,
    Telefonos VARCHAR(255) NOT NULL,
    Movil VARCHAR(20) NOT NULL,
    Sueldo DECIMAL(10,2) NOT NULL,
    Tipo_Personal ENUM('001', '002', '003', '004') NOT NULL,
    ID_Parque INT NOT NULL,
    FOREIGN KEY (ID_Parque) REFERENCES Parque(ID_Parque)
);

CREATE TABLE Personal_Gestion (
    ID_Personal INT NOT NULL PRIMARY KEY,
    ID_Entrada INT,
    FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal)
);

CREATE TABLE Entrada (
	ID_Entrada INT NOT NULL PRIMARY KEY,
	ID_Parque INT,
	FOREIGN KEY (ID_Parque) REFERENCES Parque(ID_Parque)
);

CREATE TABLE Vehiculo (
	ID_Vehiculo INT NOT NULL PRIMARY KEY,
	Tipo_Vehiculo VARCHAR(50),
	Marca_Vehiculo VARCHAR(50)
);

CREATE TABLE Personal_Vigilancia (
    ID_Personal INT NOT NULL PRIMARY KEY,
    ID_Area INT,
    ID_Vehiculo INT,
    FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal),
    FOREIGN KEY (ID_Area) REFERENCES Area(ID_Area),
    FOREIGN KEY (ID_Vehiculo) REFERENCES Vehiculo(ID_Vehiculo)
);

CREATE TABLE Personal_Conservacion (
    ID_Personal INT NOT NULL PRIMARY KEY,
    ID_Area INT,
    Especialidad VARCHAR(50),
    FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal),
    FOREIGN KEY (ID_Area) REFERENCES Area(ID_Area)
);

CREATE TABLE Proyecto_Investigacion (
    ID_Proyecto INT NOT NULL PRIMARY KEY auto_increment,
    Nombre VARCHAR(255) NOT NULL
);

CREATE TABLE Personal_Investigador (
    ID_Personal INT NOT NULL PRIMARY KEY,
    Titulacion VARCHAR(255),
    FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal)
);

CREATE TABLE Investigador_Proyecto (
    ID_Personal INT NOT NULL,
    ID_Proyecto INT,
    ID_Especie INT,
    PRIMARY KEY (ID_Personal, ID_Proyecto, ID_Especie),
    FOREIGN KEY (ID_Personal) REFERENCES Personal(ID_Personal),
    FOREIGN KEY (ID_Proyecto) REFERENCES Proyecto_Investigacion(ID_Proyecto),
    FOREIGN KEY (ID_Especie) REFERENCES Especie(ID_Especie)
);

-- Desarrollado por:
-- Juan rivero / T.I 1096701639
-- Oliver López / T.I 1097911715
