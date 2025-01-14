-- Create a list of books to feature in an exhibit.

-- Make a pick list of books published from 1890-1899 
-- which are not currently checked out.

SELECT
  Books.Title,
  Books.Author,
  Books.Published,
  Books.Barcode
FROM
  Books
WHERE
  Books.Published BETWEEN 1890 AND 1899
  AND (Books.BookID NOT IN 
    (SELECT
      Loans.BookID
    FROM
      Loans
    WHERE
      Loans.ReturnedDate IS NULL))
ORDER BY 
  Books.Title;