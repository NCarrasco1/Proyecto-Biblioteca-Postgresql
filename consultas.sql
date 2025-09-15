-- Consultar todos los lectores registrados
SELECT * FROM lectores;

-- Consultar todos los libros disponibles
SELECT * FROM libros;

-- Consultar los préstamos realizados (qué libros tiene cada lector)
SELECT l.nombre AS lector, lb.titulo AS libro
FROM lectores l
JOIN lectoreslibros ll ON l.id_lector = ll.id_lector
JOIN libros lb ON ll.id_libro = lb.id_libro;

-- Consultar qué lectores tienen un libro específico (por ejemplo, el libro con id 1)
SELECT l.nombre
FROM lectores l
JOIN lectoreslibros ll ON l.id_lector = ll.id_lector
WHERE ll.id_libro = 1;

-- Consultar cuántos libros tiene cada lector
SELECT l.nombre, COUNT(ll.id_libro) AS cantidad_libros
FROM lectores l
LEFT JOIN lectoreslibros ll ON l.id_lector = ll.id_lector
GROUP BY l.nombre;

-- Consultar los libros que no han sido prestados
SELECT lb.titulo
FROM libros lb
LEFT JOIN lectoreslibros ll ON lb.id_libro = ll.id_libro
WHERE ll.id_libro IS NULL;

-- Listar todos los préstamos activos (sin devolución)
SELECT l.nombre, l.apellido, lb.nombre AS libro, ll.fecha_prestamo
FROM lectores l
JOIN lectoreslibros ll ON l.id = ll.idlector
JOIN libros lb ON ll.idlibro = lb.id
WHERE ll.fecha_devolucion IS NULL;

-- Mostrar el historial de préstamos de un lector específico (por ejemplo, id = 3)
SELECT lb.nombre AS libro, ll.fecha_prestamo, ll.fecha_devolucion
FROM lectoreslibros ll
JOIN libros lb ON ll.idlibro = lb.id
WHERE ll.idlector = 3;

-- Consultar cuántos préstamos realizó cada lector
SELECT l.nombre, l.apellido, COUNT(ll.id) AS cantidad_prestamos
FROM lectores l
LEFT JOIN lectoreslibros ll ON l.id = ll.idlector
GROUP BY l.id, l.nombre, l.apellido;

-- Listar los libros que han sido prestados más de una vez
SELECT lb.nombre, COUNT(ll.id) AS veces_prestado
FROM libros lb
JOIN lectoreslibros ll ON lb.id = ll.idlibro
GROUP BY lb.id, lb.nombre
HAVING COUNT(ll.id) > 1;

-- Consultar los lectores que nunca han realizado un préstamo
SELECT l.nombre, l.apellido
FROM lectores l
LEFT JOIN lectoreslibros ll ON l.id = ll.idlector
WHERE ll.id IS NULL;

-- Mostrar los libros prestados y su fecha de devolución (si existe)
SELECT lb.nombre AS libro, l.nombre AS lector, ll.fecha_prestamo, ll.fecha_devolucion
FROM lectoreslibros ll
JOIN libros lb ON ll.idlibro = lb.id
JOIN lectores l ON ll.idlector = l.id;