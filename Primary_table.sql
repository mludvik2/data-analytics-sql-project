SELECT *
FROM czechia_price AS cp 
WHERE date_part('year', cp.date_from) != date_part('year', cp.date_to)

CREATE TABLE IF NOT EXISTS t_Michaeala_Papadimitriu_Ludvikova_project_SQL_primary_final AS 
SELECT 
	TO_char(cp.date_from, 'YYYY') AS YEAR,
	cpib.name industry_branch,
	cpc.name food_category,
	cp.value food_price,
	cpay.value avg_wage
FROM czechia_price AS cp
LEFT JOIN czechia_payroll AS cpay
	ON date_part('year', cp.date_from) = cpay.payroll_year
LEFT JOIN czechia_payroll_industry_branch AS cpib 
	ON cpay.industry_branch_code = cpib.code 
LEFT JOIN czechia_price_category AS cpc 
	ON cpc.code = cp.category_code
WHERE cpay.value_type_code = 5958











	




