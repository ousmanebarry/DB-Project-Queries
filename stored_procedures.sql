DELIMITER //
CREATE PROCEDURE Employee_Info(IN Username VARCHAR(255)) 
BEGIN
	SELECT 
		SIN,
        Full_name,
        Address,
        Position,
        Work_At,
        Username
    FROM employee
    WHERE employee.Username = Username
;END //


CREATE PROCEDURE Customer_Info(IN Username VARCHAR(255)) 
BEGIN
	SELECT 
		Customer_ID,
        Full_name,
        Address,
        Registration_Date,
        Username
    FROM customer
    WHERE customer.Username = Username
;END //