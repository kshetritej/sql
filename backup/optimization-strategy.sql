-- Database statics update  -- Regularly Analyze database for accurate data in each query
-- Optimization Strategy 1
ANALYZE TABLE Book;

-- Optimization Strategy 2
-- Using EXIST vs IN
-- // This is inefficient
SELECT *
 FROM Book
 WHERE ISBN IN (SELECT ISBN FROM Reservation WHERE Notified = FALSE);

-- EXIST (EFFICIENT)
SELECT *
FROM Book
WHERE EXISTS (
    SELECT 1
    FROM Reservation
    WHERE Reservation.ISBN = Book.ISBN AND Notified = FALSE
);

-- Optimization strategy 3 ( Avoiding DISTINCT whenever possible )
-- INEFFICIENT
SELECT DISTINCT Category
FROM Book;

-- EFFICIENT
SELECT Category
FROM Book
GROUP BY Category;