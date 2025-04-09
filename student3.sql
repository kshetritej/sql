-- (1) Person who made the highest number of loans
SELECT u.UserName
FROM User u
JOIN Loan l ON u.UserID = l.UserID
GROUP BY u.UserID, u.UserName
ORDER BY COUNT(*) DESC
LIMIT 1;

-- (2) Most frequently loaned books
SELECT b.Title
FROM Book b
JOIN BookCopy bc ON b.ISBN = bc.ISBN
JOIN Loan l ON bc.CopyID = l.CopyID
GROUP BY b.ISBN, b.Title
ORDER BY COUNT(*) DESC
LIMIT 1;

-- (3) Books written by more than 2 authors
SELECT b.Title
FROM Book b
JOIN BookAuthor ba ON b.ISBN = ba.ISBN
GROUP BY b.ISBN, b.Title
HAVING COUNT(ba.AuthorID) > 2;

-- (4) For Each Person in the University, the Total Number of Active and In-Active Borrower According to Person Type Such as Staff and Student (with Rollup)
SELECT
    u.UserType,
    SUM(CASE WHEN l.ReturnDate IS NULL THEN 1 ELSE 0 END) AS ActiveBorrowers,
    SUM(CASE WHEN l.ReturnDate IS NOT NULL THEN 1 ELSE 0 END) AS InactiveBorrowers
FROM
    User u
LEFT JOIN
    Loan l ON u.UserID = l.UserID
GROUP BY
    u.UserType WITH ROLLUP;

-- (5)  Find the average number of days books are reserved before being loaned
SELECT AVG(DATEDIFF(l.LoanDate, r.ReservationDate)) AS AverageReservationDays
FROM Loan l
JOIN BookCopy bc ON l.CopyID = bc.CopyID
JOIN Reservation r ON bc.ISBN = r.ISBN AND l.UserID = r.UserID
WHERE r.ReservationDate <= l.LoanDate;