CREATE DATABASE premier_league;
USE premier_league;
CREATE TABLE jugadores (
    id INT PRIMARY KEY,
    nombre VARCHAR(50) NOT NULL,
    posicion VARCHAR(20) NOT NULL,
    equipo VARCHAR(50) NOT NULL,
    edad INT NOT NULL
);
CREATE TABLE equipos (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_equipo VARCHAR(50) NOT NULL,
    estadio VARCHAR(50) NOT NULL,
    fundacion DATE NOT NULL,
    entrenador VARCHAR(50) NOT NULL,
    ciudad VARCHAR(50) NOT NULL
);
CREATE TABLE estadio (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nombre_estadio VARCHAR(50) NOT NULL,
    capacidad INT NOT NULL,
    ciudad VARCHAR(50) NOT NULL,
    equipo_local VARCHAR(50) NOT NULL,
    fecha_inauguracion DATE NOT NULL
);
ALTER TABLE jugadores ADD COLUMN equipos_id INT NULL;
ALTER TABLE equipos ADD COLUMN estadio_id INT NULL;
ALTER TABLE equipos DROP constraint fk_equipos_estadio;
ALTER TABLE equipos DROP constraint mk_equipos_estadio;
ALTER TABLE jugadores DROP constraint fk_jugadores_equipos;
ALTER TABLE equipos DROP index fk_equipos_estadio;
ALTER TABLE equipos DROP index mk_equipos_estadio;
ALTER TABLE jugadores DROP index fk_jugadores_equipos;
ALTER TABLE `premier_league`.`equipos`
ADD INDEX `equipos_estadio_idx` (`estadio_id` ASC);
;
ALTER TABLE `premier_league`.`equipos` 
ADD constraint `equipos_estadio`
	foreign key (`estadio_id`)
	references `premier_league`.`equipos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE cascade;
    
ALTER TABLE `premier_league`.`jugadores` 
ADD constraint `jugadores_equipos`
	foreign key (`equipos_id`)
	references `premier_league`.`jugadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE cascade;
    
INSERT INTO equipos (id, nombre_equipo, estadio, fundacion, entrenador, ciudad, estadio_id) VALUES 
(1, 'Manchester City', 'Etihad Stadium', '1880-01-01', 'Pep Guardiola', 'Manchester', 1),
(2, 'Manchester United', 'Old Trafford', '1878-01-01', 'Ole Gunnar Solskjær', 'Manchester', 2),
(3, 'Liverpool', 'Anfield', '1892-01-01', 'Jurgen Klopp', 'Liverpool', 3),
(4, 'Chelsea', 'Stamford Bridge', '1905-01-01', 'Thomas Tuchel', 'London', 4),
(5, 'Leeds United', 'Elland Road', '1919-01-01', 'Marcelo Bielsa', 'Leeds', 5),
(6, 'Tottenham Hotspur', 'Tottenham Hotspur Stadium', '1882-01-01', 'Ryan Mason', 'London', 6);
ALTER TABLE jugadores drop column equipo;
INSERT INTO jugadores (id, nombre, posicion, edad, equipos_id) VALUES
(1, 'Harry Kane', 'Delantero', 28, 1),
(2, 'Mohamed Salah', 'Delantero', 29, 2),
(3, 'Bruno Fernandes', 'Mediocampista', 27, 3),
(4, 'Kevin De Bruyne', 'Mediocampista', 30, 4),
(5, 'Ruben Dias', 'Defensa', 24, 5),
(6, 'Edouard Mendy', 'Portero', 29, 6);
alter table estadio drop column equipo_local;
INSERT INTO estadio (id, nombre_estadio, capacidad, ciudad, fecha_inauguracion) VALUES
(1, 'Etihad Stadium', 55097, 'Manchester', '2003-09-25'),
(2, 'Old Trafford', 74691, 'Manchester', '1910-02-19'),
(3, 'Anfield', 53023, 'Liverpool', '1884-01-28'),
(4, 'Stamford Bridge', 40853, 'Londres', '1877-03-28'),
(5, 'Emirates Stadium', 60361, 'Londres', '2006-07-22'),
(6, 'Tottenham Hotspur Stadium', 62062, 'Londres', '2019-04-03');
select * from equipos;
select * from estadio;
select * from jugadores;
update equipos
set nombre_equipo = 'Arsenal', estadio = 'Emirates Stadium', entrenador = 'Mikel Arteta', ciudad = 'Londres'
where id = 5;
select * from equipos; 
select *
from jugadores
where edad < 28;
ALTER TABLE equipos DROP constraint equipos_estadio;
ALTER TABLE equipos DROP INDEX equipos_estadio;
ALTER TABLE jugadores DROP CONSTRAINT jugadores_equipos;
ALTER TABLE jugadores DROP INDEX jugadores_equipos;
ALTER TABLE `premier_league`.`jugadores`
ADD CONSTRAINT `jugadores_equipos`
FOREIGN KEY (`equipos_id`) 
REFERENCES `premier_league`.`equipos` (`id`) 
ON DELETE NO ACTION 
ON UPDATE CASCADE;
ALTER TABLE `premier_league`.`equipos` 
ADD constraint `equipos_estadio`
	foreign key (`estadio_id`)
	references `premier_league`.`estadio` (`id`)
    ON DELETE NO ACTION
    ON UPDATE cascade;
    select * from equipos; 
