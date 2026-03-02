-- Create and populate users table
CREATE TABLE users (
    user_id INT,
    signup_date DATE,
    status VARCHAR(50)
);

INSERT INTO users (user_id, signup_date, status) VALUES 
(1, '2025-01-01', 'Active'),
(2, '2025-05-15', 'Active'),
(3, '2026-01-10', 'Active');

-- Create and populate transactions table
CREATE TABLE transactions (
    trans_id INT,
    user_id INT,
    trans_date DATE,
    amount INT
);

INSERT INTO transactions (trans_id, user_id, trans_date, amount) VALUES 
(501, 1, '2026-01-20', 500),
(502, 2, '2026-02-28', 1200),
(503, 1, '2026-02-15', 300);


select * from users; 
select * from transactions;

-- Write a SQL query to find the user_id of all users who have a status of 'Active', but do NOT have any transactions on or after '2026-02-16'.

-- This means your query must capture two types of users:

-- Active users whose transactions were strictly before 2026-02-16.

-- Active users who have never made a transaction at all.

-- Output: Just the user_id column.

SELECT USER_ID FROM USERS WHERE STATUS ='Active'AND USER_ID NOT IN (
SELECT USER_ID FROM TRANSACTIONS WHERE TRANS_dATE >='2026-02-16')