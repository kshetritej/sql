-- Authors Seed, the id is autoincremental
INSERT INTO Author (AuthorName) VALUES
('Jane Austen'), ('George Orwell'), ('J.R.R. Tolkien'), ('Stephen King'), ('Agatha Christie'),
('Ernest Hemingway'), ('Harper Lee'), ('Gabriel Garcia Marquez'), ('Leo Tolstoy'), ('Charles Dickens');


-- Book 
INSERT INTO Book (ISBN, Title, Description, Genre, Category) VALUES
('9780141439518', 'Pride and Prejudice', 'Classic romance.', 'Romance', 'Yellow Tag'),
('9780451524935', '1984', 'Dystopian future.', 'Science Fiction', 'Red Tag'),
('9780618260300', 'The Hobbit', 'A hobbit\'s adventure.', 'Fantasy', 'Green Tag'),
('9781501142976', 'The Shining', 'Horror in a hotel.', 'Horror', 'Red Tag'),
('9780062073484', 'Murder on the Orient Express', 'Detective novel.', 'Mystery', 'Yellow Tag'),
('9780684801223', 'The Old Man and the Sea', 'Man vs. fish.', 'Classic', 'Green Tag'),
('9780061120084', 'To Kill a Mockingbird', 'Racial injustice.', 'Classic', 'Yellow Tag'),
('9780061120085', 'One Hundred Years of Solitude', 'Magical realism.', 'Magical Realism', 'Red Tag'),
('9780140449603', 'War and Peace', 'Epic historical fiction.', 'Historical Fiction', 'Green Tag'),
('9780141439519', 'Oliver Twist', 'Orphan\'s journey.', 'Classic', 'Yellow Tag');

-- Book Author
INSERT INTO BookAuthor (ISBN, AuthorID) VALUES
('9780141439518', 1), ('9780451524935', 2), ('9780618260300', 3), ('9781501142976', 4),
('9780062073484', 5), ('9780684801223', 6), ('9780061120084', 7), ('9780061120085', 8),
('9780140449603', 9), ('9780141439519', 10);

-- Book Copy
INSERT INTO BookCopy (ISBN, Loanable) VALUES
('9780141439518', TRUE), ('9780141439518', TRUE), ('9780451524935', TRUE), ('9780618260300', TRUE),
('9781501142976', TRUE), ('9780062073484', TRUE), ('9780061120084', TRUE), ('9780061120085', TRUE),
('9780140449603', TRUE), ('9780141439519', TRUE), ('9780141439519', FALSE);

-- User
INSERT INTO User (UserName, UserType) VALUES
('Alice Smith', 'Student'), ('Bob Johnson', 'Staff'), ('Charlie Brown', 'Student'), ('David Lee', 'Lecturer'),
('Eve Wilson', 'Student'), ('Frank Garcia', 'Staff'), ('Grace Rodriguez', 'Student'), ('Henry Martinez', 'Lecturer'),
('Ivy Anderson', 'Student'), ('Jack Thomas', 'Staff');

-- Loan
INSERT INTO Loan (CopyID, UserID, LoanDate, DueDate, ReturnDate, FineAmount) VALUES
(1, 1, '2023-11-20', '2023-12-04', '2023-12-02', 0.00), (3, 2, '2023-11-21', '2023-12-05', NULL, 0.00),
(4, 3, '2023-11-22', '2023-12-06', '2023-12-08', 2.00), (5, 4, '2023-11-23', '2023-12-07', NULL, 0.00),
(6, 5, '2023-11-24', '2023-12-08', '2023-12-09', 1.00), (7, 6, '2023-11-25', '2023-12-09', NULL, 0.00),
(8, 7, '2023-11-26', '2023-12-10', '2023-12-12', 2.00), (9, 8, '2023-11-27', '2023-12-11', NULL, 0.00),
(10, 9, '2023-11-28', '2023-12-12', '2023-12-13', 1.00), (2, 10, '2023-11-29', '2023-12-13', NULL, 0.00);


-- Reservation 
INSERT INTO Reservation (ISBN, UserID, ReservationDate, HoldUntil, Notified) VALUES
('9780141439518', 1, '2023-12-01', '2023-12-04', FALSE), ('9780451524935', 2, '2023-12-02', '2023-12-05', FALSE),
('9780618260300', 3, '2023-12-03', '2023-12-06', FALSE), ('9781501142976', 4, '2023-12-04', '2023-12-07', FALSE),
('9780062073484', 5, '2023-12-05', '2023-12-08', FALSE), ('9780684801223', 6, '2023-12-06', '2023-12-09', FALSE),
('9780061120084', 7, '2023-12-07', '2023-12-10', FALSE), ('9780061120085', 8, '2023-12-08', '2023-12-11', FALSE),
('9780140449603', 9, '2023-12-09', '2023-12-12', FALSE), ('9780141439519', 10, '2023-12-10', '2023-12-13', FALSE);

-- Fine Rate ( This is individual table doesn't effect any other)
INSERT INTO FineRate (Category, FinePerDay, LoanPeriod) VALUES
('Yellow Tag', 1.00, 14), ('Red Tag', 2.00, 7), ('Green Tag', 0.50, 21);

-- Room 
INSERT INTO Room (RoomName) VALUES
('Presentation Room A'), ('Presentation Room B'), ('Seminar Room 1'), ('Seminar Room 2'),
('Study Room 1'), ('Study Room 2'), ('Meeting Room 1'), ('Meeting Room 2'), ('Lecture Hall 1'), ('Lecture Hall 2');

-- Room Booking
INSERT INTO RoomBooking (RoomID, UserID, BookingDate, StartTime, EndTime) VALUES
(1, 1, '2023-12-15', '10:00:00', '12:00:00'), (2, 2, '2023-12-15', '13:00:00', '15:00:00'),
(3, 3, '2023-12-16', '11:00:00', '14:00:00'), (4, 4, '2023-12-16', '14:00:00', '17:00:00'),
(5, 5, '2023-12-17', '09:00:00', '12:00:00'), (6, 6, '2023-12-17', '12:00:00', '15:00:00'),
(7, 7, '2023-12-18', '13:00:00', '16:00:00'), (8, 8, '2023-12-18', '16:00:00', '19:00:00'),
(9, 9, '2023-12-19', '10:00:00', '13:00:00'), (10, 10, '2023-12-19', '13:00:00', '16:00:00');

-- Loan Log
INSERT INTO LoanLog (LoanID, Action, ActionDate) VALUES
(1, 'Loan', '2023-11-20 10:00:00'), (1, 'Return', '2023-12-02 14:00:00'),
(3, 'Loan', '2023-11-22 11:00:00'), (3, 'Return', '2023-12-08 15:00:00'),
(5, 'Loan', '2023-11-24 12:00:00'), (5, 'Return', '2023-12-09 16:00:00'),
(7, 'Loan', '2023-11-26 13:00:00'), (7, 'Return', '2023-12-12 17:00:00'),
(9, 'Loan', '2023-11-28 14:00:00'), (9, 'Return', '2023-12-13 18:00:00');