--CREATE DATABASE VirtualArtGallery;
USE VirtualArtGallery;
/*CREATE TABLE Artwork (
    ArtworkID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Description TEXT,
    CreationDate DATE,
    Medium NVARCHAR(100),
    ImageURL NVARCHAR(500),
    ArtistID INT, 
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE SET NULL
);*/

/*CREATE TABLE Artist (
    ArtistID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Biography TEXT,
    BirthDate DATE,
    Nationality NVARCHAR(100),
    Website NVARCHAR(255),
    ContactInfo NVARCHAR(255)
);
*/
/*CREATE TABLE Artwork (
    ArtworkID INT IDENTITY(1,1) PRIMARY KEY,
    Title NVARCHAR(255) NOT NULL,
    Description TEXT,
    CreationDate DATE,
    Medium NVARCHAR(100),
    ImageURL NVARCHAR(500),
    ArtistID INT, 
    FOREIGN KEY (ArtistID) REFERENCES Artist(ArtistID) ON DELETE SET NULL
);
*/
/*CREATE TABLE [User] (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(100) UNIQUE NOT NULL,
    Password NVARCHAR(255) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    FirstName NVARCHAR(100),
    LastName NVARCHAR(100),
    DateOfBirth DATE,
  
);
*/
/*CREATE TABLE Gallery (
    GalleryID INT IDENTITY(1,1) PRIMARY KEY,
    Name NVARCHAR(255) NOT NULL,
    Description TEXT,
    Location NVARCHAR(255),
    CuratorID INT,  -- Reference to ArtistID
    OpeningHours NVARCHAR(255),
    FOREIGN KEY (CuratorID) REFERENCES Artist(ArtistID) ON DELETE SET NULL
);
*/
many to many
/*CREATE TABLE User_Favorite_Artwork (
    UserID INT,
    ArtworkID INT,
    PRIMARY KEY (UserID, ArtworkID),
    FOREIGN KEY (UserID) REFERENCES [User](UserID) ON DELETE CASCADE,
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE
);
*/
    many to many
/*CREATE TABLE Artwork_Gallery (
    ArtworkID INT,
    GalleryID INT,
    PRIMARY KEY (ArtworkID, GalleryID),
    FOREIGN KEY (ArtworkID) REFERENCES Artwork(ArtworkID) ON DELETE CASCADE,
    FOREIGN KEY (GalleryID) REFERENCES Gallery(GalleryID) ON DELETE CASCADE
);
*/
/*SELECT TABLE_NAME 
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_TYPE = 'BASE TABLE';


/*INSERT INTO Artist (Name, Biography, BirthDate, Nationality, Website, ContactInfo)
VALUES 
('Leonardo da Vinci', 'Renaissance artist and polymath', '1452-04-15', 'Italian', 'https://leonardo.com', 'leonardo@art.com'),
('Vincent van Gogh', 'Post-impressionist painter', '1853-03-30', 'Dutch', 'https://vangogh.com', 'vincent@art.com');

INSERT INTO Artwork (Title, Description, CreationDate, Medium, ImageURL, ArtistID)
VALUES 
('Mona Lisa', 'Famous portrait of Lisa Gherardini', '1503-01-01', 'Oil on wood', 'https://monalisa.com', 1),
('Starry Night', 'Depiction of Saint-Rémy', '1889-06-01', 'Oil on canvas', 'https://starrynight.com', 2);


INSERT INTO [User] (Username, PasswordHash, Email, FirstName, LastName, DateOfBirth, ProfilePicture)
VALUES 
('artlover123', 'password1', 'artlover@example.com', 'John', 'Doe', '1995-08-21', 'https://profilepic.com/user1'),
('galleryfan', 'password2', 'galleryfan@example.com', 'Jane', 'Smith', '1992-03-15', 'https://profilepic.com/user2');

*/

/*INSERT INTO Gallery (Name, Description, Location, CuratorID, OpeningHours)
VALUES 
('Louvre Museum', 'Famous museum in Paris', 'Paris, France', 1, '9AM - 6PM'),
('Van Gogh Museum', 'Museum dedicated to Vincent van Gogh', 'Amsterdam, Netherlands', 2, '10AM - 5PM');

INSERT INTO Artwork_Gallery (ArtworkID, GalleryID)
VALUES 
(1, 1),  -- Mona Lisa -> Louvre
(2, 2);  -- Starry Night -> Van Gogh Museum

INSERT INTO User_Favorite_Artwork (UserID, ArtworkID)
VALUES 
(1, 1),  -- John Doe loves Mona Lisa
(2, 2);  -- Jane Smith loves Starry Night
*/
--SELECT * FROM Artist;
--SELECT * FROM Artwork;
--SELECT * FROM [User];
SELECT * FROM Gallery;
--user and fav artworks
/*SELECT u.Username, a.Title 
FROM User_Favorite_Artwork ufa
JOIN [User] u ON ufa.UserID = u.UserID
JOIN Artwork a ON ufa.ArtworkID = a.ArtworkID;
--galleries and artwork
SELECT g.Name AS Gallery, a.Title AS Artwork 
FROM Artwork_Gallery ag
JOIN Gallery g ON ag.GalleryID = g.GalleryID
JOIN Artwork a ON ag.ArtworkID = a.ArtworkID;
*/
