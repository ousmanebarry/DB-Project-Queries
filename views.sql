-- Create employee view
CREATE VIEW Employee_View AS
SELECT 
	SIN,
	Full_name,
	Address,
	Position,
	BIN_TO_UUID(Work_At) as Work_At,
	Username
FROM employee
WHERE Username;

-- Create customer view
CREATE VIEW Customer_View AS
SELECT 
	BIN_TO_UUID(Customer_ID) as Customer_ID,
	Full_name,
	Address,
	Registration_Date,
	Username
FROM customer
WHERE customer.Username;

-- Create Available_Rooms view
CREATE VIEW Available_Rooms_Area AS
SELECT h.Address, COUNT(r.Room_ID) AS Num_Available_Rooms
FROM Hotel h
JOIN Room r ON h.Hotel.ID = r.Hotel.ID
WHERE r.Available = 1
GROUP BY h.Address;

-- Create Capacity_Of_Rooms_In_Hotel view
CREATE VIEW Capacity_Of_Rooms_In_Hotel AS
SELECT 
    