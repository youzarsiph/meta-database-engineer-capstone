--
-- Create model User
--
CREATE TABLE `user` (
    `id` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `password` VARCHAR(128) NOT NULL,
    `last_login` DATETIME(6) NULL,
    `is_superuser` BOOL NOT NULL,
    `username` VARCHAR(150) NOT NULL UNIQUE,
    `first_name` VARCHAR(150) NOT NULL,
    `last_name` VARCHAR(150) NOT NULL,
    `email` VARCHAR(254) NOT NULL,
    `is_staff` BOOL NOT NULL,
    `is_active` BOOL NOT NULL,
    `date_joined` DATETIME(6) NOT NULL,
    `phone_number` VARCHAR(10) NOT NULL UNIQUE,
    `role` VARCHAR(32) NULL,
    `salary` NUMERIC(6 , 2 ) NULL
);
--
-- Create model Category
--
CREATE TABLE `category` (
    `id` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(32) NOT NULL UNIQUE
);
--
-- Create model Menu
--
CREATE TABLE `menu` (
    `id` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `name` VARCHAR(32) NOT NULL UNIQUE,
    `description` VARCHAR(255) NOT NULL,
    `price` NUMERIC(6 , 2 ) NOT NULL,
    `category_id` BIGINT NOT NULL
);
--
-- Create model Orders
--
CREATE TABLE `orders` (
    `id` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `order_date` DATETIME(6) NOT NULL,
    `quantity` SMALLINT NOT NULL,
    `total_coast` NUMERIC(6 , 2 ) NOT NULL,
    `menu_id` BIGINT NOT NULL,
    `user_id` BIGINT NOT NULL
);
--
-- Create model DeliveryStatus
--
CREATE TABLE `delivery_status` (
    `id` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `delivery_date` DATETIME(6) NOT NULL,
    `status` SMALLINT NOT NULL,
    `order_id` BIGINT NOT NULL
);
--
-- Create model Bookings
--
CREATE TABLE `bookings` (
    `id` BIGINT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    `date` DATETIME(6) NOT NULL,
    `table_number` SMALLINT NOT NULL,
    `user_id` BIGINT NOT NULL
);
--
-- Create constraint bookings_unique on model bookings
--
ALTER TABLE `bookings` ADD CONSTRAINT `bookings_unique` UNIQUE (`date`, `table_number`);
ALTER TABLE `menu` ADD CONSTRAINT `menu_category_id_af54b4ec_fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_menu_id_709ac0a0_fk_menu_id` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);
ALTER TABLE `orders` ADD CONSTRAINT `orders_user_id_7e2523fb_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
ALTER TABLE `delivery_status` ADD CONSTRAINT `delivery_status_order_id_a2f9b3da_fk_orders_id` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);
ALTER TABLE `bookings` ADD CONSTRAINT `bookings_user_id_6e734b08_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
