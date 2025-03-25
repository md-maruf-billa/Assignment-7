-- Active: 1742886663944@@127.0.0.1@5432@bookstore_db@public

-- Creating a new books table
CREATE TABLE books (
    id SERIAL PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    author VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) CHECK (price >= 0) NOT NULL,
    stock INT CHECK (stock >= 0) NOT NULL,
    published_year INT  NOT NULL
);


-- create new customer table
CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(200) NOT NULL,
    email VARCHAR(200) UNIQUE NOT NULL,
    joined_date DATE DEFAULT CURRENT_DATE NOT NULL
);

-- create new order table
CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    book_id INT NOT NULL,
    quantity INT CHECK (quantity > 0) NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES books(id) ON DELETE CASCADE
);



-- Insert book data into books table
INSERT INTO books (title, author, price, stock, published_year) VALUES
('The Pragmatic Programmer', 'Andrew Hunt', 40.00, 10, 1999),
('Clean Code', 'Robert C. Martin', 35.00, 5, 2008),
('You Don''t Know JS', 'Kyle Simpson', 30.00, 8, 2014),
('Refactoring', 'Martin Fowler', 50.00, 3, 1999),
('Database Design Principles', 'Jane Smith', 20.00, 0, 2018),
('Design Patterns', 'Erich Gamma', 45.00, 7, 1994),
('Eloquent JavaScript', 'Marijn Haverbeke', 25.00, 12, 2018),
('JavaScript: The Good Parts', 'Douglas Crockford', 28.00, 6, 2008),
('Python Crash Course', 'Eric Matthes', 32.00, 9, 2019),
('Automate the Boring Stuff with Python', 'Al Sweigart', 27.00, 15, 2015),
('The Mythical Man-Month', 'Frederick P. Brooks Jr.', 38.00, 4, 1975),
('Introduction to Algorithms', 'Thomas H. Cormen', 60.00, 2, 2009),
('Code: The Hidden Language of Computer Hardware and Software', 'Charles Petzold', 33.00, 10, 2000),
('The Art of Computer Programming', 'Donald Knuth', 75.00, 1, 1968),
('Soft Skills: The Software Developer''s Life Manual', 'John Sonmez', 29.00, 11, 2014),
('Cracking the Coding Interview', 'Gayle Laakmann McDowell', 45.00, 6, 2015),
('Computer Networking: A Top-Down Approach', 'James F. Kurose', 55.00, 5, 2020),
('The Phoenix Project', 'Gene Kim', 37.00, 8, 2013),
('Site Reliability Engineering', 'Niall Richard Murphy', 48.00, 4, 2016),
('Deep Learning', 'Ian Goodfellow', 65.00, 3, 2016);


--  Insert customer data into customer table
INSERT INTO customers (name, email) VALUES
('John Doe', 'john.doe@example.com'),
('Jane Smith', 'jane.smith@example.com'),
('Michael Johnson', 'michael.johnson@example.com'),
('Emily Davis', 'emily.davis@example.com'),
('David Wilson', 'david.wilson@example.com'),
('Sarah Brown', 'sarah.brown@example.com'),
('James Anderson', 'james.anderson@example.com'),
('Linda Martinez', 'linda.martinez@example.com'),
('Robert Thomas', 'robert.thomas@example.com'),
('Jessica White', 'jessica.white@example.com');


-- insert order info into orders table
INSERT INTO orders (customer_id, book_id, quantity) VALUES
(1, 3, 2),
(2, 5, 1),
(3, 1, 3),
(4, 2, 2),
(5, 4, 1);



-- Problem-1
SELECT * FROM books
    WHERE stock =0;

--Problem-2
SELECT * FROM books
      ORDER BY price desc
      LIMIT 1;

--Problem-3
SELECT customers.name , count(orders.id) as total_orders FROM customers
JOIN orders on customers.id = orders.customer_id
GROUP BY customers.id;

--Problem-4
SELECT sum(books.price * orders.quantity) as total_revenue from orders
JOIN books on books.id = orders.book_id;

--Problem-5
SELECT customers.name , count(orders.id) as orders_count FROM customers
      join orders on customers.id = orders.customer_id
      GROUP BY customers.id
      HAVING count(orders.id) >1;

--Problem-6
SELECT round(avg(price) ,2) as avg_book_price from books ;

--Problem-7
update books
      set price = price*1.10
      WHERE  published_year < 2000;



--Problem-8
DELETE FROM customers
      WHERE id not in (SELECT DISTINCT customer_id from orders)

