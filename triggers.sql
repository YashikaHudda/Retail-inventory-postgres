-- 1. Create the function that performs the calculation
CREATE OR REPLACE FUNCTION update_inventory_on_sale()
RETURNS TRIGGER AS $$
BEGIN
    -- Subtract the ordered quantity from inventory
    UPDATE inventory
    SET quantity = quantity - NEW.quantity,
        updated_at = CURRENT_TIMESTAMP
    WHERE product_id = NEW.product_id;
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Create the trigger that calls this function automatically
CREATE TRIGGER trg_update_inventory
AFTER INSERT ON order_items
FOR EACH ROW
EXECUTE FUNCTION update_inventory_on_sale();