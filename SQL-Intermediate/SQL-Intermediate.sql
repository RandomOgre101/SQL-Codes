-- CASE STATEMENT

--SELECT FirstName, LastName, Age,
--CASE
--	WHEN Age > 30 THEN 'Old'
--	WHEN Age BETWEEN 27 AND 30 THEN 'Young'
--	ELSE 'Baby'
--END
--FROM SQL_Intermediate.dbo.EmployeeDemographics
--WHERE Age is NOT NULL
--ORDER BY Age

--SELECT FirstName, LastName, JobTitle, Salary,
--CASE
--	WHEN JobTitle = 'Salesman' THEN Salary + (Salary * 0.1)
--	WHEN JobTitle = 'Accountant' THEN Salary + (Salary * 0.05)
--	WHEN JobTitle = 'HR' THEN Salary + (Salary * 0.000001)
--	ELSE Salary + (Salary * 0.03)
--END AS SalaryAfterRaise
--FROM SQL_Intermediate.dbo.EmployeeDemographics
--JOIN SQL_Intermediate.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID

--           HAVING STATEMENT

--SELECT JobTitle, COUNT(JobTitle)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING COUNT(JobTitle) > 1

--SELECT JobTitle, AVG(Salary)
--FROM SQLTutorial.dbo.EmployeeDemographics
--JOIN SQLTutorial.dbo.EmployeeSalary
--	ON EmployeeDemographics.EmployeeID = EmployeeSalary.EmployeeID
--GROUP BY JobTitle
--HAVING AVG(Salary) > 45000
--ORDER BY AVG(Salary)  


--            UPDATING AND DELETING


--UPDATE SQL_Intermediate.dbo.EmployeeDemographics
--SET EmployeeID = 1012, Age = 31, Gender = 'Female'
--WHERE FirstName = 'Holly' AND LastName = 'Flax'

--SELECT *
--FROM SQL_Intermediate.dbo.EmployeeDemographics

--DELETE FROM SQL_Intermediate.dbo.EmployeeDemographics
--WHERE EmployeeID = 1005

--                  ALIASING

--SELECT FirstName + ' ' + LastName AS FullName
--FROM SQL_Intermediate.dbo.EmployeeDemographics

--SELECT AVG(Age) AS AvgAge
--FROM SQL_Intermediate.dbo.EmployeeDemographics

--SELECT Demo.EmployeeID, Sal.Salary
--FROM SQL_Intermediate.dbo.EmployeeDemographics AS Demo
--JOIN SQL_Intermediate.dbo.EmployeeSalary AS Sal
--	ON Demo.EmployeeID = Sal.EmployeeID


--								PARTITION BY

SELECT FirstName, LastName, Gender, Salary
, COUNT(Gender) OVER (PARTITION BY Gender) AS TotalGender
FROM SQL_Intermediate.dbo.EmployeeDemographics AS dem
JOIN SQL_Intermediate.dbo.EmployeeSalary AS sal
	ON dem.EmployeeID = sal.EmployeeID
