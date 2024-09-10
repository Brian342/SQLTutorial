SELECT *
FROM Portfolio_project..CovidDeaths
ORDER BY 3,4


-- SELECT *
-- FROM Portfolio_project..CovidVaccine
-- ORDER BY 3,4

-- select Data that we are going to be using
SELECT location, date, total_cases, new_cases, total_deaths, population 
FROM Portfolio_project..CovidDeaths
ORDER BY 1,2

-- Looking at total cases vs Total Deaths
-- Shows likelihood of dying if you contract covid in your country
SELECT location, date, total_cases, total_deaths, (CAST(total_deaths AS FLOAT)/total_cases)*100 as DeathPercentage
FROM Portfolio_project..CovidDeaths
where location like '%kenya%'
ORDER BY 1,2

-- looking at total cases vs population
-- shows what percentage of popluation got covid
SELECT location, date, population, total_cases, (CAST(total_cases AS FLOAT)/population)*100 as DeathPercentage
FROM Portfolio_project..CovidDeaths
where location like '%kenya%'
ORDER BY 1,2



