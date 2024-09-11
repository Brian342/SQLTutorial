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


