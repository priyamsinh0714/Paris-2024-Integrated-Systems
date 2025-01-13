-- Creating the Athlete table
CREATE TABLE Athlete (
    Athlete_ID INT PRIMARY KEY,
    Athlete_Name VARCHAR(255),
    Nationality VARCHAR(255),
    Sport VARCHAR(255),
    Gender VARCHAR(10),
    Accommodation_ID INT,
    FOREIGN KEY (Accommodation_ID) REFERENCES Accommodation(Accommodation_ID)
);

-- Creating the Equipment table
CREATE TABLE Equipment (
    Equipment_ID INT PRIMARY KEY,
    Equipment_Type VARCHAR(255),
    Sport VARCHAR(255),
    Quantity INT
);

-- Creating the Volunteer table
CREATE TABLE Volunteer (
    Volunteer_ID INT PRIMARY KEY,
    Volunteer_Name VARCHAR(255),
    Role VARCHAR(255),
    Contact_Info VARCHAR(255)
);

-- Creating the Accommodation table
CREATE TABLE Accommodation (
    Accommodation_ID INT PRIMARY KEY,
    Type VARCHAR(255),
    Location VARCHAR(255),
    Capacity INT
);
-- Inserting complete data into Venue
INSERT INTO Venue VALUES
(1, 'Stadium International', 'Paris', 50000),
(2, 'Aquatic Center', 'Paris', 15000),
(3, 'Cycling Arena', 'Paris', 10000),
(4, 'Archery Range', 'Paris', 3000),
(5, 'Tennis Court', 'Paris', 8000),
(6, 'Basketball Arena', 'Paris', 15000),
(7, 'Boxing Ring', 'Paris', 5000),
(8, 'Gymnastics Hall', 'Paris', 12000),
(9, 'Fencing Hall', 'Paris', 4000),
(10, 'Equestrian Track', 'Paris', 10000);

-- Inserting complete data into Event
INSERT INTO Event VALUES
(1, '100m Sprint', 'Track and Field', '2024-08-01 09:00:00', '2024-08-01 12:00:00', 1),
(2, 'Marathon', 'Track and Field', '2024-08-02 06:00:00', '2024-08-02 12:00:00', 1),
(3, 'Swimming 200m Freestyle', 'Swimming', '2024-08-01 14:00:00', '2024-08-01 16:00:00', 2),
(4, 'Cycling Road Race', 'Cycling', '2024-08-03 07:00:00', '2024-08-03 11:00:00', 3),
(5, 'Archery Qualifiers', 'Archery', '2024-08-04 10:00:00', '2024-08-04 13:00:00', 4),
(6, 'Men\'s Singles Tennis', 'Tennis', '2024-08-05 09:00:00', '2024-08-05 18:00:00', 5),
(7, 'Women\'s Basketball', 'Basketball', '2024-08-06 15:00:00', '2024-08-06 17:00:00', 6),
(8, 'Men\'s Boxing 75kg', 'Boxing', '2024-08-07 12:00:00', '2024-08-07 15:00:00', 7),
(9, 'Women\'s Gymnastics All-around', 'Gymnastics', '2024-08-08 16:00:00', '2024-08-08 20:00:00', 8),
(10, 'Fencing Epee Individual', 'Fencing', '2024-08-09 11:00:00', '2024-08-09 14:00:00', 9);

-- Inserting complete data into Athlete
INSERT INTO Athlete VALUES
(1, 'John Doe', 'USA', 'Swimming', 'Male', 1),
(2, 'Jane Smith', 'GBR', 'Cycling', 'Female', 2),
(3, 'Alice Johnson', 'CAN', 'Running', 'Female', 3),
(4, 'Michael Brown', 'AUS', 'Archery', 'Male', 4),
(5, 'Lucy White', 'USA', 'Tennis', 'Female', 5),
(6, 'Emma Green', 'NZL', 'Basketball', 'Female', 6),
(7, 'Oliver Black', 'RSA', 'Boxing', 'Male', 7),
(8, 'Isabella Gray', 'ITA', 'Gymnastics', 'Female', 8),
(9, 'Ethan Blue', 'FRA', 'Fencing', 'Male', 9),
(10, 'Mia Yellow', 'ESP', 'Equestrian', 'Female', 10);

-- Inserting complete data into Equipment
INSERT INTO Equipment VALUES
(1, 'Swimming Cap', 'Swimming', 100),
(2, 'Racing Bike', 'Cycling', 50),
(3, 'Running Shoes', 'Running', 150),
(4, 'Archery Bow', 'Archery', 30),
(5, 'Tennis Racket', 'Tennis', 45),
(6, 'Basketball', 'Basketball', 40),
(7, 'Boxing Gloves', 'Boxing', 20),
(8, 'Gymnastics Leotard', 'Gymnastics', 25),
(9, 'Fencing Sword', 'Fencing', 35),
(10, 'Equestrian Saddle', 'Equestrian', 15);

-- Inserting complete data into Volunteer
INSERT INTO Volunteer VALUES
(1, 'Bob Martin', 'Guide', 'bob@example.com'),
(2, 'Lucy Liu', 'Security', 'lucy@example.com'),
(3, 'Carlos Gomez', 'Ticketing', 'carlos@example.com'),
(4, 'Diana Reed', 'Event Setup', 'diana@example.com'),
(5, 'Samuel Lee', 'Logistics', 'samuel@example.com'),
(6, 'Katie Hill', 'Hospitality', 'katie@example.com'),
(7, 'Alex Rivera', 'Medical Assistance', 'alex@example.com'),
(8, 'Sophie Turner', 'Media Relations', 'sophie@example.com'),
(9, 'Jack White', 'Athlete Assistance', 'jack@example.com'),
(10, 'Nora Black', 'VIP Coordination', 'nora@example.com');

-- Inserting complete data into Accommodation
INSERT INTO Accommodation VALUES
(1, 'Athlete Village', 'Near Stadium', 300),
(2, 'Athlete Hostel', 'Downtown', 200),
(3, 'Private Homes', 'Suburban Area', 100),
(4, 'Olympic Resort', 'Coastline', 500),
(5, 'Sportsmen Lodge', 'City Center', 250),
(6, 'Competitors Inn', 'Near Aquatic Center', 150),
(7, 'Champions Stay', 'Near Cycling Arena', 180),
(8, 'Gold Medal Hotel', 'Near Gymnastics Hall', 220),
(9, 'Silver Lining Suites', 'Near Fencing Hall', 160),
(10, 'Bronze Bungalows', 'Near Equestrian Track', 130);

SELECT Venue_Name, COUNT (Event_ID) AS Event_Count
FROM Venue JOIN Event ON Venue. Venue_ID = Event. Venue_ID
GROUP BY Venue_Name
ORDER BY Event_Count DESC
LIMIT 2;|

SELECT Equipment_Type, COUNT(DISTINCT Event_ID) AS Usage_Count
FROM Equipment JOIN Event ON Equipment. Equipment_ID = Event. Event_ID
GROUP BY Equipment_Type
ORDER BY Usage_Count DESC;

SELECT Type, Location, SUM(Capacity) AS Total_Capacity, COUNT(DISTINCT Athlete_ID) AS Occupants
FROM Accommodation
JOIN Athlete ON Accommodation. Accommodation_ID = Athlete.Accommodation_ID
GROUP BY Type, Location
ORDER BY Sum (capacity) DESC
LIMIT 5;

SELECT Nationality, COUNT(*) AS Athlete_Count
FROM Athlete
GROUP BY Nationality
ORDER BY Athlete_Count DESC
LIMIT 3;

SELECT Equipment.Equipment_Type,
COUNT (DISTINCT Event. Event_ID) AS Events_Using_Equipment,
SUM(Equipment. Quantity) AS Total_Quantity
FROM Equipment
JOIN Event ON Equipment. Sport = Event. Event_Type
GROUP BY Equipment. Equipment Type
ORDER BY Events_Using_Equipment;