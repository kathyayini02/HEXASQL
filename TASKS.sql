--TASK01
CREATE TABLE MY_EMPLOYEE (
ID               NUMBER(4) NOT NULL,
LAST_NAME        VARCHAR2(25),
FIRST_NAME       VARCHAR2(25),
USERID           VARCHAR2(8),
SALARY           NUMBER(9,2),
CONSTRAINT       PK_EMPLOYEE_ID PRIMARY KEY (ID)
);

--TASK02

INSERT INTO MY_EMPLOYEE
VALUES (1, 'PARVAT', 'RAM', 'PRAM',857);

--TASK03
INSERT INTO MY_EMPLOYEE (ID, LAST_NAME, FIRST_NAME, USERID, SALARY)
VALUES  (2, 'DANIEL', 'BEN','DBEN',86000);