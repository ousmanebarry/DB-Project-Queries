-- Creating index on Employee Name
CREATE INDEX idx_employee_Full_name 
ON Employee (Full_name);

-- Creating index on Hotel ID
CREATE INDEX idx_Hotel_ID 
ON Hotel (Hotel_ID);

-- Creating index on Room Number
CREATE INDEX idx_Room_Number 
ON Room (Room_Number);