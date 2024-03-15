#Crear una base de datos llamada instituto
DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
USE instituto;

#Crear las tablas indicadas, dar un tipo adecuado a los atributos, claves primarias y foráneas
CREATE TABLE depto(
depto_id INT PRIMARY KEY,
nombre VARCHAR(20),
director VARCHAR(50),
descripcion VARCHAR(200)
);

CREATE TABLE profesor(
prof_id INT PRIMARY KEY,
depto_id INT,
FOREIGN KEY (depto_id) REFERENCES depto(depto_id),
nombre VARCHAR(50),
direccion VARCHAR(100),
telefono CHAR(9)
);

CREATE TABLE curso(
curso_id INT PRIMARY KEY,
prof_id INT,
FOREIGN KEY (prof_id) REFERENCES profesor(prof_id),
nombre VARCHAR(50),
nivel INT,
descripcion VARCHAR(200)
);

#Insertar datos en la tabla departamento
INSERT INTO depto VALUES
(1, "Informatica", "Manuel", "Departamento de Informatica"),
(2, "Lengua Extranjera", "Andres", "Departamento de Lengua Extranjera")
;

#Añadir un campo llamado subdirector detrás del campo director
ALTER TABLE depto ADD subdirector VARCHAR(50) AFTER director;

#Mostrar todas las bases de datos del servidor
SHOW DATABASES;

#Mostrar todas las tablas de la base de datos instituto
SHOW TABLES;

#Mostrar la estructura de la tabla profesor
DESCRIBE profesor;

#Cambiar el nombre de la tabla depto a departamento
RENAME TABLE depto TO departamento;




