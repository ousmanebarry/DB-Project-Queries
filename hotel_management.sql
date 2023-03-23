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
   Hotel_ID INT AUTO_INCREMENT PRIMARY KEY,
   Name VARCHAR(255),
   Address VARCHAR(255),
   Number_Of_Rooms INT,
   Contact_Email VARCHAR(255),
   Contact_Phone VARCHAR(255),
   Rating INT,
   Chain_Name VARCHAR(255),
   FOREIGN KEY (Chain_Name) REFERENCES Hotel_Chain(Name)
);

-- Create the Room table
CREATE TABLE IF NOT EXISTS Room (
   Room_Number INT AUTO_INCREMENT PRIMARY KEY,
   Price DECIMAL(10,2),
   Amenities VARCHAR(255),
   Capacity INT,
   View VARCHAR(255),
   Extendable BOOLEAN,
   Damage VARCHAR(255),
   Hotel_ID INT,
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- Create the Employee table
CREATE TABLE IF NOT EXISTS Employee (
   SSN_SIN INT AUTO_INCREMENT PRIMARY KEY,
   Full_name VARCHAR(255),
   Address VARCHAR(255),
   Position VARCHAR(255),
   Work_At INT,
   FOREIGN KEY (Work_At) REFERENCES Hotel(Hotel_ID)
   
);

-- Create the Customer table
CREATE TABLE IF NOT EXISTS Customer (
   Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
   Full_name VARCHAR(255),
   Address VARCHAR(255),
   SSN_SIN INT,
   Registration_Date DATE
);

-- Create the Booking table
CREATE TABLE IF NOT EXISTS Booking (
   Booking_ID INT AUTO_INCREMENT PRIMARY KEY,
   Specific_Date DATE,
   Customer_ID INT,
   Room_Number INT,
   Hotel_ID INT,
   First_Day DATE,
   Last_Day DATE,
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
   FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- Create the Renting table
CREATE TABLE IF NOT EXISTS Renting (
   Renting_ID INT AUTO_INCREMENT PRIMARY KEY,
   Specific_Date DATE,
   Customer_ID INT,
   Room_Number INT,
   Hotel_ID INT,
   First_Day DATE,
   Last_Day DATE,
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
   FOREIGN KEY (Room_Number) REFERENCES Room(Room_Number),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID)
);

-- Create the Archive table
CREATE TABLE IF NOT EXISTS Archive (
   Archive_ID INT AUTO_INCREMENT PRIMARY KEY,
   Hotel_ID INT,
   Renting_ID INT,
   Booking_ID INT,
   Customer_ID INT,
   Date_Of_Payment DATE,
   Room_Number INT,
   Length_Of_Stay INT,
   Price DECIMAL(10,2),
   FOREIGN KEY (Hotel_ID) REFERENCES Hotel(Hotel_ID),
   FOREIGN KEY (Renting_ID) REFERENCES Renting(Renting_ID),
   FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Create the Payment table 
CREATE TABLE IF NOT EXISTS Payment (
   Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
   paymentType VARCHAR(255),
   Customer_ID INT,
   Renting_ID INT,
   Date_Of_Payment DATE,
   Booking_ID INT,
   Payment_Status VARCHAR(255),
   Price DECIMAL(10,2),
   FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
   FOREIGN KEY (Renting_ID) REFERENCES Renting(Renting_ID),
   FOREIGN KEY (Booking_ID) REFERENCES Booking(Booking_ID)
);

-- Checking for valid payment type
ALTER TABLE Payment 
ADD CONSTRAINT valid_PaymentType
CHECK (paymentType in ("cash", "visa", "cheque", "mastercard", "amex", "paypal", "debit"));

-- Checking for valid ssn (I think this isn't needed)
-- ALTER TABLE Employee 
-- ADD CONSTRAINT valid_ssn
-- CHECK (SSN_SIN BETWEEN 0 AND 999999999);

-- Checking for valid position
ALTER TABLE Employee 
ADD CONSTRAINT valid_position
CHECK (position in ("manager", "receptionist", "House cleaner", "Cook", "Room Service"));

-- Checking for valid position
ALTER TABLE Hotel 
ADD CONSTRAINT valid_rating
CHECK (Rating>=1 AND Rating<=5);
