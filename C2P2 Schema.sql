CREATE DATABASE DWDM; 
USE DWDM;


CREATE TABLE Dim_Date (
    Date_ID INT PRIMARY KEY AUTO_INCREMENT,
    Date DATE NOT NULL,
    Month INT NOT NULL,
    Quarter INT NOT NULL,
    Year INT NOT NULL,
    Day_of_Week VARCHAR(10) NOT NULL
);


CREATE TABLE Dim_Category (
    Category_ID INT PRIMARY KEY AUTO_INCREMENT,
    Category_Name VARCHAR(100) NOT NULL
);

CREATE TABLE Dim_Supplier (
    Supplier_ID INT PRIMARY KEY AUTO_INCREMENT,
    Supplier_Name VARCHAR(100) NOT NULL,
    Contact_Info VARCHAR(255) NOT NULL
);


CREATE TABLE Dim_Product (
    Product_ID INT PRIMARY KEY AUTO_INCREMENT,
    Product_Name VARCHAR(100) NOT NULL,
    Category_ID INT,
	Supplier_ID INT,
    Unit_Cost DECIMAL(10, 2) NOT NULL,
    Reorder_Level INT NOT NULL,
    FOREIGN KEY (Supplier_ID) REFERENCES Dim_Supplier(Supplier_ID),
    FOREIGN KEY (Category_ID) REFERENCES Dim_Category(Category_ID)
);




CREATE TABLE Dim_Warehouse (
    Warehouse_ID INT PRIMARY KEY AUTO_INCREMENT,
    Warehouse_Name VARCHAR(100) NOT NULL,
    Address VARCHAR(255) NOT NULL
);



CREATE TABLE Dim_Location (
    Location_ID INT PRIMARY KEY AUTO_INCREMENT,
    Location_Name VARCHAR(100) NOT NULL,
    Warehouse_ID INT,
    FOREIGN KEY (Warehouse_ID) REFERENCES Dim_Warehouse(Warehouse_ID)
);


CREATE TABLE Dim_Employee (
    Employee_ID INT PRIMARY KEY AUTO_INCREMENT,
    Employee_Name VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    Hire_Date DATE,
    Contact_Info VARCHAR(255)
);


CREATE TABLE Fact_Production_Inventory (
    Record_ID INT PRIMARY KEY AUTO_INCREMENT,
    Date_ID INT,
    Product_ID INT,
    Location_ID INT,
    Employee_ID INT, 
    Quantity_Produced INT,
    Quantity_In_Stock INT,
    Quantity_On_Order INT,
    Cost DECIMAL(10, 2),
    FOREIGN KEY (Date_ID) REFERENCES Dim_Date(Date_ID),
    FOREIGN KEY (Product_ID) REFERENCES Dim_Product(Product_ID),
    FOREIGN KEY (Location_ID) REFERENCES Dim_Location(Location_ID),
    FOREIGN KEY (Employee_ID) REFERENCES Dim_Employee(Employee_ID) 
);





INSERT INTO Dim_Date (Date, Month, Quarter, Year, Day_of_Week) VALUES
('2024-01-01', 1, 1, 2023, 'Sunday'),
('2024-01-02', 1, 1, 2023, 'Monday'),
('2024-01-03', 1, 1, 2023, 'Tuesday'),
('2024-01-04', 1, 1, 2023, 'Wednesday'),
('2024-01-05', 1, 1, 2023, 'Thursday'),
('2024-01-06', 1, 1, 2023, 'Friday'),
('2024-01-07', 1, 1, 2023, 'Saturday'),
('2024-02-01', 2, 1, 2023, 'Wednesday'),
('2024-02-02', 2, 1, 2023, 'Thursday'),
('2024-02-03', 2, 1, 2023, 'Friday');



INSERT INTO Dim_Category (Category_Name) VALUES
('Seating'),
('Tables'),
('Storage'),
('Beds'),
('Office Furniture'),
('Outdoor Furniture'),
('Decor'),
('Lighting'),
('Accessories'),
('Children\'s Furniture');


INSERT INTO Dim_Supplier (Supplier_Name, Contact_Info) VALUES
('Aayush Gattani', 'aayush@gmail.com'),
('Vikram Mhaske', 'vikram@gmail.com'),
('Aryan Giri', 'aryang@gmail.com'),
('Soham Dachawar', 'soham@gmail.com'),
('Harsh Mohite', 'harsh@gmail.com'),
('Aryan Nimbalkar', 'aryann@gmail.com'),
('Vedant Manvelikar', 'aryan@gmail.com'),
('Jayesh Dangi', 'jayesh@gmail.com'),
('Dhairya Parekh', 'dhairya@gmail.com'),
('Sohail Shaikh', 'sohail@gmail.com');



INSERT INTO Dim_Product (Product_Name, Category_ID, Supplier_ID, Unit_Cost, Reorder_Level) VALUES
('Armchair', 1, 1, 199.99, 20),
('Dining Table', 2, 2, 499.99, 15),
('Bookshelf', 3, 3, 149.99, 10),
('Queen Bed', 4, 4, 799.99, 8),
('Office Desk', 5, 5, 299.99, 12),
('Garden Chair', 6, 6, 89.99, 25),
('Wall Decor', 7, 7, 29.99, 50),
('Floor Lamp', 8, 8, 59.99, 30),
('Coffee Table', 2, 9, 199.99, 10),
('Toy Storage Box', 10, 10, 89.99, 5);



INSERT INTO Dim_Warehouse (Warehouse_Name, Address) VALUES
('Main Warehouse', 'Pune, Maharashtra, India'),
('Secondary Warehouse', 'Bikaner, Rajasthan, India'),
('Outlet Warehouse', 'Pune, Maharashtra, India');



INSERT INTO Dim_Location (Location_Name, Warehouse_ID) VALUES
('Warehouse A', 1),
('Warehouse B', 1),
('Warehouse C', 2),
('Warehouse D', 2),
('Warehouse E', 3),
('Warehouse F', 3),
('Warehouse G', 1),
('Warehouse H', 1),
('Warehouse I', 2),
('Warehouse J', 3);


INSERT INTO Dim_Employee (Employee_Name, Position, Hire_Date, Contact_Info) VALUES
('Employee 1', 'Production Manager', '2020-01-15', 'e1@company.com'),
('Employee 2', 'Carpenter', '2019-05-20', 'e2@company.com'),
('Employee 3', 'Assembler', '2021-03-10', 'e3@company.com'),
('Employee 4', 'Quality Control', '2018-11-30', 'e4@company.com'),
('Employee 5', 'Logistics Coordinator', '2022-07-01', 'e5@company.com'),
('Employee 6', 'Machinist', '2020-06-15', 'e6@company.com'),
('Employee 7', 'Warehouse Staff', '2021-09-22', 'e7@company.com'),
('Employee 8', 'Designer', '2019-12-05', 'e8@company.com'),
('Employee 9', 'Sales Representative', '2023-01-10', 'e9@company.com'),
('Employee 10', 'Customer Service', '2020-08-12', 'e10@company.com');

INSERT INTO Fact_Production_Inventory (Date_ID, Product_ID, Location_ID, Employee_ID, Quantity_Produced, Quantity_In_Stock, Quantity_On_Order, Cost) VALUES
(1, 1, 1, 1, 50, 20, 5, 19999),
(2, 2, 2, 2, 30, 15, 3, 49999),
(3, 3, 3, 3, 20, 10, 2, 14999),
(4, 4, 4, 4, 25, 8, 1, 79999),
(5, 5, 5, 5, 40, 12, 4, 29999),
(6, 6, 6, 6, 35, 25, 6, 8999),
(7, 7, 7, 7, 60, 50, 10, 2999),
(8, 8, 8, 8, 45, 30, 8, 5999),
(9, 9, 9, 9, 55, 10, 3, 19999),
(10, 10, 10, 10, 70, 5, 2, 8999);

