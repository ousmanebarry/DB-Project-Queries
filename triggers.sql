USE hotel_management;

-- Increment number of hotels
DROP TRIGGER IF EXISTS increment_hotel_chain_hotel_count;
CREATE TRIGGER  increment_hotel_chain_hotel_count
AFTER INSERT ON Hotel FOR EACH ROW
UPDATE Hotel_Chain SET Number_Of_Hotels = Number_Of_Hotels + 1 WHERE Name = NEW.Chain_Name;

-- Decrement number of hotels
DROP TRIGGER IF EXISTS decrement_hotel_chain_hotel_count;
CREATE TRIGGER  decrement_hotel_chain_hotel_count
AFTER DELETE ON Hotel FOR EACH ROW
UPDATE Hotel_Chain SET Number_Of_Hotels = Number_Of_Hotels - 1 WHERE Name = OLD.Chain_Name;

-- Automatically assign next room number based on hotel 
DROP TRIGGER IF EXISTS assign_room_number;  
DELIMITER //
CREATE TRIGGER assign_room_number
BEFORE INSERT ON Room
FOR EACH ROW
BEGIN
  DECLARE next_room_number INT;

  -- get the next available room number for the hotel
  SELECT COALESCE(MAX(Room_Number), 0) + 1 INTO next_room_number
  FROM Room
  WHERE Hotel_ID = NEW.Hotel_ID;

  -- set the room number for the new row
  SET NEW.Room_Number = next_room_number;
END; //
DELIMITER ; 

-- Inserts data from booking into booking archive before booking is deleted
DROP TRIGGER IF EXISTS insert_in_booking_archive;
CREATE TRIGGER  insert_in_booking_archive
BEFORE DELETE ON Booking FOR EACH ROW
UPDATE Booking_Archive SET Booking_ID=OLD.Booking_ID, Specific_Date= OLD.Specific_Date,Customer_ID=OLD.Customer_ID, Room_ID=OLD.Room_ID,Hotel_ID=OLD.Hotel_ID,First_Day=OLD.First_Day,Last_Day=OLD.Last_Day, Price=OLD.Price ;

-- Inserts data from renting into renting archive before renting is deleted
DROP TRIGGER IF EXISTS insert_in_renting_archive;
CREATE TRIGGER  insert_in_renting_archive
BEFORE DELETE ON Renting FOR EACH ROW
UPDATE Renting_Archive SET Renting_ID=OLD.Renting_ID, Specific_Date= OLD.Specific_Date,Customer_ID=OLD.Customer_ID, Room_ID=OLD.Room_ID,Hotel_ID=OLD.Hotel_ID,First_Day=OLD.First_Day,Last_Day=OLD.Last_Day, Price=OLD.Price ;

-- BEGIN
-- INSERT INTO Booking_Archive (Booking_ID, Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price)
-- VALUES (OLD.Booking_ID, OLD.Specific_Date, OLD.Customer_ID, OLD.Room_ID, OLD.Hotel_ID, OLD.First_Day, OLD.Last_Day, OLD.Price);
-- END;
