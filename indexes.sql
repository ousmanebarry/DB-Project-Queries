-- Creating index on Employee
CREATE INDEX idx_employee_username_password 
ON Employee (Username, Password);