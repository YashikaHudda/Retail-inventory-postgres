INSERT INTO categories (name) VALUES 
('Electronics'), ('Clothing'), ('Books'), ('Home & Garden'), ('Sports');

-- Brands  
INSERT INTO brands (name) VALUES 
('Samsung'), ('Nike'), ('Penguin'), ('IKEA'), ('Adidas');

-- Warehouses
INSERT INTO warehouses (name, location) VALUES 
('Main Store', 'Delhi'), ('Branch 1', 'Noida'), ('Online Warehouse', 'Gurgaon');

-- Customers (5 customers)
INSERT INTO customers (first_name, last_name, email, phone) VALUES
('Rahul', 'Sharma', 'rahul@email.com', '9876543210'),
('Priya', 'Singh', 'priya@email.com', '9876543211'),
('Amit', 'Kumar', 'amit@email.com', '9876543212'),
('Neha', 'Gupta', 'neha@email.com', '9876543213'),
('Vikram', 'Patel', 'vikram@email.com', '9876543214');


INSERT INTO products (sku, name, category_id, brand_id, purchase_price, selling_price) VALUES
('TV-SAM-01', 'Samsung 55" OLED TV', (SELECT category_id FROM categories WHERE name='Electronics'), (SELECT brand_id FROM brands WHERE name='Samsung'), 45000, 65000),
('TV-SAM-02', 'Samsung Soundbar', (SELECT category_id FROM categories WHERE name='Electronics'), (SELECT brand_id FROM brands WHERE name='Samsung'), 8000, 12000),
('SH-NK-01', 'Nike Air Max Running', (SELECT category_id FROM categories WHERE name='Clothing'), (SELECT brand_id FROM brands WHERE name='Nike'), 5000, 8500),
('SH-NK-02', 'Nike Sport T-Shirt', (SELECT category_id FROM categories WHERE name='Clothing'), (SELECT brand_id FROM brands WHERE name='Nike'), 700, 1500),
('BK-PG-01', 'Python Basics Guide', (SELECT category_id FROM categories WHERE name='Books'), (SELECT brand_id FROM brands WHERE name='Penguin'), 400, 750),
('BK-PG-02', 'Advanced Data Structures', (SELECT category_id FROM categories WHERE name='Books'), (SELECT brand_id FROM brands WHERE name='Penguin'), 600, 1100),
('CH-IK-01', 'IKEA Wooden Chair', (SELECT category_id FROM categories WHERE name='Home & Garden'), (SELECT brand_id FROM brands WHERE name='IKEA'), 2000, 3500),
('CH-IK-02', 'IKEA Coffee Table', (SELECT category_id FROM categories WHERE name='Home & Garden'), (SELECT brand_id FROM brands WHERE name='IKEA'), 3000, 5000),
('SP-AD-01', 'Adidas Football', (SELECT category_id FROM categories WHERE name='Sports'), (SELECT brand_id FROM brands WHERE name='Adidas'), 1000, 1800),
('SP-AD-02', 'Adidas Gym Bag', (SELECT category_id FROM categories WHERE name='Sports'), (SELECT brand_id FROM brands WHERE name='Adidas'), 800, 1500);

INSERT INTO inventory (product_id, warehouse_id, quantity, reorder_level) VALUES
((SELECT product_id FROM products WHERE sku='TV-SAM-01'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 20, 5),
((SELECT product_id FROM products WHERE sku='TV-SAM-02'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 15, 3),
((SELECT product_id FROM products WHERE sku='SH-NK-01'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 50, 10),
((SELECT product_id FROM products WHERE sku='SH-NK-02'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 100, 20),
((SELECT product_id FROM products WHERE sku='BK-PG-01'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 200, 50),
((SELECT product_id FROM products WHERE sku='BK-PG-02'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 150, 40),
((SELECT product_id FROM products WHERE sku='CH-IK-01'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 30, 10),
((SELECT product_id FROM products WHERE sku='CH-IK-02'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 25, 5),
((SELECT product_id FROM products WHERE sku='SP-AD-01'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 40, 10),
((SELECT product_id FROM products WHERE sku='SP-AD-02'), (SELECT warehouse_id FROM warehouses WHERE name='Main Store'), 60, 15);