--USE SalesDB;
--2
/*REATE TABLE orders (
    ord_no       INT PRIMARY KEY,
    purch_amt    DECIMAL(10,2),
    ord_date     DATE,
    customer_id  INT FOREIGN KEY REFERENCES customer(customer_id),
    salesman_id  INT
);
*/
/*INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003);*/
/*SELECT 
    o.ord_no, 
    o.purch_amt, 
    c.cust_name, 
    c.city
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.purch_amt BETWEEN 500 AND 2000;*/

--3

/*SELECT 
    c.cust_name AS Customer_Name, 
    c.city AS City, 
    s.name AS Salesman, 
    s.commission AS Commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id;
*/

--4
/*SELECT 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    s.name AS Salesman, 
    s.commission AS Commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE s.commission > 0.12;
*/

--5
/*SELECT 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    s.name AS Salesman, 
    s.city AS Salesman_City, 
    s.commission AS Commission
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.city <> s.city 
AND s.commission > 0.12;*/

--6
/*SELECT 
    o.ord_no, 
    o.ord_date, 
    o.purch_amt, 
    c.cust_name AS Customer_Name, 
    c.grade, 
    s.name AS Salesman, 
    s.commission
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
JOIN salesman s ON o.salesman_id = s.salesman_id;
*/
 
 --7
 /*SELECT 
    s.salesman_id, 
    s.name AS Salesman, 
    s.city AS Salesman_City, 
    s.commission, 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade, 
    o.ord_no, 
    o.ord_date, 
    o.purch_amt
FROM salesman s
JOIN customer c ON s.salesman_id = c.salesman_id
JOIN orders o ON c.customer_id = o.customer_id;
*/

--8
/*SELECT 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade, 
    s.name AS Salesman, 
    s.city AS Salesman_City
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY c.customer_id ASC;
*/

--9
/*SELECT 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade, 
    s.name AS Salesman, 
    s.city AS Salesman_City
FROM customer c
JOIN salesman s ON c.salesman_id = s.salesman_id
WHERE c.grade < 300
ORDER BY c.customer_id ASC;
*/

--10
/*SELECT 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    o.ord_no AS Order_Number, 
    o.ord_date AS Order_Date, 
    o.purch_amt AS Order_Amount
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY o.ord_date ASC;*/

--11
/*SELECT 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    o.ord_no AS Order_Number, 
    o.ord_date AS Order_Date, 
    o.purch_amt AS Order_Amount, 
    s.name AS Salesman_Name, 
    s.commission AS Commission
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN salesman s ON c.salesman_id = s.salesman_id
ORDER BY o.ord_date ASC;

*/

--12
/*SELECT 
    s.salesman_id, 
    s.name AS Salesman_Name, 
    s.city AS Salesman_City, 
    s.commission AS Commission
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
ORDER BY s.salesman_id ASC;*/

--13

/*SELECT 
    s.salesman_id, 
    s.name AS Salesman_Name, 
    s.city AS Salesman_City, 
    s.commission AS Commission, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade AS Customer_Grade, 
    o.ord_no AS Order_Number, 
    o.ord_date AS Order_Date, 
    o.purch_amt AS Order_Amount
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id
ORDER BY s.salesman_id, c.customer_id, o.ord_date ASC;
*/

--14
/*SELECT 
    s.salesman_id, 
    s.name AS Salesman_Name, 
    s.city AS Salesman_City, 
    s.commission AS Commission, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade AS Customer_Grade, 
    o.ord_no AS Order_Number, 
    o.ord_date AS Order_Date, 
    o.purch_amt AS Order_Amount
FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id 
     AND (o.purch_amt >= 2000 OR o.purch_amt IS NULL)
WHERE c.grade IS NOT NULL OR o.ord_no IS NULL
ORDER BY s.salesman_id, c.customer_id, o.ord_date ASC;
*/

--15
/*SELECT 
    COALESCE(c.cust_name, 'Unknown') AS Customer_Name, 
    COALESCE(c.city, 'Unknown') AS Customer_City, 
    o.ord_no AS Order_Number, 
    o.ord_date AS Order_Date, 
    o.purch_amt AS Purchase_Amount
FROM orders o
LEFT JOIN customer c ON o.customer_id = c.customer_id
ORDER BY o.ord_date ASC;
*/

--16
/*SELECT 
    COALESCE(c.cust_name, 'Unknown') AS Customer_Name, 
    COALESCE(c.city, 'Unknown') AS Customer_City, 
    o.ord_no AS Order_Number, 
    o.ord_date AS Order_Date, 
    o.purch_amt AS Purchase_Amount
FROM orders o
LEFT JOIN customer c ON o.customer_id = c.customer_id
WHERE (c.grade IS NOT NULL AND o.customer_id IS NOT NULL) 
   OR (c.customer_id IS NULL OR c.grade IS NULL)
ORDER BY o.ord_date ASC;
*/

--17
/*SELECT 
    s.salesman_id, 
    s.name AS Salesman, 
    s.city AS Salesman_City, 
    s.commission, 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade
FROM salesman s
CROSS JOIN customer c;
*/

--18
/*SELECT 
    s.salesman_id, 
    s.name AS Salesman, 
    s.city AS Salesman_City, 
    s.commission, 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade
FROM salesman s
CROSS JOIN customer c
WHERE s.city = c.city;
*/

--19
/*SELECT 
    s.salesman_id, 
    s.name AS Salesman, 
    s.city AS Salesman_City, 
    s.commission, 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade
FROM salesman s
CROSS JOIN customer c
WHERE s.city IS NOT NULL AND c.grade IS NOT NULL;
*/

--20
/*SELECT 
    s.salesman_id, 
    s.name AS Salesman, 
    s.city AS Salesman_City, 
    s.commission, 
    c.customer_id, 
    c.cust_name AS Customer_Name, 
    c.city AS Customer_City, 
    c.grade
FROM salesman s
CROSS JOIN customer c
WHERE s.city <> c.city 
AND c.grade IS NOT NULL;*/

--21
-- Creating company_mast table
/*CREATE TABLE company_mast (
    COM_ID INT PRIMARY KEY,
    COM_NAME VARCHAR(50) NOT NULL
);

-- Creating item_mast table
CREATE TABLE item_mast (
    PRO_ID INT PRIMARY KEY,
    PRO_NAME VARCHAR(50) NOT NULL,
    PRO_PRICE DECIMAL(10,2) NOT NULL,
    PRO_COM INT,
    FOREIGN KEY (PRO_COM) REFERENCES company_mast(COM_ID)
);

INSERT INTO company_mast (COM_ID, COM_NAME) VALUES
(11, 'Samsung'),
(12, 'iBall'),
(13, 'Epsion'),
(14, 'Zebronics'),
(15, 'Asus'),
(16, 'Frontech');

-
INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
(101, 'Mother Board', 3200.00, 15),
(102, 'Key Board', 450.00, 16),
(103, 'ZIP drive', 250.00, 14),
(104, 'Speaker', 550.00, 16),
(105, 'Monitor', 5000.00, 11),
(106, 'DVD drive', 900.00, 12),
(107, 'CD drive', 800.00, 12),
(108, 'Printer', 2600.00, 13),
(109, 'Refill cartridge', 350.00, 13),
(110, 'Mouse', 250.00, 12);
-- Query to select all rows from both tables where there is a match
SELECT 
    i.PRO_ID, 
    i.PRO_NAME, 
    i.PRO_PRICE, 
    c.COM_ID, 
    c.COM_NAME
FROM item_mast i
INNER JOIN company_mast c ON i.PRO_COM = c.COM_ID;

*/

--22
/*SELECT 
    i.PRO_NAME AS Item_Name, 
    i.PRO_PRICE AS Price, 
    c.COM_NAME AS Company_Name
FROM item_mast i
INNER JOIN company_mast c ON i.PRO_COM = c.COM_ID;


*/

--23
/*SELECT 
    c.COM_NAME AS Company_Name, 
    AVG(i.PRO_PRICE) AS Average_Price
FROM item_mast i
INNER JOIN company_mast c ON i.PRO_COM = c.COM_ID
GROUP BY c.COM_NAME;
*/

--24
/*SELECT 
    c.COM_NAME AS Company_Name, 
    AVG(i.PRO_PRICE) AS Average_Price
FROM item_mast i
INNER JOIN company_mast c ON i.PRO_COM = c.COM_ID
GROUP BY c.COM_NAME
HAVING AVG(i.PRO_PRICE) >= 350;
*/

--25
/*SELECT i.PRO_NAME, i.PRO_PRICE, c.COM_NAME
FROM item_mast i
INNER JOIN company_mast c ON i.PRO_COM = c.COM_ID
WHERE i.PRO_PRICE = (
    SELECT MAX(PRO_PRICE) 
    FROM item_mast 
    WHERE PRO_COM = i.PRO_COM
);
*/

--26
/*
CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
	budget DECIMAL(10,2)
);

/*-- Create the employee table
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    emp_salary DECIMAL(10,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id)
);

-- Query to fetch all employee details including their department
SELECT e.*, d.dept_name
FROM employee e
LEFT JOIN department d ON e.dept_id = d.dept_id;

*/

--28
SELECT e.first_name, e.last_name
FROM employee e
JOIN department d ON e.dept_id = d.dept_id
WHERE d.budget > 50000;
*/
--29
-- Query to find department names where more than two employees are employed
SELECT d.dept_name
FROM department d
JOIN employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_name
HAVING COUNT(e.emp_id) > 2;

