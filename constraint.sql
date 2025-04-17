-- Ensure that the ISBN in the Book table is unique (UNIQUE constraint)
ALTER TABLE Book ADD CONSTRAINT UC_Book_ISBN UNIQUE (ISBN);

-- Ensure the fine amount is never negative (CHECK constraint)
ALTER TABLE Loan ADD CONSTRAINT CK_Loan_FineAmount CHECK (FineAmount >= 0);

-- Foreign key constraint for RoomBooking (FOREIGN KEY constraint)
ALTER TABLE RoomBooking
ADD CONSTRAINT FK_RoomBooking_UserID
FOREIGN KEY (UserID)
REFERENCES User(UserID);