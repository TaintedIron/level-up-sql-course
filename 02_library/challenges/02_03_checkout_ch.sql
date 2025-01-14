-- Check out two books for Jack Vaan (jvaan@wisdompets.com).
-- Book 1: The Picture of Dorian Gray, 2855934983
-- Book 2: Great Expectations, 4043822646
-- The checkout date is August 25, 2022 and the 
-- due date is September 8, 2022.
SELECT PatronID, LastName, FirstName, Email 
    FROM Patrons 
    WHERE Email = 'jvaan@wisdompets.com';

SELECT * 
    FROM Loans
    WHERE PatronID = 50
    ORDER BY LoanDate DESC;

-- Book 1 Checkout
INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (
  (SELECT BookID 
    FROM Books 
    WHERE Barcode = '2855934983'),
  (SELECT PatronID 
    FROM Patrons 
    WHERE Email = 'jvaan@wisdompets.com'),
  '2022-08-25',
  '2022-09-08'
  );

-- Book 2 Checkout
INSERT INTO Loans (BookID, PatronID, LoanDate, DueDate)
VALUES (
  (SELECT BookID 
    FROM Books 
    WHERE Barcode = '4043822646'),
  (SELECT PatronID 
    FROM Patrons 
    WHERE Email = 'jvaan@wisdompets.com'),
  '2022-08-25',
  '2022-09-08'
  );

-- forgot '' in book1 checkout. delete loanid 2001 in loans table
-- DELETE FROM Loans
-- WHERE LoanID = 2001;