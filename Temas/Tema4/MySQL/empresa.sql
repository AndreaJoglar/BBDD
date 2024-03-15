DROP DATABASE IF EXISTS bdempresa;
CREATE DATABASE bdempresa CHARACTER SET utf8mb4;
USE bdempresa;

CREATE TABLE empresa(
cif CHAR(9) PRIMARY KEY,
nombre VARCHAR(50),
telefono CHAR(9),
direccion VARCHAR(100),
localidad VARCHAR(100),
provincia VARCHAR(50)
);

CREATE TABLE piezas(
tipo VARCHAR(50),
modelo VARCHAR(50),
precioVenta DOUBLE,
PRIMARY KEY (tipo, modelo)
);

CREATE TABLE suministros(
cif CHAR(9),
tipo VARCHAR(50),
modelo VARCHAR(50),
precioCompra DOUBLE,
FOREIGN KEY (cif) REFERENCES empresa(cif),
FOREIGN KEY (tipo, modelo) REFERENCES piezas(tipo, modelo),
PRIMARY KEY (cif, tipo, modelo)
);

CREATE TABLE existencias(
tipo VARCHAR(50),
modelo VARCHAR(50),
n_almacen INT,
cantidad INT,
FOREIGN KEY (tipo, modelo) REFERENCES piezas(tipo, modelo),
PRIMARY KEY (tipo, modelo, n_almacen)
);

DESCRIBE existencias;
