CREATE DATABASE BookWormDb
GO

USE BookWormDb
GO

BEGIN TRANSACTION
CREATE TABLE Authors(
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	AuthFirstName VARCHAR(255) NOT NULL,
	AuthLastName VARCHAR(255) NOT NULL,
	BirthDate DATE,
	DeathDay DATE,
	PicturePath VARCHAR(255)
);

CREATE TABLE Categories(
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name VARCHAR(255) NOT NULL
);

CREATE TABLE Genres(
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name VARCHAR(255) NOT NULL,
	CategoryId int NOT NULL,
	FOREIGN KEY(CategoryId) REFERENCES CATEGORIES(Id)
);

CREATE TABLE Status(
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Name VARCHAR(255) NOT NULL
);

CREATE TABLE Books(
	Id int IDENTITY (1,1) PRIMARY KEY NOT NULL,
	AuthorId int NOT NULL,
	GenreId int NOT NULL,
	StatusId int NOT NULL,
	Name VARCHAR(255) NOT NULL,
	Date_Obtained DATE,
	ISBN VARCHAR(255) NOT NULL,
	Published_Date DATE,
	PicturePath VARCHAR(255),
	FOREIGN KEY(AuthorId) REFERENCES AUTHORS(Id),
	FOREIGN KEY(GenreId) REFERENCES GENRES(Id),
	FOREIGN KEY(StatusId) REFERENCES STATUS(Id)
);

CREATE TABLE Contacts(
	Id int IDENTITY(1,1) PRIMARY KEY NOT NULL,
	CntFirstName VARCHAR(255) NOT NULL,
	CntLastName VARCHAR(255) NOT NULL,
	PicturePath VARCHAR(255) NOT NULL
);

CREATE TABLE Book_Lendings(
	Id int IDENTITY(1,1) NOT NULL,
	BookId int NOT NULL,
	ContactId int NOT NULL,
	Lend_Date DATE NOT NULL,
	Return_Date DATE,
	FOREIGN KEY(BookId) REFERENCES BOOKS(Id),
	FOREIGN KEY(ContactId) REFERENCES CONTACTS(Id)
);

CREATE TABLE Reading_History(
	Id int IDENTITY(1,1) NOT NULL,
	BookId int NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE,
	FOREIGN KEY(BookId) REFERENCES BOOKS(Id),
);

COMMIT;