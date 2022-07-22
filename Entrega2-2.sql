-- Tenda
SELECT nombre FROM tienda.producto;
SELECT nombre , precio FROM tienda.producto;
SHOW COLUMNS FROM tienda.producto;
SELECT nombre, precio, FORMAT(precio * 1.02, 2) AS segundo_precio FROM tienda.producto;
SELECT nombre, precio AS euros, FORMAT(precio * 1.02, 2) AS dòlars FROM tienda.producto;
SELECT UPPER(nombre) AS nombre, precio FROM tienda.producto;
SELECT LOWER(nombre) AS nombre, precio FROM tienda.producto;
SELECT nombre, SUBSTRING(nombre, 1, 2) AS abreviación FROM tienda.fabricante;
SELECT nombre, FORMAT(precio, 2) AS precio FROM tienda.producto;
SELECT nombre, FORMAT(precio, 0) AS precio FROM tienda.producto;
SELECT codigo_fabricante FROM tienda.producto;
SELECT DISTINCT codigo_fabricante FROM tienda.producto;
SELECT nombre FROM tienda.fabricante ORDER BY nombre ASC;
SELECT nombre FROM tienda.fabricante ORDER BY nombre DESC;
SELECT nombre, precio FROM tienda.producto ORDER BY nombre ASC, precio DESC; 
SELECT * FROM tienda.fabricante LIMIT 5;
SELECT * FROM tienda.fabricante WHERE codigo >= 4 LIMIT 2;
SELECT nombre, precio FROM tienda.producto ORDER BY precio ASC LIMIT 1;
SELECT nombre, precio FROM tienda.producto ORDER BY precio DESC LIMIT 1;
SELECT nombre, codigo_fabricante FROM tienda.producto WHERE codigo_fabricante = 2;
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo;
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;
SELECT p.codigo, p.nombre, f.codigo, f.nombre  FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo;
SELECT p.nombre, p.precio, f.nombre FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;
SELECT p.nombre, p.precio, f.nombre FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;
SELECT f.nombre, p.nombre FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Asus%';
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE precio >200 AND f.nombre LIKE 'Crucial%';
SELECT f.nombre, p.nombre FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE 'Asus%' OR f.nombre LIKE 'Hewlett%' OR f.nombre LIKE 'Seagate%';
SELECT f.nombre, p.nombre FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre like '%e';
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre like '%w%';
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;
SELECT f.codigo, f.nombre FROM tienda.fabricante AS f INNER JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo;
SELECT f.*, p.nombre, p.precio FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo;
SELECT f.* FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE  ISNULL(p.codigo_fabricante);
SELECT f.nombre, p.nombre from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Lenovo');
SELECT f.*, p.* from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE p.precio = 559;
SELECT p.nombre from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Lenovo') ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Hewlett-Packard') ORDER BY p.precio ASC LIMIT 1;
SELECT f.*, p.* FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE p.precio >= 559;
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus') AND p.precio > (SELECT AVG(p.precio) FROM tienda.producto AS p LEFT JOIN tienda.fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('Asus') GROUP BY f.nombre);

-- Universitat
