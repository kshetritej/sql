-- Get user's loan history
DELIMITER //
CREATE PROCEDURE GetUserLoanHistory2 (IN p_UserID INT)
BEGIN
    SELECT b.Title, l.LoanDate, l.DueDate, l.ReturnDate, l.FineAmount, l.`UserID`
    FROM Loan l
    JOIN BookCopy bc ON l.CopyID = bc.CopyID
    JOIN Book b ON bc.ISBN = b.ISBN
    WHERE l.UserID = p_UserID
    ORDER BY l.LoanDate DESC;
END //
DELIMITER ;

CALL GetUserLoanHistory2(2);

-- Get Available Book Copies
DELIMITER //
CREATE PROCEDURE GetAvailableBookCopies(IN p_ISBN VARCHAR(20))
BEGIN
    SELECT bc.CopyID
    FROM BookCopy bc
    WHERE bc.ISBN = p_ISBN AND bc.CopyID NOT IN (SELECT CopyID FROM Loan WHERE ReturnDate IS NULL);
END //
DELIMITER ;

--Get Overdue Books
DELIMITER //
CREATE PROCEDURE GetOverdueBooks()
BEGIN
    SELECT b.Title, u.UserName, l.DueDate
    FROM Loan l
    JOIN BookCopy bc ON l.CopyID = bc.CopyID
    JOIN Book b ON bc.ISBN = b.ISBN
    JOIN User u ON l.UserID = u.UserID
    WHERE l.ReturnDate IS NULL AND l.DueDate < CURDATE();
END //
DELIMITER ;