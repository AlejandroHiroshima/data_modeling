SET
    search_path TO EZECREAM_05;

TRUNCATE TABLE ezecream_05.orders RESTART IDENTITY; -- fråga LLM

INSERT INTO Orders (customer_id, order_date)
    VALUES(
        2, '2024-05-04'),
        (50, '900-02-05'); -- Orphane record, 50 finns inte.



--DELETE FROM ezecream_05.orders WHERE customer_id = 50;

SELECT * FROM ezecream_05.orders;