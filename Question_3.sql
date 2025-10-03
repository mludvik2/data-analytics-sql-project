WITH food_growth AS (
SELECT
	food_category,
	YEAR,
	ROUND(AVG(avg_food_price)::NUMERIC, 2) AS price
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final
GROUP BY
	food_category,
	YEAR
),
food_growth_calc AS(
SELECT
    food_category,
    YEAR,
    price,
    LAG(price) OVER(PARTITION BY food_category ORDER BY YEAR) AS previous_price,
    ROUND(
        ((price - LAG(price) OVER(PARTITION BY food_category ORDER BY YEAR)) 
         / LAG(price) OVER(PARTITION BY food_category ORDER BY YEAR)) * 100,
        2
    ) AS growth_percentage
FROM food_growth_calc
WHERE previous_price IS NOT NULL
ORDER BY food_category, YEAR;

.......................... 

SELECT
	food_category,
	YEAR,
	(((avg(previous_price) - avg(price)))/avg(previous_price))*100 AS price_trend_perc
FROM 
	(
	SELECT
		food_category,
		YEAR,
		avg(avg_food_price) AS price,
		LAG(avg(avg_food_price)) OVER(PARTITION BY food_category ORDER BY YEAR) AS previous_price
	FROM
		t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
	GROUP BY
		food_category,
		YEAR)
WHERE
	previous_price IS NOT NULL
GROUP BY
	food_category,
	YEAR
ORDER BY
	price_trend_perc ASC


	
LIMIT 
	25;

SELECT food_category,
	YEAR,
	(((avg(price) - avg(previous_price)))/avg(previous_price))*100 AS price_trend_perc,
	CASE 
		WHEN avg(price) >= avg(previous_price) then 'increase'
		ELSE 'decrease'
	END AS increase_decrease
FROM 
	(
	SELECT
		food_category,
		YEAR,
		avg(avg_food_price) AS price,
		LAG(avg(avg_food_price)) OVER(PARTITION BY food_category ORDER BY YEAR) AS previous_price
		FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
		GROUP BY
			food_category,
			YEAR)
WHERE
	previous_price IS NOT NULL
GROUP BY
	food_category,
	YEAR
ORDER BY
	YEAR,
	price_trend_perc ASC,
	increase_decrease ASC
	
......................ALTER 

