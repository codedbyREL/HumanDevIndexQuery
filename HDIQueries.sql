
--2. Comparing Human Development Index by Entity and Code

SELECT Entity, Year, Hdi - LAG(Hdi) OVER (PARTITION BY Entity ORDER BY Year) AS Change_In_Hdi
FROM [HumanDevIndex$];






