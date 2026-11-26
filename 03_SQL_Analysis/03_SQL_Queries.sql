CREATE DATABASE HR_Attrition;
show tables;
USE HR_Attrition ;
USE HR_Attrition;

SELECT COUNT(*) 
FROM hr_employee_attrition;

SELECT * FROM hr_employee_attrition
LIMIT 10;

DESCRIBE hr_employee_attrition;

ALTER TABLE hr_employee_attrition
CHANGE COLUMN `ï»¿Age` Age INT;

-- 1. Employee Count by Attrition Status
SELECT
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Attrition;

-- 2. Overall Employee Attrition Rate
SELECT
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),2) 
        AS Attrition_Rate_Percentage
FROM hr_employee_attrition;

-- 3. Department-wise Employee Count
SELECT
    Department,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Total_Employees DESC;

-- 4. Department-wise Employee Attrition
SELECT
    Department,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Department, Attrition
ORDER BY Department, Attrition;

-- 5. Department-wise Attrition Rate
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate_Percentage
FROM hr_employee_attrition
GROUP BY Department
ORDER BY Attrition_Rate_Percentage DESC;

-- 6. Job Role-wise Employee Count
SELECT
    JobRole,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Total_Employees DESC;

-- 7. Job Role-wise Employee Attrition
SELECT
    JobRole,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY JobRole, Attrition
ORDER BY JobRole, Attrition;

-- 8. Job Role-wise Attrition Rate
SELECT
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate_Percentage
FROM hr_employee_attrition
GROUP BY JobRole
ORDER BY Attrition_Rate_Percentage DESC;

-- Key Finding:
-- Sales Representatives have the highest attrition rate (39.76%).
-- Research Directors have the lowest attrition rate (2.50%).

-- 9. Age Group-wise Employee Count
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Age_Group
ORDER BY
    CASE Age_Group
        WHEN 'Under 25' THEN 1
        WHEN '25-34' THEN 2
        WHEN '35-44' THEN 3
        WHEN '45-54' THEN 4
        ELSE 5
    END;
    
-- The 25–34 age group has the highest number of employees (554).
-- The 55+ age group has the lowest number (69).

-- 10. Age Group-wise Employee Attrition
SELECT
    CASE
        WHEN Age < 25 THEN 'Under 25'
        WHEN Age < 35 THEN '25-34'
        WHEN Age < 45 THEN '35-44'
        WHEN Age < 55 THEN '45-54'
        ELSE '55+'
    END AS Age_Group,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Age_Group, Attrition
ORDER BY
    CASE Age_Group
        WHEN 'Under 25' THEN 1
        WHEN '25-34' THEN 2
        WHEN '35-44' THEN 3
        WHEN '45-54' THEN 4
        ELSE 5
    END,
    Attrition;
    
-- 11. Gender-wise Employee Count
SELECT
    Gender,
    COUNT(*) AS Total_Employees
FROM hr_employee_attrition
GROUP BY Gender
ORDER BY Total_Employees DESC;

-- 12. Gender-wise Employee Attrition
SELECT
    Gender,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY Gender, Attrition
ORDER BY Gender, Attrition;

-- 13. Overtime-wise Employee Attrition
SELECT
    OverTime,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY OverTime, Attrition
ORDER BY OverTime, Attrition;

-- 14. Overtime-wise Attrition Rate
SELECT
    OverTime,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate_Percentage
FROM hr_employee_attrition
GROUP BY OverTime
ORDER BY Attrition_Rate_Percentage DESC;

-- 15. Business Travel-wise Employee Attrition
SELECT
    BusinessTravel,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY BusinessTravel, Attrition
ORDER BY BusinessTravel, Attrition;

-- 16. Marital Status-wise Employee Attrition
SELECT
    MaritalStatus,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY MaritalStatus, Attrition
ORDER BY MaritalStatus, Attrition;

-- 17. Education Field-wise Employee Attrition
SELECT
    EducationField,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY EducationField, Attrition
ORDER BY EducationField, Attrition;

-- 18. Job Satisfaction-wise Employee Attrition
SELECT
    JobSatisfaction,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY JobSatisfaction, Attrition
ORDER BY JobSatisfaction, Attrition;

-- 19. Average Monthly Income by Attrition Status

SELECT
    Attrition,
    ROUND(AVG(MonthlyIncome), 2) AS Average_Monthly_Income
FROM hr_employee_attrition
GROUP BY Attrition;

-- 20. Average Years at Company by Attrition Status
SELECT
    Attrition,
    ROUND(AVG(YearsAtCompany), 2) AS Average_Years_At_Company
FROM hr_employee_attrition
GROUP BY Attrition;

-- 21. Average Age by Attrition Status
SELECT
    Attrition,
    ROUND(AVG(Age), 2) AS Average_Age
FROM hr_employee_attrition
GROUP BY Attrition;

-- 22. Average Distance from Home by Attrition Status
SELECT
    Attrition,
    ROUND(AVG(DistanceFromHome), 2) AS Average_Distance
FROM hr_employee_attrition
GROUP BY Attrition;

-- 23. Work-Life Balance-wise Employee Attrition
SELECT
    WorkLifeBalance,
    Attrition,
    COUNT(*) AS Employee_Count
FROM hr_employee_attrition
GROUP BY WorkLifeBalance, Attrition
ORDER BY WorkLifeBalance, Attrition;

-- 24. Average Years in Current Role by Attrition Status
SELECT
    Attrition,
    ROUND(AVG(YearsInCurrentRole), 2) AS Average_Years_In_Current_Role
FROM hr_employee_attrition
GROUP BY Attrition;

-- 25. Average Years Since Last Promotion by Attrition Status
SELECT
    Attrition,
    ROUND(AVG(YearsSinceLastPromotion), 2) AS Average_Years_Since_Last_Promotion
FROM hr_employee_attrition
GROUP BY Attrition;

-- ==========================================
-- HR EMPLOYEE ATTRITION: KEY BUSINESS FINDINGS
-- ==========================================

-- 1. Total employees: 1470
-- 2. Employees who left: 237
-- 3. Employees who stayed: 1233
-- 4. Overall attrition rate: 16.12%
-- 5. Sales department has the highest attrition rate: 20.63%.
-- 6. Sales Representatives have the highest job-role attrition rate: 39.76%.
-- 7. Research Directors have the lowest job-role attrition rate: 2.50%.
-- 8. The 25-34 age group has the highest employee count.

-- 26. Employees with Monthly Income Above 7000
SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome
FROM hr_employee_attrition
WHERE MonthlyIncome > 7000
ORDER BY MonthlyIncome DESC;

-- 27. HR Retention Priority Analysis
SELECT
    Department,
    JobRole,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate
FROM hr_employee_attrition
GROUP BY Department, JobRole
HAVING COUNT(*) >= 10
ORDER BY Attrition_Rate DESC;

-- 28. Employees Earning Above Average Salary
SELECT
    EmployeeNumber,
    Age,
    Department,
    JobRole,
    MonthlyIncome
FROM hr_employee_attrition
WHERE MonthlyIncome > (
    SELECT AVG(MonthlyIncome)
    FROM hr_employee_attrition
)
ORDER BY MonthlyIncome DESC;

-- 29. Department-wise Average Salary Using CTE
WITH DepartmentSalary AS (
    SELECT
        Department,
        ROUND(AVG(MonthlyIncome), 2) AS Average_Salary
    FROM hr_employee_attrition
    GROUP BY Department
)
SELECT
    Department,
    Average_Salary
FROM DepartmentSalary
ORDER BY Average_Salary DESC;

-- 30. Rank Departments by Attrition Rate
SELECT
    Department,
    COUNT(*) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Employees_Left,
    ROUND(
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*),
        2
    ) AS Attrition_Rate,
    RANK() OVER (
        ORDER BY
        SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) DESC
    ) AS Attrition_Rank
FROM hr_employee_attrition
GROUP BY Department;