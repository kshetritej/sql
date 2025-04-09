-- Active: 1743912507178@@127.0.0.1@3306@library
CREATE TABLE Book (
    ISBN VARCHAR(20) PRIMARY KEY,
    Title VARCHAR(255),
    Description TEXT,
    Genre VARCHAR(100),
    Category VARCHAR(50)
);

CREATE TABLE Author (
    AuthorID INT AUTO_INCREMENT PRIMARY KEY,
    AuthorName VARCHAR(255)
);

CREATE TABLE BookAuthor (
    ISBN VARCHAR(20),
    AuthorID INT,
    PRIMARY KEY (ISBN, AuthorID),
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (AuthorID) REFERENCES Author(AuthorID)
);

CREATE TABLE BookCopy (
    CopyID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20),
    Loanable BOOLEAN,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN)
);

CREATE TABLE User (
    UserID INT AUTO_INCREMENT PRIMARY KEY,
    UserName VARCHAR(255),
    UserType VARCHAR(50)
);

CREATE TABLE Loan (
    LoanID INT AUTO_INCREMENT PRIMARY KEY,
    CopyID INT,
    UserID INT,
    LoanDate DATE,
    DueDate DATE,
    ReturnDate DATE,
    FineAmount DECIMAL(10, 2),
    FOREIGN KEY (CopyID) REFERENCES BookCopy(CopyID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE Reservation (
    ReservationID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20),
    UserID INT,
    ReservationDate DATE,
    HoldUntil DATE,
    Notified BOOLEAN,
    FOREIGN KEY (ISBN) REFERENCES Book(ISBN),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);

CREATE TABLE FineRate (
    Category VARCHAR(50) PRIMARY KEY,
    FinePerDay DECIMAL(10, 2),
    LoanPeriod INT
);

CREATE TABLE Room (
    RoomID INT AUTO_INCREMENT PRIMARY KEY,
    RoomName VARCHAR(255)
);

CREATE TABLE RoomBooking (
    BookingID INT AUTO_INCREMENT PRIMARY KEY,
    RoomID INT,
    UserID INT,
    BookingDate DATE,
    StartTime TIME,
    EndTime TIME,
    FOREIGN KEY (RoomID) REFERENCES Room(RoomID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
);


CREATE TABLE LoanLog (
    LogID INT AUTO_INCREMENT PRIMARY KEY,
    LoanID INT,
    Action VARCHAR(10), -- 'Loan' or 'Return'
    ActionDate DATETIME
);