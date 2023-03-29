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
