CREATE DATABASE IF NOT EXISTS home_work5;

USE home_work5;

DROP TABLE IF EXISTS cars;
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
	(1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
	(5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;

-- 1.	Создайте представление, в которое попадут автомобили стоимостью  до 25 000 долларов

CREATE OR REPLACE VIEW inexpensive_cars AS
SELECT
	name, 
    cost
FROM cars
WHERE cost < 25000
ORDER BY cost;

SELECT * FROM inexpensive_cars;

-- 2.	Изменить в существующем представлении порог для стоимости: пусть цена будет до 30 000 долларов (используя оператор ALTER VIEW) 

ALTER VIEW inexpensive_cars AS
SELECT
	name, 
    cost
FROM cars
WHERE cost < 30000
ORDER BY cost;

SELECT * FROM inexpensive_cars;

-- 3. 	Создайте представление, в котором будут только автомобили марки “Шкода” и “Ауди”

CREATE OR REPLACE VIEW skoda_and_audi AS
SELECT
	name, cost
FROM cars
WHERE name = 'Skoda' OR name = 'Audi';

SELECT * FROM skoda_and_audi;

-- 4.
DROP TABLE IF EXISTS trains_timetable;
CREATE TABLE trains_timetable
(
	train_id INT NOT NULL,
    station VARCHAR(45),
    station_time TIME
);

INSERT trains_timetable
VALUES
	(110, 'San Francisco', 100000),
    (110, 'Redwood City', 105400),
    (110, 'Palo Alto', 110200),
    (110, 'San Jose', 123500),
    (120, 'San Francisco', 110000),
    (120, 'Palo Alto', 124900),
    (120, 'San Jose', 133000);
    
SELECT * FROM trains_timetable;

SELECT 
	train_id,
    station,
    station_time,
    TIME(station_time - LEAD(station_time) OVER (PARTITION BY train_id)) AS 'time_to_next_station'
FROM trains_timetable;

	


