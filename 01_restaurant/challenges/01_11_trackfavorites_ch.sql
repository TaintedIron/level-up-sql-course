-- Update information in the database.

-- Set Cleo Goldwater's favorite dish to
-- the Quinoa Salmon Salad.

SELECT * FROM Customers WHERE LastName = 'Goldwater';
SELECT * FROM Dishes WHERE Name = 'Quinoa Salmon Salad';

UPDATE Customers SET FavoriteDish = (SELECT DishID FROM Dishes WHERE Name = 'Quinoa Salmon Salad')
WHERE LastName = 'Goldwater' and FirstName = 'Cleo';

SELECT * FROM Customers WHERE LastName = 'Goldwater';