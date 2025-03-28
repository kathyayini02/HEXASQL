-- CREATE DATABASE PetPals;

USE PetPals;


-- 2. Create Tables
CREATE TABLE Pets (
    PetID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Age INT NOT NULL,
    Breed VARCHAR(255) NOT NULL,
    Type VARCHAR(50) NOT NULL,
    AvailableForAdoption BIT NOT NULL DEFAULT 1
);

CREATE TABLE Shelters (
    ShelterID INT PRIMARY KEY IDENTITY(1,1),
    Name VARCHAR(255) NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE Donations (
    DonationID INT PRIMARY KEY IDENTITY(1,1),
    DonorName VARCHAR(255) NOT NULL,
    DonationType VARCHAR(50) NOT NULL,
    DonationAmount DECIMAL(10,2),
    DonationItem VARCHAR(255),
    DonationDate DATETIME NOT NULL
);

CREATE TABLE AdoptionEvents (
    EventID INT PRIMARY KEY IDENTITY(1,1),
    EventName VARCHAR(255) NOT NULL,
    EventDate DATETIME NOT NULL,
    Location VARCHAR(255) NOT NULL
);

CREATE TABLE Participants (
    ParticipantID INT PRIMARY KEY IDENTITY(1,1),
    ParticipantName VARCHAR(255) NOT NULL,
    ParticipantType VARCHAR(50) NOT NULL CHECK (ParticipantType IN ('Shelter', 'Adopter')),
    EventID INT,
    FOREIGN KEY (EventID) REFERENCES AdoptionEvents(EventID) ON DELETE SET NULL
);


-- 5 available pets for adoption
SELECT Name, Age, Breed, Type FROM Pets WHERE AvailableForAdoption = 1;

-- 6  participant names for a specific adoption 
DECLARE @EventID INT = 1; -- Set a specific event ID
SELECT ParticipantName, ParticipantType FROM Participants WHERE EventID = @EventID;



-- 8  total donation amount per shelter
SELECT S.Name, COALESCE(SUM(D.DonationAmount), 0) AS TotalDonation
FROM Shelters S
LEFT JOIN Donations D ON S.ShelterID = D.DonationID
GROUP BY S.Name;

-- 9  pets without an owner 
--`OwnerID` exists in `Pets`
SELECT Name, Age, Breed, Type FROM Pets WHERE OwnerID IS NULL;

-- 10 Total donation amount per month and year
SELECT FORMAT(DonationDate, 'MMMM yyyy') AS MonthYear, SUM(DonationAmount) AS TotalDonation
FROM Donations
GROUP BY FORMAT(DonationDate, 'MMMM yyyy');

-- 11  breeds for pets aged 1-3 or older than 5
SELECT DISTINCT Breed FROM Pets WHERE Age BETWEEN 1 AND 3 OR Age > 5;

-- 12 Pets and their shelters where available for adoption
SELECT P.Name AS PetName, S.Name AS ShelterName
FROM Pets P
JOIN Shelters S ON P.ShelterID = S.ShelterID
WHERE P.AvailableForAdoption = 1;
/*
-- 13 Total participants in events organized by shelters in a specific city
DECLARE @City VARCHAR(255) = 'Chennai';
SELECT COUNT(*) AS TotalParticipants
FROM Participants P
JOIN AdoptionEvents AE ON P.EventID = AE.EventID
JOIN Shelters S ON AE.Location = S.Location
WHERE S.Location = @City;
*/

-- 14 Unique breeds for pets aged 1-5
SELECT DISTINCT Breed FROM Pets WHERE Age BETWEEN 1 AND 5;

-- (15) Pets that have not been adopted
SELECT * FROM Pets WHERE AvailableForAdoption = 1;

-- (16) Adopted pets and adopter names 
SELECT P.Name AS PetName, U.Name AS AdopterName
FROM Adoption A


ALTER TABLE Pets ADD OwnerID INT;