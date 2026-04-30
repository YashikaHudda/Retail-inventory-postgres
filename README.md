# Retail Inventory & Sales Management System

A comprehensive PostgreSQL database system for managing retail operations, including inventory tracking, product management, customer orders, and payment processing.

## Overview

This project provides a complete database schema for a retail business that operates across multiple warehouses and manages inventory, sales orders, and customer relationships. It's built with PostgreSQL and includes sample data for testing and demonstration purposes.

## Features

- **Product Management**: Track products across multiple categories and brands
- **Multi-Warehouse Inventory**: Manage stock levels across different warehouse locations
- **Customer Management**: Maintain customer information and purchase history
- **Sales Orders**: Create and track customer orders with items and payments
- **Supplier Management**: Keep supplier contact information and relationships
- **Performance Optimized**: Includes indexes for fast query execution
- **Data Integrity**: Built-in constraints and relationships to maintain data quality

## Project Structure

```
├── schema.sql          # Database schema with 10 core tables
├── seed.sql            # Sample data for testing and development
├── indexes.sql         # Performance indexes for common queries
├── test-queries.sql    # Example queries for testing the system
└── README.md           # This file
```

## Database Schema

### Core Tables

1. **Categories** - Product categories (Electronics, Clothing, Books, etc.)
2. **Brands** - Product brands and manufacturers
3. **Suppliers** - Supplier contact information
4. **Products** - Product details with pricing and relationships
5. **Warehouses** - Physical warehouse locations
6. **Inventory** - Stock levels by product and warehouse
7. **Customers** - Customer contact and account information
8. **Sales Orders** - Customer orders with status tracking
9. **Order Items** - Individual items within each order
10. **Payments** - Payment records for orders

### Key Relationships

- Products belong to Categories and are provided by Brands
- Inventory links Products to Warehouses
- Sales Orders contain Order Items referencing Products
- Payments are recorded for each Sales Order

## Getting Started

### Prerequisites

- PostgreSQL 12 or higher
- psql command-line client (optional, for direct SQL execution)

### Setup Instructions

1. **Create Database**
   ```sql
   CREATE DATABASE retail_inventory;
   ```

2. **Run Schema**
   ```bash
   psql -d retail_inventory -f schema.sql
   ```

3. **Load Sample Data**
   ```bash
   psql -d retail_inventory -f seed.sql
   ```

4. **Create Indexes**
   ```bash
   psql -d retail_inventory -f indexes.sql
   ```

5. **Test the Setup**
   ```bash
   psql -d retail_inventory -f test-queries.sql
   ```

## Sample Data

The `seed.sql` file includes:
- 5 product categories
- 5 brands
- 3 warehouses (Main Store, Branch 1, Online Warehouse)
- 5 sample customers
- 10 products with varying prices and stock levels
- Inventory data across warehouses

All sample data uses Indian context with locations in Delhi, Noida, and Gurgaon.

## Query Examples

### Find All Products in a Category
```sql
SELECT p.name, p.selling_price, c.name as category
FROM products p
JOIN categories c ON p.category_id = c.category_id
WHERE c.name = 'Electronics';
```

### Check Inventory Levels
```sql
SELECT p.name, i.quantity, i.reorder_level, w.name as warehouse
FROM inventory i
JOIN products p ON i.product_id = p.product_id
JOIN warehouses w ON i.warehouse_id = w.warehouse_id
ORDER BY i.quantity ASC;
```

### Get Sales by Customer
```sql
SELECT c.first_name, c.last_name, COUNT(o.order_id) as total_orders, SUM(o.total_amount) as total_spent
FROM customers c
LEFT JOIN sales_orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name;
```

## Data Validation

The schema includes several constraints:
- **Positive Prices**: Purchase and selling prices must be greater than 0
- **Valid Quantities**: Inventory quantities cannot be negative
- **Order Status**: Limited to 'pending', 'shipped', 'delivered', 'cancelled'
- **Unique Values**: SKUs, product names, warehouse names, emails are unique

## Performance Considerations

Indexes are created on:
- Product SKU (fast product lookup)
- Inventory product/warehouse combinations
- Sales order dates and customers
- Order items by order ID

These indexes optimize common query patterns without consuming excessive storage.

## Use Cases

This database system is ideal for:
- Single or multi-location retail stores
- E-commerce inventory management
- Warehouse management systems
- Sales analytics and reporting
- Customer relationship management

## Future Enhancements

Potential additions to consider:
- Return/refund management
- Stock movement history tracking
- Supplier purchase orders
- Product reviews and ratings
- Discount and promotion management
- User authentication and access control

## License

This project is available for educational and commercial use.

## Support

For questions or issues with the database schema, refer to the test-queries.sql file for example implementations.