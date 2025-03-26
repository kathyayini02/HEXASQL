--CREATE DATABASE HMBank;
USE HMBank;
/*CREATE TABLE Customers (
    customer_id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    DOB DATE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    address TEXT NOT NULL
);*/

/*CREATE TABLE Accounts (
    account_id INT IDENTITY(1,1) PRIMARY KEY,
    customer_id INT NOT NULL,
    account_type VARCHAR(20) CHECK (account_type IN ('savings', 'current', 'zero_balance')),
    balance DECIMAL(15,2) CHECK (balance >= 0) DEFAULT 0,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE Transactions (
    transaction_id INT IDENTITY(1,1) PRIMARY KEY,
    account_id INT NOT NULL,
    transaction_type VARCHAR(20) CHECK (transaction_type IN ('deposit', 'withdrawal', 'transfer')),
    amount DECIMAL(15,2) CHECK (amount > 0) NOT NULL,
    transaction_date DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (account_id) REFERENCES Accounts(account_id) ON DELETE CASCADE
)*/
/*INSERT INTO Customers (first_name, last_name, DOB, email, phone_number, address) VALUES
('John', 'Doe', '1985-06-15', 'john.doe@example.com', '9876543210', '123 Main St'),
('Jane', 'Smith', '1990-04-25', 'jane.smith@example.com', '9876543211', '456 Oak St'),
('Alice', 'Johnson', '1988-12-05', 'alice.johnson@example.com', '9876543212', '789 Pine St'),
('Bob', 'Brown', '1995-08-19', 'bob.brown@example.com', '9876543213', '321 Maple St'),
('Charlie', 'Davis', '2000-03-30', 'charlie.davis@example.com', '9876543214', '654 Elm St'),
('Emma', 'Wilson', '1987-09-12', 'emma.wilson@example.com', '9876543215', '987 Birch St'),
('David', 'Clark', '1992-07-22', 'david.clark@example.com', '9876543216', '741 Cedar St'),
('Olivia', 'Hall', '1998-11-15', 'olivia.hall@example.com', '9876543217', '369 Spruce St'),
('Ethan', 'Walker', '1994-05-09', 'ethan.walker@example.com', '9876543218', '852 Walnut St'),
('Sophia', 'Lewis', '1991-10-29', 'sophia.lewis@example.com', '9876543219', '963 Hickory St');
*/

/*INSERT INTO Accounts (customer_id, account_type, balance) VALUES
(1, 'savings', 5000.00),
(2, 'current', 10000.00),
(3, 'savings', 7500.00),
(4, 'current', 12000.00),
(5, 'zero_balance', 0.00),
(6, 'savings', 8200.00),
(7, 'current', 5000.00),
(8, 'savings', 9500.00),
(9, 'current', 2000.00),
(10, 'savings', 6300.00);
*/

/*INSERT INTO Transactions (account_id, transaction_type, amount) VALUES
(1, 'deposit', 2000.00),
(2, 'withdrawal', 500.00),
(3, 'deposit', 3000.00),
(4, 'transfer', 1500.00),
(5, 'deposit', 1000.00),
(6, 'withdrawal', 400.00),
(7, 'deposit', 2500.00),
(8, 'transfer', 1200.00),
(9, 'deposit', 900.00),
(10, 'withdrawal', 600.00);*/

/*SELECT first_name, last_name, account_type, email FROM Customers
JOIN Accounts ON Customers.customer_id = Accounts.customer_id;

SELECT first_name, last_name, transaction_type, amount, transaction_date FROM Customers
JOIN Accounts ON Customers.customer_id = Accounts.customer_id
JOIN Transactions ON Accounts.account_id = Transactions.account_id;
*/

--UPDATE Accounts SET balance = balance + 1000 WHERE account_id = 1;

--SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM Customers;

--DELETE FROM Accounts WHERE balance = 0 AND account_type = 'savings';

/*SELECT * FROM Customers WHERE address LIKE '%Maple St%';

SELECT balance FROM Accounts WHERE account_id = 2;

SELECT * FROM Accounts WHERE account_type = 'current' AND balance > 1000;

SELECT account_id, balance * 0.05 AS interest FROM Accounts WHERE account_type = 'savings';

SELECT AVG(balance) AS avg_balance FROM Accounts;

SELECT * FROM Accounts ORDER BY balance DESC ;

SELECT SUM(amount) FROM Transactions WHERE transaction_type = 'deposit' AND transaction_date = '2025-03-26';

SELECT * FROM Customers ORDER BY DOB ASC ;

SELECT * FROM Customers ORDER BY DOB DESC ;*/

/*SELECT T.transaction_id, T.account_id, A.account_type, T.transaction_type, T.amount, T.transaction_date
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id;
SELECT C.customer_id, C.first_name, C.last_name, C.email, C.phone_number, A.account_id, A.account_type, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id;

SELECT C.customer_id, C.first_name, C.last_name, C.email, C.phone_number, A.account_id, A.account_type, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id;

SELECT C.customer_id, C.first_name, C.last_name, COUNT(A.account_id) AS account_count
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name
HAVING COUNT(A.account_id) > 1;

SELECT account_id, 
       SUM(CASE WHEN transaction_type = 'deposit' THEN amount ELSE 0 END) -
       SUM(CASE WHEN transaction_type = 'withdrawal' THEN amount ELSE 0 END) AS transaction_difference
FROM Transactions
GROUP BY account_id;

SELECT account_id, AVG(balance) AS avg_daily_balance
FROM Accounts
WHERE account_id IN (
    SELECT DISTINCT account_id FROM Transactions
    WHERE transaction_date BETWEEN '2025-03-01' AND '2025-03-26'
)
GROUP BY account_id;

SELECT account_type, SUM(balance) AS total_balance
FROM Accounts
GROUP BY account_type;

SELECT account_id, COUNT(transaction_id) AS transaction_count
FROM Transactions
GROUP BY account_id
ORDER BY transaction_count DESC;

SELECT C.customer_id, C.first_name, C.last_name, A.account_type, SUM(A.balance) AS total_balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
GROUP BY C.customer_id, C.first_name, C.last_name, A.account_type
HAVING SUM(A.balance) > 10000; -- Adjust the threshold as needed

SELECT account_id, amount, transaction_date, COUNT(*) AS duplicate_count
FROM Transactions
GROUP BY account_id, amount, transaction_date
HAVING COUNT(*) > 1;

*/

SELECT C.customer_id, C.first_name, C.last_name, A.balance
FROM Customers C
JOIN Accounts A ON C.customer_id = A.customer_id
WHERE A.balance = (SELECT MAX(balance) FROM Accounts);

SELECT AVG(balance) AS avg_balance
FROM Accounts
WHERE customer_id IN (
    SELECT customer_id FROM Accounts GROUP BY customer_id HAVING COUNT(account_id) > 1
);

SELECT * FROM Transactions
WHERE amount > (SELECT AVG(amount) FROM Transactions);

SELECT C.* FROM Customers C
WHERE C.customer_id NOT IN (SELECT DISTINCT customer_id FROM Accounts A JOIN Transactions T ON A.account_id = T.account_id);

SELECT SUM(balance) AS total_balance
FROM Accounts
WHERE account_id NOT IN (SELECT DISTINCT account_id FROM Transactions);

SELECT * FROM Transactions
WHERE account_id IN (
    SELECT account_id FROM Accounts WHERE balance = (SELECT MIN(balance) FROM Accounts)
);

SELECT customer_id
FROM Accounts
GROUP BY customer_id
HAVING COUNT(DISTINCT account_type) > 1;

SELECT account_type, 
       COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Accounts) AS percentage
FROM Accounts
GROUP BY account_type;

SELECT T.*
FROM Transactions T
JOIN Accounts A ON T.account_id = A.account_id
WHERE A.customer_id = 1; -- Change as needed

SELECT account_type, 
       (SELECT SUM(balance) FROM Accounts A2 WHERE A2.account_type = A1.account_type) AS total_balance
FROM Accounts A1
GROUP BY account_type;




