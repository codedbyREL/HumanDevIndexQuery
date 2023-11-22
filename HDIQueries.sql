--1. Visualizing Human Development Index by Entity Over Years

SELECT Entity, Code, Hdi
FROM [HumanDevIndex$]

--Measure: Hdi
--Dimensions: Entity, Year
--Human Development Index
--Visualization Suggestion for Tableau:
--Line chart: Display the Human Development Index over the years for each entity.



--2. Comparing Human Development Index by Entity and Code

SELECT Entity, Year, Hdi - LAG(Hdi) OVER (PARTITION BY Entity ORDER BY Year) AS Change_In_Hdi
FROM [HumanDevIndex$];
--Measure: Hdi
--Dimensions: Entity, Code

--Visualization Suggestion for Tableau:
--Scatter plot or heat map: Compare the Hdi among different entities and codes.


--3. Yearly Change in Hdi

SELECT Entity, Year, Hdi - LAG(Hdi) OVER (PARTITION BY Entity ORDER BY Year) AS Change_In_HDI
FROM HumanDevIndex$;

--Relevant Fields:
--Measure: Change_In_HDI
--Dimensions: Entity, Year
--Visualization Suggestion for Tableau:
--Area chart or line chart: Show the yearly change in Hdi for each entity.

--4. Top Entities with High Hdi

SELECT Entity, MAX(Hdi) AS Max_HDI
FROM HumanDevIndex$
GROUP BY Entity
ORDER BY Max_HDI DESC;

--Relevant Fields:
--Measure: Max_HDI
--Dimension: Entity
--Visualization Suggestion for Tableau:
--Bar chart or treemap: Display the top entities with the highest Hdi.
