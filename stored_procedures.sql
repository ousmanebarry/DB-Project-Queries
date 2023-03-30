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

CREATE PROCEDURE Search_Rooms(
    IN Start_Date DATE,
    IN End_Date DATE,
    IN Room_Capacity INT,
    IN Area VARCHAR(255),
    IN Hotel_Chain_Name VARCHAR(255),
    IN Hotel_Category VARCHAR(255),
    IN Number_Of_Rooms INT,
    IN Price INT
)
BEGIN
    SELECT Room.* FROM Room
    INNER JOIN Booking AS B ON Room.Room_ID != B.Room_ID
    INNER JOIN Renting AS R ON Room.Room_ID != R.Room_ID
    INNER JOIN Hotel AS H ON Room.Hotel_ID = H.Hotel_ID
    WHERE 
      (Room_Capacity IS NULL OR Room.Capacity = Room_Capacity)
      AND (Area IS NULL OR Area in (H.Address))
      AND (Hotel_Chain IS NULL OR H.Chain_Name = Hotel_Chain_Name)
      AND (Hotel_Category IS NULL OR H.Category = Hotel_Category)
      AND (Number_Of_Rooms IS NULL OR H.Number_Of_Rooms = Number_Of_Rooms)
      AND (Price IS NULL OR Room.Price < Price);
END //


