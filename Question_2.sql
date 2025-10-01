SELECT year,
       AVG(avg_wage) / MAX(CASE WHEN food_category = 'Mléko' THEN avg_food_price END) AS liters_milk,
       AVG(avg_wage) / MAX(CASE WHEN food_category = 'Chléb' THEN avg_food_price END) AS kg_bread
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
GROUP BY year
ORDER BY year;

SELECT *
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 


SELECT 
    year,
    AVG(value) AS avg_monthly_wage
FROM 
    t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
WHERE 
    value_type_code = 5958 -- average gross monthly wage
    AND calculation_code = 200 -- average per person
    AND unit_code = 200 -- CZK
    AND year IN (2010, 2023) -- replace with years from previous query
GROUP BY 
    year;

WITH affordability AS (
    SELECT year,
           food_category,
           ROUND(avg_wage / avg_food_price, 2) AS affordability
    FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
    WHERE food_category IN ('Mléko','Chléb')
      AND year BETWEEN 2006 AND 2018
)
SELECT f.year AS year_2006,
       l.year AS year_2018,
       f.food_category,
       f.affordability AS affordability_2006,
       l.affordability AS affordability_2018,
       ROUND((l.affordability - f.affordability) / f.affordability * 100, 2) AS growth_percent
FROM affordability f
JOIN affordability l 
  ON f.food_category = l.food_category
WHERE f.year = 2006
  AND l.year = 2018;


WITH affordability AS (
    SELECT year,
           food_category,
           ROUND((avg_wage / avg_food_price)::numeric, 2) AS affordability
    FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
    WHERE food_category IN ('Mléko','Chléb')
      AND year BETWEEN 2006 AND 2018
)
SELECT f.year AS year_2006,
       l.year AS year_2018,
       f.food_category,
       f.affordability AS affordability_2006,
       l.affordability AS affordability_2018,
       ROUND(((l.affordability - f.affordability) / f.affordability * 100)::numeric, 2) AS growth_percent
FROM affordability f
JOIN affordability l 
  ON f.food_category = l.food_category
WHERE f.year = 2006
  AND l.year = 2018;

SELECT 
    ROUND(MAX(CASE WHEN year = 2006 AND food_category = 'Mléko' 
                   THEN (avg_wage / avg_food_price)::numeric END), 2) AS milk_2006,
    ROUND(MAX(CASE WHEN year = 2018 AND food_category = 'Mléko' 
                   THEN (avg_wage / avg_food_price)::numeric END), 2) AS milk_2018,
    ROUND(
        (MAX(CASE WHEN year = 2018 AND food_category = 'Mléko' 
                  THEN (avg_wage / avg_food_price)::numeric END)
       - MAX(CASE WHEN year = 2006 AND food_category = 'Mléko' 
                  THEN (avg_wage / avg_food_price)::numeric END)), 2
    ) AS milk_diff,
    ROUND(MAX(CASE WHEN year = 2006 AND food_category = 'Chléb' 
                   THEN (avg_wage / avg_food_price)::numeric END), 2) AS bread_2006,
    ROUND(MAX(CASE WHEN year = 2018 AND food_category = 'Chléb' 
                   THEN (avg_wage / avg_food_price)::numeric END), 2) AS bread_2018,
    ROUND(
        (MAX(CASE WHEN year = 2018 AND food_category = 'Chléb' 
                  THEN (avg_wage / avg_food_price)::numeric END)
       - MAX(CASE WHEN year = 2006 AND food_category = 'Chléb' 
                  THEN (avg_wage / avg_food_price)::numeric END)), 2
    ) AS bread_diff
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
WHERE year BETWEEN 2006 AND 2018;


WITH affordability AS (
    SELECT year,
           food_category,
           ROUND((avg_wage / avg_food_price)::numeric, 2) AS affordability
    FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
    WHERE food_category IN ('Mléko','Chléb')
      AND year BETWEEN 2006 AND 2018
)
SELECT f.year AS year_2006,
       l.year AS year_2018,
       f.food_category,
       f.affordability AS affordability_2006,
       l.affordability AS affordability_2018,
       ROUND(((l.affordability - f.affordability) / f.affordability * 100)::numeric, 2) AS growth_percent
FROM affordability f
JOIN affordability l 
  ON f.food_category = l.food_category
WHERE f.year = 2006
  AND l.year = 2018;


SELECT
	YEAR,
	ROUND(MAX(CASE WHEN food_category = 'Mléko' THEN avg_wage / avg_food_price END), 2) AS liters_milk,
	ROUND(MAX(CASE WHEN food_category = 'Chléb' THEN avg_wage / avg_food_price END), 2) AS kg_bread
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
GROUP BY
	YEAR
ORDER BY
	YEAR;


WITH affordability AS (
    SELECT year,
           food_category,
           ROUND((avg_wage / avg_food_price)::numeric, 2) AS affordability
    FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
    WHERE food_category IN ('Mléko','Chléb')
)
SELECT f.year AS first_year,
       l.year AS last_year,
       f.affordability AS first_value,
       l.affordability AS last_value,
       f.food_category
FROM affordability f
JOIN affordability l 
  ON f.food_category = l.food_category
WHERE f.year = (SELECT MIN(year) FROM affordability)
  AND l.year = (SELECT MAX(year) FROM affordability);


SELECT year,
           food_category,
           ROUND(avg_wage / avg_price, 2) AS affordability
    FROM t_jmeno_prijmeni_project_SQL_primary_final
    WHERE food_category IN ('Mléko','Chléb')
      AND year BETWEEN 2006 AND 2018