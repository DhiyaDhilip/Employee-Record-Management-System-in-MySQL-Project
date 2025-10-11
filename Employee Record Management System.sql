

CREATE TABLE employees (
    employee_id INT NOT NULL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    department_id INT,
    salary DECIMAL(10, 2)
);

INSERT INTO employees (employee_id, first_name, last_name, position, hire_date, department_id, salary)
VALUES
(101, 'John', 'Doe', 'Software Engineer', '2020-01-15', 1, 75000.00),
(201, 'Jane', 'Smith', 'Data Scientist', '2019-03-22', 2, 85000.00),
(301, 'Alice', 'Johnson', 'Product Manager', '2018-07-10', 3, 95000.00),
(401, 'Bob', 'Brown', 'HR Manager', '2021-04-05', 4, 70000.00),
(501, 'Charlie', 'Davis', 'DevOps Engineer', '2020-09-19', 1, 80000.00),
(601, 'David', 'Miller', 'QA Engineer', '2021-11-30', 1, 65000.00),
(701, 'Eve', 'Wilson', 'Marketing Specialist', '2017-06-25', 5, 60000.00),
(801, 'Frank', 'Moore', 'Sales Manager', '2016-12-15', 6, 95000.00),
(901, 'Grace', 'Taylor', 'Customer Support', '2022-02-01', 7, 50000.00),
(1001, 'Henry', 'Anderson', 'Financial Analyst', '2019-08-10', 8, 70000.00);


CREATE TABLE departments (
    department_id INT PRIMARY KEY Not Null,
    department_name VARCHAR(100)
);

INSERT INTO departments (department_id, department_name)
VALUES
(1, 'Engineering'),
(2, 'Data Science'),
(3, 'Product Management'),
(4, 'Human Resources'),
(5, 'Marketing'),
(6, 'Sales'),
(7, 'Customer Support'),
(8, 'Finance'),
(9, 'Legal'),
(10, 'Operations');

CREATE TABLE performance (
    review_id INT PRIMARY KEY Not Null,
    employee_id INT,
    review_date DATE,
    performance_score INT,
    comments TEXT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO performance (review_id, employee_id, review_date, performance_score, comments) VALUES
(1, 101, '2024-01-15', 85, 'Consistently meets performance expectations. Strong communicator.'),
(2, 201, '2024-01-16', 90, 'Exceeds performance goals, but should work on time management.'),
(3, 301, '2024-01-17', 78, 'Improvement needed in task completion speed, but quality is good.'),
(4, 401, '2024-01-18', 88, 'Great team player, needs to focus more on individual contributions.'),
(5, 501, '2024-01-19', 92, 'Exceptional work. Demonstrates leadership in projects.'),
(6, 601, '2024-01-20', 75, 'Tends to miss deadlines; needs to focus on organization.'),
(7, 701, '2024-01-21', 80, 'Shows initiative but requires guidance on complex tasks.'),
(8, 801, '2024-01-22', 95, 'Outstanding performance. Consistently goes above and beyond.'),
(9, 901, '2024-01-23', 70, 'Needs improvement in both quality and speed of work.'),
(10,1001, '2024-01-24', 85, 'Good performance, but should work on communication skills.');

INSERT INTO employees (employee_id,first_name, last_name, position, hire_date, department_id, salary)
VALUES (156,'Alice', 'Smith', 'Software Engineer', '2025-01-01', 2, 75000);

SELECT e.first_name, e.last_name, e.position, e.salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

UPDATE employees
SET salary = salary + 5000
WHERE employee_id = 1;

-- Retrieve employees with high performance scores

SELECT e.first_name, e.last_name, e.position, p.performance_score, p.comments
FROM employees e
JOIN performance p ON e.employee_id = p.employee_id
WHERE p.performance_score >= 90;

-- Calculate the average salary by department

SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- List all employees hired after 2020

SELECT first_name, last_name, position, hire_date
FROM employees
WHERE hire_date > '2020-12-31';

-- Count the number of employees in each department

SELECT d.department_name, COUNT(e.employee_id) AS employee_count
FROM departments d
LEFT JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name;

-- Find the total salary paid in the Engineering department

SELECT SUM(e.salary) AS total_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE d.department_name = 'Engineering';

-- Retrieve employees with no performance reviews

SELECT e.first_name, e.last_name, e.position
FROM employees e
LEFT JOIN performance p ON e.employee_id = p.employee_id
WHERE p.review_id IS NULL;

-- Display the highest-paid employee in each department

SELECT d.department_name, e.first_name, e.last_name, e.salary AS highest_salary
FROM employees e
JOIN departments d ON e.department_id = d.department_id
WHERE e.salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department_id = e.department_id
);

-- Delete performance reviews older than a specific date

DELETE FROM performance
WHERE review_date < '2023-01-01';

-- Add a new column to track bonuses for employees

ALTER TABLE employees
ADD COLUMN bonus DECIMAL(10, 2) DEFAULT 0.00;

-- Update the department of an employee

UPDATE employees
SET department_id = 3
WHERE employee_id = 156;

