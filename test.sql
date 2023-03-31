INSERT INTO Employee (Full_name, Address, Position, Hotel_ID) VALUES('Test', 'Test', 'receptionist', 1);

select * from employee;

INSERT INTO User VALUES('test', '$2b$10$9B4fnNwuQSG/DGsgxfAEA.tbKjI3hQuuzt/lk7yqiLAYP3Dg0yVoi', 100000000);

select * from user;

CALL Employee_Login('test', 'test');

select TRIM(SUBSTRING_INDEX(Address, ' ', -2)) from hotel;

select * from hotel_chain;

-- insert into customer (Full_name, Address, SIN, Registration_Date) values ('test', 'test', 100000000, CURDATE());

-- insert into booking (Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price) values (CURDATE(), 1, 68, 3, curdate(), curdate(), 737.23);

-- insert into booking (Specific_Date, Customer_ID, Room_ID, Hotel_ID, First_Day, Last_Day, Price) values (CURDATE(), 1, 3, 3, curdate(), curdate(), 737.23);

CALL Search_Rooms(NULL, NULL, NULL, NULL, NULL, NULL);

CALL Search_Room(1,1);

select * from room;
    
select * from hotel;

select * from customer;

select * from booking;
    