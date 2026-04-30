-- Test basic inserts
INSERT INTO categories (name) VALUES ('Electronics');
INSERT INTO brands (name) VALUES ('Samsung');
INSERT INTO products (sku, name, category_id, brand_id, purchase_price, selling_price) 
VALUES ('SAM-TV01', 'Samsung Smart TV', 1, 1, 25000.00, 35000.00);

SELECT * FROM products;