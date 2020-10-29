USE tienda;
#¿Cuántos registros hay por cada uno de los puestos?
SELECT nombre, COUNT(*) AS frecuencia FROM puesto GROUP BY nombre;
#¿Cuánto dinero se paga en total por puesto?
SELECT nombre, SUM(salario) totalPagado FROM puesto GROUP BY nombre;
#¿Cuál es el número total de ventas por vendedor?
SELECT id_empleado, COUNT(*) AS totalVentas FROM venta GROUP BY id_empleado;
#¿Cuál es el número total de ventas por artículo?
SELECT id_articulo, COUNT(*) AS totalVentas FROM venta GROUP BY id_articulo;