CREATE VIEW OrdersView AS
SELECT id,
       quantity,
       total_cost
FROM orders
WHERE quantity > 2;


CREATE VIEW CustomerView AS
SELECT user.id AS CustomerID,
       CONCAT(user.first_name, user.last_name) as FullName,
       orders.id AS OrderID,
       orders.cost,
       menu.name AS MenuName
FROM user
JOIN orders ON user.id = orders.user_id
JOIN menu ON orders.menu_id = menu.id
WHERE orders.cost > 150
ORDER BY orders.cost ASC;


CREATE VIEW MenuView AS
SELECT name
FROM
    (SELECT name
     FROM menu
     JOIN orders ON orders.menu_id = menu.id
     WHERE quantity > 2);