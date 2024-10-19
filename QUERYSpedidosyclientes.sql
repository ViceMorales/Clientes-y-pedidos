INSERT INTO clientes (id_clientes, nombre, direccion, telefono) 
					VALUES (1, "Vicente", "San martin 42", 998502337),
							(2, "Jose", "El canelo 33", 998442337),
                            (3, "Julio", "Elton 612", 998539827),
                            (4, "Ferderica", "La sierra 42", 928763337),
                            (5, "Amanda", "San Amaru 2", 99883987);
                            
INSERT INTO pedidos VALUES	(1, 1, now(), 15000),
							(2, 1, now(), 4000),
							(3, 2, now(), 7000),
							(4, 2, now(), 4000),
							(5, 3, now(), 6500),
							(6, 3, now(), 2000),
							(7, 4, now(), 20000),
							(8, 4, now(), 25000),
							(9, 5, now(), 40000),
							(10, 5, now(), 26000);

SELECT *
FROM pedidos
order by id_pedidos;      

SELECT *
FROM clientes
order by nombre;                            
                      

SELECT *
FROM clientes, pedidos
WHERE clientes.id_clientes = pedidos.id_clientes;

SELECT *
FROM pedidos
WHERE pedidos.id_clientes = 1;

SELECT clientes.nombre, 
SUM(CASE WHEN pedidos.total > 0 THEN pedidos.total ELSE 0 END) AS total_pedidos
FROM clientes 
INNER JOIN pedidos ON clientes.id_clientes = pedidos.id_clientes
GROUP BY clientes.nombre;

DELETE FROM CLIENTES
WHERE clientes.id_clientes = 2 and pedidos.id_clientes= 2; 

SELECT clientes.nombre, 
SUM(CASE WHEN pedidos.total > 0 THEN pedidos.total ELSE 0 END) AS total_pedidos
FROM clientes 
INNER JOIN pedidos ON clientes.id_clientes = pedidos.id_clientes
GROUP BY clientes.nombre
ORDER BY total_pedidos DESC
LIMIT 3;