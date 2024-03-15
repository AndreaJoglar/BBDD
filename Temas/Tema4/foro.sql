DROP DATABASE IF EXISTS foro;
CREATE DATABASE foro CHARACTER SET utf8mb4;
USE foro;

CREATE TABLE usuario(
idUsuario VARCHAR(100) PRIMARY KEY,
nombre VARCHAR(100),
apellidos VARCHAR(100),
contrasenia VARCHAR(100),
email VARCHAR(100),
antiguedad INT
);

CREATE TABLE hilo(
idHilo INT PRIMARY KEY,
idUsuario VARCHAR(100),
FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario),
titulo VARCHAR(1000),
contenido VARCHAR(10000),
fechaCreacion DATE 
);

CREATE TABLE comentario(
idComent INT PRIMARY KEY,
idUsuario VARCHAR(100),
FOREIGN KEY (idUsuario) REFERENCES usuario (idUsuario),
idHilo INT,
FOREIGN KEY (idHilo) REFERENCES hilo (idHilo),
fechaComent DATE
);

SHOW TABLES;

