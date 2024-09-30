select * from order_details;

-- In the OrderDetails table, we have the fields UnitPrice
-- and Quantity. Create a new field, TotalPrice, that
-- multiplies these two together. We’ll ignore the Discount
-- field for now.
-- In addition, show the OrderID, ProductID, UnitPrice, and
-- Quantity. Order by OrderID and ProductID

select order_id , product_id ,unit_price , quantity ,
		cast(unit_price * quantity as decimal(10,2)) as Total_price 
from order_details;