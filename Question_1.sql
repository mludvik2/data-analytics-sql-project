SELECT 
	industry_branch,
	YEAR,
	round(avg(avg_wage::numeric), 2) AS Wage
FROM t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final AS tmplpspf
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
SELECT industry_branch
	CASE
		WHEN min (wage >= previous_wage) = 1 THEN 'always growing'
	END
	
FROM (
	SELECT 
	industry_branch,
	YEAR,
	avg(avg_wage) AS wage,
	LAG(avg(avg_wage)) OVER (PARTITION BY industry_branch ORDER BY YEAR) AS previous_wage
	FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
	GROUP BY industry_branch, YEAR)
WHERE wage < previous_wage
GROUP BY industry_branch,YEAR
HAVING count(*) > 0;
.........................

SELECT industry_branch, YEAR,
	CASE
		WHEN min(CASE WHEN wage >= previous_wage THEN 1 ELSE 0 END) = 1
			THEN 'always growing'
		ELSE 'has declined'
	END AS wage_trend
--a view of wage and the privious_wage year to year per industry per industry
FROM (
	SELECT industry_branch,
		YEAR,
		avg(avg_wage) AS wage,
		lag(avg(avg_wage)) OVER(PARTITION BY industry_branch ORDER BY year) AS previous_wage
	FROM t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf 
	GROUP BY industry_branch,
		YEAR) mpl
WHERE previous_wage IS NOT NULL 
GROUP BY industry_branch, year
ORDER BY wage_trend desc, industry_branch ASC, year asc

---show only the decline with industry and year

--most odvetvi that have a decline usually shows up in 2013
