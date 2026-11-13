
-- WEEK 7 ASSIGNMENT: DATABASE DESIGN AND NORMALIZATION


-- =========================================
-- QUESTION 1: ACHIEVING FIRST NORMAL FORM (1NF)
-- =========================================

-- Create a new table where each row contains only one product per order.

CREATE TABLE ProductDetail_1NF (
    OrderID INT,
    CustomerName VARCHAR(100),
    Product VARCHAR(100),
    PRIMARY KEY (OrderID, Product)
);

-- Insert normalized records into the table.

INSERT INTO ProductDetail_1NF (OrderID, CustomerName, Product)
VALUES
(101, 'John Doe', 'Laptop'),
(101, 'John Doe', 'Mouse'),
(102, 'Jane Smith', 'Tablet'),
(102, 'Jane Smith', 'Keyboard'),
(102, 'Jane Smith', 'Mouse'),
(103, 'Emily Clark', 'Phone');


-- =========================================
-- QUESTION 2: ACHIEVING SECOND NORMAL FORM (2NF)
-- =========================================

-- Partial Dependency:
-- CustomerName depends only on OrderID,
-- not on the entire composite key (OrderID, Product).
-- Therefore, CustomerName should be stored in a separate Orders table.


-- Create Orders table to store order information.

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerName VARCHAR(100)
);

-- Create OrderItems table to store products and quantities.

CREATE TABLE OrderItems (
    OrderID INT,
    Product VARCHAR(100),
    Quantity INT,
    PRIMARY KEY (OrderID, Product),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);


-- Insert records into Orders table.

INSERT INTO Orders (OrderID, CustomerName)
VALUES
(101, 'John Doe'),
(102, 'Jane Smith'),
(103, 'Emily Clark');


-- Insert records into OrderItems table.

INSERT INTO OrderItems (OrderID, Product, Quantity)
VALUES
(101, 'Laptop', 2),
(101, 'Mouse', 1),
(102, 'Tablet', 3),
(102, 'Keyboard', 1),
(102, 'Mouse', 2),
(103, 'Phone', 1);
