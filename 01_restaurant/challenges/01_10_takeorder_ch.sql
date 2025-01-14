-- Enter a customer's delivery order into our database, 
-- and provide the total cost of the items ordered.

-- Use this order information:
-- Customer: Loretta Hundey, at 6939 Elka Place
-- Items: 1 House Salad, 1 Mini Cheeseburgers, and
-- 1 Tropical Blue Smoothie
-- Delivery date and time: September 20, 2022 @ 2PM (14:00)
-- There are no taxes or other fees.

SELECT * FROM Customers WHERE LastName = 'Hundey';
SELECT * FROM Dishes WHERE Name = 'House Salad' OR Name = 'Mini Cheeseburgers' OR Name = 'Tropical Blue Smoothie';

-- Create the order record in the Orders table
-- Add items to the order from Dishes table
-- Start by inserting the order record by joining CustomerID from pervious query on Customers table
-- then we will insert the items found from the Dishes table in the last query.

INSERT INTO Orders (CustomerID, OrderDate) 
VALUES ((SELECT CustomerID FROM Customers WHERE LastName = 'Hundey'), '2022-09-20 14:00:00');
SELECT * FROM Orders ORDER BY OrderID DESC;

-- Insert the items from the new order record into the OrderDishes table. Only need to insert the OrderID and DishID.

INSERT INTO OrdersDishes (OrderID, DishID)
VALUES (1001, (SELECT DishID FROM Dishes WHERE Name = 'House Salad')),
       (1001, (SELECT DishID FROM Dishes WHERE Name = 'Mini Cheeseburgers')),
       (1001, (SELECT DishID FROM Dishes WHERE Name = 'Tropical Blue Smoothie'));

-- fix my new record for OrderDishes. Updating with correct OrderID of 1001.
-- UPDATE OrdersDishes SET OrderID = 1001 WHERE OrderID = 50;

SELECT * FROM OrdersDishes ORDER BY OrdersDishesID DESC;

-- Calculate the total cost of the order by summing the prices of the items in the order.
SELECT * FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;

SELECT SUM(Dishes.Price) FROM Dishes
JOIN OrdersDishes ON Dishes.DishID = OrdersDishes.DishID
WHERE OrdersDishes.OrderID = 1001;