-- =====================================================
-- 📚 Proyecto Biblioteca - PostgreSQL
-- Creación de esquema, tablas y datos de prueba
-- =====================================================

- =====================================================
-- TABLA: lectores
-- =====================================================
CREATE TABLE lectores (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    nacimiento DATE
);
-- =====================================================
-- TABLA: libros
-- =====================================================
CREATE TABLE libros (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    editorial VARCHAR(100),
    autor VARCHAR(100),
    isbn INTEGER UNIQUE
);
-- =====================================================
-- TABLA: lectoreslibros (relación N:N)
-- =====================================================
CREATE TABLE lectoreslibros (
    id SERIAL PRIMARY KEY,
    idlector INT NOT NULL,
    idlibro INT NOT NULL,
    fecha_prestamo DATE DEFAULT CURRENT_DATE,
    fecha_devolucion DATE,
    FOREIGN KEY (idlector) REFERENCES lectores(id) ON DELETE CASCADE,
    FOREIGN KEY (idlibro) REFERENCES libros(id) ON DELETE CASCADE
);
-- =====================================================
-- INSERTAR DATOS DE PRUEBA
-- =====================================================

-- Lectores
INSERT INTO lectores (nombre, apellido, email, nacimiento) VALUES
('Juan Alberto', 'Cortéz', 'juancortez@gmail.com', '1983-06-20'),
('Antonia', 'de los Ríos', 'antonianos_23@yahoo.com', '1978-11-24'),
('Nicolás', 'Martin', 'nico_martin23@gmail.com', '1986-07-11'),
('Néstor', 'Casco', 'nestor_casco2331@hotmail.com', '1981-02-11'),
('Lisa', 'Pérez', 'lisperez@hotmail.com', '1994-08-11'),
('Ana Rosa', 'Estagnolli', 'anros@abcdatos.com', '1974-10-15'),
('Milagros', 'Pastoruti', 'mili_2231@gmail.com', '2001-01-22'),
('Pedro', 'Alonso', 'alonso.pedro@impermebilizantesrosario.com', '1983-09-05'),
('Arturo Ezequiel', 'Ramirez', 'artu.rama@outlook.com', '1998-03-29'),
('Juan Ignacio', 'Altarez', 'juanalvarez.223@yahoo.com', '1975-08-24');

-- Libros
INSERT INTO libros (nombre, editorial, autor, isbn) VALUES
('Cementerio de animales', 'Ediciones de Mente', 'Stephen King', 4568874),
('En el nombre de la rosa', 'Editorial España', 'Umberto Eco', 44558877),
('Cien años de soledad', 'Sudamericana', 'Gabriel García Márquez', 7788845),
('El diario de Ellen Rimbauer', 'Editorial Maine', 'Stephen King', 45699874),
('La hojarasca', 'Sudamericana', 'Gabriel García Márquez', 7787898),
('El amor en los tiempos del cólera', 'Sudamericana', 'Gabriel García Márquez', 2564111),
('La casa de los espíritus', 'Ediciones Chile', 'Isabel Allende', 5544781),
('Paula', 'Ediciones Chile', 'Isabel Allende', 22545447),
('La tregua', 'Alfa', 'Mario Benedetti', 2225412),
('Gracias por el fuego', 'Alfa', 'Mario Benedetti', 88541254);

-- Relación lectores-libros
INSERT INTO lectoreslibros (idlector, idlibro, fecha_prestamo, fecha_devolucion) VALUES
(1, 1, '2025-01-10', NULL),
(2, 2, '2025-01-12', '2025-01-20'),
(3, 3, '2025-01-15', NULL),
(4, 4, '2025-01-18', '2025-01-25'),
(5, 5, '2025-02-01', NULL),
(6, 6, '2025-02-03', NULL),
(7, 7, '2025-02-05', '2025-02-12'),
(8, 8, '2025-02-10', NULL),
(9, 9, '2025-02-15', NULL),
(10, 10, '2025-02-20', NULL);
