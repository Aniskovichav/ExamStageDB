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

INSERT INTO `categories` VALUES (1,'Fruits');
INSERT INTO `categories` VALUES (2,'Vegetables');
INSERT INTO `categories` VALUES (3,'Dairy');
INSERT INTO `categories` VALUES (4,'Meat');

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

INSERT INTO `orders` VALUES (1,'2024-01-01',1,100,1);
INSERT INTO `orders` VALUES (2,'2024-01-02',2,150,1);
INSERT INTO `orders` VALUES (3,'2024-01-03',3,200,2);
INSERT INTO `orders` VALUES (4,'2024-01-04',4,250,2);
INSERT INTO `orders` VALUES (5,'2024-01-05',5,300,3);
INSERT INTO `orders` VALUES (6,'2024-01-06',6,350,3);
INSERT INTO `orders` VALUES (7,'2024-01-07',7,400,4);
INSERT INTO `orders` VALUES (8,'2024-01-08',8,450,4);

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

INSERT INTO `products` VALUES (1,'Apple','Fresh red apple',0.99,1);
INSERT INTO `products` VALUES (2,'Banana','Organic bananas',1.29,1);
INSERT INTO `products` VALUES (3,'Carrot','Crunchy orange carrot',0.49,2);
INSERT INTO `products` VALUES (4,'Broccoli','Fresh green broccoli',1.99,2);
INSERT INTO `products` VALUES (5,'Milk','Fresh and juicy strawberries',1.09,3);
INSERT INTO `products` VALUES (6,'Cheese','Cheddar cheese',2.99,3);
INSERT INTO `products` VALUES (7,'Chicken Breast','Boneless chicken breast',5.99,4);
INSERT INTO `products` VALUES (8,'Beef Steak','Premium beef steak',12.99,4);

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

INSERT INTO `suppliers` VALUES (1,'Fresh Farms','Ivan Ivanov','375(29)1234567','12 Fruit Street, Minsk, Belarus','ivanov.ivan@emailprovider.com');
INSERT INTO `suppliers` VALUES (2,'Organic Foods','Peter Petrov','375(29)7654321','25 Greenery Avenue, Grodno, Belarus','petrov.peter@emailprovider.com');
INSERT INTO `suppliers` VALUES (3,'Dairy Pure','Mary Krambrery','375(29)5555555','8 Milk Lane, Brest, Belarus','mary.krambrery@emailprovider.com');
INSERT INTO `suppliers` VALUES (4,'Meat Masters','John Snow','375(29)1010101','6 Butcher`s Way, Mogilev, Belarus','john.snow@emailprovider.com');

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
