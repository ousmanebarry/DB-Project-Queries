DELIMITER //
CREATE PROCEDURE Employee_Login(IN Username VARCHAR(255), IN Password VARCHAR(255)) 
BEGIN
	SELECT *
    FROM employee
    WHERE employee.Username = Username AND employee.Password = Password
;END //


CREATE PROCEDURE Customer_Login(IN Username VARCHAR(255), IN Password VARCHAR(255)) 
BEGIN
	SELECT *
    FROM customer
    WHERE customer.Username = Username AND customer.Password = Password
;END //