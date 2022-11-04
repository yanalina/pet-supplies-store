-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: petsupplies
-- ------------------------------------------------------
-- Server version	8.0.31

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `product_title` varchar(200) DEFAULT NULL,
  `product_description` varchar(800) DEFAULT NULL,
  `product_image` text,
  `product_price` double DEFAULT NULL,
  `product_category` varchar(60) DEFAULT NULL,
  `product_subcategory` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Royal Canin Mother & Babycat Ultra Soft Mousse','Baby cats grow so quickly that some kitten foods aren\'t tailored to their nutritional needs. With growing bones, emerging teeth, and developing immune and digestive systems, it\'s critical they receive precise nutrition. Royal Canin Mother & Babycat Ultra-Soft Mousse in Sauce feeds your kitten\'s magnificence from the start with the essential building block nutrients needed for healthy growth.','productpic1.jpg',12.99,'Food','Cat Food'),(2,'B.F.F. OMG Best Feline Friend with Chicken & Lamb','Selfie Cam! (2.8oz Can, Pack of 12) Red-meat tuna, cage-free chicken, and grass-fed lamb in a tasty gravy. With even more gravy, and tender pieces of chicken - B.F.F. provides all the lean protein and moisture your cat needs to thrive. After eating the tasty, minced chicken and lamb in this high-moisture meal, your kitty will feel fabulous and camera-ready!','productpic2.jpg',19.99,'Food','Cat Food'),(3,'Purina Pro Plan Gravy, High Protein, Turkey & Vegetable','Show your cat just how much you pay attention to her unique taste preferences when you offer her Purina Pro Plan Turkey & Vegetables Entree in Gravy adult wet cat food. This delicious recipe features real turkey complemented with vegetables, and every high-quality ingredient is carefully chosen for a specific purpose, so you can feel confident serving this wet cat food to your feline friend.','productpic3.jpg',42.5,'Food','Cat Food'),(4,'Purina Pro Plan Cat Food, Lamb and Rice','Give your sensitive cat the support she needs to thrive with Purina Pro Plan Brand Cat Food Sensitive Skin & Stomach Lamb & Rice Formula adult dry cat food. We carefully choose every ingredient in this sensitive stomach cat food for a specific purpose. The high-protein cat food formula starts with real lamb as the first ingredient and is rounded out with easily digestible rice and oatmeal.','productpic4.jpg',49.99,'Food','Cat Food'),(5,'Cat Roller Ball Toy by 7 Ruby Road 100% Natural Wood','Made Tough to Handle the Rough - built from double-layered sustainable wood and 10.8” diameter, this cat ball toy is substantial enough to deal with multiple cats or kittens playing ball together. Anti-Topple Design with Non-Slip Pads.','productpic5.jpg',31.55,'Toys','Cat Toys'),(6,'Gochanmon Catnip Toys-2Psc Stick Catnip Ball&Bell','Silvervine (also known as Mtatabi) plant, harvested from the jungles of Southeast Asia, combined with wild catnip and hand-woven. 100% natural, no additives and preservatives, safe for pets. Silvervine sticks lead cats healthy chewing behavior, help cats grow permanent teeth.','productpic6.jpg',15.99,'Toys','Cat Toys');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-31 18:27:41
