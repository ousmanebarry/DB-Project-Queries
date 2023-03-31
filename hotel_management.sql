-- Use the database
DROP SCHEMA IF EXISTS hotel_management;
CREATE SCHEMA hotel_management;
USE hotel_management;

-- Create the Hotel Chain table
CREATE TABLE IF NOT EXISTS Hotel_Chain (
   Name VARCHAR(255) PRIMARY KEY,
   Address VARCHAR(255),
   Number_Of_Hotels INT,
   Contact_Email VARCHAR(255),
   Contact_Phone VARCHAR(255)
);

-- Create the Hotel table
CREATE TABLE IF NOT EXISTS Hotel (
   Hotel_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Address VARCHAR(255),
   Number_Of_Rooms INT,
   Contact_Email VARCHAR(255),
   Contact_Phone VARCHAR(255),
   Category VARCHAR(255) CHECK (Category in ('budget', 'resort', 'luxury', 'motel')),
   Rating INT CHECK (Rating>=1 AND Rating<=5),
   Chain_Name VARCHAR(255),
   FOREIGN KEY (Chain_Name) REFERENCES Hotel_Chain(Name) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create the Room table
CREATE TABLE IF NOT EXISTS Room (
   Room_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Room_Number INT,
   Price DECIMAL(10,2),
   Amenities VARCHAR(255),
   Capacity INT,
   View VARCHAR(255),
   Extendable BOOLEAN,
   Damage VARCHAR(255),
   Hotel_ID INT,
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   UNIQUE(Room_Number, Hotel_ID)
);

-- Create the Employee table
CREATE TABLE IF NOT EXISTS Employee (
   SIN INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Full_name VARCHAR(255),
   Address VARCHAR(255),
   Position VARCHAR(255) CHECK (Position in ("receptionist")),
   Hotel_ID INT,
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

-- Create User table
CREATE TABLE IF NOT EXISTS User (
	Username VARCHAR(255),
    Password VARCHAR(255),
    SIN INT,
    FOREIGN KEY (SIN) REFERENCES Employee(SIN)
);

-- Create the Customer table
CREATE TABLE IF NOT EXISTS Customer (
   Customer_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Full_name VARCHAR(255),
   Address VARCHAR(255),
   SIN INT,
   Registration_Date DATE
);

-- Create the Booking table
CREATE TABLE IF NOT EXISTS Booking (
   Booking_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Specific_Date DATE,
   Customer_ID INT,
   Room_ID INT,
   Hotel_ID INT,
   First_Day DATE,
   Last_Day DATE,
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- Create the Renting table
CREATE TABLE IF NOT EXISTS Renting (
   Renting_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Specific_Date DATE,
   Customer_ID INT,
   Room_ID INT,
   Hotel_ID INT,
   First_Day DATE,
   Last_Day DATE,
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- Create the Booking table
CREATE TABLE IF NOT EXISTS Booking_Archive (
   Booking_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Specific_Date DATE,
   Customer_ID INT,
   Room_ID INT,
   Hotel_ID INT,
   First_Day DATE,
   Last_Day DATE,
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- Create the Renting_Archive table
CREATE TABLE IF NOT EXISTS Renting_Archive (
   Renting_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Specific_Date DATE,
   Customer_ID INT,
   Room_ID INT,
   Hotel_ID INT,
   First_Day DATE,
   Last_Day DATE,
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);
-- Create the Archive table
-- CREATE TABLE IF NOT EXISTS Archive (
--   Archive_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
--   Hotel_ID INT,
--   Renting_ID INT,
--   Booking_ID INT,
--   Customer_ID INT,
--   Date_Of_Payment DATE,
--   Room_Number INT,
--   Length_Of_Stay INT,
--   Price DECIMAL(10,2),
--   FOREIGN KEY (Renting_ID) REFERENCES Renting(Renting_ID) ON UPDATE CASCADE ON DELETE CASCADE,
--   FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID) ON UPDATE CASCADE ON DELETE CASCADE
-- );

-- Create the Payment table 
CREATE TABLE IF NOT EXISTS Payment (
   Payment_ID INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
   Payment_Type VARCHAR(255) CHECK (Payment_Type in ("cash", "visa", "mastercard")),
   Customer_ID INT,
   Renting_ID INT,
   Date_Of_Payment DATE,
   Booking_ID INT,
   Payment_Status VARCHAR(255),
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (Renting_ID) REFERENCES Renting(Renting_ID) ON UPDATE CASCADE ON DELETE CASCADE,
   FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE token_blacklist (
  id INT PRIMARY KEY AUTO_INCREMENT,
  token VARCHAR(255) NOT NULL,
  invalidated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

ALTER TABLE Employee AUTO_INCREMENT = 100000000;