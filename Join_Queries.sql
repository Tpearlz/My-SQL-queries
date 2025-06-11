Select * FROM monarchs;

--Inner Join Using ON

SELECT prime_ministers.country, prime_ministers.continent,
prime_minister, president
FROM presidents
INNER JOIN prime_ministers
ON presidents.country = prime_ministers.country;

--Inner Join Using Aliased Tables

SELECT p2.country, p2.continent, prime_minister,president
FROM presidents AS p1
INNER JOIN prime_ministers AS p2
ON p1.country = p2.country;

--Inner Join using USING
SELECT p2.country, p2.continent, prime_minister, president
FROM presidents AS p1
INNER JOIN prime_ministers AS p2
USING(country);

--Mutiple inner Joins
SELECT *
FROM presidents AS p1
INNER JOIN prime_ministers AS p2
ON p1.country = p2.country
INNER JOIN monarchs AS p3
ON p1.continent = p3.continent;

--Join Example with USING
SELECT p1.country, p1.continent,  
       president, prime_minister 
FROM prime_ministers AS p1 
INNER JOIN presidents AS p2 
USING(country);
