-- Ensure that the ISBN in the Book table is unique
ALTER TABLE Book ADD CONSTRAINT UC_Book_ISBN UNIQUE (ISBN);
-- Ensure the fine amount is never negative
ALTER TABLE Loan ADD CONSTRAINT CK_Loan_FineAmount CHECK (FineAmount >= 0);

-- Ensure that the UserType in the User table is one of the allowed types (e.g., 'Student', 'Staff', 'Lecturer').
ALTER TABLE User ADD CONSTRAINT CK_User_UserType CHECK (UserType IN ('Student', 'Staff', 'Lecturer'));
