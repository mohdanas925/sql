USE campusx;

SELECT * FROM smartphones_cleaned_v6;

-- GROUP BY
SELECT brand_name, ROUND(AVG(price)) AS 'avg_price'
FROM smartphones_cleaned_v6
GROUP BY brand_name
ORDER BY avg_price DESC
LIMIT 5;

SELECT brand_name, 
AVG(screen_size) AS 'avg_screen_size'
FROM smartphones_cleaned_v6
GROUP BY brand_name
ORDER BY avg_screen_size ASC
LIMIT 1;

SELECT brand_name, COUNT(*) AS 'count'
FROM smartphones_cleaned_v6
WHERE has_nfc = 'True' AND has_ir_blaster = 'True'
GROUP BY brand_name
ORDER BY count DESC LIMIT 5;


SELECT has_nfc, 
ROUND(AVG(price),2) AS 'avg_price'
FROM smartphones_cleaned_v6
WHERE brand_name = 'samsung' AND has_5g = 'True'
GROUP BY has_nfc;


SELECT model, price
FROM smartphones_cleaned_v6
ORDER BY price DESC
LIMIT 10;


-- WHERE applied on SELECT
-- HAVING applied o GROUP BY

SELECT brand_name,
COUNT(*) AS 'count',
AVG(price) AS 'avg_price'
FROM smartphones_cleaned_v6
GROUP BY brand_name
HAVING count > 20
ORDER BY avg_price DESC;

SELECT brand_name,
COUNT(*) AS 'count',
ROUND(AVG(rating),2) AS 'avg_rating'
FROM smartphones_cleaned_v6
GROUP BY brand_name
HAVING count > 20
ORDER BY avg_rating DESC;

SELECT brand_name, COUNT(*) AS 'count',
ROUND(AVG(ram_capacity),2) AS 'avg_ram'
FROM smartphones_cleaned_v6
WHERE refresh_rate > 90 AND fast_charging_available = 1
GROUP BY brand_name
HAVING count > 10
ORDER BY avg_ram DESC
LIMIT 3;


-- HAVING applies when there is some aggregate operatings
-- Where applies on non-aggregate operations
SELECT brand_name,
COUNT(*) AS 'count',
ROUND(AVG(price), 2) AS 'avg_price',
ROUND(AVG(rating),2) AS 'avg_rating'
FROM smartphones_cleaned_v6
WHERE has_5g = 'True'
GROUP BY brand_name
HAVING avg_rating > 70 AND count > 10;