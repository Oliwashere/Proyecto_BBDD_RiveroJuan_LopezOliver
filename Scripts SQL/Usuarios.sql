-- ############################################################################
-- ### PROYECTO BBDD - Creación de Roles, usuarios y asignación de permisos ###
-- ############################################################################

use Ambientales;

-- ## Creación de roles ##

CREATE ROLE EntidadResponsable;
CREATE ROLE PersonalGestion;
CREATE ROLE PersonalInvestigacion;
CREATE ROLE Visitante;

-- ## Otorgamiento de permisos ##

GRANT SELECT, UPDATE ON Parque TO EntidadResponsable;
GRANT SELECT, UPDATE ON Departamento_Parque TO EntidadResponsable;
GRANT SELECT, UPDATE ON Entrada TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Vehiculo TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Personal TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Personal_Gestion TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Personal_Vigilancia TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Personal_Conservacion TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Personal_Investigador TO EntidadResponsable;
GRANT SELECT, INSERT, UPDATE, DELETE ON Visitante TO PersonalGestion;
GRANT SELECT, UPDATE ON Alojamiento TO PersonalGestion;
GRANT SELECT, INSERT, UPDATE ON Visitante_Alojamiento TO PersonalGestion;
GRANT SELECT, INSERT, UPDATE, DELETE ON Proyecto_Investigacion TO PersonalInvestigacion;
GRANT SELECT, INSERT, UPDATE, DELETE ON Especie TO PersonalInvestigacion;
GRANT SELECT, UPDATE ON Especie_Area TO PersonalInvestigacion;
GRANT SELECT ON Parque TO Visitante;
GRANT SELECT ON Alojamiento TO Visitante;
GRANT SELECT ON Visitante_Alojamiento TO Visitante;
GRANT SELECT ON Area TO Visitante;

-- ## Creación de usuarios ##

create user 'entidadr'@'%' identified by '}=45b+Ug:0b';
GRANT EntidadResponsable TO 'entidadr'@'%';
create user 'pgestion'@'%' identified by '+e61=xLT1,O';
GRANT PersonalGestion TO 'pgestion'@'%';
create user 'pinvestigacion'@'%' identified by ')I{413T.Z,n';
GRANT PersonalInvestigacion TO 'pinvestigacion'@'%';
create user 'visitante'@'%' identified by '3`R6Me@%(1!';
GRANT Visitante TO 'visitante'@'%';

-- Desarrollado por:
-- Juan rivero / T.I 1096701639
-- Oliver López / T.I 1097911715