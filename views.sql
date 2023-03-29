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