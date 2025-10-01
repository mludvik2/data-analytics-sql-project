---try incorporate into code

SELECT
	min(YEAR),
	max(YEAR)
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf;

SELECT
ROUND(MAX(CASE WHEN YEAR = 2006 AND food_category LIKE '%Mléko%' 
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS milk_2006,
	ROUND(MAX(CASE WHEN YEAR = 2018 AND food_category LIKE '%Mléko%' 
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS milk_2018,
	ROUND(
        (MAX(CASE WHEN YEAR = 2018 AND food_category LIKE '%Mléko%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)
       - MAX(CASE WHEN YEAR = 2006 AND food_category LIKE '%Mléko%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)), 2
    ) AS milk_diff,
	ROUND(MAX(CASE WHEN YEAR = 2006 AND food_category LIKE '%Chléb%'
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS bread_2006,
	ROUND(MAX(CASE WHEN YEAR = 2018 AND food_category LIKE '%Chléb%'
                   THEN (avg_wage / avg_food_price)::NUMERIC END), 2) AS bread_2018,
	ROUND(
        (MAX(CASE WHEN YEAR = 2018 AND food_category LIKE '%Chléb%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)
       - MAX(CASE WHEN YEAR = 2006 AND food_category LIKE '%Chléb%'
                  THEN (avg_wage / avg_food_price)::NUMERIC END)), 2
    ) AS bread_diff
FROM
	t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final
WHERE
	YEAR BETWEEN 2006 AND 2018;

SELECT *
FROM t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final