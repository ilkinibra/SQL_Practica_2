Create database Cinema

USE Cinema

CREATE TABLE Movies(
    Id int primary key identity,
    Name NVARCHAR(255) NOT NULL,
    Duration int
)

CREATE TABLE Genres(
    Id int primary key identity,
    Name NVARCHAR(255) NOT NULL
)

CREATE TABLE MoviesGenres(
    Id int primary key identity,
    MovieId int REFERENCES Movies(Id),
    GenreId int REFERENCES Genres(Id) 
)

CREATE TABLE Actors(
    Id int primary key identity,
    Name NVARCHAR(100)NOT NULL,
    Surname NVARCHAR(100) NOT NULL
)

CREATE TABLE MovieActors(
    Id int primary key identity,
    MovieId int REFERENCES Movies(Id),
    ActorId int REFERENCES Actors(Id)
)

CREATE TABLE Halls(
    Id int primary key identity,
    Name NVARCHAR(100) NOT NULL,
    Seats int
)

CREATE TABLE Sessions(
    Id int primary key identity,
    [Start] DATETIME,
    [End] DATETIME,
    MovieId int REFERENCES Movies(Id),
    HallId int REFERENCES Halls(Id)
)

CREATE TABLE Customers(
    Id int primary key identity,
    Fullname NVARCHAR(255) NOT NULL,
    PhoneNumber NVARCHAR(255)
)

CREATE TABLE Tickets(
    Id int primary key identity,
    [Type] NVARCHAR(100),
    Price DECIMAL,
    CostumerId int REFERENCES Customers(Id),
    SessionId int REFERENCES Sessions(Id)
)

SELECT * FROM Actors a
JOIN MovieActors ma
ON a.Id = ma.ActorId
JOIN Movies m
ON m.Id = ma.MovieId