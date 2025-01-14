-- Prepare a report of the library patrons
-- who have checked out the fewest books.

SELECT
  Patrons.FirstName,
  Patrons.LastName,
  Patrons.Email,
  COUNT(Loans.LoanID) AS NumLoans
FROM
  Patrons
  JOIN Loans ON Patrons.PatronID = Loans.PatronID
GROUP BY
  Loans.PatronID
ORDER BY
  NumLoans ASC
LIMIT
  5;
