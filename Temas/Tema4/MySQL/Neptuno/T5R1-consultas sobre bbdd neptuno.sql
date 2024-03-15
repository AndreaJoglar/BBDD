use neptuno;
-- 1) Mostar el identificador de cada categoría, el número de productos que hay de cada categoría y el precio medio de ellos.
SELECT idCategoria, SUM(unidadesEnExistencia), AVG(precioUnidad) FROM productos GROUP BY idCategoria;


-- 2) misma consulta anterior pero mostrando solo dos decimales en el precio medio 
SELECT idCategoria, SUM(unidadesEnExistencia), round(AVG(precioUnidad), 2) FROM productos GROUP BY idCategoria;

-- 3) mostrar todos los pedidos cuyo destinatario comience por Fa
SELECT * FROM pedidos WHERE destinatario LIKE "Fa%";

-- 4) mostrar todos los pedidos que tengan como destino el portal nº 10 de cualquier calle
SELECT * FROM pedidos WHERE direccionDestinatario LIKE "%10";

-- 5) mostrar todos los pedidos que hayan sido realizados en el mes de marzo de cualquier año
SELECT * FROM pedidos WHERE month(fechaPedido) = 3;

-- 6) mostrar todos los empleados que tengan un nombre de no más de 5 caracteres
SELECT * FROM empleados WHERE char_length(nombre) <= 5;

-- 7) mostrar todos los empleados que trabajen en algún departamento relacionado con ventas.
SELECT * FROM empleados WHERE cargo LIKE "%ventas%";

-- 8) Mostrar el nombre y apellidos de todos los empleados ordenados descendentemente por apellidos 
SELECT nombre, apellidos FROM empleados ORDER BY apellidos DESC;

-- 9) mostrar por pantalla el nombre y apellido de los empleados en una sola columna
-- con el siguiente formato: apellidos, nombre 
-- y darle a esa coumna el alias 'Nombre Completo Empleado'
SELECT concat(apellidos, ', ', nombre) AS 'Nombre Completo Empleado' FROM empleados;

-- 10) mostrar por pantalla la consulta anterior pero mostrando también el identificador del empleado
-- y ordenándolos por el identificador de mayor a menor
SELECT concat(apellidos, ', ', nombre, ' -- ID: ', idEmpleado) AS 'Nombre Completo Empleado' FROM empleados ORDER BY idEmpleado DESC;