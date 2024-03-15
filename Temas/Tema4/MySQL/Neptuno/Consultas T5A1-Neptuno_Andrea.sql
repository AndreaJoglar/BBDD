# ACTIVIDAD T5A1 - Consultas sobre la base de datos Neptuno

# 1: Mostrar toods los empleados
SELECT * FROM empleados;

# 2: Mostrar el nombre y los aplellidos de todso los empleados
SELECT nombre, apellidos FROM empleados;

#3 mostrar todas las tablas de la base de datos
SHOW TABLES;

# 4 mostrar la estructura de la tabla empleados
DESCRIBE empleados;

#5 Ejemplo 03: Mostrar el nombre, apellidos  y ciudad de todos los empleados que vivan en la ciudad de Londres 
SELECT nombre, apellidos, ciudad FROM empleados WHERE ciudad = "Londres";


#7  Mostrar el nombre de los empleados y su identificacador de todos los empleados que tengan un código entre 3 y 7 
SELECT nombre, IdEmpleado FROM empleados WHERE IdEmpleado BETWEEN 3 AND 7;


#8 haz el ejercicio anterior de otra forma distinta
SELECT nombre, IdEmpleado FROM empleados WHERE IdEmpleado >=3 AND IdEmpleado<=7; 


#9 mostrar todos los países de la tabla clientes, eliminando los paises repetidos.
SELECT DISTINCT Pais FROM clientes;


# 10 Mostrar el identificador y cargo de todas las categorías
SELECT IdCategoria, NombreCategoria FROM categorias;

# 11 selecciona ei idntificador y fecha del pedido y la ciudadDestinatario de todos los pedidos con fecha de envío superior al 1-12-1997
SELECT IdPedido, FechaPedido, CiudadDestinatario FROM pedidos WHERE FechaEnvio > '1997-12-01';

#:12 Mostrar todos los 	productos que empiecen por ‘M'
 SELECT NombreProducto FROM productos WHERE NombreProducto LIKE 'M%';


# 13 Mostrar todos los productos que lleven la palabra chocolate
SELECT NombreProducto FROM productos WHERE NombreProducto LIKE '%chocolate%';


# 14 Mostrar el nombre de la compañía (nombreCompañia) de la tabla clientes que no tengan region asignada
SELECT nombreCompañia FROM clientes WHERE Region IS NULL;


# 15 Mostrar el nombre de la compañía (nombreCompañia) de todos los proveedores cuya region sea Oviedo, Madrid, Berlin
SELECT nombreCompañia FROM proveedores WHERE Ciudad = 'Oviedo' OR Ciudad = 'Madrid' OR Ciudad = 'Berlín';



  
  
  

  
 
