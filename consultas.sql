-- Consulta 1: Mostrar todos los lectores registrados en la biblioteca
SELECT * FROM lectores;

-- Consulta 2: Mostrar todos los libros disponibles en la biblioteca
SELECT * FROM libros;

-- Consulta 3: Consultar los préstamos realizados (qué libros tiene cada lector)
SELECT l.nombre AS lector, lb.nombre AS libro
FROM lectores l
JOIN lectoreslibros ll ON l.id = ll.id_lectores
JOIN libros lb ON ll.id_libros = lb.id;

-- Consulta 4: Consultar qué lectores tienen un libro específico (por ejemplo, el libro con id 1)
SELECT l.nombre
FROM lectores l
JOIN lectoreslibros ll ON l.id = ll.id_lectores
WHERE ll.id_libros = 1;

-- Consulta 5: Consultar cuántos libros tiene cada lector
SELECT l.nombre, COUNT(ll.id_libros) AS cantidad_libros
FROM lectores l
LEFT JOIN lectoreslibros ll ON l.id = ll.id_lectores
GROUP BY l.nombre;

-- Consulta 6: Consultar los libros que no han sido prestados
SELECT lb.nombre
FROM libros lb
LEFT JOIN lectoreslibros ll ON lb.id = ll.id_libros
WHERE ll.id_libros IS NULL;

