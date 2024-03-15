DROP DATABASE IF EXISTS prueba_db;
CREATE DATABASE prueba_db CHARACTER SET utf8mb4;
USE prueba_db;

CREATE TABLE discografica(
idDiscografica CHAR(3) PRIMARY KEY,
nombre VARCHAR(50), 
direccion VARCHAR(100)
);

CREATE TABLE cantante(
idCantante CHAR(3) PRIMARY KEY,
idDiscografica CHAR(3),
FOREIGN KEY (idDiscografica) REFERENCES discografica(idDiscografica),
nombre VARCHAR(50),
direccion VARCHAR(100),
telefono CHAR(9)
);

CREATE TABLE disco(
idDisco CHAR(3) PRIMARY KEY,
idCantante CHAR(3),
FOREIGN KEY (idCantante) REFERENCES cantante(idCantante),
nombre VARCHAR(50),
estilo VARCHAR(50),
duracion int
);

SHOW TABLES;
DESCRIBE cantante;

INSERT INTO discografica VALUES
('111', 'Universal', 'Calle Murcia'),
('222', 'MGM', 'Calle Pereza')
;

SELECT * FROM discografica;

ALTER TABLE discografica 
ADD nombre_artistico VARCHAR(50) AFTER nombre;

DESCRIBE discografica;

ALTER TABLE discografica 
RENAME disco_stu;

SHOW TABLES;

ALTER TABLE cantante CHANGE telefono mi_telefono CHAR(9);
DESCRIBE cantante;

ALTER TABLE cantante MODIFY nombre CHAR(50);
DESCRIBE cantante;

SELECT nombre FROM disco_stu WHERE nombre LIKE '%m%';