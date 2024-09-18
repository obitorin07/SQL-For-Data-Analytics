/* Looking at the Orders table, there’s a field called
ShipCountry. Write a query that shows the OrderID,
CustomerID, and ShipCountry for the orders where the
ShipCountry is either France or Belgium */


SELECT 
ORDER_ID,
CUSTOMER_ID,
SHIP_COUNTRY
FROM ORDERS
WHERE SHIP_COUNTRY = 'Belgium' or SHIP_COUNTRY ='France';