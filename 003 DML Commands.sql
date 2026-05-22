USE campusx;

CREATE TABLE user (
	user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE
);

INSERT INTO user (name, email)
VALUES ('Anas', 'abc@gmail.com');

SELECT * FROM user;

INSERT INTO user (name, email) VALUES
('Amit', 'amit@gmail.com'),
('nitish', 'nitish@gmail.com');

SELECT * FROM smartphones_cleaned_v6;

SELECT model, price, rating 
FROM smartphones_cleaned_v6;

SELECT os AS 'Operating System', model, Battery_capacity AS Mah
FROM smartphones_cleaned_v6;

SELECT model,
SQRT(resolution_width * resolution_width + resolution_height*resolution_height) AS PPI
FROM smartphones_cleaned_v6;

SELECT model, 'smartphone' AS 'smartphones'
FROM smartphones_cleaned_v6;


-- UNIQUE
SELECT DISTINCT(brand_name) AS 'all brands'
FROM smartphones_cleaned_v6;

-- UNIQUE COMBINATIONS OF COLUMNS
SELECT DISTINCT brand_name, processor_brand
FROM smartphones_cleaned_v6;

SELECT DISTINCT(processor_brand) AS all_processors
FROM smartphones_cleaned_v6;

-- FILTERING ROWS USING WHERE CLAUSE
SELECT * FROM smartphones_cleaned_v6
WHERE brand_name = 'samsung';

SELECT * FROM smartphones_cleaned_v6
WHERE price > 100000;

SELECT * FROM smartphones_cleaned_v6
WHERE price > 10000 AND price < 20000;

-- BETWEEN
SELECT * FROM smartphones_cleaned_v6
WHERE price BETWEEN 10000 AND 20000;

SELECT * FROM smartphones_cleaned_v6
WHERE price < 20000 AND rating < 80 AND processor_brand = 'snapdragon';

SELECT * FROM smartphones_cleaned_v6
WHERE brand_name = 'samsung' AND ram_capacity > 8;

-- QUERY EXECUTION ORDER
-- F J W G H S D O
-- FROM - JOIN - WHERE - GROUP BY - HAVING - SELECT - DISTINCT - ORDER BY

SELECT DISTINCT(brand_name) 
FROM smartphones_cleaned_v6
WHERE price > 100000;

-- IN, NOT IN
SELECT * FROM smartphones_cleaned_v6
WHERE processor_brand IN ('snapdragon', 'bionic', 'exynos');

SELECT * FROM smartphones_cleaned_v6
WHERE processor_brand NOT IN ('snapdragon', 'bionic', 'exynos');


-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;
SET SQL_SAFE_UPDATES = 1;
-- UPDATE brand_name of MEDIATEK To DIMENSITY
UPDATE smartphones_cleaned_v6
SET processor_brand = 'dimensity'
WHERE processor_brand = 'mediatek';

SELECT * FROM smartphones_cleaned_v6
WHERE processor_brand = 'dimensity';

UPDATE user
SET email = 'nitish1@gmail.com'
WHERE email = 'abc@gmail.com';

SELECT * FROM user;


-- DELETE ROWS
SELECT * FROM smartphones_cleaned_v6
WHERE price > 200000;

DELETE FROM smartphones_cleaned_v6
WHERE price > 200000;

DELETE FROM smartphones_cleaned_v6
WHERE primary_camera_rear > 150 AND brand_name = 'samsung';

SELECT * FROM smartphones_cleaned_v6
WHERE primary_camera_rear > 150 AND brand_name = 'samsung';


-- AGGREGATE FUNCTIONS
SELECT MIN(price)
FROM smartphones_cleaned_v6;

SELECT * FROM smartphones_cleaned_v6;

SELECT MAX(price)
FROM smartphones_cleaned_v6
WHERE brand_name = 'samsung';

SELECT AVG(rating)
FROM smartphones_cleaned_v6
WHERE brand_name = 'samsung';

SELECT SUM(price)
FROM smartphones_cleaned_v6
WHERE brand_name = 'samsung';

SELECT COUNT(*) 
FROM smartphones_cleaned_v6
WHERE brand_name = 'apple';

SELECT COUNT(DISTINCT(brand_name))
FROM smartphones_cleaned_v6;

SELECT STD(screen_size)
FROM smartphones_cleaned_v6;

SELECT VARIANCE(screen_size)
FROM smartphones_cleaned_v6;



-- SCALAR FUNCTIONS
SELECT ABS(price - 100000) AS temp
FROM smartphones_cleaned_v6;

SELECT model, 
ROUND(SQRT(resolution_width*resolution_width + resolution_height*resolution_height)/screen_size, 2) AS PPI
FROM smartphones_cleaned_v6;

SELECT CEIL(screen_size)
FROM smartphones_cleaned_v6;

SELECT FLOOR(screen_size)
FROM smartphones_cleaned_v6;

SELECT AVG(battery_capacity), AVG(primary_camera_rear)
FROM smartphones_cleaned_v6
WHERE price >= 100000;

SELECT * FROM smartphones_cleaned_v6;