-- Find the category which has the highest number of books.
SELECT `Category`, COUNT(*) AS BookCount
FROM Book
GROUP BY Category
ORDER BY BookCount DESC;

-- Show books which never have been loaned
SELECT b.Title, l.LoanID
FROM Book b
LEFT JOIN BookCopy bc ON b.ISBN = bc.ISBN
LEFT JOIN Loan l ON bc.CopyID = l.CopyID
WHERE l.LoanID IS NULL;

-- List person who have made more than 2 loans
SELECT u.UserName,u.`UserID`, COUNT(*) AS LoanCount
FROM User u
JOIN Loan l ON u.UserID = l.UserID
GROUP BY u.UserID, u.UserName
HAVING LoanCount > 2;

-- Create a Query Which Provides, for Each Category and Genre of Book, the Total Number of Books in the Library (with Rollup)
SELECT Category, Genre, COUNT(*) AS TotalBooks
FROM Book
GROUP BY Category, Genre WITH ROLLUP;

--- Additional Query (Find the most reserved book)
SELECT b.Title, COUNT(r.ReservationID) AS ReservationCount
FROM Book b
JOIN Reservation r ON b.ISBN = r.ISBN
GROUP BY b.ISBN, b.Title
ORDER BY ReservationCount DESC
LIMIT 1;