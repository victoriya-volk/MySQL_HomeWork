CREATE DATABASE IF NOT EXISTS products;
USE products;
# 1
CREATE TABLE IF NOT EXISTS smart_phone
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(45),
	manufacturer VARCHAR(45),
    product_count INT,
    price INT
);

INSERT smart_phone (product_name, manufacturer, product_count, price)
VALUES
		('IPhone X', 'Apple', 3, 76000),
        ('IPhone 8', 'Apple', 2, 51000),
        ('Galaxy S9', 'Samsung', 2, 56000),
        ('Galaxy S8', 'Samsung', 1, 41000),
        ('P20 Pro', 'Huawei', 5, 36000);

SELECT *
FROM smart_phone;

# 2
SELECT product_name, manufacturer, price
FROM smart_phone
WHERE product_count > 2;

# 3
SELECT product_name, product_count, price
FROM smart_phone
WHERE manufacturer = 'Samsung';

# 4
SELECT product_name, manufacturer, product_count, price
FROM smart_phone
WHERE product_count * price > 100000 
AND product_count * price < 145000;

# 4.1
SELECT *
FROM smart_phone
WHERE product_name LIKE 'IPhone%';

# 4.2
SELECT *
FROM smart_phone
WHERE product_name LIKE 'Galaxy%';

#4.3
SELECT *
FROM smart_phone
WHERE product_name LIKE '%[0-9]%';

# 4.4 
SELECT *
FROM smart_phone
WHERE product_name RLIKE '8';