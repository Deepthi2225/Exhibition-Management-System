
CREATE DATABASE ems;
USE ems;
  
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    designation VARCHAR(100),    -- e.g., Event Coordinator, HR, Finance, Admin
    department VARCHAR(100),     -- optional, e.g., Management, IT, Sales
    date_joined DATE
);

CREATE TABLE users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,                             
    username VARCHAR(100) NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    phone VARCHAR(20),
    password_hash VARCHAR(255) NOT NULL,
    user_role ENUM('employee', 'artist', 'customer') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id) ON DELETE CASCADE,
    CHECK (
        (user_role = 'employee' AND employee_id IS NOT NULL)
        OR (user_role IN ('artist','customer') AND employee_id IS NULL)
    )
);

CREATE TABLE exhibition (
	exhibition_id INT PRIMARY KEY AUTO_INCREMENT,
    exhibition_name VARCHAR(100) NOT NULL,
	start_date DATETIME NOT NULL,
    end_date DATETIME NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE artist (
	exhibition_id INT NOT NULL,
    artist_id INT ,
    dob DATE,
    nationality VARCHAR(50),
    bio TEXT,
    FOREIGN KEY (artist_id) REFERENCES users(user_id),
    FOREIGN KEY (exhibition_id) REFERENCES exhibition(exhibition_id),
    PRIMARY KEY (exhibition_id,artist_id)
);

-- CREATE TABLE visitor (
-- 	exhibition_id INT NOT NULL,
--     exhibition_date DATE,
--     visitor_id INT,
--     FOREIGN KEY (visitor_id) REFERENCES users(user_id) ON DELETE CASCADE,
--     PRIMARY KEY (exhibition_id,exhibition_date,visitor_id)
-- );

CREATE TABLE exhibition_days (
	exhibition_id INT NOT NULL,
    exhibition_date DATE,
	tickets_available SMALLINT NOT NULL,
    tickets_sold SMALLINT NOT NULL,
    FOREIGN KEY (exhibition_id) REFERENCES exhibition(exhibition_id),
    PRIMARY KEY (exhibition_id,exhibition_date)
);

CREATE TABLE ticket_sales (
    exhibition_id INT NOT NULL,
    exhibition_date DATE,
    ticket_id INT NOT NULL,
    visitor_id INT NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    purchase_date DATETIME NOT NULL,
    payment_method ENUM('card','upi') NOT NULL,
    FOREIGN KEY (exhibition_id, exhibition_date) REFERENCES exhibition_days(exhibition_id,exhibition_date),
    FOREIGN KEY (visitor_id) REFERENCES users(user_id),
    PRIMARY KEY (exhibition_id, exhibition_date,ticket_id)
);

CREATE TABLE registration_fee (
    exhibition_id INT NOT NULL,
    artist_id INT NOT NULL,
    reg_amount DECIMAL(10,2) NOT NULL,
    payment_date DATETIME NOT NULL,
    payment_method ENUM('card','upi') NOT NULL,
    FOREIGN KEY (exhibition_id,artist_id) REFERENCES artist(exhibition_id,artist_id),
    PRIMARY KEY (exhibition_id,artist_id)
);

-- CREATE TABLE payments (
--     payment_id INT PRIMARY KEY AUTO_INCREMENT,
--     visitor_id INT NOT NULL,                 -- who made the payment
-- 	artwork_id INT,                          -- optional: if buying artwork
-- 	exhibition_id INT,                       -- optional: if ticket/registration
--     payment_method ENUM('card','upi') NOT NULL,
--     amount DECIMAL(10,2) NOT NULL,           -- full payment made
--     profit DECIMAL(10,2) GENERATED ALWAYS AS (amount * 0.05) STORED, 
--     purpose ENUM('buying_ticket','buying_artwork','registration_fee') NOT NULL,
--     payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
--     FOREIGN KEY (visitor_id) REFERENCES customer(customer_id),
--     FOREIGN KEY (artwork_id) REFERENCES artworks(artwork_id),
--     FOREIGN KEY (exhibition_id) REFERENCES exhibitions(exhibition_id)
-- );


CREATE TABLE artwork_details (
	artwork_id INT PRIMARY KEY AUTO_INCREMENT,
	exhibition_id INT NOT NULL,
    artist_id INT NOT NULL,
    visitor_id INT ,
    price DECIMAL(10,2) NOT NULL,
    sold ENUM('sold','not_sold')  NOT NULL,
    payment_method ENUM('card','upi') NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (exhibition_id,artist_id) REFERENCES artist(exhibition_id, artist_id),
	FOREIGN KEY (visitor_id) REFERENCES users(user_id)
);
