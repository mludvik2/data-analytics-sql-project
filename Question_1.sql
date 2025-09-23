SELECT *
FROM czechia_payroll AS cpay
JOIN czechia_payroll_industry_branch AS cpib 
	ON cpay.industry_branch_code = cpib.code
WHERE cp.value_type_code = 5958;


JOIN czechia_price AS cp 
	 On