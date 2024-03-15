# CONSULTAS 2 SOBRE BASE DE DATOS NEPTUNO

# 16- Mostrar los nombreCompañia,ciudad y codpostal de todos los CLIENTES cuyo
# códigopostal tenga una longitud de 5 caracteres
SELECT nombreCompañia, ciudad, codPostal FROM clientes WHERE char_length(codPostal) = 5;

# 17- Mostrar de la tabla de empleados, el nombre, apellidos y cargo con el siguiente formato: Nombre, Apellidos (Cargo)
# tiene que aparecer todo en una sola columna que tendrá el nombre de Empleados)
SELECT concat_ws(" ", nombre, apellidos, "(", cargo, ")") AS "Empleados" FROM empleados;


/* 18-  Mostrar los nombre de los productos, el precio por unidad y el nombre del producto reemplazando
 el texto ‘Queso’ por ‘CHEESE’ de todos los PRODUCTOS que contengan el texto ‘queso’en cualquier parte 
 del nombre */
 /* El ejercicio anterior no sustituye la palabra 'queso' que se encuentra en mitad de la descripción del producto.
    modificar la sentencia anterior para que también lo sustituya */
SELECT nombreProducto, precioUnidad, REPLACE (lower(nombreProducto), "queso", "Cheese") FROM productos;

 
 /* 19-  Mostrar el nombre y el precio por unidad de todos los PRODUCTOS aplicándoles todas las
 funciones de redondeo(ROUND,FLOOR,CEIL). Mostrar únicamente los productos que tienen 
 idCategoria con valor 1 */
SELECT nombreProducto, round(precioUnidad) FROM productos WHERE idCategoria = 1;
SELECT nombreProducto, floor(precioUnidad) FROM productos WHERE idCategoria = 1;
SELECT nombreProducto, ceil(precioUnidad) FROM productos WHERE idCategoria = 1;

 /* 20-  Mostrar de la tabla de PEDIDOS: idcliente, idpedido, fechapedido, fechaenvio,
 fechaentrega,número de días transcurridos desde que se envió el pedido hasta
 que lo recibió el cliente y cargo del pedido de todos los pedidos cuyo idCliente
 sea ‘WELLI’.*/
 
 SELECT idCliente, idPedido, fechaPedido, fechaEnvio, fechaEntrega, datediff(fechaEntrega, fechaEnvio), cargo 
 FROM pedidos WHERE idCliente LIKE "WELLI";
 

 