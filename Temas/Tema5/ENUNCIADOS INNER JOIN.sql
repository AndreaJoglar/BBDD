# 1. LISTAR NOMBRE Y DIRECCION DE CLIENTES CON EL IDPEDIDO Y FECHA PEDIDO
SELECT c.nombreContacto, c.Direccion, p.IDpedido, p.fechaPedido
FROM clientes c INNER JOIN pedidos p ON c.IDcliente = p.IDcliente;

# 2. CALCULAR EL NUMERO TOTAL DE PEDIDOS REALIZADO POR CADA CLIENTE
SELECT c.IdCliente, count(p.idPedido) FROM pedidos p JOIN clientes c ON p.idCliente = c.idCliente group by idCliente;

# 3. CALCULAR LA SUMA TOTAL GASTADA POR CADA CLIENTE EN TODOS SUS PEDIDOS
SELECT c.idCliente, sum(cargo) FROM pedidos p JOIN clientes c ON p.idCliente = c.idCliente GROUP BY idCliente;

# 4. LISTAR NOMBRE DE PRODUCTOS CON SU NOMBRE DE CATEGORIA
SELECT p.nombreProducto, c.nombreCategoria FROM productos p JOIN categorias c
ON p.idCategoria = c.idCategoria;

# 5. CALCULAR EL TOTAL VENDIDO POR CADA PRODUCTO
SELECT d.idProducto, sum(d.cantidad) AS 'Cantidad Vendida' FROM detallesPedidos d JOIN productos p
ON d.idProducto = p.idProducto GROUP BY d.idProducto ORDER BY idProducto ASC;
SHOW TABLES;
# 6. Listar clientes que han realizado compras eL 08/07/1996
SELECT p.idCliente, p.idPedido FROM pedidos p JOIN clientes c
ON p.idCliente = c.idCliente AND fechaPedido = '1997-07-08';

DESCRIBE proveedores;
DESCRIBE pedidos;
# 7. Encontrar los CLIENTES QUE NO HAN REALIZADO COMPRAS:
SELECT p.idCliente, p.idPedido FROM pedidos p JOIN clientes c
ON p.cargo = 0;
# 8. Listar productos y sus proveedores(NOMBRE COMPAÑIA)
SELECT p.nombreProducto, pr.nombreCompañia FROM productos p JOIN proveedores pr
ON p.idProveedor = pr.idProveedor;