USE hotel_management;

DELIMITER //
CREATE PROCEDURE Employee_Login(IN Username VARCHAR(255), IN Password VARCHAR(255)) 
BEGIN
	SELECT 
		User.Username,
        Employee.SIN,
        Employee.Full_name,
        Employee.Address,
        Employee.Position,
        Employee.Hotel_ID
    FROM User
    JOIN Employee ON User.SIN = Employee.SIN
    WHERE User.Username = Username AND User.Password = Password
;END //


CREATE PROCEDURE Customer_Info(IN Username VARCHAR(255)) 
BEGIN
	SELECT *
    FROM customer
    WHERE customer.Username = Username
;END //