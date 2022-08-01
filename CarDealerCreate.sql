-- DROP TABLE IF EXISTS customer CASCADE;
-- CREATE TABLE customer(
--     id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone_number VARCHAR(50)
-- );

-- DROP TABLE IF EXISTS car CASCADE;
-- CREATE TABLE car(
--     id SERIAL PRIMARY KEY,
--     make VARCHAR(50),
--     model VARCHAR(50),
--     year VARCHAR(20),
--     VIN VARCHAR(50),
--     price DECIMAL(10,2),
--     sold varchar(4)
-- );

-- DROP TABLE IF EXISTS salesman CASCADE;
-- CREATE TABLE salesman(
--     id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone_number VARCHAR(50)
-- );

-- DROP TABLE IF EXISTS invoice CASCADE;
-- CREATE TABLE invoice(
--     id SERIAL PRIMARY KEY,
--     customer_id INT,
--     salesman_id INT,
--     car_id INT,
--     date_ TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc',now()),
--     FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE,
--     FOREIGN KEY (salesman_id) REFERENCES salesman(id) ON DELETE CASCADE,
--     FOREIGN KEY (car_id) REFERENCES car(id) ON DELETE CASCADE

-- );

-- -- Ticket Stuff

-- DROP TABLE IF EXISTS mechanic CASCADE;
-- CREATE TABLE mechanic(
--     id SERIAL PRIMARY KEY,
--     first_name VARCHAR(50),
--     last_name VARCHAR(50),
--     email VARCHAR(100),
--     phone_number VARCHAR(50)
-- );

-- DROP TABLE IF EXISTS part CASCADE;
-- CREATE TABLE part(
--     id SERIAL PRIMARY KEY,
--     part VARCHAR(50),
--     price DECIMAL(10,2)
-- );

-- DROP TABLE IF EXISTS inventory CASCADE;
-- CREATE TABLE inventory(
--     inventory_id SERIAL PRIMARY KEY,
--     part_id INT,
--     FOREIGN KEY (part_id) REFERENCES part(id) ON DELETE CASCADE
-- );

-- DROP TABLE IF EXISTS ticket CASCADE;
-- CREATE TABLE ticket(
--     id SERIAL PRIMARY KEY,
--     customer_id INT,
--     descrip text,
--     VIN VARCHAR(50),
--     date_ TIMESTAMP WITH TIME ZONE DEFAULT timezone('utc',now()),
--     FOREIGN KEY (customer_id) REFERENCES customer(id) ON DELETE CASCADE
-- );

-- DROP TABLE IF EXISTS ticket_part CASCADE;
-- CREATE TABLE ticket_part(
--     ticket_id INT,
--     part_id INT,
--     mechanic_id INT,
--     FOREIGN KEY (ticket_id) REFERENCES ticket(id) ON DELETE CASCADE,
--     FOREIGN KEY (mechanic_id) REFERENCES mechanic(id) ON DELETE CASCADE,
--     FOREIGN KEY (part_id) REFERENCES part(id) ON DELETE CASCADE
-- );

-- DROP TABLE IF EXISTS ticket_mechanic CASCADE;
-- CREATE TABLE ticket_mechanic(
--     ticket_id INT,
--     mechanic_id INT,
--     FOREIGN KEY (ticket_id) REFERENCES ticket(id) ON DELETE CASCADE,
--     FOREIGN KEY (mechanic_id) REFERENCES mechanic(id) ON DELETE CASCADE
-- );

