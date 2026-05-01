CREATE TABLE rw.customers (
    customer_id VARCHAR(15),
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(100),
    country VARCHAR(50),
    customer_segment VARCHAR(30),
    registration_date VARCHAR(50), 
    age_group VARCHAR(10)
);

CREATE TABLE rw.orders (
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date VARCHAR(50),
    bs_year VARCHAR(10),
    order_status VARCHAR(20),
    payment_method VARCHAR(20),
    shipping_city VARCHAR(100),
    shipping_country VARCHAR(50),
    discount_pct VARCHAR(20)
);

CREATE TABLE rw.order_items (
    order_item_id VARCHAR(12),
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity VARCHAR(5),
    unit_price_at_sale VARCHAR(20),
    line_total VARCHAR(20)
)

CREATE TABLE rw.products (
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(30),
    unit_price VARCHAR(20),
    supplier_id VARCHAR(8),
    weight_kg VARCHAR(20),
    is_active VARCHAR(5)
);

CREATE TABLE rw.suppliers (
    supplier_id VARCHAR(8),
    supplier_name VARCHAR(100),
    country VARCHAR(20),
    contact_email VARCHAR(50),
    contract_start VARCHAR(50)
);

CREATE TABLE rw.reviews (
    review_id VARCHAR(10),
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    review_score VARCHAR(5),
    review_date VARCHAR(50),
    review_text VARCHAR(MAX),
    review_length_chars VARCHAR(10)
);

ALTER TABLE rw.customers
ALTER COLUMN age_group VARCHAR(10);
ALTER TABLE rw.customers 
ALTER COLUMN customer_id VARCHAR(15);