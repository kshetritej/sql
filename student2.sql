-- (1) Find the presentation room with highest number of bookings
SELECT r.RoomName
FROM Room r
JOIN RoomBooking rb ON r.RoomID = rb.RoomID
GROUP BY r.RoomID, r.RoomName
ORDER BY COUNT(*) DESC
LIMIT 1;

-- (2) List the person who had never made any loans
SELECT u.UserName
FROM User u
LEFT JOIN Loan l ON u.UserID = l.UserID
WHERE l.LoanID IS NULL;

-- (3) Person who made the highest total fine payment
SELECT u.UserName
FROM User u
JOIN Loan l ON u.UserID = l.UserID
GROUP BY u.UserID, u.UserName
ORDER BY SUM(l.FineAmount) DESC
LIMIT 1;

-- (4) Query Which Provides, for the Loan, the Total Amount of Fine from Different Types of Persons in the University Such as Staff and Student (with Rollup)
SELECT u.UserType, SUM(l.FineAmount) AS TotalFines
FROM Loan l
JOIN User u ON l.UserID = u.UserID
GROUP BY u.UserType WITH ROLLUP;

-- (5) Average loan duration for each book category 
SELECT b.Category, AVG(DATEDIFF(l.ReturnDate, l.LoanDate)) AS AverageLoanDuration
FROM Book b
JOIN BookCopy bc ON b.ISBN = bc.ISBN
JOIN Loan l ON bc.CopyID = l.CopyID
WHERE l.ReturnDate IS NOT NULL
GROUP BY b.Category;

-- 