

Select *
From [Portfolio Project]..['CovidDeaths I$']
Order by 3,4


--Select *
--From [Portfolio Project]..CovidVaccinations$
--Order by 3,4

-- LET'S BEGIN BY SELECTING THE DATA WE WILL BE WORKING WITH IT

Select Location, Date, Total_Tests, New_Tests, Population
From [Portfolio Project]..['CovidDeaths I$']
--Where continent is not null
Order by 3,4


--Select Location, date, total_cases, new_cases,total_deaths, population
--From dbo.['CovidDeaths I$']
--Where continent is null
--Order by 1,2



--Select Location, Date, Total_Tests, New_Tests, (Total_Tests/New_Tests)*100 As TestPercentage
--From [Portfolio Project]..['CovidDeaths I$']
--Where continent is not null
--Order by 3,4


Select Location, date, total_cases, new_cases,total_deaths, population
From dbo.['CovidDeaths I$']
--Where continent is null
Order by 1,2


Select Location, Date, Total_Tests, New_Tests, CAST(Total_Tests AS Decimal (18, 2)) / 2 AS TestPercent
From [Portfolio Project]..['CovidDeaths I$']
Where continent is not null
Order by 1,2


Select Location, Date, Total_Tests, New_Tests, CAST(Total_Tests AS Decimal (20, 3 )) / 10 AS TestPercent
From [Portfolio Project]..['CovidDeaths I$']
Where continent is not null 
Order by 1,2

SELECT
    Location,
    Date,
    Total_Tests,
    New_Tests,
    (CAST(Total_Tests AS decimal(255)) * CAST(New_Tests AS decimal(255))) * 100 AS TestPercentage
FROM [Portfolio Project]..['CovidDeaths I$']
WHERE continent IS NOT NULL
ORDER BY 3, 4;

SELECT Location, Date, Total_Tests, New_Tests,  (CAST(Total_Tests AS decimal(255))
    * CAST(New_Tests AS decimal(255))) * 100 AS TestPercentage
  FROM [Portfolio Project]..['CovidDeaths I$']
--WHERE continent IS NOT NULL
ORDER BY 3, 4;



SELECT Location,Date, Population,Total_Tests,New_Tests,
    (CAST(Total_Tests AS decimal) / CAST(New_Tests AS decimal)) * 100 AS TestPercentage
FROM [Portfolio Project]..['CovidDeaths I$']
--WHERE continent IS NULL
ORDER BY 1,2;


SELECT Location, Date, Population, Total_Tests, New_Tests,  (CAST(Total_Tests AS int))/
    (CAST(New_Tests AS int)) * 100 AS TestPercentage
  FROM [Portfolio Project]..['CovidDeaths I$']
WHERE continent IS NOT NULL
ORDER BY 1,2;


SELECT Location, Date, Population,  New_Tests, Total_Tests, (CAST(Total_Tests AS int))/
    (CAST(New_Tests AS int)) * 100 AS TestPercentage
  FROM [Portfolio Project]..['CovidDeaths I$']
WHERE Location  Like  '%United States%'
  and continent IS NOT NULL
ORDER BY 1,2;


  SELECT Location, Date, Population,  New_Tests, Total_Tests, (CAST(Total_Tests as int) /
    CAST(New_Tests as int))* 100 as TestPercentage
  FROM [Portfolio Project]..['CovidDeaths I$']
WHERE Location  Like  '%Nigeria%'
  and continent IS NOT NULL
ORDER BY 1,2;


 SELECT Location, Date, Population,  New_Tests, Total_Tests, ( Total_Tests/Population)*
     100 as TotalPopulationTested
  FROM [Portfolio Project]..['CovidDeaths I$']
WHERE Location  Like  '%Africa%'
  and continent IS NOT NULL
ORDER BY 1,2;


 SELECT Location, Date, Population,  New_Tests, Total_Tests, ( New_Tests/Population)*
     100 as PopulationTested
  FROM [Portfolio Project]..['CovidDeaths I$']
WHERE Location  Like  '%Africa%'
  and continent IS NOT NULL
ORDER BY 1,2;


 SELECT Location, Date, Population,  New_Tests, Total_Tests, ( Total_Tests/Population)*
     100 as TotalPopulationTested
  FROM [Portfolio Project]..['CovidDeaths I$']
--WHERE Location  Like  '%Africa%'
ORDER BY 1,2 desc


SELECT Continent, Population, MAX(Total_Tests) as HighestTestCount, MAX(Total_Tests/Population)*  
     100 as PercentageOfPopulationTested
  FROM [Portfolio Project]..['CovidDeaths I$']
--WHERE Location  Like  '%Africa%'
Group by continent, population
Order by PercentageOfPopulationTested  desc



-- LET'S BREAK THINGS DOWN BY CONTINENT

-- Showing continents with the highest test count per population

SELECT continent, MAX(CAST(Total_Tests as int)) as TotalTestCount 
  FROM [Portfolio Project]..['CovidDeaths I$']
--WHERE Location  Like  '%Africa%'
Where continent is not null
Group by continent
Order by TotalTestCount desc


-- USING GLOBAL NUMBERS

Select date,SUM(CAST(new_tests as int)) as new_cases, SUM(Cast(total_tests as int)) as total_cases, 
 SUM(Cast(total_tests as int))/SUM(CAST(new_tests as int)) as PercentageTested
From dbo.['CovidDeaths I$']
--Where location like '%Nigeria%'
Where continent is not null
Group By date
Order by 1,2                                   

