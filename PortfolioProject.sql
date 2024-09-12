SELECT *
FROM Portfolio_project..CovidDeaths
where continent is not null
ORDER BY 3,4


-- SELECT *
-- FROM Portfolio_project..CovidVaccine
-- ORDER BY 3,4

-- select Data that we are going to be using
SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM Portfolio_project..CovidDeaths
where continent is not null
ORDER BY 1,2

-- Looking at total cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/total_cases)*100 as DeathPercentage
FROM Portfolio_project..CovidDeaths
where location like '%kenya%' and continent is not null
ORDER BY 1,2

-- looking at total cases vs population
-- shows what percentage of popluation got covid
SELECT location, date, population, total_cases, (CAST(total_cases AS FLOAT)/population)*100 as Percentageofpopulation
FROM Portfolio_project..CovidDeaths
where continent is not null
--where location like '%kenya%'
ORDER BY 1,2

-- Looking at countries with highest infection rate compared to population
SELECT location, population, MAX(total_cases) AS HighestInfectionCount, MAX(CAST(total_cases AS FLOAT)/population)*100 as Percentageofpopulationinfected
FROM Portfolio_project..CovidDeaths
--where location like '%kenya%'
where continent is not null
GROUP BY location, population
ORDER BY Percentageofpopulationinfected DESC

--Showing countries with highest Death count per population
SELECT location, MAX(CAST(total_deaths AS INT)) AS TotalDeathCount
FROM Portfolio_project..CovidDeaths
--where location like '%kenya%'
where continent is not null
GROUP BY location
ORDER BY TotalDeathCount DESC

--Let's break things down by continent

SELECT location, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM Portfolio_project..CovidDeaths
--where location like '%kenya%' 
WHERE continent is not NULL
GROUP BY location
order by TotalDeathCount DESC

-- Showing continent with the highest death count per population

SELECT continent, MAX(cast(total_deaths as int)) as TotalDeathCount
FROM Portfolio_project..CovidDeaths
--where location like '%kenya%' 
WHERE continent is not NULL
GROUP BY continent
order by TotalDeathCount DESC


-- Global Numbers

-- ALTER TABLE CovidDeaths
-- ALTER COLUMN new_cases NVARCHAR(50)
select  sum(cast(new_cases as int)) as total_cases, sum(cast(new_deaths as int)) as total_deaths , SUM(cast(new_deaths as int))/sum(cast(new_cases as float))*100 as DeathPercentage
from Portfolio_project..CovidDeaths
--where location like %kenya%
WHERE continent is not NULL
-- GROUP by date
order by 1, 2

-- looking at Total population vs vaccinations
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location,
dea.date) as Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
join Portfolio_project..CovidVaccine vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
order by 2,3

-- use CTE
WITH popvsvac (Continent, Location, Date, Population, new_vaccinations, Rollingpeoplevaccinated)
AS
(
select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(cast(vac.new_vaccinations as int)) over (partition by dea.location order by dea.location,
 dea.date) as Rollingpeoplevaccinated
--  (Rollingpeoplevaccinated/population)*100
FROM Portfolio_project..CovidDeaths dea
join Portfolio_project..CovidVaccine vac
    on dea.location = vac.location
    and dea.date = vac.date
where dea.continent is not null
-- order by 2,3
)
SELECT * , (cast(Rollingpeoplevaccinated AS FLOAT)/Population )* 100
from popvsvac


-- Temp Table
DROP TABLE if exists #percentpopulationvaccinated
CREATE TABLE #percentpopulationvaccinated
(
    Continent nvarchar(255),
    Location nvarchar(255),
    Date datetime, 
    Population numeric,
    New_vaccinations numeric,
    Rollingpeoplevaccinated numeric
)

-- Inserting data into the temp table
INSERT INTO #percentpopulationvaccinated
SELECT 
    dea.continent, 
    dea.location, 
    dea.date, 
    dea.population, 
    vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccine vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL

-- Querying the temp table
SELECT *, 
    (Rollingpeoplevaccinated/ population) * 100
FROM #percentpopulationvaccinated


-- Creating view to store data for visualization
CREATE View percentpopulationvaccinated AS
SELECT dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
    SUM(CAST(vac.new_vaccinations AS int)) OVER (PARTITION BY dea.Location ORDER BY dea.location, dea.Date) AS Rollingpeoplevaccinated
FROM Portfolio_project..CovidDeaths dea
JOIN Portfolio_project..CovidVaccine vac
    ON dea.location = vac.location
    AND dea.date = vac.date
WHERE dea.continent IS NOT NULL
-- order by 2,3

select *
FROM percentpopulationvaccinated
