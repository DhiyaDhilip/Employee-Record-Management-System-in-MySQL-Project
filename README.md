# Employee-Record-Management-System-in-MySQL-Project
This SQL project manages employee data, departments, and performance reviews. It includes operations like inserting, updating, deleting, and altering data. Using JOINs, GROUP BY, and subqueries, it analyzes salaries, performance scores, and department insights, making it a complete employee management and performance tracking system.



##  MySQL Project: Employee Management System

###  Project Overview:
This project simulates a relational database for managing employee records, departmental structures, and performance reviews. It demonstrates your ability to design normalized schemas, implement foreign key relationships, and write advanced SQL queries for HR analytics and operational insights.

---

###  Database Schema Design

#### 🔹 employees
Stores employee details:
- Fields: `employee_id`, `first_name`, `last_name`, `position`, `hire_date`, `department_id`, `salary`, `bonus`

#### 🔹 departments
Defines organizational departments:
- Fields: `department_id`, `department_name`

#### 🔹 performance
Tracks employee performance reviews:
- Fields: `review_id`, `employee_id`, `review_date`, `performance_score`, `comments`
- Foreign Key: `employee_id` → `employees`

---

###  SQL Query Highlights

#### Employee Insights
- List employees in the Engineering department  
- Retrieve employees hired after 2020  
- Display highest-paid employee in each department  
- Identify employees with no performance reviews  
- Update department or salary for specific employees  
- Add a new column to track bonuses

#### Performance Analysis
- Retrieve employees with performance scores ≥ 90  
- Delete reviews older than a specific date  
- Summarize performance comments and scores

#### Departmental Metrics
- Count employees per department  
- Calculate average salary by department  
- Find total salary paid in Engineering

---

###  Skills Demonstrated
- Relational schema design with foreign key constraints  
- Data insertion and normalization  
- Join operations across multiple tables  
- Aggregation functions (`AVG`, `SUM`, `COUNT`)  
- Subqueries and conditional filtering  
- Schema evolution (`ALTER TABLE`)  
- Update and delete operations

---

###  Outcome:
This project showcases your ability to build and query a scalable HR database system using MySQL. It reflects practical skills in employee data management, performance tracking, and departmental analysis — essential for roles in data engineering, HR analytics, and business intelligence.

