
--									CTE - Common Table Expression

--WITH CTE_Employee AS 
--(SELECT FirstName, LastName, Gender, Salary
--, COUNT(Gender) OVER (PARTITION BY Gender) as TotalGender
--, AVG(Salary) OVER (PARTITION BY Gender) as AvgSalary
--FROM [SQLTutorial].[dbo].[EmployeeDemographics] emp
--JOIN [SQLTutorial].[dbo].[EmployeeSalary] sal
--	ON emp.EmployeeID = sal.EmployeeID
--WHERE Salary > '45000'
--)
--SELECT *
--FROM CTE_Employee


--									TEMP TABLES

--CREATE TABLE #temp_Employee (
--Employee_ID int,
--JobTitle varchar(100),
--Salary int
--)

--insert into #temp_Employee values (
--'1001', 'HR', '45000'
--)

--select *
--from #temp_Employee

--insert into #temp_Employee
--select * 
--from [SQLTutorial].[dbo].[EmployeeSalary]

--DROP TABLE IF EXISTS #temp_emp2
--create table #temp_emp2 (
--JobTitle varchar(50),
--EmployeesPerJob int,
--AvgAge int,
--AvgSalary int
--)

--insert into #temp_emp2
--SELECT JobTitle, COUNT(JobTitle), Avg(Age), Avg(Salary)
--FROM [SQLTutorial].[dbo].[EmployeeDemographics] emp
--JOIN [SQLTutorial].[dbo].[EmployeeSalary] sal
--	ON emp.EmployeeID = sal.EmployeeID
--group by JobTitle

--select *
--from #temp_emp2

--										STRING FUNCTIONS

--CREATE TABLE EmployeeErrors (
--EmployeeID varchar(50)
--,FirstName varchar(50)
--,LastName varchar(50)
--)

--Insert into EmployeeErrors Values 
--('1001  ', 'Jimbo', 'Halbert')
--,('  1002', 'Pamela', 'Beasely')
--,('1005', 'TOby', 'Flenderson - Fired')

SELECT * 
FROM EmployeeErrors

--Trim, LTRIM, RTRIM
SELECT EmployeeID, TRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, LTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors

SELECT EmployeeID, RTRIM(EmployeeID) AS IDTRIM
FROM EmployeeErrors


-- REPLACE
SELECT LastName, REPLACE(LastName, '- Fired','') AS LastNameFixed
FROM EmployeeErrors


-- Substring
SELECT SUBSTRING(err.FirstName,1,3), SUBSTRING(dem.FirstName,1,3)
FROM EmployeeErrors err
JOIN SQLTutorial.dbo.EmployeeDemographics dem
	ON SUBSTRING(err.FirstName,1,3) = SUBSTRING(dem.FirstName,1,3)


-- UPPER AND LOWER
SELECT FirstName, LOWER(FirstName)
FROM EmployeeErrors

SELECT FirstName, UPPER(FirstName)
FROM EmployeeErrors


--									STORED PROCEDURES
CREATE PROCEDURE TEST
AS
SELECT *
FROM EmployeeDemographics
