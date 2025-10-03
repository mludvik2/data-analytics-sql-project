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
SELECT
	f.YEAR,
	round(avg(f.price_growth_perc)::NUMERIC, 2) AS avg_price_perc,
	round(avg(w.wage_growth_perc)::NUMERIC, 2) AS avg_wage_perc,
	round((avg(f.price_growth_perc) - avg(w.wage_growth_perc)), 2) AS difference
FROM
	food_growth_calc f
JOIN wage_growth_calc w ON
	f.YEAR = w.YEAR
WHERE 
	f.previous_price IS NOT NULL
	AND w.previous_wage IS NOT NULL
GROUP BY
	f.YEAR
	--HAVING (avg(f.price_growth_perc) - avg(w.wage_growth_perc)) > 10
ORDER BY
	difference DESC,
	f.YEAR
























SELECT
	f.YEAR,
	avg(f.price_growth_perc) AS avg_food_growth,
	avg(w.wage_growth_perc) AS avg_wage_growth,
	(avg(f.price_growth_perc) - avg(w.wage_growth_perc)) AS difference
FROM
	food_growth_calc 
JOIN 
	wage_growth_calc ON 
---select:
---year, avg percent for price and wage
---calculate the diffrence between them

---from and join on the calcs

---where we remove null from previous price and wage

---group

---having
---avg(perc price) - avg(perc wage) > 10

--order by year