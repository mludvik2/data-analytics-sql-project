CREATE TABLE IF NOT EXISTS t_Michaela_Papadimitriu_Ludvikova_project_SQL_secondary_final AS
SELECT 
	e.country,
	e.YEAR,
	e.gdp,
	e.gini	
FROM economies AS e 
LEFT JOIN countries AS c 
 	ON e.country = c.country
WHERE c.continent = 'Europe';
 
