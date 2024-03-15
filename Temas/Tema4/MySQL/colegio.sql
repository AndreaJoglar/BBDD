DROP DATABASE IF EXISTS colegio;
CREATE DATABASE colegio CHARACTER SET utf8mb4;
USE colegio;

CREATE TABLE alumno(
dni CHAR(9) PRIMARY KEY,
nombre VARCHAR(100)
);

CREATE TABLE curso(
codigo VARCHAR(3) PRIMARY KEY,
nombreCurso VARCHAR(100) NOT NULL
);

CREATE TABLE asistencia(
dni CHAR(9),
codigo VARCHAR(3),
FOREIGN KEY (dni) REFERENCES alumno(dni),
FOREIGN KEY (codigo) references curso(codigo),
PRIMARY KEY (dni, codigo)
);

INSERT INTO curso (codigo, nombreCurso) VALUES 
('001','DAM'),
('002', 'DAW'),
('003', 'ASIR')
;

INSERT INTO alumno (dni, nombre) VALUES
('71345728W', 'Pepín'),
('76283719R', 'Antonia'),
('23482719G', 'Chus')
;

INSERT INTO asistencia (dni,codigo) VALUES
('71345728W', '003'),
('76283719R', '001'),
('23482719G', '002')
;

SELECT nombre FROM alumno WHERE nombre LIKE '%a%';
SELECT nombre FROM alumno WHERE nombre LIKE 'c%';