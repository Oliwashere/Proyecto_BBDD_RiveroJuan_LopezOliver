
# Proyecto BBDD

El Ministerio del Medio Ambiente ha decidido crear un Software que permita manejar los
datos e información que se generan sobre los parques naturales gestionados por cada
departamento.


## Autores

- [@Oliver Lopez](https://github.com/Oliwashere)
- [@Juan Rivero](https://github.com/juandariver9)


## Caso de estudio

Como parte del proceso de validación y estructuración de requerimientos en su primera
versión, determino las siguientes características para el diseño inicial del sistema:

1. Un departamento puede tener varios parques naturales.

2. Todo departamento tiene solo una entidad responsable de los parques.

3. Aunque un departamento tiene una entidad responsable para sus parques, dicha entidad puede ser responsable de parques en varios departamentos.

4. Un parque puede ser compartido por más de undepartamento.

5. Un parque natural se identifica por un nombre, el día en que fue declarado, tiene varias áreas identificadas por un nombre y una determinada extensión. Por motivos de eficiencia se desea favorecer las consultas que se refieran al número de parques existentes en cada departamento y la superficie total declarada de cada parque.

6. En cada área residen diferentes especies, las cuales pueden ser de tres (3) tipos:
Vegetales, Animales o Minerales.

7. Cada especie tiene una denominación científica, una denominación vulgar y un número de inventario de individuos por área.

8. Del personal del parque se guarda el número de cedula, nombre, dirección, teléfonos (incluido móvil) y sueldo. Se distinguen los siguientes tipos de personal:

8.1. 001: Personal de Gestión: Registra los datos de los visitantes del parque y están ubicados en las entradas del mismo, las cuales están identificadas con un número).

8.2. 002: Personal de Vigilancia: Vigila un área determinada del parque que recorre en un vehículo el cual está identificado por un tipo y una marca).

8.3. 003: Personal de Conservación: Mantiene y conserva un área determinada del parque. Cada uno lo realiza en una especialidad determinada (Limpieza, Caminos, etc.).

8.4. 004: Personal Investigador: Tiene una titulación y realizan funciones (incluso en equipo), a nivel de proyectos de investigación sobre una determinada especie. Un investigador trabaja en un proyecto analizando varias especies, una especie puede ser investigada por un investigador en varios proyectos y en un proyecto una especie puede ser investigada por varios investigadores.

9. Un proyecto de investigación tiene un presupuesto y un periodo de realización.

10. De un visitante se tiene identificación, nombre, dirección y profesión, puede alojarse en cualquiera de los alojamientos de los que dispone el parque los cuales tienen capacidad limitada y una categoría establecida.
## Requerimientos técnicos

Para desarrollar dicho proyecto se deben tener los siguientes puntos en cuenta: 

- Se puede realizar en equipos de 2 personas, las cuales deben aportar periódicamente al repositorio de GitHub. Para este caso, se creará un repositorio privado llamado “Proyecto_BBDD_Apellido1Nombre1” con dicho fin. Este será compartido como colaborador al correo [pedrogomez.campuslands@gmail.com](mailto:pedrogomez.campuslands@gmail.com)

- En dicho repositorio se agregara un documento formal tipo documentación, donde se haga los pasos generales aprendidos a lo largo de la formación de bases de datos:
    1. Extrapolación del caso de estudio hacia un modelo conceptual.

    2. Conversión formal del modelo conceptual al modelo lógico.

    3. Normalización hasta la 3FN de dicho modelo lógico.

    4. Conversión del modelo lógico a modelo físico.

    5. Construcción formal del modelo físico basado en SQL (Mínimo 100 inserciones por tabla donde aplique).

    6. Creación del modelo UML tipo E-R basado en el estándar de MySQL Workbench.
    
    7. Temas de estandarización de cuentas , funciones, transacciones, y demás elementos que hacen la construcción de un Sistema de Información ***bien documentada***.
    
    También se espera de los archivos necesarios, de manera secuencial, para la implementación y uso del Sistema de Información creado.
## Desarrollo/Resultados

Se documentó el proceso completo de realización del proyecto en el siguiente google docs:
- [Google docs](https://docs.google.com/document/d/1XMH0gMHXFwjiQUEFSdbeHZgvZyBGyqp5lge0dJ8T10Q/edit?usp=sharing)

Los diferentes scripts desarrollados para el proyecto se encuentran en el siguiente repositorio;
- [Github](https://github.com/Oliwashere/Proyecto_BBDD_RiveroJuan_LopezOliver)
## Referencias

Proyecto asignado para su debida realización y entrega:
- [Notion](https://hallowed-slug-719.notion.site/P-BD-1-Los-Ambientales-954b4c47d2464f7aa4ff615d810654a6)
