-- Return three books to the library using
-- their bar codes.
-- Return date: July 5, 2022
-- Book 1: 6435968624
-- Book 2: 5677520613
-- Book 3: 8730298424

SELECT * FROM Books WHERE Barcode = 6435968624 OR Barcode = 5677520613 OR Barcode = 8730298424;
-- Book 1: 6435968624 - BookID: 105
-- Book 2: 5677520613 - BookID: 46
-- Book 3: 8730298424 - BookID: 73

SELECT * FROM Loans WHERE (BookID = 105 OR BookID = 46 OR BookID = 73) AND ReturnedDate IS NULL;
-- LoanID: 1991 -- BookID: 105
-- LoanID: 1992 -- BookID: 46
-- LoanID: 1999 -- BookID: 73

-- Update to Book 1 Loan
UPDATE Loans 
  SET ReturnedDate = '2022-07-05' 
  WHERE BookID = 
    (SELECT
      BookID FROM Books
      WHERE Barcode = 6435968624)
  AND ReturnedDate IS NULL;

-- Update to Book 2 Loan
UPDATE Loans 
  SET ReturnedDate = '2022-07-05' 
  WHERE BookID = 
    (SELECT
      BookID FROM Books
      WHERE Barcode = 5677520613)
  AND ReturnedDate IS NULL;

-- Update to Book 3 Loan
UPDATE Loans 
  SET ReturnedDate = '2022-07-05' 
  WHERE BookID = 
    (SELECT
      BookID FROM Books
      WHERE Barcode = 8730298424)
  AND ReturnedDate IS NULL;

-- Verify that the books have been returned
SELECT * FROM Loans 
  WHERE (BookID = 105 OR BookID = 46 OR BookID = 73) 
  AND ReturnedDate = '2022-07-05';