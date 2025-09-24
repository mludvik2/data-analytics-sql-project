SELECT 
	tmplpspf.industry_branch,
	YEAR,
	round(avg(avg_wage::numeric), 2) AS Wage
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
GROUP BY YEAR,industry_branch
ORDER BY YEAR, industry_branch

SELECT industry_branch,
	tmplpspf.YEAR,
	tmplpspf2.year,
	tmplpspf2.avg_wage - tmplpspf.avg_wage AS wage_difference
FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
JOIN t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf2
	ON tmplpspf.industry_branch = tmplpspf2.industry_branch
		AND tmplpspf.YEAR = tmplpspf2.YEAR -1;