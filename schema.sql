-- 1. Customers 
-- Stores customer details. 
CREATE TABLE Customers ( 
    customer_id INT PRIMARY KEY, 
    name VARCHAR(100), 
    email VARCHAR(150) UNIQUE, 
    phone VARCHAR(15), 
    city VARCHAR(50), 
    state VARCHAR(50), 
    country VARCHAR(50), 
    registration_date DATE 
); 


 
-- 2. Products 
-- Stores product details. 
CREATE TABLE Products ( 
    product_id INT PRIMARY KEY, 
    name VARCHAR(100), 
    category VARCHAR(50), 
    price DECIMAL(10,2), 
    stock_quantity INT 
); 



 
-- 3. Orders 
-- Stores order details. 
CREATE TABLE Orders ( 
    order_id INT PRIMARY KEY, 
    customer_id INT, 
    order_date DATE, 
    total_amount DECIMAL(10,2), 
    status VARCHAR(20), 
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) 
); 


 
-- 4. Order_Items 
-- Stores each product within an order. 
CREATE TABLE Order_Items ( 
    order_item_id INT PRIMARY KEY, 
    order_id INT, 
    product_id INT, 
    quantity INT, 
    subtotal DECIMAL(10,2), 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id), 
    FOREIGN KEY (product_id) REFERENCES Products(product_id) 
); 




 
-- 5. Payments 
-- Stores payment details. 
CREATE TABLE Payments ( 
    payment_id INT PRIMARY KEY, 
    order_id INT, 
    payment_date DATE, 
    amount DECIMAL(10,2), 
    payment_method VARCHAR(50), 
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) 
); 


 
-- 6. Employees 
-- Stores employee details who process orders. 
CREATE TABLE Employees ( 
employee_id INT PRIMARY KEY, 
name VARCHAR(100), 
department VARCHAR(50), 
salary DECIMAL(10,2), 
manager_id INT, 
FOREIGN KEY (manager_id) REFERENCES Employees(employee_id) 
);