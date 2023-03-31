-- Create Available_Rooms view
CREATE VIEW Available_Rooms_Area_View AS
SELECT  TRIM(SUBSTRING_INDEX(h.Address, ' ', -2)) AS Area, COUNT(r.Room_ID) AS Num_Available_Rooms
FROM Hotel h JOIN Room r ON h.Hotel_ID = r.Hotel_ID
  LEFT JOIN (
    SELECT Room_ID, MAX(CASE WHEN CURDATE() BETWEEN First_Day AND Last_Day THEN 1 ELSE 0 END) AS Is_Booked
    FROM Booking 
    GROUP BY Room_ID
  ) b ON b.Room_ID = r.Room_ID AND b.Is_Booked = 1
WHERE b.Room_ID IS NULL
GROUP BY Area;

-- Create Capacity_Of_Rooms_In_Hotel view
CREATE VIEW Capacity_Of_Rooms_In_Hotel_View AS
SELECT 
	Hotel.Hotel_ID,
    SUM(Room.Capacity) AS Total_Capacity_Of_Hotel_Rooms
FROM Hotel JOIN Room ON Hotel.Hotel_ID = Room.Hotel_ID
GROUP BY Hotel.Hotel_ID; 

-- Create Booking view
CREATE VIEW Booking_View AS
SELECT c.Full_name, c.Address, c.SIN, b.First_Day, b.Last_Day, h.Chain_Name, h.Category, b.Price, ro.Room_Number
FROM Booking b 
JOIN Customer c ON c.Customer_ID = b.Customer_ID
JOIN Room ro ON b.Room_ID = ro.Room_ID
JOIN Hotel h ON b.Hotel_ID = h.Hotel_ID;

-- Create Renting view
CREATE VIEW Renting_View AS
SELECT c.Full_name, c.Address, c.SIN, r.First_Day, r.Last_Day, h.Chain_Name, h.Category, r.Price, ro.Room_Number
FROM Renting r 
JOIN Customer c ON c.Customer_ID = r.Customer_ID
JOIN Room ro ON r.Room_ID = ro.Room_ID
JOIN Hotel h ON r.Hotel_ID = h.Hotel_ID;

-- Create Profile view
CREATE VIEW Profile_View AS
SELECT 
  e.SIN, 
  e.Full_Name, 
  e.Address,
  e.Position,
  h.Chain_Name
FROM Employee e JOIN Hotel h ON e.Hotel_ID = h.Hotel_ID;    