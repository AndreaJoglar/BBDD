#--Mostrar todos los campos de la tabla categorías
SELECT * FROM categorias;

#--Mostrar todos los paises distintos de la tabla clientes
SELECT DISTINCT pais FROM clientes;

#--Mostrar el nombreProducto y precioUnidad de todos los productos cuyo precioUnidad sea mayor que 100
SELECT nombreProducto, precioUnidad FROM productos WHERE precioUnidad > 100;

#--Mostrar el nombreProducto, precioUnidad y unidadesEnExistencia de todos los PRODUCTOS con precioUnidad comprendido entre 75 y 100
SELECT nombreProducto, precioUnidad, unidadesEnExistencia FROM productos
WHERE precioUnidad BETWEEN 75 AND 100;

#--Mostrar el nombre, apellidos y fechaContratacion de todos los EMPLEADOS contratados (FechaContratacion) antes del 01-02-1993
SELECT nombre, apellidos, fechaContratacion FROM empleados 
WHERE fechaContratacion < '1993-02-01';

#--Mostrar destinatario, fechaPedido y cargo de todos los PEDIDOS del segundo trimestre del año 1997
SELECT destinatario, fechaPedido, cargo FROM pedidos WHERE fechaPedido BETWEEN '1997-04-01' AND '1997-06-30';

#--Mostrar todos los CLIENTES cuyo nombreCompañia comience por ‘A’
SELECT * FROM clientes WHERE nombreCompañia LIKE 'A%';

#--Mostrar todos los CLIENTES cuyo nombreCompañia tenga una ‘A’ en el segundo carácter
SELECT * FROM clientes WHERE nombreCompañia LIKE '_A%';

#--Mostrar todos los CLIENTES cuyo nombreCompañia finalice con el texto “store”
SELECT * FROM clientes WHERE nombreCompañia LIKE '%store';

#--Mostrar todos los CLIENTES cuyo nombreCompañia NO comience por ‘A’
SELECT * FROM clientes WHERE nombreCompañia NOT LIKE 'A%';

#--Mostrar todos los PRODUCTOS cuyo nombreProducto contenga el texto “chocolate” en cualquier parte del nombreProducto
SELECT * FROM productos WHERE nombreProducto LIKE '%chocolate%';

#--Mostrar nombreproducto y preciounidad de todos los PRODUCTOS que se encuentren suspendidos. 
#--El valor del campo suspendido tiene que ser distinto de 0 (0 = FALSE).
SELECT nombreProducto, precioUnidad FROM productos WHERE suspendido IS TRUE;

#--Mostrar nombrecompañia, ciudad, pais, fax de los CLIENTES de los cuales no tengamos su número de fax (el valor del campo fax sea nulo).
SELECT nombreCompañia, ciudad, pais, fax FROM clientes WHERE fax IS NULL;

#--Mostrar los nombreCompañia, ciudad, region y pais de todos los PROVEESORES de los que conozcamos su región.
SELECT nombreCompañia, ciudad, region, pais FROM proveedores WHERE region IS NOT NULL;

#--Mostrar los nombreCompañia, ciudad, region y pais de todos los PROVEEDORES de Oviedo, Madrid o Berlín.
SELECT nombreCompañia, ciudad, region, pais FROM proveedores WHERE ciudad IN ('Oviedo', 'Madrid', 'Berlín');

#--Mostrar los nombreCompañia, ciudad y codpostal de todos los CLIENTES cuyo código postal tenga una longitud de 5 caracteres
SELECT nombreCompañia, ciudad, codPostal FROM clientes WHERE char_length(codPostal) = 5;

#--Mostrar de la tabla de EMPLEADOS, el nombre, apellidos y cargo con el siguiente formato: Nombre Apellidos (Cargo)
SELECT concat(nombre, " ", apellidos, " ", cargo) AS Empleado FROM empleados;

/*--Mostrar los nombreproducto, preciounidad y el nombreproducto reemplazando
el texto ‘Queso’ por ‘CHEESE’ de todos los PRODUCTOS que contengan el texto
‘queso’ en cualquier parte del nombre.*/
SELECT nombreProducto, REPLACE (nombreProducto,'Queso', 'Cheese') AS Producto, precioUnidad FROM productos 
WHERE nombreProducto LIKE '%queso%'; 

/*--Mostrar los precioUnidad de todos los PRODUCTOS aplicándoles todas las
funciones de redondeo (ROUND, FLOOR, CEIL). Mostrar únicamente los productos
que tienen idCategoria con valor 1.*/
SELECT nombreProducto, precioUnidad, ceil(precioUnidad) AS 'Hacia arriba', floor(precioUnidad)
 AS 'Hacia abajo', round(precioUnidad) AS 'Redondeo' FROM productos
WHERE idCategoria = 1;

/*Mostrar de la tabla de PEDIDOS: idcliente, idpedido, fechapedido, fechaenvio,
fechaentrega, número de días transcurridos desde que se envió el pedido hasta
que lo recibió el cliente y cargo del pedido de todos los pedidos cuyo idCliente
sea ‘WELLI’.*/
SELECT idCliente, idPedido, fechaPedido, fechaEnvio, fechaEntrega, datediff(fechaEntrega, fechaEnvio) AS 'Días transcurridos', cargo FROM pedidos
WHERE idCliente LIKE 'WELLI';

/*Mostrar todos los datos de los clientes cuyo
campo NombreCompañia tenga una
longitud inferior a 10 caracteres.*/
SELECT * FROM clientes WHERE char_length(nombreCompañia) < 10;

/*Mostrar los datos de todos los proveedores
añadiendo un nuevo campo que muestre
concatenados el CodPostal y la Ciudad.
Este campo tendrá el alias ‘Ubicación’.*/
SELECT concat(codPostal, ciudad) AS 'Ubicación' FROM proveedores;

/*Mostrar el NombreProducto y el
PrecioUnidad de todos los productos pero
mostrando los nombres de los productos en
mayúsculas.*/
SELECT upper(nombreProducto), precioUnidad FROM productos;

/*Mostrar todos los datos de los pedidos
indicando cuántos días tardó en llegar el
pedido cliente (diferencia entre la
fechaEntrega y la fechaPedido)*/
SELECT ALL datediff(fechaEntrega, fechaPedido) AS 'Días transcurridos' FROM pedidos;

#--¿Cuántos CLIENTES tenemos?
SELECT count(*) FROM clientes;

#--Mostrar el número de países diferentes que hay en la tabla de CLIENTES.
SELECT count(DISTINCT pais) FROM clientes;

#--Mostrar el cargo medio de los PEDIDOS realizados en el año 1996.
SELECT avg(cargo) FROM pedidos WHERE year(fechaPedido) = '1996';

#--Calcular los precioUnidad: mínimo, máximo y medio de todos los productos.
SELECT MIN(precioUnidad) AS 'Precio mínimo', MAX(precioUnidad) AS 'Precio máximo',
avg(precioUnidad) AS 'Precio medio' FROM productos;

#--Calcular la suma de los cargos de todos los pedidos con fechaPedido del año 1996.
SELECT sum(cargo) FROM pedidos WHERE year(fechaPedido) = 1996;

#--Calcular las fechapedido de los PEDIDOS más antiguo y más reciente.
SELECT MIN(fechaPedido) AS 'Más antiguo', MAX(fechaPedido) AS 'Más reciente' FROM pedidos;

#--Calcular cuántos PEDIDOS ha hecho el empleado con idEmpleado = 1
SELECT count(idPedido) AS 'Cantidad pedidos' FROM pedidos WHERE IdEmpleado = 1;

/*Queremos saber cuántas unidades hay en
stock de media de los PRODUCTOS. Se trata
de calcular la media del campo
UnidadesEnExistencia.*/
SELECT avg(unidadesEnExistencia) FROM productos;

/*Queremos hacer un descuento del 25% en todos nuestros PRODUCTOS. Mostrar el
nombreproducto, el precioUnidad sin y con descuento.*/
SELECT nombreProducto, precioUnidad AS 'Precio sin descuento', (precioUnidad - (precioUnidad * 0.25)) AS 'Precio con descuento'
FROM productos;

/*Queremos ver en una consulta sobre la tabla de PEDIDOS: el idpedido, idcliente,
idempleado, fechapedido, fechaentrega, número de días* transcurridos desde
el pedido hasta la entrega del mismo al cliente, cargo del pedido, comisión del
vendedor* (15%) y beneficio neto* (cargo-comisión: 85%). Solamente se
contemplarán los pedidos con FechaPedido a partir del 1 de enero de 1997 y
que se haya tardado menos de 30 días en entregar.*/
SELECT idPedido, idCliente, idEmpleado, fechaPedido, fechaEntrega, datediff(fechaEntrega, fechaPedido) AS 'Días transcurridos',
cargo, (cargo * 0.15) AS 'Comisión vendedor', (cargo * 0.85) AS 'Beneficio neto' FROM pedidos
WHERE fechaPedido > '1997-01-01' AND datediff(fechaEntrega, fechaPedido) < 30;

/*Se desea ver el nombreProducto, precioUnidad y unidadesEnExistencia de todos
los PRODUCTOS ordenados descendentemente por el precioUnidad.*/
SELECT nombreProducto, precioUnidad, unidadesEnExistencia FROM productos ORDER BY precioUnidad DESC;

/*Se desea ver el nombreCompañia, Ciudad y Pais de todos los CLIENTES
ordenados ascendentemente primero por el Pais, después por la Ciudad y por
último por el nombreCompañia.*/
SELECT nombreCompañia, ciudad, pais FROM clientes ORDER BY pais, ciudad, nombreCompañia;

/*Se desea ver el nombreProducto, precioUnidad y unidadesEnExistencia de los 8
PRODUCTOS más caros.*/
SELECT nombreProducto, precioUnidad, unidadesEnExistencia FROM productos ORDER BY precioUnidad DESC LIMIT 8;

/*Se desea ver el nombreProducto, precioUnidad y unidadesEnExistencia de los 6
productos siguientes al 4º producto más caro.*/
SELECT nombreProducto, precioUnidad, unidadesEnExistencia FROM productos ORDER BY precioUnidad DESC LIMIT 3, 6;

/*Se desea ver todos los datos de los 3 primeros
CLIENTES que comiencen por ‘B’. Los datos deben
ordenarse por el nombreCompañia.*/
SELECT * FROM clientes WHERE nombreCompañia LIKE 'B%' ORDER BY NombreCompañia LIMIT 3;

/*Se desea ver todos los datos de aquellos PEDIDOS
cuya fechaPedido pertenezca a la segunda
mitad del mes de agosto de 1996. Los resultados
deben mostrarse en orden descendente por el
Cargo del pedido. Solamente deben mostrarse las
10 primeras filas.*/
SELECT * FROM pedidos WHERE fechaPedido BETWEEN '1996-08-15' AND '1996-08-31' ORDER BY cargo DESC LIMIT 10;

/*Se desea ver de la tabla de PEDIDOS, el idCliente,
fechaPedido, Cargo, diferencia en días entre la
fechaPedido y la fechaEntrega; de todos aquellos
pedidos cuyo idCliente comience por ‘B’ , la
fechaPedido sea del año 1997.
Los resultados deben mostrarse ordenados
descendentemente por Días de diferencia y por
Cargo. Mostrar solamente las 15 primeras filas.*/
SELECT idCliente, fechaPedido, cargo, datediff(fechaEntrega, fechaPedido) FROM pedidos
WHERE idCliente LIKE 'B%' AND year(fechaPedido) ='1997' ORDER BY datediff(fechaEntrega, fechaPedido) DESC, cargo DESC LIMIT 15;

/*Se desea calcular el descuento aplicado a los PEDIDOS sabiendo que si el Cargo
del pedido es mayor de 200 se le aplica un 25% y en caso contrario le
aplicaremos un 10%. Mostrar el idPedido, fechaPedido, Destinatario y Cargo de
los pedidos, así como dicho descuento.*/
SELECT idPedido, fechaPedido, destinatario, cargo, IF (cargo >200, (cargo *0.25), (cargo * 0.1)) AS 'Descuento' FROM pedidos;

/*Se quiere hacer una consulta sobre la tabla de COMPAÑÍA que muestre: idPedido,
Destinatario, fechaPedido, Cargo y la compañía de envíos que se ha utilizado
para enviarlo. No debe aparecer el código de la compañía (campo
FormaEnvio), sino su nombre. Hacer la consulta anterior para los pedidos del mes
de septiembre de 1996.*/
SELECT idPedido, destinatario, fechaPedido, cargo, 
CASE formaEnvio
WHEN 1 THEN 'Speedy Express'
WHEN 2 THEN 'United Package'
WHEN 3 THEN 'Federal Shipping'
END AS 'Empresa Transporte'
FROM pedidos WHERE fechaPedido BETWEEN '1996-09-01' AND '1996-09-30';

/*Mostrar paises de clientes agrupados por pais*/
SELECT pais FROM clientes GROUP BY pais;

/*Calcular el número de CLIENTES que tenemos en cada país.*/
SELECT pais, count(*) AS 'NUM CLIENTES' FROM clientes GROUP BY pais;

/*Mostrar a partir de la tabla de PEDIDOS: el nombre de la compañía de envío
(utilizar el campo FormaEnvio en un CASE) y la suma de los cargos de los pedidos
enviados con cada compañía, así como los cargos mínimo, medio y máximo.*/
SELECT CASE formaEnvio
WHEN 1 THEN 'Speedy Express'
WHEN 2 THEN 'United Package'
WHEN 3 THEN 'Federal Shipping'
END AS 'Empresa Transporte',
sum(cargo) AS 'Suma cargos', min(cargo) AS 'Cargo mínimo', max(cargo) AS 'Cargo máximo', avg(cargo) AS 'Cargo promedio' FROM pedidos
GROUP BY FormaEnvio;

/*Calcular el número de CLIENTES que tenemos en cada país que empiece por A.*/
SELECT pais, count(*) FROM clientes GROUP BY pais HAVING pais LIKE 'A%';

/*Mostrar el número de PEDIDOS realizados cada año. Recordad que existe una
función llamada YEAR(fecha) que devuelve el año de una fecha. Agrupar
utilizando esta función*/
SELECT year(fechaPedido) AS 'AÑO', count(*) FROM pedidos group by year(fechaPedido);

/*Mostrar cuánto hemos vendido (Cargo de PEDIDOS) agrupando los resultados por
año y por PaisDestinatario de los pedidos.*/
SELECT year(fechaPedido) AS 'AÑO', sum(cargo), PaisDestinatario FROM pedidos GROUP BY year(fechaPedido), PaisDestinatario;

/*-----------SUBCONSULTAS----------------*/
/*Ver los datos de todos los empleados cuya fecha de contratación sea anterior a
la fecha del primer pedido que ha recibido la empresa*/
SELECT * FROM EMPLEADOS WHERE fechaContratacion < (SELECT MIN(fechaPedido) FROM pedidos);
SHOW TABLES;
DESCRIBE pedidos;