-- Tenda (estan per ordre)
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
SELECT f.* FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE ISNULL(p.codigo_fabricante);
SELECT f.nombre, p.nombre from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Lenovo');
SELECT f.*, p.* from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE p.precio = 559;
SELECT p.nombre from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Lenovo') ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre from tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Hewlett-Packard') ORDER BY p.precio ASC LIMIT 1;
SELECT f.*, p.* FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p on p.codigo_fabricante = f.codigo WHERE p.precio >= 559;
SELECT f.nombre, p.nombre, p.precio FROM tienda.fabricante AS f LEFT JOIN tienda.producto AS p ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus') AND p.precio > (SELECT AVG(p.precio) FROM tienda.producto AS p LEFT JOIN tienda.fabricante AS f ON f.codigo = p.codigo_fabricante WHERE f.nombre IN ('Asus') GROUP BY f.nombre);

-- Universitat (estan per ordre)
SELECT nombre, apellido1, apellido2 FROM universidad.persona WHERE tipo IN ('alumno') ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;
SELECT nombre, apellido1, apellido2, telefono FROM universidad.persona WHERE tipo IN ('alumno') AND telefono IS NULL;
SELECT nombre, apellido1, apellido2, fecha_nacimiento FROM universidad.persona WHERE tipo IN ('alumno') AND fecha_nacimiento LIKE '1999%';
SELECT nombre, apellido1, apellido2, telefono, nif FROM universidad.persona WHERE tipo IN ('profesor') AND telefono IS NULL AND nif LIKE '%K';
SELECT nombre, id_grado, cuatrimestre, curso FROM universidad.asignatura WHERE cuatrimestre IN ('1') AND curso IN ('3') AND id_grado IN ('7');
SELECT p.nombre, p.apellido1, p.apellido2, dep.nombre FROM universidad.persona AS p JOIN universidad.profesor AS pro ON p.id = pro.id_profesor JOIN universidad.departamento AS dep ON pro.id_departamento = dep.id WHERE tipo IN ('profesor') ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT a.nombre, a.apellido1, a.apellido2, asignatura.nombre, curso.anyo_inicio, curso.anyo_fin FROM universidad.persona AS a JOIN universidad.alumno_se_matricula_asignatura AS ids ON a.id = ids.id_alumno JOIN universidad.curso_escolar AS curso ON id_curso_escolar = curso.id JOIN universidad.asignatura AS asignatura ON ids.id_asignatura = asignatura.id WHERE nif IN ('26902806M');
SELECT p.nombre, p.apellido1, p.apellido2, grado.nombre AS grado, departamento.nombre AS departamento FROM universidad.persona AS p JOIN asignatura ON p.id = asignatura.id_profesor JOIN grado ON grado.id = asignatura.id_grado JOIN profesor ON profesor.id_profesor = p.id JOIN departamento ON profesor.id_departamento = departamento.id WHERE p.tipo IN ('profesor') AND departamento.nombre LIKE ('%informática') GROUP BY p.nombre;
SELECT nombre, apellido1, apellido2, curso.anyo_inicio, curso.anyo_fin FROM universidad.persona AS p JOIN alumno_se_matricula_asignatura AS a ON p.id = a.id_alumno JOIN curso_escolar AS curso ON a.id_curso_escolar = curso.id WHERE curso.anyo_fin IN ('2019') GROUP BY p.nombre;

-- Consultes Universitat LEFT JOIN / RIGHT JOIN (estan per ordre)
SELECT  dep.nombre, p.nombre, p.apellido1, p.apellido2 FROM universidad.persona AS p LEFT JOIN universidad.profesor AS profesor ON p.id = profesor.id_profesor RIGHT JOIN universidad.departamento AS dep ON profesor.id_departamento = dep.id WHERE tipo IN ('profesor') ORDER BY dep.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;
SELECT  dep.nombre, p.nombre, p.apellido1, p.apellido2 FROM universidad.persona AS p LEFT JOIN universidad.profesor AS profesor ON p.id = profesor.id_profesor LEFT JOIN universidad.departamento AS dep ON profesor.id_departamento = dep.id WHERE tipo IN ('profesor') AND dep.nombre IS NULL;
SELECT  dep.nombre, p.nombre, p.apellido1, p.apellido2 FROM universidad.departamento AS dep LEFT JOIN universidad.profesor AS profesor ON dep.id = profesor.id_departamento LEFT JOIN universidad.persona AS p ON profesor.id_profesor = p.id WHERE p.nombre IS NULL;
SELECT persona.nombre, persona.apellido1, persona.apellido2, asignatura.nombre AS asignatura FROM universidad.persona AS persona LEFT JOIN universidad.asignatura AS asignatura ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NUll;
SELECT persona.nombre, asignatura.nombre AS asignatura FROM universidad.persona AS persona RIGHT JOIN universidad.asignatura AS asignatura ON persona.id = asignatura.id_profesor WHERE asignatura.id_profesor IS NUll;
SELECT dep.nombre, asignatura.nombre FROM universidad.departamento AS dep LEFT JOIN universidad.profesor AS pro ON dep.id = pro.id_departamento LEFT JOIN universidad.asignatura AS asignatura ON pro.id_profesor = asignatura.id_profesor WHERE asignatura.id_profesor IS NULL GROUP BY dep.nombre;

-- Consultes resum (estan per ordre)
SELECT COUNT(*) FROM universidad.persona WHERE tipo IN ('alumno');
SELECT COUNT(*) FROM universidad.persona WHERE fecha_nacimiento LIKE '1999%';
SELECT dep.nombre, COUNT(*) FROM universidad.persona AS p JOIN universidad.profesor AS pro ON p.id = pro.id_profesor LEFT JOIN universidad.departamento AS dep ON pro.id_departamento = dep.id GROUP BY dep.nombre ORDER BY COUNT(*) DESC;
SELECT dep.nombre, COUNT(pro.id_profesor) FROM universidad.persona AS p JOIN universidad.profesor AS pro ON p.id = pro.id_profesor RIGHT JOIN universidad.departamento AS dep ON pro.id_departamento = dep.id GROUP BY dep.nombre ORDER BY COUNT(*) DESC;
SELECT grado.nombre, COUNT(asignatura.id_grado) FROM universidad.grado AS grado LEFT JOIN universidad.asignatura AS asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre ORDER BY COUNT(asignatura.id_grado) DESC;
SELECT grado.nombre, COUNT(asignatura.id_grado) FROM universidad.grado AS grado LEFT JOIN universidad.asignatura AS asignatura ON grado.id = asignatura.id_grado GROUP BY grado.nombre HAVING COUNT(asignatura.id_grado) > 40;
SELECT grado.nombre, asignatura.tipo, SUM(asignatura.creditos) FROM universidad.grado AS grado RIGHT JOIN universidad.asignatura AS asignatura ON grado.id = asignatura.id_grado GROUP BY asignatura.tipo, grado.nombre;
SELECT curso.anyo_inicio, COUNT(ids.id_curso_escolar) FROM universidad.curso_escolar AS curso LEFT JOIN universidad.alumno_se_matricula_asignatura AS ids ON curso.id = ids.id_curso_escolar GROUP BY curso.anyo_inicio;
SELECT p.id, p.nombre, p.apellido1, p.apellido2, COUNT(asignatura.id_profesor) FROM universidad.persona AS p LEFT JOIN universidad.asignatura AS asignatura ON p.id = asignatura.id_profesor GROUP BY p.id ORDER BY COUNT(asignatura.id_profesor) DESC;
SELECT * FROM universidad.persona ORDER BY fecha_nacimiento DESC LIMIT 1;
SELECT p.nombre, dep.nombre, COUNT(asig.id_profesor) AS asignaturas FROM universidad.persona AS p RIGHT JOIN universidad.profesor AS pro ON p.id = pro.id_profesor LEFT JOIN universidad.departamento AS dep ON pro.id_departamento = dep.id LEFT JOIN universidad.asignatura AS asig ON p.id = asig.id_profesor GROUP BY p.nombre HAVING COUNT(asig.id_profesor) = 0;
