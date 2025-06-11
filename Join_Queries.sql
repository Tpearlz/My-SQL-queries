Select * FROM monarchs;

Inner Join Using ON

SELECT prime_ministers.country, prime_ministers.continent,
prime_minister, president
FROM presidents
INNER JOIN prime_ministers
ON presidents.country = prime_ministers.country;

Inner Join Using Aliased Tables

SELECT p2.country, p2.continent, prime_minister,president
FROM presidents AS p1
INNER JOIN prime_ministers AS p2
ON p1.country = p2.country;