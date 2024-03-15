DROP DATABASE IF EXISTS DBprueba;
CREATE DATABASE DBprueba;
USE DBprueba;

#Manera de poner comentarios
-- También se pueden poner así (siempre con espacio)
/*
Para comentar 
varias
líneas. 
*/
CREATE TABLE CLIENTE(
idCliente INT PRIMARY KEY,
nombre VARCHAR (50) NOT NULL,
direccion VARCHAR (50) NOT NULL,
telefono INT NOT NULL,
ciudad VARCHAR (50) NOT NULL
);
CREATE TABLE PRODUCTO(
idProducto INT PRIMARY KEY,
descripcion VARCHAR (200) NOT NULL,
precio INT NOT NULL
);
CREATE TABLE VENTA(
idVenta INT PRIMARY KEY,
cantidad INT NOT NULL,
idCliente INT NOT NULL REFERENCES CLIENTE,
idProducto INT NOT NULL REFERENCES PRODUCTO
);

INSERT INTO CLIENTE VALUES(123, 'Simón Bolivar', 'Avilés', 555111111, 'Cali');
INSERT INTO CLIENTE VALUES(456, 'Mark Zuckerberg', 'Xixón', 555222222, 'Medellín');
INSERT INTO CLIENTE VALUES(789, 'Drew Barrymore', 'Avilés', 555333333, 'Cali');
INSERT INTO CLIENTE VALUES(741, 'Larry Page', 'Uviéu', 555444444, 'Tunja');

#Selecciona todos los atributos de CLIENTE
SELECT * FROM CLIENTE; 

#Selecciona solo esos atributos de CLIENTE
SELECT idCliente, nombre FROM CLIENTE; 

#Selecciona los atributos de CLIENTE ordenados por nombre
SELECT * FROM CLIENTE ORDER BY nombre; 

#Selecciona los atributos de CLIENTE ordenando nombres en sentido descendente
SELECT * FROM CLIENTE ORDER BY nombre DESC; 

#Selecciona todos atributos de CLIENTE donde la ciudad es Cali
SELECT * FROM CLIENTE WHERE ciudad='Cali'; 

#Selecciona todos los atributos de CLIENTES cuyo nombre incluye una "g"
SELECT * FROM CLIENTE WHERE nombre LIKE '%g%'; 

#La barra baja indica que solo hay un caracter delante
SELECT * FROM CLIENTE WHERE nombre LIKE '_i%'; 