CREATE TABLE stg.customers (
    customer_id VARCHAR(10),
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    state_province VARCHAR(100),
    country VARCHAR(50),
    customer_segment VARCHAR(30),
    registration_date DATE, 
    age_group VARCHAR(10)
);

CREATE TABLE stg.orders (
    order_id VARCHAR(10),
    customer_id VARCHAR(10),
    order_date DATE,
    bs_year INT,
    order_status VARCHAR(20),
    payment_method VARCHAR(20),
    shipping_city VARCHAR(100),
    shipping_country VARCHAR(50),
    discount_pct DECIMAL(10,2)
);

CREATE TABLE stg.order_items (
    order_item_id VARCHAR(12),
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    quantity TINYINT,
    unit_price_at_sale DECIMAL(10,2),
    line_total DECIMAL(12,2)
)

CREATE TABLE stg.products (
    product_id VARCHAR(10),
    product_name VARCHAR(100),
    category VARCHAR(50),
    sub_category VARCHAR(30),
    unit_price DECIMAL(10,2),
    supplier_id VARCHAR(8),
    weight_kg DECIMAL(5,2),
    is_active TINYINT
);

CREATE TABLE stg.suppliers (
    supplier_id VARCHAR(8),
    supplier_name VARCHAR(100),
    country VARCHAR(20),
    contact_email VARCHAR(50),
    contract_start DATE
);

CREATE TABLE stg.reviews (
    review_id VARCHAR(10),
    order_id VARCHAR(10),
    product_id VARCHAR(10),
    review_score TINYINT,
    review_date DATE,
    review_text VARCHAR(500),
    review_length_chars SMALLINT
);