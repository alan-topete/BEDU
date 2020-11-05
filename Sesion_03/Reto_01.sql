#¿Cuál es el nombre de los empleados cuyo sueldo es menor a $10,000?
USE tienda;
SELECT nombre, apellido_paterno, apellido_materno FROM empleado WHERE id_puesto IN(
SELECT id_puesto FROM puesto WHERE salario < 10000);

#¿Cuál es la cantidad mínima y máxima de ventas de cada empleado?
SELECT id_empleado, min(total_ventas) AS 'Mínimo', max(total_ventas) AS 'Máximo'
FROM (SELECT clave, id_empleado, count(*) AS total_ventas
      FROM venta
      GROUP BY clave, id_empleado) AS subconsulta
GROUP BY id_empleado;

#¿Cuáles claves de venta incluyen artículos cuyos precios son mayores a $5,000?
SELECT clave, id_articulo from venta 
WHERE id_articulo IN (
SELECT id_articulo FROM articulo WHERE precio > 5000);
