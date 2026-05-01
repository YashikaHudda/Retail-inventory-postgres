-- Key indexes for fast queries
CREATE INDEX idx_products_sku ON products(sku);
CREATE INDEX idx_inventory_product_warehouse ON inventory(product_id, warehouse_id);
CREATE INDEX idx_sales_orders_date ON sales_orders(order_date);
CREATE INDEX idx_sales_orders_customer ON sales_orders(customer_id);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_stock_movements_product_date ON stock_movements(product_id, movement_date);

CREATE INDEX idx_order_items_product_id ON order_items(product_id);
CREATE INDEX idx_sales_orders_status ON sales_orders(status);
CREATE INDEX idx_inventory_warehouse_id ON inventory(warehouse_id);
CREATE INDEX idx_products_category ON products(category_id);