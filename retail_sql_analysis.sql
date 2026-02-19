--Lab Week 4 Solution

--1 List the average employee salary for each employee title. Sequence the output, highest to lowest average
SELECT AVG(EmpSal) AS "Average Salary", EmpTitle
FROM Employee
GROUP BY EmpTitle
ORDER BY AVG(EmpSal) DESC;

--2 List the total balance for each customer province but only show the situations where the total is over $100
SELECT SUM(Balance) AS "Total Balance", Prov
FROM Customer
GROUP BY Prov
HAVING SUM(Balance) > 100;

--3 List for each city a count of customers. Only show for situations where there are more than 2 customers
SELECT COUNT(*) AS "No of Customers", CustCity
FROM Customer
GROUP BY CustCity
HAVING COUNT(*) > 2;

--4 List the province that has more than 5 customers
SELECT Prov
FROM Customer
GROUP BY Prov
HAVING COUNT(*) > 5;

--5 List the details for all Fruit items and all their sale item details
SELECT *
FROM Item INNER JOIN SaleItem
ON Item.ItemId = SaleItem.ItemId
WHERE ItemCategory = 'FR';

--6 List the details for all Cash customers that have ever bought any Fruit Item. Show each customer only once
--  Sequence the output by customer id within province
SELECT DISTINCT Customer.*
FROM Customer INNER JOIN Orders
ON Customer.CustId = Orders.CustId INNER JOIN SaleItem
ON Orders.OrderNo = SaleItem.OrderNo INNER JOIN Item
ON SaleItem.ItemId = Item.ItemId
WHERE CustType = 'CASH' AND ItemCategory = 'FR'
ORDER BY Prov, CustId;

--7 List the details for all items that had sales in 2019 with a quantity sold over 75. Only show each item once.
--  Sequence the output by item description within category
SELECT DISTINCT Item.*
FROM Item INNER JOIN SaleItem
ON Item.ItemId = SaleItem.ItemId INNER JOIN Orders
ON SaleItem.OrderNo = Orders.OrderNo
WHERE OrderDate BETWEEN '2019-01-01' AND '2019-12-31'
  AND QtySold > 75
ORDER BY ItemCategory, ItemDesc;

--8 List the details of all customers that placed orders in 2019. Show each customer only once
SELECT DISTINCT Customer.*
FROM Customer INNER JOIN Orders
ON Customer.CustId = Orders.CustId
WHERE OrderDate BETWEEN '2019-01-01' AND '2019-12-31';

--9 List the id of any employee that serviced more than 2 sales in 2019.
SELECT EmpId
FROM Orders
WHERE OrderDate BETWEEN '2019-01-01' AND '2019-12-31'
GROUP BY EmpId
HAVING COUNT(*) > 2;

--10  i) Add to the database a new Sale Item for an existing Order
--    ii) Change the sale price by doubling its value and change the qtysold to 50
--    iii) Delete the sale item added above

-- i) (Using an existing order: 9992, and an existing item: 99999)
INSERT INTO SaleItem
 (OrderNo, ItemId, SalePrice, QtySold)
VALUES (9992, 99999, 1.30, 10);

-- ii)
UPDATE SaleItem
SET SalePrice = SalePrice * 2,
    QtySold = 50
WHERE OrderNo = 9992 AND ItemId = 99999;

-- iii)
DELETE FROM SaleItem
WHERE OrderNo = 9992 AND ItemId = 99999;



