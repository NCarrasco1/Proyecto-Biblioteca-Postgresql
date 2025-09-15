# Proyecto-Biblioteca-Postgresql

Este proyecto fue desarrollado como parte de la **Tecnicatura en Programación**, en la materia **Bases de Datos**.  
El objetivo fue diseñar y crear una base de datos para la gestión de una biblioteca, utilizando **PostgreSQL v17** como motor y **pgAdmin 4** como herramienta de administración.

---

## 🔹 Descripción del proyecto

La base de datos permite gestionar:
- **Lectores** registrados en la biblioteca.
- **Libros** disponibles.
- **Préstamos** de libros a lectores, a través de una relación **muchos a muchos (N:N)**.

Esto permite consultar fácilmente:
- Qué libros tiene cada lector.
- Qué lectores tienen un libro determinado.
- Estadísticas de préstamos.

---

## 🔹 Modelo de datos

### Tablas principales
- **lectores** → almacena la información de las personas que usan la biblioteca.  
- **libros** → contiene los datos de cada libro disponible.  
- **lectoreslibros** → tabla intermedia que modela la relación N:N entre lectores y libros (un lector puede tener varios libros, y un libro puede ser prestado a varios lectores).

### Relación
lectores (1) ←→ (N) lectoreslibros (N) ←→ (1) libros

## Cómo usar el proyecto | [Ver el script de la base de datos](proyectobiblioteca.sql)

1. Instala PostgreSQL y pgAdmin4.
2. Abre pgAdmin4 y crea una nueva base de datos (por ejemplo, "biblioteca").
3. Abre el archivo `proyecto-biblioteca.sql` en el Query Tool de pgAdmin4.
4. Ejecuta el script para crear las tablas y datos iniciales.
