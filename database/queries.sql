-- ===================================================
-- Query Requirements for Exhibition Management System
-- ===================================================

-- 🔹 CUSTOMER MODULE QUERIES

-- 1. Register new customer
INSERT INTO users (username, first_name, last_name, email, phone, password_hash, user_role) 
VALUES ('cust1', 'Ravi', 'Kumar', 'ravi@example.com', '9876543210', 'hashed_pwd', 'customer');

-- 2. Login validation (check credentials)
SELECT user_id, user_role 
FROM users 
WHERE username = 'cust1' AND password_hash = 'hashed_pwd';

-- 3. Browse upcoming exhibitions
SELECT exhibition_id, exhibition_name, start_date, end_date 
FROM exhibition 
WHERE start_date >= CURDATE();

-- 4. Check tickets availability for an exhibition date
SELECT exhibition_date, tickets_available, tickets_sold 
FROM exhibition_days 
WHERE exhibition_id = 1;

-- 5. Purchase ticket
INSERT INTO ticket_sales (exhibition_id, exhibition_date, ticket_id, visitor_id, price, purchase_date, payment_method) 
VALUES (1, '2025-09-10', 1001, 5, 200.00, NOW(), 'upi');

-- 6. View customer’s purchased tickets
SELECT t.ticket_id, e.exhibition_name, t.exhibition_date, t.price, t.payment_method 
FROM ticket_sales t
JOIN exhibition e ON t.exhibition_id = e.exhibition_id
WHERE t.visitor_id = 5;



-- 🔹 ARTIST MODULE QUERIES

-- 1. Register artist
INSERT INTO users (username, first_name, last_name, email, phone, password_hash, user_role) 
VALUES ('artist1', 'Asha', 'Rao', 'asha@example.com', '9876501234', 'hashed_pwd', 'artist');

-- 2. Add artist details
INSERT INTO artist (exhibition_id, artist_id, dob, nationality, bio) 
VALUES (1, 6, '1995-05-12', 'Indian', 'Modern abstract painter');

-- 3. Pay registration fee
INSERT INTO registration_fee (exhibition_id, artist_id, reg_amount, payment_date, payment_method) 
VALUES (1, 6, 500.00, NOW(), 'card');

-- 4. Add artwork
INSERT INTO artwork_details (exhibition_id, artist_id, price, sold, payment_method) 
VALUES (1, 6, 10000.00, 'not_sold', 'upi');

-- 5. List all artworks by an artist
SELECT artwork_id, price, sold 
FROM artwork_details 
WHERE artist_id = 6;



-- 🔹 ADMINISTRATOR MODULE QUERIES

-- 1. Add employee (pre-configured admin)
INSERT INTO employee (first_name, last_name, designation, department, date_joined) 
VALUES ('Admin', 'User', 'Coordinator', 'Management', CURDATE());

-- 2. Link employee to user account
INSERT INTO users (employee_id, username, first_name, last_name, email, password_hash, user_role) 
VALUES (1, 'admin1', 'Admin', 'User', 'admin@example.com', 'hashed_pwd', 'employee');

-- 3. Create exhibition
INSERT INTO exhibition (exhibition_name, start_date, end_date) 
VALUES ('Art Expo 2025', '2025-09-10', '2025-09-15');

-- 4. Configure exhibition days
INSERT INTO exhibition_days (exhibition_id, exhibition_date, tickets_available, tickets_sold) 
VALUES (1, '2025-09-10', 200, 0);

-- 5. Track tickets sold per exhibition
SELECT e.exhibition_name, SUM(t.price) AS total_ticket_revenue, COUNT(*) AS tickets_sold 
FROM ticket_sales t
JOIN exhibition e ON t.exhibition_id = e.exhibition_id
GROUP BY e.exhibition_id;

-- 6. Track registration fees collected
SELECT e.exhibition_name, SUM(r.reg_amount) AS total_registration_fees 
FROM registration_fee r
JOIN exhibition e ON r.exhibition_id = e.exhibition_id
GROUP BY e.exhibition_id;

-- 7. Track artworks sold & revenue
SELECT e.exhibition_name, COUNT(*) AS artworks_sold, SUM(ad.price) AS total_artwork_revenue 
FROM artwork_details ad
JOIN exhibition e ON ad.exhibition_id = e.exhibition_id
WHERE ad.sold = 'sold'
GROUP BY e.exhibition_id;

-- 8. Profit calculation per exhibition
SELECT e.exhibition_name,
       (SUM(t.price) + SUM(r.reg_amount) + SUM(ad.price * 0.05)) AS profit
FROM exhibition e
LEFT JOIN ticket_sales t ON e.exhibition_id = t.exhibition_id
LEFT JOIN registration_fee r ON e.exhibition_id = r.exhibition_id
LEFT JOIN artwork_details ad ON e.exhibition_id = ad.exhibition_id
GROUP BY e.exhibition_id;



-- 🔹 FRONTEND-DRIVEN QUERIES (for UI features)

-- Search exhibitions by name/date
SELECT * FROM exhibition 
WHERE exhibition_name LIKE '%Art%' OR start_date = '2025-09-10';

-- Filter artworks by artist or exhibition
SELECT * FROM artwork_details 
WHERE artist_id = 6 OR exhibition_id = 1;

-- Show Top 5 artists by artworks sold
SELECT a.artist_id, u.first_name, u.last_name, COUNT(ad.artwork_id) AS sold_count
FROM artwork_details ad
JOIN artist a ON ad.artist_id = a.artist_id
JOIN users u ON a.artist_id = u.user_id
WHERE ad.sold = 'sold'
GROUP BY a.artist_id
ORDER BY sold_count DESC
LIMIT 5;

-- Display best-selling exhibition (highest revenue)
SELECT e.exhibition_name, 
       (SUM(t.price) + SUM(r.reg_amount) + SUM(ad.price)) AS total_revenue
FROM exhibition e
LEFT JOIN ticket_sales t ON e.exhibition_id = t.exhibition_id
LEFT JOIN registration_fee r ON e.exhibition_id = r.exhibition_id
LEFT JOIN artwork_details ad ON e.exhibition_id = ad.exhibition_id AND ad.sold = 'sold'
GROUP BY e.exhibition_id
ORDER BY total_revenue DESC
LIMIT 1;

-- Show ticket availability in real time
SELECT exhibition_date, tickets_available, tickets_sold,
       (tickets_available - tickets_sold) AS tickets_left
FROM exhibition_days
WHERE exhibition_id = 1;

-- Show artist profile with their artworks + sales history
SELECT u.first_name, u.last_name, ad.artwork_id, ad.price, ad.sold, ad.payment_date
FROM users u
JOIN artwork_details ad ON u.user_id = ad.artist_id
WHERE u.user_role = 'artist' AND u.user_id = 6;
                                                                                         