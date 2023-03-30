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

-- Search for rooms
CREATE PROCEDURE Search_Rooms(
    IN Room_Capacity INT,
    IN Area VARCHAR(255),
    IN Hotel_Chain_Name VARCHAR(255),
    IN Hotel_Category VARCHAR(255),
    IN Number_Of_Rooms INT,
    IN Price DECIMAL (10,2)
)
BEGIN
    SELECT Room.* FROM Room
    INNER JOIN Hotel AS H ON Room.Hotel_ID = H.Hotel_ID
    WHERE 
      (Room_Capacity IS NULL OR Room.Capacity = Room_Capacity)
      AND (Area IS NULL OR Area in (H.Address))
      AND (Hotel_Chain_Name IS NULL OR H.Chain_Name = Hotel_Chain_Name)
      AND (Hotel_Category IS NULL OR H.Category = Hotel_Category)
      AND (Number_Of_Rooms IS NULL OR H.Number_Of_Rooms >= Number_Of_Rooms)
      AND (Price IS NULL OR Room.Price <= Price);
END //

-- Create a customer booking
CREATE PROCEDURE Customer_Booking (
    IN Customer_Name VARCHAR(255),
    IN Customer_Address VARCHAR(255),
    IN Customer_SIN INT,
    IN Registration_Date DATE,
    IN Room_ID INT,
    IN Hotel_ID INT,
    IN First_Day DATE,
    IN Last_Day DATE,
    IN Price DECIMAL(10,2)
)
BEGIN
	INSERT INTO Customer (Full_name, Address, SIN, Registration_Date) 
    VALUES (Customer_Name, Customer_Address, Customer_SIN, Registration_Date);
    SET Customer_ID = LAST_INSERT_ID();
	INSERT INTO Booking (Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price)
    VALUES (CURDATE(), Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price);
END //


