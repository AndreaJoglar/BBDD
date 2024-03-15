/* CONSULTAS SOBRE BBDD bdBazar*/ 


/*PREGUNTA 1: 
mostrar todos los productos cuyo nombre acabe en la letra ‘o’*/
SELECT * FROM PRODUCTO WHERE nombre LIKE '%o';



/*PREGUNTA 2: Mostrar todos los productos cuyo nombre acabe en la letra O y no comience por la palabra block.*/
SELECT * FROM PRODUCTO WHERE nombre LIKE '%o' AND nombre NOT LIKE 'block%';





/*PREGUNTA 3
Mostrar todas las familias que tengan un codigo mayor que 2 y menor que 6. .*/
SELECT * FROM FAMILIA WHERE codFamilia > 2 AND codFamilia < 6;




/*PREGUNTA 4
Realizar la consulta anterior de otra forma distinta.*/
SELECT * FROM FAMILIA WHERE codFamilia BETWEEN 3 AND 5;



/*PREGUNTA 5
Mostrar nombre de producto con el alias producto, el código de la familia a la que 
pertenecen con el alias 'código familia' y el nombre de la familia con el alias familia.*/
SELECT p.nombre AS 'Producto', f.codFamilia AS 'Código Familia', f.nombre AS 'Familia' FROM PRODUCTO p
JOIN FAMILIA f ON p.codFamilia = f.codFamilia;


/*PREGUNTA 6
Mostrar el nombre y la familia de los productos que pertenezcan a la familia de informatica. .*/
SELECT p.nombre, f.nombre FROM PRODUCTO p JOIN FAMILIA f
ON p.codFamilia = 3 AND f.codFamilia = 3;



/*PREGUNTA 7
Mostar el número de productos (con el alias 'total productos') que hay en la tabla PRODUCTO.*/
SELECT count(*) AS 'total productos' FROM PRODUCTO;



/*PREGUNTA 8
Mostar todos los productos de las familias 1, 2, 3, ordenado de mayor a menor por el nombre del producto.*/
SELECT * FROM PRODUCTO p WHERE p.codFamilia = 1 OR p.codFamilia = 2 OR p.codFamilia = 3 ORDER BY p.nombre DESC;


/*PREGUNTA 9
Mostrar todos los productos que no tengas asociada ninguna familia. */
SELECT p.codFamilia AS 'producto sin familia' FROM PRODUCTO p WHERE p.codFamilia IS NULL;


/*PREGUNTA 10
Mostrar todos los productos y la familia a la que pertenecen. */
SELECT p.nombre, f.nombre FROM PRODUCTO p JOIN FAMILIA f 
ON p.codFamilia = f.codFamilia;



/*PREGUNTA 11
Mostrar la frase "Buenas tardes a todos" y después reemplazar tardes por noches y mostrarlo también en pantalla. Utilizad los alias 'original' y 'modificada'.*/
SELECT 'buenas tardes a todos' AS 'original', replace('buenas tardes a todos', 'tardes', 'noches') AS 'modificada';



/*PREGUNTA 12
Mostrar todas las familias de la tabla PRODUCTO eliminando las repetida.*/
SELECT DISTINCT p.codFamilia FROM PRODUCTO p;



/*PREGUNTA 13
Mostar todas las familias que lleven una 'a' en la cuarta posición.*/
SELECT f.codFamilia, f.nombre FROM FAMILIA f WHERE nombre LIKE '___a%';



/*PREGUNTA 14
Mostrar en pantalla la frase “HOY ES LUNES” con el alias 'mayúsculas' y esa misma frase en minúsculas usando una función, darle el alias minúsculas.*/
SELECT 'HOY ES LUNES' AS 'mayúsculas', lower('HOY ES LUNES') AS 'minúsculas';


/*PREGUNTA 15
Mostrar el nombre y el código de los productos que terminen en 'o' y que no contengan la letra 't'.*/
SELECT codProducto, nombre, codFamilia FROM PRODUCTO WHERE nombre LIKE '%o' AND nombre NOT LIKE '%t%'; 



/*PREGUNTA 16
Muestra por pantalla el nombre de todos lso prodctos precedidos de la palabra PRODUCTO y dos puntos, 
darle el alias de 'mis productos' y también la longitud en bytes del nombre del producto con el alias de tamaño.*/
SELECT concat('PRODUCTO: ', nombre) AS 'mis productos', char_length(nombre) AS tamaño FROM PRODUCTO;



/*PREGUNTA 17
Mostrar el código de la familia y el nombre de todos los productos ordenados descendentemente por familia y después ordenados ascendentemente por código familia.*/
SELECT p.codFamilia, p.nombre FROM PRODUCTO p ORDER BY p.codFamilia DESC, p.nombre ASC;
