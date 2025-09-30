SELECT
	industry_branch,
	YEAR,
	CASE 
		WHEN (avg(wage) >= avg(previous_wage)) THEN 'grown'
		ELSE 'declined'
	END AS wage_trend
FROM
	(
	SELECT
		industry_branch,
		YEAR,
		avg(avg_wage) AS wage,
		LAG(avg(avg_wage)) OVER(PARTITION BY industry_branch ORDER BY YEAR) AS previous_wage
	FROM
		t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf
	GROUP BY
		industry_branch,
		YEAR)
WHERE
	previous_wage IS NOT NULL
GROUP BY
	industry_branch,
	YEAR
ORDER BY
	wage_trend ASC,
	industry_branch ASC,
	YEAR ASC
LIMIT 
	25;
	
SELECT
	min(YEAR),
	max(YEAR)
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf;

SELECT
	count(DISTINCT industry_branch)
FROM
	t_michaeala_papadimitriu_ludvikova_project_sql_primary_final AS tmplpspf;


