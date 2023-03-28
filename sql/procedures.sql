
DELIMITER //
CREATE PROCEDURE GetMaxQuantity() BEGIN;
SELECT MAX(quantity)
FROM orders; END;

//
DELIMITER ;

PREPARE GetOrderDetails
FROM 'SELECT id, quantity, total_cost FROM orders WHERE id = ?';


SET @id = 1;

EXECUTE GetOrderDetails USING @id;


DELIMITER //
CREATE PROCEDURE CancelOrder(IN orderID INT) BEGIN
DELETE
FROM orders
WHERE id = orderID; END;

//
DELIMITER ;


INSERT INTO bookings(date, table_number, user_id)
VALUES ('2022-10-10',
        5,
        1);


INSERT INTO bookings(date, table_number, user_id)
VALUES ('2022-10-12',
        3,
        3);


INSERT INTO bookings(date, table_number, user_id)
VALUES ('2022-10-11',
        2,
        2);


INSERT INTO bookings(date, table_number, user_id)
VALUES ('2022-10-13',
        2,
        1);


DELIMITER //
CREATE PROCEDURE CheckBooking(IN date DATETIME, IN tableID INT) BEGIN
SELECT *
FROM bookings
WHERE date = date
        AND id = tableID; END;

//
CREATE PROCEDURE AddValidBooking(IN date DATETIME, IN tableID INT) BEGIN
START TRANSACTION;
INSERT INTO bookings(date, table_number)
VALUES (date, tableID);
COMMIT; END;

//
CREATE PROCEDURE AddBooking(IN date DATETIME, IN tableID INT, IN userID INT) BEGIN;
INSERT INTO bookings (date, table_number, user_id)
VALUES (date, tableID,
              userID); END;

//
CREATE PROCEDURE UpdateBooking(IN date DATETIME, IN tableID INT) BEGIN
UPDATE bookings
SET date = date
WHERE id = tableID; END;

//
CREATE PROCEDURE CancelBooking(IN bookingID INT) BEGIN
DELETE
FROM bookings
WHERE id = bookingID; END;

//
DELIMITER ;