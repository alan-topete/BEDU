USE tienda;
#¿Cuál es el promedio de salario de los puestos?
SELECT AVG(salario) FROM puesto;
#¿Cuántos artículos incluyen la palabra Pasta en su nombre?
SELECT COUNT(*) FROM articulo WHERE nombre LIKE '%pasta%';
#¿Cuál es el salario mínimo y máximo?
SELECT MIN(salario) AS 'Mínimo', MAX(salario) AS 'Máximo' FROM puesto;
#¿Cuál es la suma del salario de los últimos cinco puestos agregados?
SELECT SUM(salario) AS sumaSalariosUltCinco FROM (SELECT salario FROM puesto ORDER BY id_puesto DESC LIMIT 5) AS ultimosCinco;