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
