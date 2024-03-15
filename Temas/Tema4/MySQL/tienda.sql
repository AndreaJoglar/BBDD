DROP DATABASE IF EXISTS tiendab;
CREATE DATABASE tiendab CHARACTER SET utf8mb4;
USE tiendab;

CREATE TABLE fabricante (
id INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
id INT PRIMARY KEY, 
nombre VARCHAR(100),
precio DOUBLE,
id_fabricante INT,
FOREIGN KEY (id_fabricante) REFERENCES fabricante (id)
);

SHOW TABLES;

DESCRIBE fabricante;
DESCRIBE producto;

ALTER TABLE producto RENAME TO productos_informaticos;

SHOW TABLES;

ALTER TABLE fabricante
ADD provincia VARCHAR(20) AFTER id;
DESCRIBE fabricante;

ALTER TABLE fabricante
ADD garantia VARCHAR(50) AFTER nombre;
DESCRIBE fabricante;

ALTER TABLE fabricante
DROP garantia;
DESCRIBE fabricante;

CREATE TABLE alumno (
idAlumno INT PRIMARY KEY,
nombre VARCHAR(50)
);

INSERT INTO alumno VALUES 
(1, 'Antonio'),
(2, 'Pepa');
INSERT INTO alumno VALUES (3, 'Juanma');
INSERT INTO alumno VALUES (4, 'Marta');
INSERT INTO alumno (idAlumno, nombre) VALUES 
(5, 'Maricarmen'),
(6, 'Chechu');

SELECT * FROM alumno;

ALTER TABLE alumno
ADD notas DECIMAL(6,2) AFTER nombre;
DESCRIBE alumno;

UPDATE alumno SET notas = 9.3 WHERE idAlumno = 1;
UPDATE alumno SET notas = 3.5 WHERE idAlumno = 2;
UPDATE alumno SET notas = 8.8 WHERE idAlumno = 3;
UPDATE alumno SET notas = 6.5 WHERE idAlumno = 4;
UPDATE alumno SET notas = 10.0 WHERE idAlumno = 5;
UPDATE alumno SET notas = 9.1 WHERE idAlumno = 6;
SELECT * FROM alumno;

ALTER TABLE alumno
DROP notas;
DESCRIBE alumno;

DROP TABLE alumno;
SHOW TABLES;