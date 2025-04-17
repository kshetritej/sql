SELECT * FROM `BookCopy`;

SELECT * FROM `Loan`;

DELETE FROM `Loan` WHERE `Loan`.`CopyID` = 1;


DELETE FROM `BookCopy` WHERE `BookCopy`.`CopyID` = 3;
