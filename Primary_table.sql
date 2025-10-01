CREATE TABLE IF NOT EXISTS t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final AS
SELECT 
	cpay.payroll_year AS YEAR,
	cpib.name industry_branch,
	cpc.name food_category,
	avg(cp.value) as avg_food_price,
	avg(cpay.value) AS avg_wage
FROM czechia_payroll AS cpay 
JOIN czechia_price AS cp 
	ON date_part('year', cp.date_from) = cpay.payroll_year
JOIN czechia_payroll_industry_branch AS cpib 
	ON cpay.industry_branch_code = cpib.code 
JOIN czechia_price_category AS cpc 
	ON cpc.code = cp.category_code
WHERE cpay.value_type_code = 5958 
	AND cpay.calculation_code = 200
	AND cpay.unit_code = 200
	AND cpay.value IS NOT NULL 
	AND cp.value IS NOT NULL 
GROUP BY cpay.payroll_year, cpib.name, cpc.name
ORDER BY YEAR, industry_branch, food_category

