DROP DATABASE IF EXISTS bddiscografica;
CREATE DATABASE bddiscografica CHARACTER SET utf8mb4;
USE bddiscografica;

CREATE TABLE discografica(
idDiscografica CHAR(3) PRIMARY KEY,
direccion VARCHAR(100),
nombre VARCHAR(50)
);

CREATE TABLE cantante(
idCantante INT PRIMARY KEY,
nombre VARCHAR(100),
direccion VARCHAR(100),
telefono CHAR(9),
idDiscografica CHAR(3),
FOREIGN KEY (idDiscografica) REFERENCES discografica(idDiscografica)
);

CREATE TABLE disco(
idDisco INT PRIMARY KEY,
nombre VARCHAR(100),
estilo VARCHAR(50),
duracion TIME,
idCantante INT,
FOREIGN KEY (idCantante) REFERENCES cantante(idCantante)
);

SHOW TABLES;

INSERT INTO discografica VALUES
("071", "Direccion1", "Universal"),
("046", "Direccion2", "Sony")
;

SELECT * FROM discografica;

ALTER TABLE cantante
ADD nombre_artistico VARCHAR(50) AFTER nombre;

SELECT * FROM cantante;

SHOW DATABASES;
SHOW TABLES;
DESCRIBE cantante;
ALTER TABLE disco
RENAME album;
SHOW TABLES;