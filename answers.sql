-- Create Database
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

-- Authors Table
CREATE TABLE Authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    bio TEXT
);

-- Books Table
CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    isbn VARCHAR(20) UNIQUE NOT NULL,
    published_year YEAR,
    genre VARCHAR(50),
    copies_available INT NOT NULL DEFAULT 0
);

-- BookAuthors Table (Many-to-Many between Books and Authors)
CREATE TABLE BookAuthors (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id) ON DELETE CASCADE
);

-- Members Table
CREATE TABLE Members (
    member_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    joined_date DATE DEFAULT CURRENT_DATE
);

-- Borrowings Table (Many-to-Many between Members and Books)
CREATE TABLE Borrowings (
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,
    member_id INT,
    book_id INT,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (member_id) REFERENCES Members(member_id) ON DELETE CASCADE,
    FOREIGN KEY (book_id) REFERENCES Books(book_id) ON DELETE CASCADE
);

-- Sample Data Insertion

-- Authors
INSERT INTO Authors (name, bio) VALUES
('George Orwell', 'English novelist, essayist, and critic'),
('J.K. Rowling', 'British author best known for the Harry Potter series'),
('Chinua Achebe', 'Nigerian novelist and author of Things Fall Apart');

-- Books
INSERT INTO Books (title, isbn, published_year, genre, copies_available) VALUES
('1984', '9780451524935', 1949, 'Dystopian', 5),
('Harry Potter and the Sorcerer''s Stone', '9780439708180', 1997, 'Fantasy', 8),
('Things Fall Apart', '9780385474542', 1958, 'Fiction', 4);

-- BookAuthors
INSERT INTO BookAuthors (book_id, author_id) VALUES
(1, 1),
(2, 2),
(3, 3);

-- Members
INSERT INTO Members (name, email, phone) VALUES
('Alice Mwangi', 'alicemwangi@gmail.com', '0712345678'),
('Brian Otieno', 'otienobrian@gmail.com', '0798765432');

-- Borrowings
INSERT INTO Borrowings (member_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2025-04-20', '2025-04-27'),
(2, 2, '2025-04-25', NULL),
(1, 3, '2025-05-01', NULL);

