-- Create the database
CREATE DATABASE products_db;
USE products_db;

-- Create the categories table
CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Create the products table
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    contact_name VARCHAR(50),
    phone VARCHAR(20),
    address VARCHAR(255),
    email VARCHAR(50)
);

-- Create the orders table
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    product_id INT,
    quantity INT NOT NULL,
    supplier_id INT,
    FOREIGN KEY (product_id) REFERENCES products(id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id)
);

-- Insert initial data into the categories table
INSERT INTO categories (name) VALUES ('Fruits'), ('Vegetables'), ('Dairy'), ('Meat');

-- Insert initial data into the products table
INSERT INTO products (name, description, price, category_id) VALUES
    ('Apple', 'Fresh red apples', 3.00, 1),
    ('Banana', 'Ripe yellow bananas', 1.50, 1),
    ('Orange', 'Juicy oranges', 2.50, 1),
    ('Broccoli', 'Fresh broccoli heads', 2.00, 2),
    ('Carrot', 'Orange carrots', 1.00, 2),
    ('Tomato', 'Red tomatoes', 2.20, 2),
    ('Milk', 'Whole milk, 1 liter', 1.20, 3),
    ('Cheese', 'Cheddar cheese, 200g', 4.00, 3),
    ('Butter', 'Unsalted butter, 200g', 2.50, 3),
    ('Chicken Breast', 'Boneless chicken breast, 1kg', 8.00, 4),
    ('Beef Steak', 'Ribeye steak, 1kg', 15.00, 4),
    ('Pork Chops', 'Boneless pork chops, 1kg', 10.00, 4),
    ('Strawberry', 'Fresh strawberries, 500g', 4.00, 1),
    ('Lettuce', 'Green leaf lettuce', 1.50, 2),
    ('Yogurt', 'Greek yogurt, 500g', 3.00, 3),
    ('Ground Beef', 'Lean ground beef, 1kg', 12.00, 4),
    ('Lamb Chops', 'Lamb chops, 1kg', 18.00, 4),
    ('Peach', 'Fresh peaches', 3.50, 1),
    ('Spinach', 'Fresh spinach leaves', 2.00, 2),
    ('Cabbage', 'Green cabbage', 1.00, 2),
    ('Cream', 'Heavy cream, 250ml', 1.80, 3),
    ('Bacon', 'Smoked bacon, 200g', 5.00, 4),
    ('Kiwi', 'Fresh kiwis', 2.50, 1),
    ('Cauliflower', 'Fresh cauliflower', 2.00, 2),
    ('Blueberries', 'Fresh blueberries, 500g', 5.00, 1),
    ('Eggplant', 'Fresh eggplants', 1.50, 2),
    ('Cucumber', 'Fresh cucumbers', 1.20, 2),
    ('Mozzarella', 'Mozzarella cheese, 200g', 3.50, 3),
    ('Turkey Breast', 'Boneless turkey breast, 1kg', 9.00, 4),
    ('Grapes', 'Fresh green grapes, 500g', 3.00, 1),
    ('Pineapple', 'Fresh pineapple', 3.50, 1),
    ('Mango', 'Fresh mango', 2.50, 1),
    ('Onion', 'Yellow onions', 0.80, 2),
    ('Garlic', 'Fresh garlic', 1.50, 2),
    ('Potato', 'Fresh potatoes', 0.50, 2),
    ('Sour Cream', 'Sour cream, 500g', 2.00, 3),
    ('Ice Cream', 'Vanilla ice cream, 1 liter', 5.00, 3),
    ('Sausage', 'Smoked sausage, 500g', 6.00, 4),
    ('Salmon', 'Fresh salmon fillet, 1kg', 20.00, 4),
    ('Pork Belly', 'Fresh pork belly, 1kg', 12.00, 4),
    ('Avocado', 'Fresh avocado', 1.50, 1),
    ('Watermelon', 'Fresh watermelon', 7.00, 1),
    ('Cherry', 'Fresh cherries, 500g', 6.00, 1),
    ('Bell Pepper', 'Red bell peppers', 2.00, 2),
    ('Zucchini', 'Fresh zucchini', 1.50, 2),
    ('Radish', 'Fresh radishes', 1.00, 2),
    ('Whipped Cream', 'Whipped cream, 250ml', 2.00, 3),
    ('Cottage Cheese', 'Cottage cheese, 500g', 2.50, 3),
    ('Ham', 'Smoked ham, 500g', 7.00, 4),
    ('Duck Breast', 'Boneless duck breast, 1kg', 18.00, 4),
    ('Pomegranate', 'Fresh pomegranate', 3.00, 1),
    ('Pear', 'Fresh pears', 2.00, 1),
    ('Blackberry', 'Fresh blackberries, 500g', 5.00, 1),
    ('Asparagus', 'Fresh asparagus', 3.00, 2),
    ('Mushroom', 'Fresh mushrooms', 2.00, 2),
    ('Brussels Sprouts', 'Fresh Brussels sprouts', 3.00, 2),
    ('Parmesan', 'Parmesan cheese, 200g', 5.00, 3),
    ('Ricotta', 'Ricotta cheese, 500g', 4.00, 3),
    ('Chorizo', 'Spicy chorizo sausage, 500g', 8.00, 4),
    ('Veal Cutlets', 'Veal cutlets, 1kg', 20.00, 4);

-- Insert initial data into the suppliers table
INSERT INTO suppliers (name, contact_name, phone, address, email) VALUES
	('Fresh Farms', 'Ivan Ivanov', '375(29)1234567', '12 Fruit Street, Minsk, Belarus', 'ivanov.ivan@emailprovider.com'),
    ('Organic Foods', 'Peter Petrov', '375(29)7654321', '25 Greenery Avenue, Grodno, Belarus', 'petrov.peter@emailprovider.com'),
    ('Dairy Pure', 'Mary Krambrery', '375(29)5555555', '8 Milk Lane, Brest, Belarus', 'mary.krambrery@emailprovider.com'),
    ('Meat Masters', 'John Snow', '375(29)1010101', '6 Butcher`s Way, Mogilev, Belarus', 'john.snow@emailprovider.com');

-- Insert initial data into the orders table
INSERT INTO orders (order_date, product_id, quantity, supplier_id) VALUES
    ('2024-01-01', 1, 100, 1),
    ('2024-01-02', 2, 150, 1),
    ('2024-01-03', 3, 200, 2),
    ('2024-01-04', 4, 250, 2),
    ('2024-01-05', 5, 300, 3),
    ('2024-01-06', 6, 350, 3),
    ('2024-01-07', 7, 400, 4),
    ('2024-01-08', 8, 450, 4);