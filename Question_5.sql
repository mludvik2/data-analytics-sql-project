WITH gdp_growth AS (
SELECT
		YEAR,
		country,
		round(
			(((gdp - LAG(gdp) OVER (PARTITION BY country ORDER BY YEAR))/
			LAG(gdp) OVER (PARTITION BY country ORDER BY YEAR))* 100)::NUMERIC, 2) AS gdp_growth_perc
FROM
		t_michaela_papadimitriu_ludvikova_project_sql_secondary_final AS tmplpssf 
WHERE 
	country = 'Czech Republic'
	),
avg_wages AS (
SELECT
	YEAR,
	avg(avg_wage) AS avg_wage
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
GROUP BY
	YEAR
),
wage_growth AS (
SELECT
		YEAR,
		round(
			(((avg_wage - LAG(avg_wage) OVER (ORDER BY YEAR))/
			LAG(avg_wage) OVER (ORDER BY YEAR ))* 100)::NUMERIC, 2) AS wage_growth_perc
FROM
	avg_wages
),
avg_food_prices AS (
SELECT
	YEAR,
	avg(avg_food_price) AS avg_food_price
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
GROUP BY
	YEAR
),
food_growth AS (
SELECT
		YEAR,
		round(
			(((avg_food_price - LAG(avg_food_price) OVER (ORDER BY YEAR))/
			LAG(avg_food_price) OVER (ORDER BY YEAR ))* 100)::NUMERIC, 2) AS price_growth_perc
FROM
		avg_food_prices
)
SELECT 
	g.year,
	g.gdp_growth_perc,
	w.wage_growth_perc,
	f.price_growth_perc
FROM
	gdp_growth g
LEFT JOIN wage_growth w ON
	g.YEAR = w.YEAR
LEFT JOIN food_growth f ON
	g.YEAR = f.YEAR
WHERE
	g.gdp_growth_perc IS NOT NULL
ORDER BY
	g.YEAR;


SELECT *
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 

SELECT *
FROM t_michaela_papadimitriu_ludvikova_project_sql_secondary_final AS tmplpssf
WHERE country = 'Czech Republic'