WITH food_growth AS (
SELECT 
		food_category,
		YEAR,
		round(avg(avg_food_price)::NUMERIC, 2) AS price
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
GROUP BY
	food_category,
	YEAR
),
food_growth_calc AS (
SELECT
		food_category,
		YEAR,
		price,
		LAG(price) OVER(PARTITION BY food_category ORDER BY YEAR) AS previous_price,
		round(
			((price - LAG(price) OVER (PARTITION BY food_category ORDER BY YEAR))/
			LAG(price) OVER (PARTITION BY food_category ORDER BY YEAR ))* 100, 2) AS price_growth_perc
FROM
	food_growth
)
SELECT 
	food_category,
	round(avg(price_growth_perc)::NUMERIC, 2) AS avg_growth_perc
FROM
	food_growth_calc
WHERE
	previous_price IS NOT NULL
GROUP BY
	food_category
ORDER BY
	avg_growth_perc ASC
LIMIT 1;

