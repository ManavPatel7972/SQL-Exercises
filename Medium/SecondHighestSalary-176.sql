-- 176. Second Highest Salary
-- Difficulty: Medium
-- Link: https://leetcode.com/problems/second-highest-salary/

-- Table: Employee
-- +-------------+------+
-- | Column Name | Type |
-- +-------------+------+
-- | id          | int  |
-- | salary      | int  |
-- +-------------+------+
-- id is the primary key (column with unique values) for this table.
-- Each row of this table contains information about the salary of an employee.

-- Write a solution to find the second highest DISTINCT salary from the Employee table.
-- If there is no second highest salary, return null.

-- Example:
-- Input:
-- Employee table:
-- +----+--------+
-- | id | salary |
-- +----+--------+
-- | 1  | 100    |
-- | 2  | 200    |
-- | 3  | 300    |
-- +----+--------+
-- Output:
-- +---------------------+
-- | SecondHighestSalary |
-- +---------------------+
-- | 200                 |
-- +---------------------+

-- Write your solution below:

-- Method 1: Subquery approach
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- Method 2: CTE with Window Function
WITH RankedSalaries AS (
    SELECT salary, DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
    FROM Employee
    GROUP BY salary
)
SELECT (SELECT salary FROM RankedSalaries WHERE rnk = 2) AS SecondHighestSalary;
