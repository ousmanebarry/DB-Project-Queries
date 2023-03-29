USE hotel_management;

-- Populate hotel chain
INSERT INTO Hotel_Chain
VALUES ('Marriott', '157 Mariott Road', 0, 'mariott@gmail.com', '613-429-5006'),
('Hilton', '382 Hilton Avenue', 0, 'hilton@gmail.com', '613-486-3006'),
('Wyndham', '182 Windy Road', 0, 'wyndham@gmail.com', '613-404-2906'),
('Four Seasons', '287 Silver Way', 0, '4Seasons@gmail.com', '613-356-4006'),
('Cardinal', '839 Viking Road', 0, 'cardinal@gmail.com', '613-423-4006');

-- Populate hotel
INSERT INTO Hotel (Address, Number_Of_Rooms, Contact_Email, Contact_Phone, Rating, Category, Chain_Name)
VALUES ('476 Walnut Street', '5', 'info5036@marriott.com', '613-243-3572', '5', 'budget', 'Marriott'),
('509 Ocean Way', '5', 'info5824@marriott.com', '613-141-5357', '2', 'budget', 'Marriott'),
('840 Lexington Avenue', '5', 'info3486@marriott.com', '613-659-1540', '3', 'motel', 'Marriott'),
('524 Ocean Way', '5', 'info9295@marriott.com', '613-231-9488', '2', 'luxury', 'Marriott'),
('48 Ocean Way', '5', 'info9237@marriott.com', '613-440-2060', '3', 'budget', 'Marriott'),
('528 Walnut Street', '5', 'info7064@marriott.com', '613-961-7015', '3', 'resort', 'Marriott'),
('476 Ocean Way', '5', 'info9667@marriott.com', '613-457-1774', '2', 'budget', 'Marriott'),
('967 Broadway Park', '5', 'info9649@marriott.com', '613-914-6694', '3', 'resort', 'Marriott'),
('703 Maple Way', '5', 'info3278@cardinal.com', '613-259-9112', '5', 'resort', 'Cardinal'),
('210 Oak Avenue', '5', 'info4169@cardinal.com', '613-510-1283', '4', 'budget', 'Cardinal'),
('809 Maple Way', '5', 'info7556@cardinal.com', '613-521-1649', '5', 'luxury', 'Cardinal'),
('197 Pine Road', '5', 'info6073@cardinal.com', '613-925-7896', '1', 'motel', 'Cardinal'),
('861 Maple Way', '5', 'info5353@cardinal.com', '613-824-4771', '4', 'motel', 'Cardinal'),
('941 Elm Street', '5', 'info6010@cardinal.com', '613-954-9521', '5', 'luxury', 'Cardinal'),
('500 Elm Street', '5', 'info2869@cardinal.com', '613-245-9529', '2', 'resort', 'Cardinal'),
('547 Elm Street', '5', 'info5621@cardinal.com', '613-900-7843', '1', 'resort', 'Cardinal'),
('515 Magnolia Park', '5', 'info2932@hilton.com', '613-607-9465', '1', 'resort', 'Hilton'),
('940 Cedar Avenue', '5', 'info7737@hilton.com', '613-921-3171', '3', 'luxury', 'Hilton'),
('609 Magnolia Park', '5', 'info9934@hilton.com', '613-167-4531', '4', 'luxury', 'Hilton'),
('246 Cedar Avenue', '5', 'info514@hilton.com', '613-804-7838', '3', 'budget', 'Hilton'),
('643 Daisy Street', '5', 'info4545@hilton.com', '613-319-8682', '3', 'motel', 'Hilton'),
('743 Daisy Street', '5', 'info9645@hilton.com', '613-916-6777', '3', 'luxury', 'Hilton'),
('29 Daisy Street', '5', 'info9076@hilton.com', '613-227-9850', '3', 'luxury', 'Hilton'),
('957 Rose Way', '5', 'info5332@hilton.com', '613-301-5689', '5', 'motel', 'Hilton'),
('213 River Park', '5', 'info1395@wyndham.com', '613-848-7633', '1', 'luxury', 'Wyndham'),
('583 Park Way', '5', 'info3380@wyndham.com', '613-494-2609', '3', 'resort', 'Wyndham'),
('136 Park Way', '5', 'info3925@wyndham.com', '613-354-3101', '2', 'budget', 'Wyndham'),
('40 Park Way', '5', 'info6368@wyndham.com', '613-577-7677', '1', 'resort', 'Wyndham'),
('251 Meadow Street', '5', 'info4952@wyndham.com', '613-934-2329', '5', 'resort', 'Wyndham'),
('312 River Park', '5', 'info7890@wyndham.com', '613-198-2627', '3', 'resort', 'Wyndham'),
('724 Meadow Street', '5', 'info7421@wyndham.com', '613-426-6293', '5', 'resort', 'Wyndham'),
('124 Meadow Street', '5', 'info8993@wyndham.com', '613-940-9733', '1', 'resort', 'Wyndham'),
('776 Hill Avenue', '5', 'info6571@4seasons.com', '613-725-5523', '3', 'luxury', 'Four Seasons'),
('562 Hill Avenue', '5', 'info9558@4seasons.com', '613-454-1910', '2', 'resort', 'Four Seasons'),
('171 Lake Park', '5', 'info3642@4seasons.com', '613-905-4447', '2', 'budget', 'Four Seasons'),
('536 Valley Street', '5', 'info1900@4seasons.com', '613-704-8089', '5', 'resort', 'Four Seasons'),
('799 Moutain Way', '5', 'info8638@4seasons.com', '613-966-3007', '2', 'resort', 'Four Seasons'),
('802 Creek Road', '5', 'info564@4seasons.com', '613-105-8730', '2', 'luxury', 'Four Seasons'),
('696 Valley Street', '5', 'info9169@4seasons.com', '613-263-2421', '2', 'luxury', 'Four Seasons'),
('793 Lake Park', '5', 'info3346@4seasons.com', '613-860-2980', '3', 'resort', 'Four Seasons');

-- Populate room

INSERT INTO Room (Price, Amenities, Capacity, View, Extendable, Damage, Hotel_ID)
WITH RECURSIVE nums(n) AS (
  SELECT 1
  UNION ALL
  SELECT n + 1 FROM nums WHERE n < 30
)
SELECT 
    ROUND(RAND() * 1000 + 50, 2) AS Price,
    CONCAT('TV,', 'Air Conditioning,', 'Free Breakfast,', 'Free Wi-Fi,', 'Free Parking,', 'Private Bathroom,', 
		   IF(RAND() > 0.5, 'Swimming pool,', ''),
           IF(RAND() > 0.5, 'Daily Housekeeping,', ''),
           IF(RAND() > 0.5, 'Fitness Centre,', ''),
           IF(RAND() > 0.5, 'Kitchen,', ''),
           IF(RAND() > 0.5, 'Balcony/Terrace,', '')
           ) AS Amenities,
    FLOOR(RAND() * 4 + 1) AS Capacity,
    CASE ROUND(RAND() * 2)
        WHEN 0 THEN 'City view'
        WHEN 1 THEN 'Ocean view'
        WHEN 2 THEN 'Mountain view'
    END AS View,
    IF(RAND() > 0.5, TRUE, FALSE) AS Extendable,
    IF(RAND() > 0.8, 'Some minor damage', '') AS Damage,
    Hotel_ID
FROM Hotel
CROSS JOIN nums
ORDER BY Hotel_ID;

