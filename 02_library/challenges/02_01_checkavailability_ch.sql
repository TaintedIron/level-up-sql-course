-- Determine how many copies of the book 'Dracula'
-- are available for library patrons to borrow.
SELECT * FROM Books WHERE title = 'Dracula';

SELECT Loans.LoanDate, Loans.DueDate, Loans.ReturnedDate, Books.Title, Books.BookID
FROM Loans
JOIN Books ON Loans.BookID = Books.BookID
WHERE Books.Title = 'Dracula'
ORDER BY Loans.LoanDate DESC;

-- There are 3 copies of 'Dracula' available for borrowing.
-- One of which is not returned yet, so there are 2 copies available.

-- Total count of 'Dracula' books
SELECT COUNT(Books.Title)
FROM Books
WHERE Books.Title = 'Dracula';

-- Total count of 'Dracula' books that are not returned
SELECT COUNT(Books.Title)
FROM Books
JOIN Loans ON Books.BookID = Loans.BookID
WHERE Books.Title = 'Dracula'
AND Loans.ReturnedDate IS NULL;

-- Total count of 'Dracula' books that are available
SELECT
  (SELECT COUNT(Books.Title)
  FROM Books
  WHERE Books.Title = 'Dracula') -
  (SELECT COUNT(Books.Title)
  FROM Books
  JOIN Loans ON Books.BookID = Loans.BookID
  WHERE Books.Title = 'Dracula'
  AND Loans.ReturnedDate IS NULL)
  AS AvailableBooks;