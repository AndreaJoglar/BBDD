DROP DATABASE IF EXISTS atletismo;
CREATE DATABASE atletismo CHARACTER SET utf8mb4;
USE atletismo;

CREATE TABLE competition (
id INTEGER PRIMARY KEY,
nome VARCHAR(128),
start_date DATE,
end_date DATE,
anio INTEGER,
location VARCHAR(128)
);

CREATE TABLE discipline (
id INTEGER PRIMARY KEY,
nome VARCHAR(128),
is_men BOOLEAN,
distance INTEGER
);

CREATE TABLE evento (
id INTEGER PRIMARY KEY,
competition_id INTEGER,
discipline_id INTEGER,
FOREIGN KEY (competition_id) REFERENCES competition(id),
FOREIGN KEY (discipline_id) REFERENCES discipline(id),
final_date DATE,
wind NUMERIC(6,2)
); 

CREATE TABLE athlete (
id INTEGER PRIMARY KEY,
first_name VARCHAR(128),
last_name VARCHAR(128),
nationality_id INTEGER,
birth_date date
);

CREATE TABLE final_result (
event_id INTEGER,
FOREIGN KEY (event_id) REFERENCES evento(id),
athlete_id INTEGER,
FOREIGN KEY (athlete_id) REFERENCES athlete(id),
PRIMARY KEY (event_id, athlete_id),
result TIME,
place INTEGER,
is_dsq BOOLEAN,
is_dns BOOLEAN,
is_dnf BOOLEAN
);

CREATE TABLE nationality (
id INTEGER PRIMARY KEY,
country_name VARCHAR(128),
country_abbr VARCHAR(3)
);

INSERT INTO competition VALUES 
(7093747, 'Rio de Janeiro Olympic Games', '2016-08-12', '2016-08-21', 2016, 'Estádio Olimpico, Rio de Janeiro (BRA)'),
(7093740, 'London IAAF World Championships in Athletics', '2017-08-04', '2017-08-13', 2017, 'Olympic Stadium, London (GBR)'),
(7125365, 'IAAF World Championships in Athletics', '2019-09-27', '2019-10-06', 2019, 'Khalifa International Stadium, Doha (QAT)')
;

INSERT INTO discipline VALUES
(1, 'Mens 100m', TRUE, 100),
(2, 'Mens 200m', TRUE, 200),
(3, 'Mens 400m', TRUE, 400),
(4, 'Mens 800m', TRUE, 800),
(5, 'Mens 1500m', TRUE, 1500)
;

INSERT INTO evento VALUES
(1, 7093747, 1, '2016-08-14', 0.2),
(2, 7093747, 2, '2016-08-18', -0.5),
(3, 7093747, 3, '2016-08-14', 0),
(4, 7093747, 4, '2016-08-15', 0),
(5, 7093747, 5, '2016-08-20', 0)
;

INSERT INTO nationality VALUES
(1, 'Jamaica', 'JAM'),
(2, 'United States', 'USA'),
(3, 'Canada', 'CAN'),
(4, 'South Africa', 'RSA'),
(5, 'Côte dIvoire', 'CIV')
;

INSERT INTO athlete VALUES
(14201847, 'Usain', 'BOLT', 1, '1986-08-21'),
(14238562, 'Justin', 'GATLIN', 2, '1982-02-10'),
(14535607, 'André', 'DE GRASSE', 3, '1994-11-10'),
(14201842, 'Yohan', 'BLAKE', 1, '1989-12-26'),
(14417763, 'Fred', 'KERLEY', 4, '1991-06-22')
;

INSERT INTO final_result VALUES 
(1, 14201847, '0:00:10', 1, FALSE, FALSE, FALSE),
(1, 14238562, '0:00:10', 2, FALSE, FALSE, FALSE),
(1, 14535607, '0:00:10', 3, FALSE, FALSE, FALSE),
(1, 14201842, '0:00:10', 4, FALSE, FALSE, FALSE),
(1, 14417763, '0:00:10', 5, FALSE, FALSE, FALSE)
;

SELECT final_date, wind FROM evento;
SELECT final_date FROM evento WHERE wind>0.5;
SELECT * FROM discipline WHERE nome LIKE '%100%';






