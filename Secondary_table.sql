CREATE TABLE IF NOT EXISTS t_Michaela_Papadimitriu_Ludvikova_project_SQL_secondary_final AS
SELECT 
	e.country,
	e.YEAR,
	e.gdp,
	e.gini,
	e.population
FROM economies AS e 
LEFT JOIN countries AS c 
 	ON e.country = c.country
WHERE c.continent = 'Europe'
AND e.gdp IS NOT NULL
AND e.gini IS NOT NULL
AND e.population IS NOT null;
