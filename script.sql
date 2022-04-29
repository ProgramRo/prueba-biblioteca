-- Crear DB
CREATE DATABASE biblioteca_db;
/* Ingresar a DB
\c biblioteca_db
*/
-- Crear Tablas
CREATE TABLE libros(isbn VARCHAR(15) UNIQUE PRIMARY KEY, titulo VARCHAR(50) NOT NULL, numero_paginas INT NOT NULL);
CREATE TABLE autores(codigo_autor SERIAL UNIQUE PRIMARY KEY, nombre VARCHAR(20) NOT NULL, apellido VARCHAR(20) NOT NULL, fecha_nacimiento INT, fecha_muerte INT, tipo_autor VARCHAR(20));
CREATE TABLE libro_autor(id SERIAL UNIQUE PRIMARY KEY, libros_isbn_fk VARCHAR(15), autores_codigo_autor_fk INT, FOREIGN KEY(libros_isbn_fk) REFERENCES libros(isbn), FOREIGN KEY(autores_codigo_autor_fk) REFERENCES autores(codigo_autor));

CREATE TABLE socios(rut VARCHAR(10) UNIQUE PRIMARY KEY, nombre VARCHAR(20) NOT NULL, apellido VARCHAR(20) NOT NULL, direccion VARCHAR(50) NOT NULL, telefono INT NOT NULL);
CREATE TABLE prestamos(id SERIAL UNIQUE PRIMARY KEY, libros_isbn_fk VARCHAR(15), socios_rut_fk VARCHAR(10), fecha_prestamo DATE NOT NULL, fecha_devolucion DATE NOT NULL, FOREIGN KEY(libros_isbn_fk) REFERENCES libros(isbn), FOREIGN KEY(socios_rut_fk) REFERENCES socios(rut));

-- Se insertan datos en tablas
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES('1111111-1', 'Juan', 'Soto', 'Avenida 1, Santiago', 911111111);
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES('2222222-2', 'Ana', 'Pérez', 'Pasaje 2, Santiago', 922222222);
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES('3333333-3', 'Sandra', 'Aguilar', 'Avenida 2, Santiago', 933333333);
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES('4444444-4', 'Esteban', 'Jerez', 'Avenida 3, Santiago', 944444444);
INSERT INTO socios(rut, nombre, apellido, direccion, telefono) VALUES('5555555-5', 'Silvana', 'Muñoz', 'Pasaje 3, Santiago', 955555555);

INSERT INTO libros(isbn, titulo, numero_paginas) VALUES('111-1111111-111', 'Cuentos de Terror', 344);
INSERT INTO libros(isbn, titulo, numero_paginas) VALUES('222-2222222-222', 'Poesías Contemporaneas', 167);
INSERT INTO libros(isbn, titulo, numero_paginas) VALUES('333-3333333-333', 'Historias de Asia', 511);
INSERT INTO libros(isbn, titulo, numero_paginas) VALUES('444-4444444-444', 'Manual de Mecánica', 298);

INSERT INTO autores(nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) VALUES('Andrés', 'Ulloa', 1982, NULL, 'Principal');
INSERT INTO autores(nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) VALUES('Sergio', 'Mardones', 1950, 2012, 'Principal');
INSERT INTO autores(nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) VALUES('José', 'Salgado', 1968, 2020, 'Principal');
INSERT INTO autores(nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) VALUES('Ana', 'Salgado', 1972, NULL, 'Coautor');
INSERT INTO autores(nombre, apellido, fecha_nacimiento, fecha_muerte, tipo_autor) VALUES('Martin', 'Porta', 1976, NULL, 'Principal');

INSERT INTO libro_autor(libros_isbn_fk, autores_codigo_autor_fk) VALUES('111-1111111-111', '3');
INSERT INTO libro_autor(libros_isbn_fk, autores_codigo_autor_fk) VALUES('111-1111111-111', '4');
INSERT INTO libro_autor(libros_isbn_fk, autores_codigo_autor_fk) VALUES('222-2222222-222', '1');
INSERT INTO libro_autor(libros_isbn_fk, autores_codigo_autor_fk) VALUES('333-3333333-333', '2');
INSERT INTO libro_autor(libros_isbn_fk, autores_codigo_autor_fk) VALUES('444-4444444-444', '5');

INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('111-1111111-111', '1111111-1', '2020-01-20', '2020-01-27');
INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('222-2222222-222', '5555555-5', '2020-01-20', '2020-01-30');
INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('333-3333333-333', '3333333-3', '2020-01-22', '2020-01-30');
INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('444-4444444-444', '4444444-4', '2020-01-23', '2020-01-30');
INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('111-1111111-111', '2222222-2', '2020-01-27', '2020-02-04');
INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('444-4444444-444', '1111111-1', '2020-01-31', '2020-02-12');
INSERT INTO prestamos(libros_isbn_fk, socios_rut_fk, fecha_prestamo, fecha_devolucion) VALUES('222-2222222-222', '3333333-3', '2020-01-31', '2020-02-12');

-- Realizando consultas a DB
SELECT * FROM libros WHERE numero_paginas < 300;
SELECT * FROM autores WHERE fecha_nacimiento > 1970;
SELECT COUNT(p.libros_isbn_fk) AS mas_solicitado, l.titulo FROM prestamos AS p INNER JOIN libros AS l ON p.libros_isbn_fk = l.isbn GROUP BY p.libros_isbn_fk, l.titulo ORDER BY mas_solicitado DESC LIMIT 1;
