-- 1. Create a log table
CREATE TABLE audit_log (
    log_id SERIAL PRIMARY KEY,
    table_name VARCHAR(50),
    operation VARCHAR(10),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details TEXT
);

-- 2. Create a function to log changes
CREATE OR REPLACE FUNCTION log_stock_change()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO audit_log (table_name, operation, details)
    VALUES ('inventory', 'UPDATE', 'Product ID ' || NEW.product_id || ' quantity changed to ' || NEW.quantity);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3. Attach it to your inventory
CREATE TRIGGER trg_audit_inventory
AFTER UPDATE ON inventory
FOR EACH ROW
EXECUTE FUNCTION log_stock_change();