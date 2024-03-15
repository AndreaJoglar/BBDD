DROP DATABASE IF EXISTS festivales;
CREATE DATABASE festivales CHARACTER SET utf8mb4;
USE festivales;

CREATE TABLE artista(
idArtista INT PRIMARY KEY,
nombre VARCHAR(20),
nombreManager VARCHAR(50),
tipoArtista VARCHAR(30),
discografica VARCHAR(20),
pais VARCHAR(50)
);

CREATE TABLE organizador(
idOrganizador INT PRIMARY KEY,
nombre VARCHAR(20),
apellidos VARCHAR(50),
dni CHAR(9),
telefono CHAR(9)
);

CREATE TABLE festival(
idFestival INT PRIMARY KEY,
idOrganizador INT,
FOREIGN KEY (idOrganizador) REFERENCES organizador (idOrganizador) ON DELETE CASCADE,
nombre VARCHAR(50),
ubicacion VARCHAR(30),
fechaInicio DATE
);

CREATE TABLE artista_festival(
idFestival INT,
FOREIGN KEY (idFestival) REFERENCES festival (idFestival),
idArtista INT,
FOREIGN KEY (idArtista) REFERENCES artista (idArtista),
PRIMARY KEY (idFestival, idArtista),
caché DOUBLE
);

#----------Operaciones CRUD-------------
#a) INSERTAR DATOS EN LAS TABLAS
INSERT INTO artista (idArtista, nombre, nombreManager, tipoArtista, discografica, pais) VALUES
(100, 'Alice Cooper', 'Shep Gordon', 'Música', 'New West', NULL),
(101, 'The Offspring', 'Jeffrey Nordstrom', 'Música', 'Columbia Records', NULL),
(102, 'Rodrigo Cuevas', 'Carlos Barral', 'Música', 'Sony Music España', NULL),
(103, 'Tanxugueiras', 'PlayPlan', 'Música', 'Calaverita Records', NULL),
(104, 'Rigoberta Bandini', 'Fernando Yáñez', 'Música', 'Auto-publicación', NULL),
(105, 'María Arnal', 'Fina Estampa Produccions', 'Música', 'MGM', NULL),
(106, 'PJ Harvey', 'ATC Management', 'Música', 'Vagrant Records', NULL),
(107, 'Iron Maiden', 'Ron Smallwood', 'Música', 'Parlophone Records', NULL),
(108, 'Ankor', 'Max Maeder', 'Música', 'Winner Horse', NULL),
(109, 'Vetusta Morla', 'Kin Martínez', 'Música', 'Pequeño Salto Mortal', NULL),
(110, 'Carlos Chaouen', 'Jordi Tello', 'Música', 'Sony Music', NULL),
(111, 'Jabbawockeez', 'Nick Ngo', 'Danza', NULL, 'Estados Unidos'),
(112, 'The Wild', 'Jenni Reinke', 'Danza', NULL, 'Estados Unidos'),
(113, 'Diversity', 'Ashley Banjo', 'Danza', NULL, 'Gran Bretaña'), 
(114, 'Request Dance Crew', 'Palance Dance', 'Danza', NULL, 'Nueva Zelanda'),
(115, 'Poreotics', 'Matt Nguyen', 'Danza',  NULL, 'Estados Unidos'),
(116, 'Sol-T-Shine', 'Devin Graham', 'Danza', NULL, 'Japón'),
(117, 'Philippine Allstars', 'Kenjhons Serrano', 'Danza', NULL, 'Filipinas'),
(118, 'The Royal Family', 'Palance Dance', 'Danza', NULL, 'Nueva Zelanda'),
(119, 'Mos Wanted', 'Julia Deivis', 'Danza', NULL, 'Estados Unidos'),
(120, '2Proposiciones', 'Raquel Madrid', 'Danza', NULL, 'España');

INSERT INTO organizador (idOrganizador, nombre, apellidos, dni, telefono) VALUES
(100, 'Mireia', 'Bravo', '11122233A', '666111222'),
(101, 'Jaime', 'Lorenzo', '22211133B', '612111212'),
(102, 'Marga', 'Scott', '33311122C', '699666744');

INSERT INTO festival (idFestival, idOrganizador, nombre, ubicacion, fechaInicio) VALUES
(100, 102, 'Resurrection Fest', 'Viveiro', '2024-06-26'),
(101, 100, 'Primavera Sound', 'Barcelona', '2024-05-29'),
(102, 102, 'Leyendas del Rock', 'Villena', '2024-08-07'),
(103, 101, 'Alternativas Fest', 'Avilés', '2024-07-10'),
(104, 101, 'Raíz', 'León', '2024-03-22');

INSERT INTO artista_festival (idFestival, idArtista, caché) VALUES
(100, 100, 40300),
(100, 101, 35000),
(100, 107, 60000),
(100, 108, 8000),
(101, 102, 10000), 
(101, 104, 15500), 
(101, 105, 12800),
(101, 109, 18670),
(102, 100, 40300), 
(102, 106, 56000), 
(102, 107, 60000),
(102, 110, 15650),
(103, 102, 10000),
(103, 105, 12800),
(103, 110, 15650),
(103, 111, 40000),
(103, 112, 20000), 
(103, 115, 30409),
(103, 116, 12690),
(104, 102, 10000),
(104, 103, 20000),
(104, 113, 15600),
(104, 114, 58320),
(104, 117, 32000),
(104, 118, 24670),
(104, 119, 13240), 
(104, 120, 20600);

SELECT * FROM artista_festival;
SELECT * FROM artista;
SELECT * FROM organizador;
SELECT * FROM festival;

#b) USAR SENTENCIAS DDL PARA MODIFICAR LA ESTRUCTURA DE LAS TABLAS
#-- Cambiar el nombre de la tabla artista_festival a programación
SHOW TABLES;
RENAME TABLE artista_festival TO programación;
SHOW TABLES;

#--Cambiar el nombre del atributo nombreManager de la tabla artistas a manager
ALTER TABLE artista CHANGE nombreManager manager VARCHAR(50);
DESCRIBE artista;

#--Añadir el campo fechaFin en la tabla festival
ALTER TABLE festival ADD COLUMN fechaFin DATE AFTER fechaInicio;
DESCRIBE festival;

#--Insertar valores al campo fechaFin
UPDATE festival SET fechaFin = '2024-06-29' WHERE idFestival = '100';
UPDATE festival SET fechaFin = '2024-05-30' WHERE idFestival = '101';
UPDATE festival SET fechaFin = '2024-08-10' WHERE idFestival = '102';
UPDATE festival SET fechaFin = '2024-07-12' WHERE idFestival = '103';
UPDATE festival SET fechaFin = '2024-03-26' WHERE idFestival = '104';
SELECT * FROM festival;

/*Consulta multitabla:
--Listar el id y el nombre de los artistas y el id y nombre del festival cuando coinciden sus id
-- Consulta con JOIN
*/
SELECT idArtista, a.nombre AS Artista, idFestival, f.nombre AS Festival FROM artista a
JOIN festival f ON idFestival = idArtista;

-- Misma consulta sin JOIN
SELECT idArtista, a.nombre AS Artista, idFestival, f.nombre FROM artista a, festival f 
WHERE idFestival = idArtista;

/*Subconsultas:
#-- Mostrar el nombre del artista con el caché más alto */
 SELECT nombre AS 'Artista caché más alto' FROM artista WHERE idArtista IN 
 (SELECT idArtista FROM programación WHERE caché = (SELECT MAX(caché) FROM programación));

/*Otras consultas:
--Mostrar los festivales que duran menos de tres días*/ 
SELECT nombre AS Festival, fechaInicio AS Inicio, fechaFin AS Fin FROM festival
WHERE datediff(fechaFin, fechaInicio) <= 2;

/*-- Consulta que utilice algún patrón LIKE
--Mostrar los id, nombres, el manager y el tipo de los artistas que tengan una 'v' en el nombre de su discográfica
o cuyo país sea Nueva Zelanda. El idArtista se mostrará como ID, el manager como Manager y el tipoArtista como Categoría
*/
SELECT idArtista AS ID, nombre AS Artista, manager AS Manager, tipoArtista AS Categoría FROM artista
WHERE discografica LIKE '%v%' OR pais = 'Nueva Zelanda';

#--Consulta con alguna función de agregado COUNT:
#--Muestra el número total de artistas que participan en el festival Raíz. Utiliza COUNT
SELECT COUNT(idArtista) AS 'Artistas Festival Raíz' FROM programación p WHERE idFestival = '104';
DESCRIBE festival;

#--Consulta con GROUP BY... HAVING y con función de agregado SUM:
#--Mostrar el dinero que invierte en caché cada festival y el id del festival siempre que gasten menos de 150000 €*
SELECT idFestival, SUM(p.caché) FROM programación p GROUP BY idFestival HAVING SUM(p.caché) < 150000;

