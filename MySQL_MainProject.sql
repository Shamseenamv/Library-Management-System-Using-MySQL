/* You are going to build a project based on the Library Management System. It
keeps track of all information about books in the library, their cost, status and
total number of books available in the library.
Create a database named library and create following TABLES in the database:
1. Branch
2. Employee
3. Customer
4. IssueStatus
5. ReturnStatus
6. Books
*/

CREATE DATABASE library;
USE library;

/*
Attributes for the tables:
1. Branch
∙ Branch_no - Set as PRIMARY KEY
∙ Manager_Id
∙ Branch_address
∙ Contact_no
*/

CREATE TABLE Branch (
    Branch_no INT PRIMARY KEY,
    Manager_Id INT,
    Branch_address VARCHAR(255),
    Contact_no VARCHAR(15)
);

DESC Branch;

INSERT INTO Branch (Branch_no, Manager_Id, Branch_address, Contact_no) VALUES
(1, 101, 'Trivandrum', '+91 1234567890'),
(2, 102, 'Kochi', '+91 9876543210'),
(3, 103, 'Kozhikode', '+91 8765432109'),
(4, 104, 'Thrissur', '+91 7654321098'),
(5, 105, 'Kollam', '+91 6543210987');

SELECT * FROM Branch;

/*
2. Employee
∙ Emp_Id – Set as PRIMARY KEY
∙ Emp_name
∙ Position
∙ Salary
∙ Branch_no - Set as FOREIGN KEY and it should refer branch_no in
EMPLOYEE table
*/

CREATE TABLE Employee (
    Emp_Id INT PRIMARY KEY,
    Emp_name VARCHAR(255),
    Position VARCHAR(50),
    Salary DECIMAL(10, 2),
    Branch_no INT,
    FOREIGN KEY (Branch_no) REFERENCES Branch(Branch_no)
);

DESC Employee;

INSERT INTO Employee (Emp_Id, Emp_name, Position, Salary, Branch_no) VALUES
(101, 'Arun Kumar', 'Librarian', 50000.00, 1),
(102, 'Anjali Nair', 'Assistant Librarian', 45000.00, 2),
(103, 'Deepak Pillai', 'Clerk', 35000.00, 3),
(104, 'Lakshmi Menon', 'Manager', 60000.00, 4),
(105, 'Rahul Raju', 'Security', 30000.00, 5),
(106, 'Sneha Thomas', 'Cataloguer', 48000.00, 1),
(107, 'Vijay Kumar', 'Janitor', 32000.00, 2),
(108, 'Priya Devi', 'IT Specialist', 55000.00, 3),
(109, 'Sunil Nair', 'Assistant Manager', 52000.00, 4),
(110, 'Meera Chandran', 'Maintenance', 33000.00, 5);

SELECT * FROM Employee;

/*
3. Customer
∙ Customer_Id - Set as PRIMARY KEY
∙ Customer_name
∙ Customer_address
∙ Reg_date
*/

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_name VARCHAR(255),
    Customer_address VARCHAR(255),
    Reg_date DATE
);

DESC Customer;

INSERT INTO Customer (Customer_Id, Customer_name, Customer_address, Reg_date) VALUES
(201, 'Rajesh Kumar', 'Thiruvananthapuram', '2024-01-15'),
(202, 'Deepa Nair', 'Kochi', '2024-01-18'),
(203, 'Vijay Menon', 'Kozhikode', '2024-01-22'),
(204, 'Saranya Pillai', 'Thrissur', '2024-02-01'),
(205, 'Rakesh Nair', 'Kollam', '2024-01-10'),
(206, 'Meena Devi', 'Palakkad', '2023-02-15'),
(207, 'Vinod Kumar', 'Alappuzha', '2023-02-20'),
(208, 'Anjali Chandran', 'Kannur', '2023-05-25'),
(209, 'Santhosh Nair', 'Malappuram', '2023-10-02'),
(210, 'Lakshmi Menon', 'Kottayam', '2021-08-08'),
(211, 'Shilpa KR', 'Palakkad', '2021-05-01');

SELECT * FROM Customer;

/*
4. Books
∙ ISBN - Set as PRIMARY KEY
∙ Book_title
∙ Category
∙ Rental_Price
∙ Status [Give yes if book available and no if book not available] ∙
Author
∙ Publisher
*/

CREATE TABLE Books (
    ISBN INT PRIMARY KEY,
    Book_title VARCHAR(255),
    Category VARCHAR(50),
    Rental_Price DECIMAL(10, 2),
    Status ENUM('yes', 'no'),
    Author VARCHAR(255),
    Publisher VARCHAR(255)
);

DESC Books;

INSERT INTO Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) VALUES
(123456789, 'The Alchemist', 'Fiction', 10.99, 'yes', 'Paulo Coelho', 'HarperCollins'),
(234567890, 'To Kill a Mockingbird', 'Classic', 8.99, 'yes', 'Harper Lee', 'J.B. Lippincott & Co.'),
(345678901, 'Harry Potter and the Sorcerer''s Stone', 'Fantasy', 12.99, 'yes', 'J.K. Rowling', 'Bloomsbury'),
(456789012, '1984', 'Dystopian', 9.99, 'no', 'George Orwell', 'Secker & Warburg'),
(567890123, 'The Ancient India', 'History', 11.99, 'yes', 'F. Scott Fitzgerald', 'Charles Scribner''s Sons'),
(678901234, 'Pride and Prejudice', 'Romance', 10.99, 'yes', 'Jane Austen', 'Thomas Egerton'),
(789012345, 'The Catcher in the Rye', 'Fiction', 9.99, 'no', 'J.D. Salinger', 'Little, Brown and Company'),
(890123456, 'The Hobbit', 'Fantasy', 12.99, 'yes', 'J.R.R. Tolkien', 'Allen & Unwin'),
(901234567, 'One Hundred Years of Solitude', 'Magical Realism', 11.99, 'yes', 'Gabriel García Márquez', 'Harper & Row'),
(1234567890, 'Brave New World', 'Dystopian', 10.99, 'no', 'Aldous Huxley', 'Chatto & Windus');

SELECT * FROM Books;

/*
5. IssueStatus
∙ Issue_Id - Set as PRIMARY KEY
∙ Issued_cust – Set as FOREIGN KEY and it refer customer_id in
CUSTOMER table
∙ Issued_book_name
∙ Issue_date
∙ Isbn_book – Set as FOREIGN KEY and it should refer isbn in
BOOKS table
*/

CREATE TABLE IssueStatus (
    Issue_Id INT PRIMARY KEY,
    Issued_cust INT,
    Issued_book_name VARCHAR(255),
    Issue_date DATE,
    Isbn_book INT,
    FOREIGN KEY (Issued_cust) REFERENCES Customer(Customer_Id),
    FOREIGN KEY (Isbn_book) REFERENCES Books(Isbn)
);

DESC IssueStatus;

INSERT INTO IssueStatus (Issue_Id, Issued_cust, Issued_book_name, Issue_date, Isbn_book) VALUES
(301, 201, 'The Alchemist', '2024-01-20', 123456789),
(302, 202, 'To Kill a Mockingbird', '2024-01-25', 234567890),
(303, 203, 'Harry Potter and the Sorcerer''s Stone', '2024-02-02', 345678901),
(304, 204, '1984', '2024-02-03', 456789012),
(305, 205, 'The Great Gatsby', '2024-02-05', 567890123),
(306, 206, 'Pride and Prejudice', '2024-02-02', 678901234),
(307, 207, 'The Catcher in the Rye', '2023-06-01', 789012345),
(308, 208, 'The Hobbit', '2023-06-08', 890123456),
(309, 209, 'One Hundred Years of Solitude', '2024-02-05', 901234567),
(310, 210, 'Brave New World', '2024-02-04', 1234567890);

SELECT * FROM IssueStatus;

/*
6. ReturnStatus
∙ Return_Id - Set as PRIMARY KEY
∙ Return_cust
∙ Return_book_name
∙ Return_date
∙ Isbn_book2 - Set as FOREIGN KEY and it should refer isbn in
BOOKS table
*/

CREATE TABLE ReturnStatus (
    Return_Id INT PRIMARY KEY,
    Return_cust INT,
    Return_book_name VARCHAR(255),
    Return_date DATE,
    Isbn_book2 INT,
    FOREIGN KEY (Isbn_book2) REFERENCES Books(Isbn)
);

DESC ReturnStatus;

INSERT INTO ReturnStatus (Return_Id, Return_cust, Return_book_name, Return_date, Isbn_book2) VALUES
(401, 201, 'The Alchemist', '2024-02-05', 123456789),
(402, 202, 'To Kill a Mockingbird', '2024-02-10', 234567890),
(403, 203, 'Harry Potter and the Sorcerer''s Stone', '2024-02-15', 345678901),
(404, 204, '1984', '2024-02-17', 456789012),
(405, 205, 'The Great Gatsby', '2024-02-18', 567890123),
(406, 206, 'Pride and Prejudice', '2024-03-20', 678901234),
(407, 207, 'The Catcher in the Rye', '2024-02-10', 789012345),
(408, 208, 'The Hobbit', '2024-02-18', 890123456),
(409, 209, 'One Hundred Years of Solitude', '2024-02-18', 901234567),
(410, 210, 'Brave New World', '2024-02-15', 1234567890);

SELECT * FROM ReturnStatus;

-- Write the queries for the following:

-- 1. Retrieve the book title, category, and rental price of all available books.

SELECT Book_title, Category, Rental_Price FROM Books WHERE Status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.
	  
SELECT Emp_name, Salary FROM Employee ORDER BY Salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT B.Book_title, C.Customer_name FROM Books B JOIN IssueStatus I ON B.ISBN = I.Isbn_book JOIN Customer C ON I.Issued_cust = C.Customer_Id;

-- 4. Display the total count of books in each category.

SELECT Category, COUNT(*) AS BookCount FROM Books GROUP BY Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.
	
SELECT Emp_name, Position FROM Employee WHERE Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet.

SELECT Customer_name FROM Customer WHERE Reg_date < '2022-01-01' AND Customer_Id NOT IN (SELECT Issued_cust FROM IssueStatus);
    
-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no;
    
-- 8. Display the names of customers who have issued books in the month of June 2023.
	
SELECT DISTINCT C.Customer_name FROM Customer C JOIN IssueStatus I ON C.Customer_Id = I.Issued_cust WHERE MONTH(I.Issue_date) = 6 AND YEAR(I.Issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history. 

SELECT Book_title FROM Books WHERE Category LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.
	
SELECT Branch_no, COUNT(*) AS EmployeeCount FROM Employee GROUP BY Branch_no HAVING COUNT(*) > 5;

