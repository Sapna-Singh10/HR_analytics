CREATE DATABASE hr_analytics;
USE hr_analytics;

SELECT * FROM employees;

-- Total Employess --
SELECT COUNT(*) AS TotalEmployees FROM employees;

-- Atrrition Count
SELECT Attrition, COUNT(*) AS Count
FROM Employees
GROUP BY Attrition;

-- Average Age, Salary
SELECT ROUND(AVG(Age),1) AS Avg_Age,
       ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM Employees;

-- Atrrition Rate by Department
SELECT Department,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS Attrition_Rate
FROM Employees
GROUP BY Department
ORDER BY Attrition_Rate DESC;

-- Average Salary by JobRole
SELECT JobRole, ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM Employees
GROUP BY JobRole
ORDER BY Avg_Salary DESC;

-- Gender Pay Gap
SELECT Gender, ROUND(AVG(MonthlyIncome),2) AS Avg_Salary
FROM Employees
GROUP BY Gender;

-- Atrrition by Age Group
SELECT AgeGroup, COUNT(*) AS Employees,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM Employees
GROUP BY AgeGroup
ORDER BY AttritionCount DESC;

-- Top 10 Highest paid emploees
SELECT EmployeeNumber, Department, JobRole, MonthlyIncome
FROM Employees
ORDER BY MonthlyIncome DESC
LIMIT 10;

-- Performance vs. Atrrition
SELECT PerformanceRating,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS LeftCompany
FROM Employees
GROUP BY PerformanceRating;

-- YearsAtCompany Bucket vs. Atrrition
SELECT TenureGroup,
       COUNT(*) AS Total,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END) AS AttritionCount
FROM Employees
GROUP BY TenureGroup
ORDER BY AttritionCount DESC;

-- Attrition by Department
SELECT Department,
       SUM(CASE WHEN Attrition='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS AttritionRate
FROM Employees
GROUP BY Department
ORDER BY AttritionRate DESC;

-- Average Salary By Job Role --
SELECT JobRole, ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM Employees
GROUP BY JobRole
ORDER BY AvgSalary DESC;

-- Average Salary by Gender --
SELECT Gender, ROUND(AVG(MonthlyIncome),2) AS AvgSalary
FROM Employees
GROUP BY Gender;

-- Atrrition by Age group --
SELECT AgeGroup,
       COUNT(*) AS TotalEmployees,
       SUM(Attrition='Yes') AS AttritionCount,
       ROUND(SUM(Attrition='Yes')*100.0/COUNT(*),2) AS AttritionRate
FROM Employees
GROUP BY AgeGroup
ORDER BY AttritionRate DESC;

-- Attrition by TenureGroup
SELECT 
  TenureGroup,
  COUNT(*) AS TotalEmployees,
  SUM(Attrition='Yes') AS AttritionCount,
  ROUND(SUM(Attrition='Yes')*100.0/COUNT(*),2) AS AttritionRate
FROM (
  SELECT
    CASE 
      WHEN YearsAtCompany BETWEEN 0 AND 2 THEN '0-2 Years'
      WHEN YearsAtCompany BETWEEN 3 AND 5 THEN '3-5 Years'
      WHEN YearsAtCompany BETWEEN 6 AND 10 THEN '6-10 Years'
      ELSE '10+ Years'
    END AS TenureGroup,
    Attrition
  FROM Employees
) AS sub
GROUP BY TenureGroup
ORDER BY AttritionRate DESC;





















