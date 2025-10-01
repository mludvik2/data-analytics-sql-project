WITH years AS (
SELECT
	MIN(YEAR) AS first_year,
	MAX(YEAR) AS last_year
FROM
	t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final
)
SELECT
	ROUND(MAX(CASE WHEN t.YEAR = t2.first_year AND food_category LIKE '%Mléko%' 
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS milk_2006,
	ROUND(MAX(CASE WHEN t.YEAR = t2.last_year AND food_category LIKE '%Mléko%' 
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS milk_2018,
	ROUND(
        (MAX(CASE WHEN t.YEAR = t2.last_year AND food_category LIKE '%Mléko%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)
       - MAX(CASE WHEN t.YEAR = t2.first_year AND food_category LIKE '%Mléko%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)), 2
    ) AS milk_diff,
	ROUND(MAX(CASE WHEN t.YEAR = t2.first_year AND food_category LIKE '%Chléb%'
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS bread_2006,
	ROUND(MAX(CASE WHEN t.YEAR = t2.last_year AND food_category LIKE '%Chléb%'
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS bread_2018,
	ROUND(
        (MAX(CASE WHEN t.YEAR = t2.last_year AND food_category LIKE '%Chléb%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)
       - MAX(CASE WHEN t.YEAR = t2.first_year AND food_category LIKE '%Chléb%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)), 2
    ) AS bread_diff
FROM
	t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final AS t
CROSS JOIN years t2;