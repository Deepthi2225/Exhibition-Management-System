-- Sample data
-- Employees
INSERT INTO employee (first_name, last_name, designation, department, date_joined) VALUES
('Aarav', 'Sharma', 'Event Coordinator', 'Management', '2022-01-10'),
('Neha', 'Iyer', 'Finance Manager', 'Finance', '2021-05-20'),
('Vikram', 'Reddy', 'Admin Staff', 'Operations', '2023-03-12');

-- Users
INSERT INTO users (employee_id, username, first_name, last_name, email, phone, password_hash, user_role) VALUES
(1, 'aarav_admin', 'Aarav', 'Sharma', 'aarav@ems.com', '9876543210', 'pw1', 'employee'),
(2, 'neha_admin', 'Neha', 'Iyer', 'neha@ems.com', '9876543211', 'pw2', 'employee'),
(3, 'vikram_admin', 'Vikram', 'Reddy', 'vikram@ems.com', '9876543212', 'pw3', 'employee'),

-- Artists
(NULL, 'rahul_artist', 'Rahul', 'Verma', 'rahul@ems.com', '9000000001', 'pw4', 'artist'),
(NULL, 'sneha_artist', 'Sneha', 'Rao', 'sneha@ems.com', '9000000002', 'pw5', 'artist'),
(NULL, 'amit_artist', 'Amit', 'Patel', 'amit@ems.com', '9000000003', 'pw6', 'artist'),
(NULL, 'lisa_artist', 'Lisa', 'Fernandes', 'lisa@ems.com', '9000000004', 'pw7', 'artist'),

-- Customers
(NULL, 'ananya_customer', 'Ananya', 'Mehta', 'ananya@ems.com', '9000000005', 'pw8', 'customer'),
(NULL, 'rohit_customer', 'Rohit', 'Patil', 'rohit@ems.com', '9000000006', 'pw9', 'customer'),
(NULL, 'mehul_customer', 'Mehul', 'Singh', 'mehul@ems.com', '9000000007', 'pw10', 'customer'),
(NULL, 'sara_customer', 'Sara', 'Khan', 'sara@ems.com', '9000000008', 'pw11', 'customer'),
(NULL, 'arjun_customer', 'Arjun', 'Desai', 'arjun@ems.com', '9000000009', 'pw12', 'customer');

-- Exhibitions
INSERT INTO exhibition (exhibition_name, start_date, end_date) VALUES
('Modern Art Expo', '2025-09-15 10:00:00', '2025-09-20 18:00:00'),
('Sculpture Showcase', '2025-10-01 10:00:00', '2025-10-05 18:00:00'),
('Photography Fiesta', '2025-11-01 10:00:00', '2025-11-07 18:00:00');

-- Artists Registered in Exhibitions
INSERT INTO artist (exhibition_id, artist_id, dob, nationality, bio) VALUES
(1, 4, '1990-05-15', 'Indian', 'Contemporary painter.'),
(1, 5, '1988-03-22', 'Indian', 'Stone sculptor.'),
(2, 6, '1992-07-09', 'Indian', 'Digital illustrator.'),
(3, 7, '1995-08-19', 'Portuguese', 'Photographer of urban life.');

-- Exhibition Days
INSERT INTO exhibition_days (exhibition_id, exhibition_date, tickets_available, tickets_sold) VALUES
(1, '2025-09-15', 100, 20),
(1, '2025-09-16', 100, 35),
(1, '2025-09-17', 100, 40),
(2, '2025-10-01', 80, 10),
(2, '2025-10-02', 80, 25),
(3, '2025-11-01', 120, 50);

-- Ticket Sales
INSERT INTO ticket_sales (exhibition_id, exhibition_date, ticket_id, visitor_id, price, purchase_date, payment_method) VALUES
(1, '2025-09-15', 1, 8, 200.00, '2025-09-10 12:30:00', 'upi'),
(1, '2025-09-15', 2, 9, 200.00, '2025-09-11 10:00:00', 'card'),
(1, '2025-09-16', 3, 10, 200.00, '2025-09-12 14:00:00', 'upi'),
(1, '2025-09-16', 4, 11, 200.00, '2025-09-13 09:30:00', 'card'),
(2, '2025-10-01', 5, 8, 250.00, '2025-09-28 15:20:00', 'upi'),
(3, '2025-11-01', 6, 9, 300.00, '2025-10-29 11:00:00', 'card');

-- Registration Fees
INSERT INTO registration_fee (exhibition_id, artist_id, reg_amount, payment_date, payment_method) VALUES
(1, 4, 500.00, '2025-09-05 11:00:00', 'upi'),
(1, 5, 500.00, '2025-09-06 16:00:00', 'card'),
(2, 6, 600.00, '2025-09-20 10:00:00', 'upi'),
(3, 7, 700.00, '2025-10-15 13:00:00', 'card');

-- Artwork Details
INSERT INTO artwork_details (exhibition_id, artist_id, visitor_id, price, sold, payment_method, payment_date) VALUES
(1, 4, NULL, 10000.00, 'not_sold', 'upi', NULL),
(1, 5, 8, 15000.00, 'sold', 'card', '2025-09-16 15:00:00'),
(2, 6, 9, 8000.00, 'sold', 'upi', '2025-10-02 16:00:00'),
(3, 7, NULL, 12000.00, 'not_sold', 'upi', NULL),
(3, 7, 10, 14000.00, 'sold', 'card', '2025-11-02 14:00:00');

-- to verify
SELECT * FROM employee;
SELECT * FROM users;
SELECT * FROM exhibition;
SELECT * FROM artist;
SELECT * FROM exhibition_days;
SELECT * FROM ticket_sales;
SELECT * FROM registration_fee;
SELECT * FROM artwork_details;

