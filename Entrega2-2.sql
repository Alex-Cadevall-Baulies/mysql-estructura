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



