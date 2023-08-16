USE world;

/*todos los países que hablan esloveno*/
SELECT c.name, l.language, l.percentage FROM languages l 
JOIN countries c ON c.id = l.country_id
WHERE l.language = "slovene"
ORDER BY l.percentage DESC;

/*número total de ciudades de cada país*/
SELECT c.name, l.language, COUNT(ci.id) as cantidad_ciudades
FROM countries c
JOIN languages l ON c.id = l.country_id
JOIN cities ci ON ci.country_id = c.id
WHERE l.is_official = 1
GROUP BY c.id, l.language
ORDER BY COUNT(ci.id) DESC;

/*ciudades de México con una población mayor a 500,000*/
SELECT name, population, country_id FROM cities
WHERE cities.country_id = (SELECT id FROM countries WHERE countries.code="MEX")
AND cities.population > 500000
ORDER BY cities.population DESC;

/*idiomas en cada país con un porcentaje de habla mayor a 89%*/
SELECT name, language, percentage
FROM countries c
JOIN languages l ON c.id = l.country_id
WHERE l.percentage > 89
ORDER BY l.percentage DESC;

/*países con un área de superficie menor a 501 y población mayor a 100,000*/
SELECT name, surface_area, population
FROM countries
WHERE surface_area < 501 AND population > 100000;

/*países solo con monarquía constitucional, un capital superior a 200 y una esperanza de vida mayor a 75 años*/
SELECT name, government_form, capital, life_expectancy
FROM countries
WHERE government_form = "Constitutional Monarchy" AND capital > 200 AND life_expectancy > 75;

/*ciudades de Argentina dentro del distrito de Buenos Aires con una población mayor a 500,000 habitantes*/
SELECT c.name, ci.name, ci.district, ci.population 
FROM countries c
JOIN cities ci ON c.id = ci.country_id
WHERE c.name = "Argentina" AND ci.district = "Buenos Aires" AND ci.population > 500000;

/*número de países en cada región*/
SELECT region, COUNT(id) as countries
FROM countries
GROUP BY region
ORDER BY COUNT(id) DESC;