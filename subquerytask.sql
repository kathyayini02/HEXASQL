--create database subqueries;

--use subqueries;

--Task 1
--CREATE TABLE Salesman (
--    salesman_id INT PRIMARY KEY,
--    name VARCHAR(50),
--    city VARCHAR(50),
--    commission DECIMAL(5,2)
--);

--INSERT INTO Salesman (salesman_id, name, city, commission) VALUES
--(5001, 'James Hoog', 'New York', 0.15),
--(5002, 'Nail Knite', 'Paris', 0.13),
--(5005, 'Pit Alex', 'London', 0.11),
--(5006, 'Mc Lyon', 'Paris', 0.14),
--(5003, 'Lauson Hen', 'San Jose', 0.12),
--(5007, 'Paul Adam', 'Rome', 0.13);

--CREATE TABLE Orders (
--    ord_no INT PRIMARY KEY,
--    purch_amt DECIMAL(10,2),
--    ord_date DATE,
--    customer_id INT,
--    salesman_id INT,
--    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
--);

--INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
--(70001, 150.5, '2012-10-05', 3005, 5002),
--(70009, 270.65, '2012-09-10', 3001, 5005),
--(70002, 65.26, '2012-10-05', 3002, 5001),
--(70004, 110.5, '2012-08-17', 3009, 5003),
--(70007, 948.5, '2012-09-10', 3005, 5002),
--(70005, 2400.6, '2012-07-27', 3007, 5001),
--(70008, 5760, '2012-09-10', 3002, 5001),
--(70010, 1983.43, '2012-10-10', 3004, 5006),
--(70003, 2480.4, '2012-10-10', 3009, 5003),
--(70012, 250.45, '2012-06-27', 3008, 5002),
--(70011, 75.29, '2012-08-17', 3003, 5007),
--(70013, 3045.6, '2012-04-25', 3002, 5001);

--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE salesman_id = (SELECT salesman_id FROM Salesman WHERE name = 'Paul Adam');

--Task 2
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE city = 'London');

--Task 3
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE salesman_id = (SELECT salesman_id FROM Orders WHERE customer_id = 3007);


--Task 4
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE ord_date = '2012-10-10'
--AND purch_amt > (SELECT AVG(purch_amt) FROM Orders WHERE ord_date = '2012-10-10');


--Task 5
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE city = 'New York');

--Task 6
--CREATE TABLE Customer (
--    customer_id INT PRIMARY KEY,
--    cust_name VARCHAR(50),
--    city VARCHAR(50),
--    grade INT,
--    salesman_id INT,
--    FOREIGN KEY (salesman_id) REFERENCES Salesman(salesman_id)
--);

--INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES
--(3002, 'Nick Rimando', 'New York', 100, 5001),
--(3005, 'Graham Zusi', 'California', 200, 5002),
--(3001, 'Brad Guzan', 'London', 100, 5005),
--(3004, 'Fabian Johns', 'Paris', 300, 5006),
--(3007, 'Brad Davis', 'New York', 200, 5001),
--(3009, 'Geoff Camero', 'Berlin', 100, 5003),
--(3008, 'Julian Green', 'London', 300, 5002),
--(3003, 'Jozy Altidor', 'Moncow', 200, 5007);

--SELECT commission 
--FROM Salesman 
--WHERE city = 'Paris';



--Task 7
--SELECT * 
--FROM Customer 
--WHERE customer_id < 2001 
--AND salesman_id = (SELECT salesman_id FROM Salesman WHERE name = 'Mc Lyon');



--Task 8
--SELECT COUNT(*) AS customer_count 
--FROM Customer 
--WHERE city = 'New York' 
--AND grade > (SELECT AVG(grade) FROM Customer);


--Task 9
--SELECT ord_no, purch_amt, ord_date, salesman_id 
--FROM Orders 
--WHERE salesman_id IN (SELECT salesman_id FROM Salesman WHERE commission = (SELECT MAX(commission) FROM Salesman));

--Task 10
--SELECT O.ord_no, O.purch_amt, O.ord_date, O.customer_id, O.salesman_id, C.cust_name
--FROM Orders AS O
--INNER JOIN Customer AS C ON O.customer_id = C.customer_id
--WHERE O.ord_date = '2012-08-17';


--Task 11
--SELECT S.salesman_id, S.name
--FROM Salesman S
--JOIN Customer C ON S.salesman_id = C.salesman_id
--GROUP BY S.salesman_id, S.name
--HAVING COUNT(C.customer_id) > 1;

--Task 12
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE purch_amt > (SELECT AVG(purch_amt) FROM Orders);

--Task 13
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE purch_amt >= (SELECT AVG(purch_amt) FROM Orders);

--Task 14
--SELECT ord_date, SUM(purch_amt) AS total_sales
--FROM Orders
--GROUP BY ord_date
--HAVING SUM(purch_amt) >= (SELECT MAX(purch_amt) FROM Orders) + 1000;


--Task 15
--SELECT * FROM Customer
--WHERE EXISTS (SELECT 1 FROM Customer WHERE city = 'London');

--Task 16
--SELECT S.salesman_id, S.name, S.city, S.commission
--FROM Salesman S
--JOIN Customer C ON S.salesman_id = C.salesman_id
--GROUP BY S.salesman_id, S.name, S.city, S.commission
--HAVING COUNT(C.customer_id) > 1;

--Task 17
--SELECT S.salesman_id, S.name, S.city, S.commission
--FROM Salesman S
--JOIN Customer C ON S.salesman_id = C.salesman_id
--GROUP BY S.salesman_id, S.name, S.city, S.commission
--HAVING COUNT(C.customer_id) = 1;

--Task 18
--SELECT DISTINCT S.salesman_id, S.name, S.city, S.commission
--FROM Salesman S
--JOIN Customer C ON S.salesman_id = C.salesman_id
--JOIN Orders O ON C.customer_id = O.customer_id
--WHERE O.customer_id IN (
--    SELECT customer_id FROM Orders GROUP BY customer_id HAVING COUNT(ord_no) > 1
--);

--Task 19
--SELECT DISTINCT S.salesman_id, S.name, S.city, S.commission
--FROM Salesman S
--WHERE EXISTS (SELECT 1 FROM Customer C WHERE C.city = S.city);

--Task 20
--SELECT DISTINCT S.salesman_id, S.name, S.city, S.commission
--FROM Salesman S
--JOIN Customer C ON S.city = C.city;

--Task 21
--SELECT DISTINCT S.salesman_id, S.name, S.city, S.commission
--FROM Salesman S
--JOIN Customer C ON S.name < C.cust_name;

--Task 22
--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Customer
--WHERE grade > ALL (
--    SELECT grade FROM Customer WHERE city > 'New York'
--);

--Task 23
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE purch_amt > ANY (
--    SELECT purch_amt FROM Orders WHERE ord_date = '2012-09-10'
--);

--Task 24
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE purch_amt < ANY (
--    SELECT purch_amt FROM Orders 
--    WHERE customer_id IN (
--        SELECT customer_id FROM Customer WHERE city = 'London'
--    )
--);


--Task 25
--SELECT ord_no, purch_amt, ord_date, customer_id, salesman_id
--FROM Orders
--WHERE purch_amt < (
--    SELECT MAX(purch_amt) FROM Orders 
--    WHERE customer_id IN (
--        SELECT customer_id FROM Customer WHERE city = 'London'
--    )
--);

--Task 26
--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Customer
--WHERE grade > ALL (
--    SELECT grade FROM Customer WHERE city = 'New York'
--);


--Task 27
--SELECT S.name, S.city, SUM(O.purch_amt) AS total_order_amount
--FROM Salesman S
--JOIN Orders O ON S.salesman_id = O.salesman_id
--WHERE S.city IN (SELECT DISTINCT city FROM Customer)
--GROUP BY S.name, S.city;

--Task 28
--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Customer
--WHERE grade NOT IN (
--    SELECT DISTINCT grade FROM Customer WHERE city = 'London'
--);

--Task 29
--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Customer
--WHERE grade NOT IN (
--    SELECT DISTINCT grade FROM Customer WHERE city = 'Paris'
--);

--Task 30
--SELECT customer_id, cust_name, city, grade, salesman_id
--FROM Customer
--WHERE NOT EXISTS (
--    SELECT 1 FROM Customer WHERE city = 'Dallas'
--);

--Task 31
--CREATE TABLE item_mast (
--    PRO_ID INT PRIMARY KEY,
--    PRO_NAME VARCHAR(50),
--    PRO_PRICE DECIMAL(10,2),
--    PRO_COM INT
--);

--INSERT INTO item_mast (PRO_ID, PRO_NAME, PRO_PRICE, PRO_COM) VALUES
--(101, 'Mother Board', 3200.00, 15),
--(102, 'Key Board', 450.00, 16),
--(103, 'ZIP drive', 250.00, 14),
--(104, 'Speaker', 550.00, 16),
--(105, 'Monitor', 5000.00, 11),
--(106, 'DVD drive', 900.00, 12),
--(107, 'CD drive', 800.00, 12),
--(108, 'Printer', 2600.00, 13),
--(109, 'Refill cartridge', 350.00, 13),
--(110, 'Mouse', 250.00, 12);

--CREATE TABLE company_mast (
--    COM_ID INT PRIMARY KEY,
--    COM_NAME VARCHAR(50)
--);

--INSERT INTO company_mast (COM_ID, COM_NAME) VALUES
--(11, 'Samsung'),
--(12, 'iBall'),
--(13, 'Epsion'),
--(14, 'Zebronics'),
--(15, 'Asus'),
--(16, 'Frontech');

--SELECT AVG(i.PRO_PRICE) AS avg_price, c.COM_NAME
--FROM item_mast i
--JOIN company_mast c ON i.PRO_COM = c.COM_ID
--GROUP BY c.COM_NAME;


--Task 32
--SELECT AVG(i.PRO_PRICE) AS avg_price, c.COM_NAME
--FROM item_mast i
--JOIN company_mast c ON i.PRO_COM = c.COM_ID
--WHERE i.PRO_PRICE >= 350
--GROUP BY c.COM_NAME;

--Task 33
--SELECT i.PRO_NAME, i.PRO_PRICE, c.COM_NAME
--FROM item_mast i
--JOIN company_mast c ON i.PRO_COM = c.COM_ID
--WHERE i.PRO_PRICE = (
--    SELECT MAX(PRO_PRICE) FROM item_mast WHERE PRO_COM = i.PRO_COM
--);

--Task 34
--CREATE TABLE emp_details (
--    EMP_IDNO INT PRIMARY KEY,
--    EMP_FNAME VARCHAR(50),
--    EMP_LNAME VARCHAR(50),
--    EMP_DEPT INT
--);

--INSERT INTO emp_details (EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT) VALUES
--(127323, 'Michale', 'Robbin', 57),
--(526689, 'Carlos', 'Snares', 63),
--(843795, 'Enric', 'Dosio', 57),
--(328717, 'Jhon', 'Snares', 63),
--(444527, 'Joseph', 'Dosni', 47),
--(659831, 'Zanifer', 'Emily', 47),
--(847674, 'Kuleswar', 'Sitaraman', 57),
--(748681, 'Henrey', 'Gabriel', 47),
--(555935, 'Alex', 'Manuel', 57),
--(539569, 'George', 'Mardy', 27),
--(733843, 'Mario', 'Saule', 63),
--(631548, 'Alan', 'Snappy', 27),
--(839139, 'Maria', 'Foster', 57);

--SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
--FROM emp_details
--WHERE EMP_LNAME IN ('Gabriel', 'Dosio');

--Task 35
--SELECT EMP_IDNO, EMP_FNAME, EMP_LNAME, EMP_DEPT
--FROM emp_details
--WHERE EMP_DEPT IN (89, 63);

--Task 36
--CREATE TABLE emp_department (
--    DPT_CODE INT PRIMARY KEY,
--    DPT_NAME VARCHAR(50),
--    DPT_ALLOTMENT DECIMAL(10,2)
--);

--INSERT INTO emp_department (DPT_CODE, DPT_NAME, DPT_ALLOTMENT) VALUES
--(57, 'IT', 65000),
--(63, 'Finance', 15000),
--(47, 'HR', 240000),
--(27, 'RD', 55000),
--(89, 'QC', 75000);

--SELECT e.EMP_FNAME, e.EMP_LNAME
--FROM emp_details e
--JOIN emp_department d ON e.EMP_DEPT = d.DPT_CODE
--WHERE d.DPT_ALLOTMENT > 50000;


--Task 37
--SELECT DPT_CODE, DPT_NAME, DPT_ALLOTMENT
--FROM emp_department
--WHERE DPT_ALLOTMENT > (SELECT AVG(DPT_ALLOTMENT) FROM emp_department);

--Task 38
--SELECT d.DPT_NAME
--FROM emp_department d
--JOIN emp_details e ON d.DPT_CODE = e.EMP_DEPT
--GROUP BY d.DPT_NAME
--HAVING COUNT(e.EMP_IDNO) > 2;

--Task 39
--SELECT e.EMP_FNAME, e.EMP_LNAME
--FROM emp_details e
--JOIN emp_department d ON e.EMP_DEPT = d.DPT_CODE
--WHERE d.DPT_ALLOTMENT = (
--    SELECT DISTINCT DPT_ALLOTMENT
--    FROM emp_department
--    ORDER BY DPT_ALLOTMENT ASC
--    OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY
--);

