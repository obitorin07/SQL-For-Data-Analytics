-- 2 Certain fields from Categories
-- In the Categories table, selecting all the fields using this
-- SQL:
-- Select * from Categories

-- …will return 4 columns. We only want to see two
-- columns, CategoryName and Description

select * from categories

select category_name as category,
description from categories