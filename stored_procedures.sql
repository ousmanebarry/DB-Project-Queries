USE hotel_management;

DELIMITER //
CREATE PROCEDURE Employee_Login(IN Username VARCHAR(255)) 
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
    WHERE User.Username = Username
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
    SELECT Room.*, H.Address, H.Number_Of_Rooms, H.Contact_Email, H.Contact_Phone, H.Category, H.Rating, H.Chain_Name FROM Room
    INNER JOIN Hotel AS H ON Room.Hotel_ID = H.Hotel_ID
    WHERE 
      (Room_Capacity IS NULL OR Room.Capacity = Room_Capacity)
      AND (Area IS NULL OR Area = TRIM(SUBSTRING_INDEX(H.Address, ' ', -2)))
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
    IN Price DECIMAL(10,2),
    OUT Customer_ID INT
)
BEGIN
	INSERT INTO Customer (Full_name, Address, SIN, Registration_Date) 
    VALUES (Customer_Name, Customer_Address, Customer_SIN, Registration_Date);
    SET Customer_ID = LAST_INSERT_ID();
	INSERT INTO Booking (Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price)
    VALUES (CURDATE(), Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price);
END //

-- Create a customer renting
CREATE PROCEDURE Employee_Renting (
    IN Customer_Name VARCHAR(255),
    IN Customer_Address VARCHAR(255),
    IN Customer_SIN INT,
    IN Registration_Date DATE,
    IN Room_ID INT,
    IN Hotel_ID INT,
    IN First_Day DATE,
    IN Last_Day DATE,
    IN Price DECIMAL(10,2),
    OUT Customer_ID INT
)
BEGIN
	INSERT INTO Customer (Full_name, Address, SIN, Registration_Date) 
    VALUES (Customer_Name, Customer_Address, Customer_SIN, Registration_Date);
    SET Customer_ID = LAST_INSERT_ID();
	INSERT INTO Renting (Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price)
    VALUES (CURDATE(), Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price);
END //

-- Check Renting
CREATE PROCEDURE Check_Renting (
    IN Room_ID INT,
    IN Hotel_ID INT,
    IN First_Day DATE,
    IN Last_Day DATE
)
BEGIN
	SELECT * FROM Renting r 
    WHERE r.Hotel_ID=Hotel_ID AND r.Room_ID=Room_ID AND ((First_Day > r.First_Day AND Last_Day > r.First_Day)  OR (First_Day < r.Last_Day AND Last_Day < r.Last_Day));
    
END //

-- Check booking
CREATE PROCEDURE Check_Booking (
    IN Room_ID INT,
    IN Hotel_ID INT,
    IN First_Day DATE,
    IN Last_Day DATE
)
BEGIN
	SELECT * FROM Booking b 
    WHERE b.Hotel_ID=Hotel_ID AND b.Room_ID=Room_ID AND ((First_Day > b.First_Day AND Last_Day > b.First_Day)  OR (First_Day < b.Last_Day AND Last_Day < b.Last_Day));
END //

-- Create a customer renting
CREATE PROCEDURE Customer_Renting (
    IN Customer_ID INT,
    IN Room_ID INT,
    IN Hotel_ID INT,
    IN First_Day DATE,
    IN Last_Day DATE,
    IN Price DECIMAL(10,2)
)
BEGIN
	INSERT INTO Renting (Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price)
    VALUES (CURDATE(),Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price);
END //
DELIMITER ;


