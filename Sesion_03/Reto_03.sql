#Obtener el puesto de un empleado.
CREATE VIEW Puestos014 AS 
SELECT empleado.nombre
	, empleado.apellido_paterno
	, empleado.apellido_materno
	, puesto.nombre AS nombre_del_puesto
FROM empleado JOIN puesto ON empleado.id_puesto = puesto.id_puesto;

SELECT * FROM Puestos014;


#Saber qué artículos ha vendido cada empleado.
CREATE VIEW ArticulosVendidos014 AS
SELECT DISTINCT 
		empleado.id_empleado
		, empleado.nombre
		, empleado.apellido_paterno
        , empleado.apellido_materno
        , venta.id_articulo 
FROM venta JOIN empleado ON empleado.id_empleado = venta.id_empleado
ORDER BY id_empleado;

SELECT * FROM ArticulosVendidos014;


#Saber qué puesto ha tenido más ventas.
CREATE VIEW VentasPuesto014 AS
SELECT puesto.nombre, count(venta.clave) AS total_ventas
FROM venta
JOIN empleado ON venta.id_empleado = empleado.id_empleado
JOIN puesto ON empleado.id_puesto = puesto.id_puesto
GROUP BY puesto.nombre
ORDER BY total_ventas DESC, nombre;

SELECT * FROM VentasPuesto014;
