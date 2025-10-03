SELECT *
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 


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
),
wage_growth AS (
SELECT 
		industry_branch,
		YEAR,
		round(avg(avg_wage)::NUMERIC, 2) AS wage
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
GROUP BY
	industry_branch,
	YEAR
),
wage_growth_calc AS (
SELECT
	industry_branch,
	YEAR,
	wage,
	LAG(wage) OVER(PARTITION BY industry_branch ORDER BY YEAR) AS previous_wage,
	round(
		((wage - LAG(wage) OVER (PARTITION BY industry_branch ORDER BY YEAR))/
		LAG(wage) OVER (PARTITION BY industry_branch ORDER BY YEAR ))* 100, 2) AS wage_growth_perc
FROM
	wage_growth
)