CREATE VIEW gmv_by_store_and_category AS 
SELECT 
    d.store_id, 
    p.category_id, 
    SUM(pi.product_price * pi.product_count) AS gmv
FROM 
    deliveries d
JOIN 
    purchase_items pi ON d.product_id = pi.product_id
JOIN 
    products p ON pi.product_id = p.product_id
GROUP BY 
    d.store_id, 
    p.category_id;