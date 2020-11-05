#¿Cuál es el nombre de los empleados que realizaron cada venta?
SELECT id_venta, nombre, apellido_paterno, apellido_materno FROM empleado JOIN venta ON empleado.id_empleado = venta.id_empleado;
#¿Cuál es el nombre de los artículos que se han vendido?
SELECT nombre FROM venta JOIN articulo ON venta.id_articulo = articulo.id_articulo;
#¿Cuál es el total de cada venta?
SELECT clave, ROUND(SUM(precio), 2) AS total FROM venta JOIN articulo ON venta.id_articulo = articulo.id_articulo GROUP BY clave;
