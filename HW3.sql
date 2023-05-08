 CREATE DATABASE IF NOT EXISTS home_work3;
 
 USE home_work3;
 
 DROP TABLE IF EXISTS staff; 
CREATE TABLE staff
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    firstname VARCHAR(45),
	lastname VARCHAR(45),
    post VARCHAR(45),
    seniority INT,
	salary DECIMAL(8, 2), 
    age INT
);
INSERT staff (firstname, lastname, post, seniority, salary, age)
VALUES
	 ('Вася', 'Петров', 'Начальник', 40, 100000, 60),
	 ('Петр', 'Власов', 'Начальник', 8, 70000, 30),
	 ('Катя', 'Катина', 'Инженер', 2, 70000, 25),
	 ('Саша', 'Сасин', 'Инженер', 12, 50000, 35),
	 ('Иван', 'Петров', 'Рабочий', 40, 30000, 59),
	 ('Петр', 'Петров', 'Рабочий', 20, 55000, 60),
	 ('Сидр', 'Сидоров', 'Рабочий', 10, 20000, 35),
	 ('Антон', 'Антонов', 'Рабочий', 8, 19000, 28),
	 ('Юрий', 'Юрков', 'Рабочий', 5, 15000, 25),
	 ('Максим', 'Петров', 'Рабочий', 2, 11000, 19),
	 ('Юрий', 'Петров', 'Рабочий', 3, 12000, 24),
	 ('Людмила', 'Маркина', 'Уборщик', 10, 10000, 49);
 
SELECT *
FROM staff;

# Задача 1, 2

SELECT salary, id
FROM staff
ORDER BY (salary) ASC;

SELECT salary, id
FROM staff
ORDER BY (salary) DESC
LIMIT 5; 

# Задача 3
SELECT 
	post AS "Должность",
    SUM(salary) AS "Суммарная ЗП"
FROM staff
GROUP BY post;

# Задача 4
SELECT 
	post AS "Должность",
	COUNT(age) AS "Количество сотрудников в возрасте 24 - 49"
FROM staff    
WHERE post = "Рабочий" AND age > 23 AND age < 50
GROUP BY post;

# Задача 5
SELECT 
	COUNT(DISTINCT post) AS "Количество должностей"
FROM staff;

# Задача 6
SELECT 
	post AS "Должность",
    AVG(age) AS "Средний возраст"
FROM staff    
GROUP BY post
HAVING AVG(age) <= 30;

    