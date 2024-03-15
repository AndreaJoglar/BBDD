# CONSULTAS BASE DE DATOS NEPTUNO

/*
EJEMPLO 35
 Mostrar a partir de la tabla de PEDIDOS:el nombre de la compañía de envío
 (utilizar el campo FormaEnvio en un CASE) y la suma de los cargos de los pedidos
 enviados con cada compañía,así como los cargos mínimo, medio y máximo
 */
 
 SELECT CASE FormaEnvio
 WHEN 1 THEN 'Speedy Express'
 WHEN 2 THEN 'United Package'
 ELSE 'Federal Shipping'
 END AS nombre_Compañia,
 SUM(cargo), MIN(cargo), AVG(cargo), MAX(cargo) 
 FROM pedidos GROUP BY FormaEnvio;

        
/* EJEMPLO 36
 Mostrar a partir de la tabla de clientes: los clientes agrupados por país y el nombre del país,
 de todos los países que empiecen por A
  */   
SELECT NombreCompañia AS clientes, Pais FROM clientes WHERE Pais LIKE 'A%' ORDER BY pais;

 
 /*
 Ejemplo 37 (ampliación al ejemplo 35: tabla Pdidos)
 Mejorar el ejemplo 35 para que además de mostrar los datos de los cargos medios, mínimos,
 máximos y suma de cargos,agrupados por formaenvío,también agrupe los pedidos por idempleado.
 Debe mostrar los datos como la tabla que aparece abajo.
 La consulta afectará solamente a los PEDIDOS de los años 1996 y 1997 (fechapedido)
 FORMATO TABLA:
 Empresa Transporte	Empleado	fechapedido		Suma Pedido  Pedido Máximo	Pedido Medio  Pedido Mínimo 
 */
 
 SELECT CASE FormaEnvio
 WHEN 1 THEN 'Speedy Express'
 WHEN 2 THEN 'United Package'
 ELSE 'Federal Shipping'
 END AS Empresa_Transporte, idEmpleado AS Empleado, fechaPedido,
 SUM(cargo) AS Suma_Pedido, MAX(cargo) AS Pedido_Maximo, AVG(cargo) AS Pedido_Medio, MIN(cargo) AS Pedido_Minimo  
 FROM pedidos WHERE year(fechaPedido) LIKE '1996' OR year(fechaPedido) LIKE'1997' GROUP BY FormaEnvio, idEmpleado, fechaPedido;
 
/*
 EJEMPLO 38
 Mostrar el año y el número de PEDIDOS realizados cada año. Recordad que existe una función 
 llamada YEAR(fecha) que devuelve el añode una fecha. Agrupar utilizando esta función
*/
SELECT count(idPedido), year(fechaPedido) FROM pedidos group by year(fechaPedido);
    
   /* 
    Ejemplo 39
 Mostrar cuánto hemos vendido (Cargo de PEDIDOS) agrupando los resultados por
 año y por PaisDestinatario de los pedidos, mostra también el país destinarario 
y el año del pedido*/
SELECT SUM(cargo), year(fechaPedido), paisDestinatario FROM pedidos GROUP BY year(fechaPedido), paisDestinatario;

