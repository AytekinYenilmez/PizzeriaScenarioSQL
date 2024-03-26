---- Drop 'orders' table
--IF OBJECT_ID('orders', 'U') IS NOT NULL
--    DROP TABLE orders;

---- Drop 'items' table if it exists
--IF OBJECT_ID('items', 'U') IS NOT NULL
--    DROP TABLE items;

---- Drop 'customers' table
--IF OBJECT_ID('customers', 'U') IS NOT NULL
--    DROP TABLE customers;

---- Drop 'addresses' table
--IF OBJECT_ID('addresses', 'U') IS NOT NULL
--    DROP TABLE addresses;

--IF OBJECT_ID('ingredients', 'U') IS NOT NULL
--    DROP TABLE ingredients;

--IF OBJECT_ID('recipes', 'U') IS NOT NULL
--    DROP TABLE recipes;

--IF OBJECT_ID('inventory', 'U') IS NOT NULL
--    DROP TABLE inventory;

--IF OBJECT_ID('staffs', 'U') IS NOT NULL
--    DROP TABLE staffs;

--IF OBJECT_ID('shifts', 'U') IS NOT NULL
--    DROP TABLE shifts;

--IF OBJECT_ID('rota', 'U') IS NOT NULL
--    DROP TABLE rota;

CREATE TABLE orders (
    row_id INT PRIMARY KEY,
    order_id VARCHAR(10),
    created_at DATETIME,
    item_id INT,
    quantity INT,
    cust_firstname VARCHAR(50),
    cust_lastname VARCHAR(50),
    add_id INT,
);

-- Create 'item' table
--DROP TABLE items
CREATE TABLE items (
    item_id INT PRIMARY KEY,
    sku VARCHAR(20),
    item_name VARCHAR(50),
    item_cat VARCHAR(50),
    item_size VARCHAR(20),
    item_price DECIMAL(5,2)
);

-- Create 'customers' table
CREATE TABLE customers (
    cust_id INT PRIMARY KEY,
    cust_firstname VARCHAR(50),
    cust_lastname VARCHAR(50)
);

-- Create 'addresses' table
CREATE TABLE addresses (
    add_id INT PRIMARY KEY,
    delivery BIT,
    delivery_address1 VARCHAR(200),
    delivery_address2 VARCHAR(200),
    delivery_city VARCHAR(50),
    delivery_zipcode VARCHAR(20)
);

CREATE TABLE ingredients(
	ing_id VARCHAR(10) PRIMARY KEY,
	ing_name VARCHAR(200),
	ing_weight INT,
	ing_meas VARCHAR(20),
	ing_price DECIMAL(5,2)
);

CREATE TABLE recipes(
	row_id INT PRIMARY KEY,
	recipe_id VARCHAR(20),
	ing_id VARCHAR(10),
	quantity INT
);

CREATE TABLE inventory(
	inv_id INT PRIMARY KEY,
	item_id VARCHAR(10),
	quantity int
);

CREATE TABLE staffs(
	staff_id VARCHAR(20) PRIMARY KEY,
	first_name VARCHAR(50),
	last_name VARCHAR(50),
	position VARCHAR(100),
	hourly_rate DECIMAL(5,2)
);

CREATE TABLE shifts(
	shift_id VARCHAR(20) PRIMARY KEY,
	day_of_week VARCHAR(10),
	start_time time,
	end_time time
);

CREATE TABLE rota(
	row_id INT PRIMARY KEY,
	rota_id VARCHAR(20),
	rota_date DATETIME,
	shift_id VARCHAR(20),
	staff_id VARCHAR(20)
);

-- Add foreign key constraints
ALTER TABLE orders
ADD CONSTRAINT FK_item FOREIGN KEY (item_id) REFERENCES items(item_id);

ALTER TABLE orders
ADD CONSTRAINT FK_address FOREIGN KEY (add_id) REFERENCES addresses(add_id);

ALTER TABLE rota
ADD CONSTRAINT FK_shift FOREIGN KEY (shift_id) REFERENCES shifts(shift_id);

ALTER TABLE rota
ADD CONSTRAINT FK_staff FOREIGN KEY (staff_id) REFERENCES staffs(staff_id);

ALTER TABLE recipes
ADD CONSTRAINT FK_ing FOREIGN KEY (ing_id) REFERENCES ingredients(ing_id);


--Select *
--From PizzaPlace..staffs