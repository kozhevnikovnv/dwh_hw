-- Таблица производителей
CREATE TABLE manufacturers (
    manufacturer_id SERIAL PRIMARY KEY,
    manufacturer_name VARCHAR(100) NOT NULL
);

-- Таблица категорий
CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Таблица изменения цен
CREATE TABLE price_change (
    product_id BIGINT PRIMARY KEY,
    new_price NUMERIC(9,2) NOT NULL,
    price_change_ts TIMESTAMP NOT NULL
);

-- Таблица магазинов
CREATE TABLE stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(255) NOT NULL
);

-- Таблица клиентов
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_fname VARCHAR(100) NOT NULL,
    customer_lname VARCHAR(100) NOT NULL
);

-- Таблица продуктов
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    manufacturer_id BIGINT NOT NULL,
    category_id BIGINT NOT NULL,
    FOREIGN KEY (manufacturer_id) REFERENCES manufacturers(manufacturer_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Таблица покупок
CREATE TABLE purchases (
    purchase_id SERIAL PRIMARY KEY,
    store_id BIGINT NOT NULL,
    customer_id BIGINT NOT NULL,
    purchase_date TIMESTAMP NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Таблица элементов покупки
CREATE TABLE purchase_items (
    product_count BIGINT NOT NULL,
    purchase_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    product_price NUMERIC(9,2) NOT NULL,
    FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Таблица доставок
CREATE TABLE deliveries (
    product_id BIGINT NOT NULL,
    store_id BIGINT,
    delivery_date DATE NOT NULL,
    product_count INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES price_change(product_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);