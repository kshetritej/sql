-- Prevent deletion of Loaned Copies
DELIMITER //
CREATE TRIGGER PreventDeleteLoanedCopy
BEFORE DELETE ON BookCopy
FOR EACH ROW
BEGIN
    IF EXISTS (SELECT 1 FROM Loan WHERE CopyID = OLD.CopyID AND ReturnDate IS NULL) THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Cannot delete a loaned book copy.';
    END IF;
END //
DELIMITER ;

-- Update Reservation Notification
DELIMITER //
CREATE TRIGGER UpdateReservationNotificationStatus
AFTER UPDATE ON Loan
FOR EACH ROW
BEGIN
    IF NEW.ReturnDate IS NOT NULL THEN
        -- Check for reservations on the returned book's ISBN
        UPDATE Reservation
        SET Notified = TRUE
        WHERE ISBN = (SELECT ISBN FROM BookCopy WHERE CopyID = NEW.CopyID)
        AND Notified = FALSE
        LIMIT 1; -- Update only the oldest reservation
    END IF;
END //
DELIMITER ;

-- Log loan actions
DELIMITER //
CREATE TRIGGER LogLoanAction
AFTER INSERT ON Loan
FOR EACH ROW
BEGIN
    INSERT INTO LoanLog (LoanID, Action, ActionDate) VALUES (NEW.LoanID, 'Loan', NOW());
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER LogReturnAction
AFTER UPDATE ON Loan
FOR EACH ROW
BEGIN
    IF NEW.ReturnDate IS NOT NULL THEN
        INSERT INTO LoanLog (LoanID, Action, ActionDate) VALUES (NEW.LoanID, 'Return', NOW());
    END IF;
END //
DELIMITER ;


