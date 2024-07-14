CREATE DATABASE  IF NOT EXISTS `products_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `products_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: products_db
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

INSERT INTO `products_db`.`categories` VALUES
    (1,'Fruits'),
    (2,'Vegetables'),
    (3,'Dairy'),
    (4,'Meat');

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_date` date NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `supplier_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_id` (`product_id`),
  KEY `supplier_id` (`supplier_id`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

INSERT INTO `products_db`.`orders` VALUES
    (1,'2024-01-01',1,100,1),
    (2,'2024-01-02',2,150,1),
    (3,'2024-01-03',3,200,2),
    (4,'2024-01-04',4,250,2),
    (5,'2024-01-05',5,300,3),
    (6,'2024-01-06',6,350,3),
    (7,'2024-01-07',7,400,4),
    (8,'2024-01-08',8,450,4);

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `description` text,
  `price` decimal(10,2) NOT NULL,
  `category_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

INSERT INTO `products_db`.`products` (`name`, `description`, `price`, `category_id`) VALUES
    ('Apple', 'Fresh red apples', 3.00, 1),
    ('Banana', 'Ripe yellow bananas', 1.50, 1),
    ('Orange', 'Juicy oranges', 2.50, 1),
    ('Broccoli', 'Fresh broccoli heads', 2.00, 2),
    ('Carrot', 'Orange carrots', 1.00, 2),
    ('Tomato', 'Red tomatoes', 2.20, 2),
    ('Milk', 'Whole milk, 1 liter', 1.20, 3),
    ('Cheese', 'Cheddar cheese, 200g', 4.00, 3),
    ('Butter', 'Unsalted butter, 200g', 2.50, 3),
    ('Chicken Breast', 'Boneless chicken breast, 1kg', 8.00, 4),
    ('Beef Steak', 'Ribeye steak, 1kg', 15.00, 4),
    ('Pork Chops', 'Boneless pork chops, 1kg', 10.00, 4),
    ('Strawberry', 'Fresh strawberries, 500g', 4.00, 1),
    ('Lettuce', 'Green leaf lettuce', 1.50, 2),
    ('Yogurt', 'Greek yogurt, 500g', 3.00, 3),
    ('Ground Beef', 'Lean ground beef, 1kg', 12.00, 4),
    ('Lamb Chops', 'Lamb chops, 1kg', 18.00, 4),
    ('Peach', 'Fresh peaches', 3.50, 1),
    ('Spinach', 'Fresh spinach leaves', 2.00, 2),
    ('Cabbage', 'Green cabbage', 1.00, 2),
    ('Cream', 'Heavy cream, 250ml', 1.80, 3),
    ('Bacon', 'Smoked bacon, 200g', 5.00, 4),
    ('Kiwi', 'Fresh kiwis', 2.50, 1),
    ('Cauliflower', 'Fresh cauliflower', 2.00, 2),
    ('Blueberries', 'Fresh blueberries, 500g', 5.00, 1),
    ('Eggplant', 'Fresh eggplants', 1.50, 2),
    ('Cucumber', 'Fresh cucumbers', 1.20, 2),
    ('Mozzarella', 'Mozzarella cheese, 200g', 3.50, 3),
    ('Turkey Breast', 'Boneless turkey breast, 1kg', 9.00, 4),
    ('Grapes', 'Fresh green grapes, 500g', 3.00, 1),
    ('Pineapple', 'Fresh pineapple', 3.50, 1),
    ('Mango', 'Fresh mango', 2.50, 1),
    ('Onion', 'Yellow onions', 0.80, 2),
    ('Garlic', 'Fresh garlic', 1.50, 2),
    ('Potato', 'Fresh potatoes', 0.50, 2),
    ('Sour Cream', 'Sour cream, 500g', 2.00, 3),
    ('Ice Cream', 'Vanilla ice cream, 1 liter', 5.00, 3),
    ('Sausage', 'Smoked sausage, 500g', 6.00, 4),
    ('Salmon', 'Fresh salmon fillet, 1kg', 20.00, 4),
    ('Pork Belly', 'Fresh pork belly, 1kg', 12.00, 4),
    ('Avocado', 'Fresh avocado', 1.50, 1),
    ('Watermelon', 'Fresh watermelon', 7.00, 1),
    ('Cherry', 'Fresh cherries, 500g', 6.00, 1),
    ('Bell Pepper', 'Red bell peppers', 2.00, 2),
    ('Zucchini', 'Fresh zucchini', 1.50, 2),
    ('Radish', 'Fresh radishes', 1.00, 2),
    ('Whipped Cream', 'Whipped cream, 250ml', 2.00, 3),
    ('Cottage Cheese', 'Cottage cheese, 500g', 2.50, 3),
    ('Ham', 'Smoked ham, 500g', 7.00, 4),
    ('Duck Breast', 'Boneless duck breast, 1kg', 18.00, 4),
    ('Pomegranate', 'Fresh pomegranate', 3.00, 1),
    ('Pear', 'Fresh pears', 2.00, 1),
    ('Blackberry', 'Fresh blackberries, 500g', 5.00, 1),
    ('Asparagus', 'Fresh asparagus', 3.00, 2),
    ('Mushroom', 'Fresh mushrooms', 2.00, 2),
    ('Brussels Sprouts', 'Fresh Brussels sprouts', 3.00, 2),
    ('Parmesan', 'Parmesan cheese, 200g', 5.00, 3),
    ('Ricotta', 'Ricotta cheese, 500g', 4.00, 3),
    ('Chorizo', 'Spicy chorizo sausage, 500g', 8.00, 4),
    ('Veal Cutlets', 'Veal cutlets, 1kg', 20.00, 4);

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `contact_name` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

INSERT INTO `suppliers` VALUES
    (1,'Fresh Farms','Ivan Ivanov','375(29)1234567','12 Fruit Street, Minsk, Belarus','ivanov.ivan@emailprovider.com'),
    (2,'Organic Foods','Peter Petrov','375(29)7654321','25 Greenery Avenue, Grodno, Belarus','petrov.peter@emailprovider.com'),
    (3,'Dairy Pure','Mary Krambrery','375(29)5555555','8 Milk Lane, Brest, Belarus','mary.krambrery@emailprovider.com'),
    (4,'Meat Masters','John Snow','375(29)1010101','6 Butcher`s Way, Mogilev, Belarus','john.snow@emailprovider.com');

--
-- Dumping routines for database 'products_db'
--

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-11 22:45:24
