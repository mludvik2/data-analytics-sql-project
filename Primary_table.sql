SELECT *
FROM czechia_price AS cp 
WHERE date_part('year', cp.date_from) != date_part('year', cp.date_to)


SELECT
	cpc.name food_category,
	cp.value food_price,
	cpib.name industry_branch,
	cpay.value avg_wage,
	TO_char(cp.date_from, 'DD.Month YYYY') date_from
FROM czechia_price AS cp
LEFT JOIN czechia_payroll AS cpay
	ON date_part('year', cp.date_from) = cpay.payroll_year
LEFT JOIN czechia_payroll_industry_branch AS cpib 
	ON cpay.industry_branch_code = cpib.code 
LEFT JOIN czechia_price_category AS cpc 
	ON cpc.code = cp.category_code
WHERE cpay.value_type_code = 5958












	




