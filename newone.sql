-- Create Customers table
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

-- Insert values into Customers table
INSERT all
INTO Customers (CustomerID, CustomerName) VALUES    (1, 'Alice')
INTO Customers (CustomerID, CustomerName) VALUES    (2, 'Bob')
INTO Customers (CustomerID, CustomerName) VALUES    (3, 'Charlie')
INTO Customers (CustomerID, CustomerName) VALUES    (4, 'Diana')
select * from dual;

-- Create Orders table
CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    CustomerID INT,
    Amount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

-- Insert values into Orders table
INSERT all 
INTO Orders VALUES(101, '01-12-2024', 1, 150.00)
INTO Orders VALUES(102, '02-12-2024', 1, 200.00)
INTO Orders VALUES(103, '03-12-2024', 2, 300.00)
INTO Orders VALUES(104, '04-12-2024', 4, 50.00)
select * from dual;

select * from orders;

-- Query to find the total amount of orders placed by each customer, including those with no orders
SELECT c.CustomerID, c.CustomerName, COALESCE(SUM(o.Amount), 0) AS TotalAmount
FROM Customers c LEFT JOIN Orders o 
ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
order by customerid;

select * from customers;
select * from orders;
drop table Customers;
drop table Orders;
