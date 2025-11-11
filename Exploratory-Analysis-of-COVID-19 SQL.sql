-- Initial data verification

SELECT *
From PortfolioProject..CovidDeaths
ORDER BY 3,4

SELECT *
FROM PortfolioProject..CovidVaccinations
ORDER BY 3,4

-- 1. Total number of countries and time period covered in the COVID-19 dataset

SELECT
    COUNT(DISTINCT location) AS total_countries,             
    MIN(date) AS date_start,                            
    MAX(date) AS date_end,                              
    DATEDIFF(DAY, MIN(date), MAX(date)) AS total_days
FROM CovidDeaths
WHERE continent IS NOT NULL

-- 2. Global death rate (total_deaths / population)

SELECT
    SUM(CAST(total_deaths AS int)) / SUM(population) AS global_death_rate
FROM CovidDeaths
WHERE continent IS NOT NULL


-- 3. Death rate by continent (total_deaths / population)

SELECT continent,
    SUM(CAST(total_deaths AS INT)) / SUM(population) AS death_rate
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY continent
ORDER BY death_rate DESC


-- 4. Highest infection Rate compared to population (TOP 10)

SELECT TOP 10 location, population, 
    MAX(total_cases) AS HighestInfectionCount, 
    MAX((total_cases)/population)*100 AS PercentPopulationInfected
FROM PortfolioProject..CovidDeaths 
GROUP BY Location, population
ORDER BY PercentPopulationInfected DESC

-- 5. Average vaccination rate by continent (people_vaccinated / population)

SELECT
    v.continent,
    AVG(CAST(v.people_vaccinated AS FLOAT) / d.population) AS avg_vaccination_rate
FROM CovidVaccinations v
JOIN CovidDeaths d
    ON v.location = d.location
    AND v.date = d.date
WHERE v.continent IS NOT NULL
GROUP BY v.continent
ORDER BY avg_vaccination_rate DESC


---- 6.1 Joining CovidDeaths table with CovidVaccinations table (Method 1) 
--Select * 
--From PortfolioProject..CovidDeaths d
--Join PortfolioProject..CovidVaccinations v
--	On d.location = v.location
--	and d.date = v.date

-- 6.2 Join between CovidDeaths and CovidVaccinations tables (Method 2) 

SELECT
    d.location, d.continent, d.date, d.population, d.total_cases, d.total_deaths,
    v.new_vaccinations, v.people_vaccinated, v.people_fully_vaccinated
FROM CovidDeaths d
JOIN CovidVaccinations v
    ON d.location = v.location
    AND d.date = v.date
WHERE d.continent IS NOT NULL
ORDER BY d.location, d.date


-- 6.2.1. Compare number of records and key pairs between both tables

SELECT
    (SELECT COUNT(*) FROM CovidDeaths) AS deaths_rows,
    (SELECT COUNT(*) FROM CovidVaccinations) AS vaccinations_rows,
    (SELECT COUNT(*) 
     FROM CovidDeaths d
     JOIN CovidVaccinations v
        ON d.location = v.location
       AND d.date = v.date) AS joined_rows

-- 6.2.2 Check vaccination records without matching deaths records

SELECT
    v.location,
    v.date
FROM CovidVaccinations v
LEFT JOIN CovidDeaths d
    ON v.location = d.location
   AND v.date = d.date
WHERE d.location IS NULL

-- 6.2.3. Check deaths records without matching vaccination records

SELECT
    d.location,
    d.date
FROM CovidDeaths d
LEFT JOIN CovidVaccinations v
    ON d.location = v.location
   AND d.date = v.date
WHERE v.location IS NULL

    -- The datasets are perfectly aligned each record in CovidVaccinations has a matching entry in CovidDeaths for the same country and date. 
    -- The join between both tables is therefore consistent and reliable for further analysis.

-- 7. Evolution of total (cumulative) deaths over time

SELECT
    date,
    SUM(CAST(total_deaths AS INT)) AS cumulative_deaths
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date

-- 8. Evolution of total (cumulative) vaccinations over time

SELECT
    date,
    SUM(CAST(total_vaccinations AS BIGINT)) AS cumulative_vaccinations
FROM CovidVaccinations
WHERE continent IS NOT NULL
GROUP BY date
ORDER BY date

-- 9. Average daily deaths before and after the start of vaccination by country

SELECT
    d.location,
    AVG(CASE 
        WHEN v.total_vaccinations IS NULL OR v.total_vaccinations = 0 
        THEN TRY_CAST(d.new_deaths AS FLOAT) 
        END) AS avg_daily_deaths_before_vax,
    AVG(CASE 
        WHEN v.total_vaccinations > 0 
        THEN TRY_CAST(d.new_deaths AS FLOAT) 
        END) AS avg_daily_deaths_after_vax
FROM CovidDeaths d
JOIN CovidVaccinations v
    ON d.location = v.location
   AND d.date = v.date
WHERE d.continent IS NOT NULL
GROUP BY d.location
ORDER BY d.location

-- 10. Top countries by highest vaccination rate

SELECT
    v.location,
    MAX(CAST(v.people_vaccinated AS FLOAT) / d.population) * 100 AS highest_vaccination_rate
FROM CovidVaccinations v
JOIN CovidDeaths d
    ON v.location = d.location
   AND v.date = d.date
WHERE v.continent IS NOT NULL
GROUP BY v.location
ORDER BY highest_vaccination_rate DESC

-- 11. Countries ranked by lowest death rate

SELECT
    location,
    (SUM(CAST(total_deaths AS FLOAT)) / SUM(population)) * 100 AS death_rate_percentage
FROM CovidDeaths
WHERE continent IS NOT NULL
GROUP BY location
HAVING SUM(CAST(total_deaths AS FLOAT)) > 0
ORDER BY death_rate_percentage ASC
