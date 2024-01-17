# SQL Join exercise
#

SELECT * FROM City;
# 1: Get the cities with a name starting with ping sorted by their population with the least populated cities first
SELECT name FROM city WHERE name LIKE "ping%" order by Population;
#
# 2: Get the cities with a name starting with ran sorted by their population with the most populated cities first
SELECT Name FROM city WHERE name LIKE "ran%" ORDER BY population DESC;
#
# 3: Count all cities
SELECT COUNT(id) FROM city;
#
# 4: Get the average population of all cities
SELECT AVG(population) FROM city;
#
# 5: Get the biggest population found in any of the cities
SELECT MAX(population) FROM city;
#
# 6: Get the smallest population found in any of the cities
SELECT MIN(population) FROM city;
#
# 7: Sum the population of all cities with a population below 10000
SELECT SUM(population) FROM city WHERE population<10000;
#
# 8: Count the cities with the countrycodes MOZ and VNM
SELECT COUNT(Name) FROM city WHERE CountryCode IN("MOZ","VNM");
#
# 9: Get individual count of cities for the countrycodes MOZ and VNM
SELECT DISTINCT COUNT(Name),CountryCode FROM city WHERE CountryCode IN("MOZ","VNM") GROUP BY CountryCode;
#
# 10: Get average population of cities in MOZ and VNM
SELECT AVG(population) FROM city WHERE CountryCode IN("MOZ","VNM");
#
# 11: Get the countrycodes with more than 200 cities
SELECT city.CountryCode,count(CountryCode) AS CityCount 
FROM city 
JOIN country ON City.CountryCode=country.Code 
GROUP BY city.CountryCode 
HAVING CityCount>200;
#
# 12: Get the countrycodes with more than 200 cities ordered by city count
SELECT city.CountryCode,count(CountryCode) AS CityCount 
FROM city 
JOIN country ON City.CountryCode=country.Code 
GROUP BY city.CountryCode 
HAVING CityCount>200
ORDER BY CityCount;
#
# 13: What language(s) is spoken in the city with a population between 400 and 500 ?
SELECT countrylanguage.Language
FROM countrylanguage JOIN city ON countrylanguage.CountryCode = city.CountryCode
WHERE city.Population BETWEEN 400 AND 500;
#
# 14: What are the name(s) of the cities with a population between 500 and 600 people and the language(s) spoken in them
SELECT name,countrylanguage.Language
FROM city JOIN countrylanguage 
ON city.CountryCode=countrylanguage.CountryCode 
WHERE city.population BETWEEN 500 AND 600;
#
# 15: What names of the cities are in the same country as the city with a population of 122199 (including the that city itself)
SELECT Name FROM city WHERE CountryCode = (SELECT CountryCode FROM city WHERE population=122199);
#
# 16: What names of the cities are in the same country as the city with a population of 122199 (excluding the that city itself)
SELECT Name FROM city WHERE CountryCode = (SELECT CountryCode FROM city WHERE population = 122199) AND population != 122199;
#
# 17: What are the city names in the country where Luanda is capital?
SELECT city.Name,country.Capital,country.LocalName,country.Name FROM city JOIN country ON city.CountryCode=country.Code WHERE city.Name = "Luanda";
#
# 18: What are the names of the capital cities in countries in the same region as the city named Yaren
SELECT City.Name FROM city JOIN (select Region,CountryCode FROM country JOIN city ON country.Code=city.CountryCode WHERE city.name="Yaren") AS RegCity ON city.CountryCode=RegCity.CountryCode; 
#
#
# 19: What unique languages are spoken in the countries in the same region as the city named Riga
SELECT DISTINCT Language FROM countrylanguage JOIN country ON countrylanguage.CountryCode=country.Code
JOIN city ON  country.Code=city.CountryCode 
WHERE city.Name="Riga";
#
#
# 20: Get the name of the most populous city
SELECT name FROM city ORDER BY POPULATION DESC LIMIT 1; 
