-- Remove incorrect information from the database.

-- A customer named Norby has notified us he won't 
-- be able to keep his Friday reservation. 
-- Today is July 24, 2022.
SELECT
  *
FROM
  Customers
WHERE FirstName = 'Norby';

SELECT * FROM Reservations WHERE customerID = 64;

DELETE FROM Reservations WHERE customerID = 64 AND ReservationID = 2000;

SELECT * FROM Reservations WHERE customerID = 64 ORDER BY Date DESC;