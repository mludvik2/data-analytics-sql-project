SELECT 
	tmplpspf.industry_branch,
	YEAR,
	round(avg(avg_wage::numeric), 2) AS Wage
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
GROUP BY YEAR,industry_branch
ORDER BY YEAR, industry_branch;

SELECT tmplpspf.industry_branch,
	tmplpspf.YEAR,
	tmplpspf2.year,
	tmplpspf2.avg_wage - tmplpspf.avg_wage AS wage_difference
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
JOIN t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf2
	ON tmplpspf.industry_branch = tmplpspf2.industry_branch
		AND tmplpspf.YEAR = tmplpspf2.YEAR -1


--industtries the klesaji
		--To ti vrátí seznam odvětví, kde mzdy alespoň v jednom roce klesly.
SELECT industry_branch, year
FROM (
	SELECT 
	industry_branch,
	YEAR,
	avg(avg_wage) AS wage,
	LAG(avg(avg_wage)) OVER (PARTITION BY industry_branch ORDER BY YEAR) AS previous_wage
	FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
	GROUP BY industry_branch, YEAR) 
WHERE wage < previous_wage
GROUP BY industry_branch,year
HAVING count(*) > 0;

SELECT *
FROM t_michaela_papadimitriu_ludvikova_project_sql_secondary_final
