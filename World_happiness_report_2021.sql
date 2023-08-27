------ CREATING THE TABLE ------
CREATE TABLE WHREPORT2021 (Country VARCHAR(75), 
                            Region VARCHAR(75) , 
                            Happiness_score DECIMAL(5,3), 
                            Economy_gdp_per_capital DECIMAL(5,3), 
                            Social_support DECIMAL(5,3),
                            Healthy_life_expectancy DECIMAL(5,3) , 
                            Freedom DECIMAL(5,3), 
                            Generosity DECIMAL(5,3),
                            Perceptions_of_corruption DECIMAL(5,3), 
                            Ladder_score_dystopia DECIMAL(5,3), 
                            Explained_by_log_gdp DECIMAL(5,3),
                            Dystopia_residual DECIMAL(5,3)


------ TOP 10 MOST HAPPIEST COUNTRIES ------

SELECT TOP(10) Country,Happiness_score,Region FROM WHREPORT2021
ORDER BY Happiness_score DESC


------ TOP 10 LEAST HAPPIEST COUNTRIES ------
SELECT TOP(10) Country,Happiness_score,Region FROM WHREPORT2021
ORDER BY Happiness_score ASC


------ AVERAGE HAPPINESS SCORE PER REGION ------

SELECT Region,AVG(Happiness_score) AS Average_Happiness_Score
FROM WHREPORT2021
GROUP BY Region 
ORDER BY Average_Happiness_Score DESC

------ WHICH COUNTRIES CONTRIBUTE MOST TO THE HAPPINESS SCORE OF THE REGION ------

SELECT TOP(5) Country,Happiness_score
FROM WHREPORT2021 WHERE Region = 'North America and ANZ'
ORDER BY Happiness_score DESC



SELECT TOP(5) Country,Happiness_score
FROM WHREPORT2021 WHERE Region = 'Western Europe'
ORDER BY Happiness_score DESC


SELECT TOP(5) Country,Happiness_score
FROM WHREPORT2021 WHERE Region = 'South Asia'
ORDER BY Happiness_score ASC

SELECT TOP(5) Country,Happiness_score
FROM WHREPORT2021 WHERE Region = 'Sub-Saharan Africa'
ORDER BY Happiness_score ASC

------ TOP 10 COUNTRIES FOR HEALTHY LIFE EXPECTANCY ------

SELECT TOP(10) Country,Healthy_life_expectancy,Region FROM WHREPORT2021
ORDER BY Healthy_life_expectancy DESC 


------- 10 MOST GENEROUS COUNTRIES WITH BEST SOCIAL SUPPORT ------

SELECT TOP(10) Country,Social_support,Generosity,Region FROM WHREPORT2021
ORDER BY Generosity DESC,Social_support DESC 


------ CALCULATING CORRELATION ------

SELECT round((Avg(Social_support*Generosity) - (Avg(Social_support) * Avg(Generosity))) / (StDevP(Social_support) * StDevP(Generosity)),4) AS 'correlation'
FROM WHREPORT2021 


------ What are the Top 10 countries with the highest healthy life expectancy and GDP per capita? Is there any relationship?------


SELECT TOP(10) Country,Healthy_life_expectancy,Economy_gdp_per_capital,Region FROM WHREPORT2021
ORDER BY Healthy_life_expectancy DESC,Economy_gdp_per_capital DESC 

------ Checking if there is any relationship between life expectancy and Gdp per capita using the correlation coefficient in SQL------

SELECT round((Avg(Healthy_life_expectancy*Economy_gdp_per_capital) - (Avg(Healthy_life_expectancy) * Avg(Economy_gdp_per_capital))) / (StDevP(Healthy_life_expectancy) * StDevP(Economy_gdp_per_capital)),4) AS 'correlation'
FROM WHREPORT2021 

------- Is there is any relationship between happiness score , life expectancy , gdp per capita and social support--------


SELECT round((Avg(Healthy_life_expectancy*Happiness_score) - (Avg(Healthy_life_expectancy) * Avg(Happiness_score))) / (StDevP(Healthy_life_expectancy) * StDevP(Happiness_score)),2) AS 'correlation of happiness score vs life expectancy',
round((Avg(Economy_gdp_per_capital*Happiness_score) - (Avg(Economy_gdp_per_capital) * Avg(Happiness_score))) / (StDevP(Economy_gdp_per_capital) * StDevP(Happiness_score)),2) AS 'correlation of happiness score vs GDP per capita',
round((Avg(Social_support*Happiness_score) - (Avg(Social_support) * Avg(Happiness_score))) / (StDevP(Social_support) * StDevP(Happiness_score)),2) AS 'correlation of happiness score vs social support'
FROM WHREPORT2021"