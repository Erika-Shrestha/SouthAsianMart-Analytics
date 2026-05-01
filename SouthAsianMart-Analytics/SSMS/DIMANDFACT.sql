CREATE TABLE dim.customers(
    customer_key INT IDENTITY(1,1) PRIMARY KEY,
    customer_id VARCHAR(15) NOT NULL UNIQUE,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    city VARCHAR(50) NOT NULL,
    state_province VARCHAR(100) NOT NULL,
    country VARCHAR(50) NOT NULL,
    customer_segment VARCHAR(30) NOT NULL,
    registration_date DATE NOT NULL,
    age_group VARCHAR(10)
);

CREATE TABLE dim.products(
    product_key INT IDENTITY(1,1) PRIMARY KEY,
    product_id VARCHAR(10) NOT NULL UNIQUE,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    sub_category VARCHAR(30) NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    supplier_id VARCHAR(8) NOT NULL,
    weight_kg DECIMAL(5,2) NOT NULL,
    is_active TINYINT NOT NULL
);

CREATE TABLE dim.suppliers(
    supplier_key INT IDENTITY(1,1) PRIMARY KEY,
    supplier_id VARCHAR(8) NOT NULL UNIQUE,
    supplier_name VARCHAR(100) NOT NULL,
    country VARCHAR(20) NOT NULL,
    contact_email VARCHAR(50) NOT NULL,
    contract_start DATE NOT NULL
);

CREATE TABLE dim.dates(
    date_id INT PRIMARY KEY,
    full_date DATE NOT NULL,
    day_of_week VARCHAR(15) NOT NULL,
    day_number INT NOT NULL,
    month_number INT NOT NULL,
    month_name VARCHAR(15) NOT NULL,
    quarter INT NOT NULL,
    year INT NOT NULL,
    is_weekend BIT NOT NULL,
    is_np_holiday BIT NOT NULL
);

CREATE TABLE dim.order_details(
    order_details_key INT IDENTITY(1,1) PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL UNIQUE,
    order_status VARCHAR(20) NOT NULL,
    payment_method VARCHAR(20) NOT NULL,
    shipping_city VARCHAR(100) NOT NULL,
    shipping_country VARCHAR(50) NOT NULL
);

CREATE TABLE fact.order_items(
    order_item_id VARCHAR(12) PRIMARY KEY,
    customer_key INT NOT NULL,
    product_key INT NOT NULL,
    supplier_key INT NOT NULL,
    order_details_key INT NOT NULL,
    date_id INT NOT NULL,
    discount_pct DECIMAL(10,2),
    quantity TINYINT NOT NULL,
    unit_price_at_sale DECIMAL(10,2) NOT NULL,
    line_total DECIMAL(12,2) NOT NULL,
    review_score TINYINT,
    review_length_chars SMALLINT,
    CONSTRAINT FK_fact_customer FOREIGN KEY(customer_key) REFERENCES dim.customers(customer_key),
    CONSTRAINT FK_fact_product FOREIGN KEY(product_key) REFERENCES dim.products(product_key),
    CONSTRAINT FK_fact_supplier FOREIGN KEY(supplier_key) REFERENCES dim.suppliers(supplier_key),
    CONSTRAINT FK_fact_order_details FOREIGN KEY(order_details_key) REFERENCES dim.order_details(order_details_key),   
    CONSTRAINT FK_fact_date FOREIGN KEY(date_id) REFERENCES dim.dates(date_id)
);