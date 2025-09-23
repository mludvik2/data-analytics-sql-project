SELECT 
	c.continent,
	e.country,
	e.YEAR,
	e.gdp,
	e.gini	
FROM economies AS e 
LEFT JOIN countries AS c 
 	ON e.country = c.country
WHERE continent = 'Europe'
 	
