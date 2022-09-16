-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sut
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `s_booking`
--

DROP TABLE IF EXISTS `s_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_booking` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_ADD` date DEFAULT NULL,
  `IS_ACTIVE` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_booking`
--

INSERT INTO `s_booking` VALUES (1,'Kemmer, Wehner and Reichert','2009-10-08','Y'),(2,'McDermott and Sons','2005-04-27','Y'),(3,'Becker-Streich','1994-02-08','Y'),(4,'Jenkins, Hilll and Balistreri','2014-12-09','Y'),(5,'Macejkovic, Runolfsdottir and Hessel','1984-12-01','Y'),(6,'Paucek and Sons','1987-12-25','Y'),(7,'Windler-Conn','1985-10-19','Y');

--
-- Table structure for table `s_booking_data_temp`
--

DROP TABLE IF EXISTS `s_booking_data_temp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_booking_data_temp` (
  `ID` int DEFAULT NULL,
  `BOOKING_CODE` varchar(255) DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  `LINK` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_booking_data_temp`
--

INSERT INTO `s_booking_data_temp` VALUES (1,'1uwdjeaw',10000,'http://denesik.info/1'),(2,'1ewlfqqd',9000,'http://www.pouros.com/2'),(3,'1ynqhmlb',8000,'http://beier.com/3');

--
-- Table structure for table `s_booking_hotels`
--

DROP TABLE IF EXISTS `s_booking_hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_booking_hotels` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `HOTEL_ID` int DEFAULT NULL,
  `BOOKING_CODE` varchar(255) DEFAULT NULL,
  `BOOKING_SYSTEM_ID` int DEFAULT NULL,
  `PRICE` int DEFAULT NULL,
  `LINK` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_booking_hotels_s_booking_ID_fk` (`BOOKING_SYSTEM_ID`),
  KEY `s_booking_hotels_s_object_ID_fk` (`HOTEL_ID`),
  CONSTRAINT `s_booking_hotels_s_booking_ID_fk` FOREIGN KEY (`BOOKING_SYSTEM_ID`) REFERENCES `s_booking` (`ID`),
  CONSTRAINT `s_booking_hotels_s_object_ID_fk` FOREIGN KEY (`HOTEL_ID`) REFERENCES `s_object` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_booking_hotels`
--

INSERT INTO `s_booking_hotels` VALUES (2,5,'ewlfqqd',6,4920,'http://www.pouros.info/'),(3,88,'jnvmlop',1,9477,'http://www.aufderhar.com/'),(4,77,'jnvmlop',6,3320,'http://muellerwisoky.info/'),(5,11,'jnvmlop',1,6149,'http://www.gerhold.com/'),(6,44,'jnvmlop',7,9809,'http://harber.biz/'),(7,45,'rnhjlfa',3,1737,'http://www.breitenbergnikolaus.com/'),(8,11,'rexlhpq',6,7000,'http://doyle.org/4'),(9,69,'muongmu',5,5372,'http://bechtelar.com/'),(10,89,'ordtpip',5,9209,'http://www.larkin.com/'),(11,11,'tnvosdk',7,7259,'http://www.prosacco.com/'),(12,13,'mtcpnuw',2,5274,'http://luettgen.info/'),(13,94,'mrkxscy',6,2692,'http://okuneva.com/'),(14,77,'yuxpyfm',2,NULL,NULL),(15,84,'yeeqoma',6,NULL,NULL),(16,13,'fjaodkw',6,9620,'http://schulist.com/'),(17,56,'mifooig',6,5930,'http://www.heathcotekuvalis.com/'),(18,4,'xznobki',1,NULL,NULL),(19,58,'pizygve',7,8169,'http://www.hilpert.biz/'),(20,77,'ptcrxsp',4,5258,'http://nitzschestreich.com/'),(21,15,'hvmumbz',2,2249,'http://www.greenfelder.com/'),(22,36,'lfcslif',2,3379,'http://walker.com/'),(23,45,'uqgmnnv',1,8580,'http://www.russelgislason.com/'),(24,50,'yaydyuy',3,5555,'http://www.parisian.com/'),(25,32,'vwoscws',7,8148,'http://bogan.org/'),(26,44,'yndomja',4,4000,'http://www.parisian.com/'),(27,95,'ownsuze',3,8371,'http://www.wyman.com/'),(28,15,'bezvxka',6,8890,'http://daniel.org/'),(29,11,'oyssfpg',6,8867,'http://oconnell.info/'),(30,72,'hxptuxr',5,7782,'http://gutkowskireichel.net/'),(31,15,'gsdicte',3,4571,'http://willblanda.net/'),(32,32,'qvcyees',2,2203,'http://labadiebartell.org/'),(33,24,'mkgflkc',2,1440,'http://www.ruecker.com/'),(34,87,'olmsand',5,3492,'http://treutelmcglynn.org/'),(35,58,'qdcvhyp',1,4243,'http://www.wyman.com/'),(36,13,'wkdgcej',6,6000,'http://www.lesch.biz/5'),(37,13,'ysvaczl',3,NULL,NULL),(38,56,'xcfefth',2,1444,'http://www.carrollgraham.com/'),(39,96,'txtgqzx',4,4476,'http://hillsberge.com/'),(40,56,'qcsmdyy',4,9658,'http://kesslerbrown.com/'),(41,15,'khmxzux',1,3745,'http://www.bernhard.com/'),(42,69,'eymmnmx',4,3791,'http://www.purdy.net/'),(43,94,'1ewlfqqd',1,9000,'http://www.pouros.com/2'),(44,29,'pajflmw',1,8556,'http://www.marvinharvey.com/'),(45,81,'wqsnmcr',5,6831,'http://balistreri.com/'),(46,22,'jnvmlop',1,4722,'http://www.osinski.com/'),(47,95,'vyqatpo',5,3705,'http://www.corwin.net/'),(48,94,'hxowslv',6,9438,'http://www.okeefebartell.org/'),(49,84,'aijgyap',2,1481,'http://deckow.com/'),(50,77,'shbkusn',3,8630,'http://www.parisianbogan.com/'),(51,17,'kvlvpwx',2,3058,'http://rogahn.com/'),(52,94,'vhzshkd',2,8000,'http://beier.com/3'),(53,11,'btldzcr',6,5555,'http://labadieweber.biz/6'),(54,95,'zoqqyxl',6,NULL,NULL),(55,44,'hkcmwgb',3,1095,'http://www.weissnat.com/'),(56,15,'rwunyly',3,1802,'http://binsspencer.com/'),(57,80,'1uwdjeaw',1,10000,'http://denesik.info/1'),(58,80,'ernfoiq',2,6285,'http://www.hand.com/'),(59,13,'aruatej',2,3438,'http://www.cronacremin.org/'),(60,88,'arldqhl',6,9544,'http://rauschamberger.net/'),(61,69,'vljayjc',5,1141,'http://www.heathcote.com/'),(62,72,'ttlorqs',3,5000,'http://bergnaum.info/'),(63,50,'aqflqpu',1,2555,'http://auerkoepp.com/'),(64,5,'ogrbktt',7,3829,'http://johnson.biz/'),(65,77,'ytaiqij',1,NULL,NULL),(66,87,'qkubosw',7,4731,'http://www.renner.com/'),(67,45,'ahhkybb',6,7815,'http://www.parisian.com/'),(68,50,'xnmujaw',6,6666,'http://www.terry.net/'),(69,89,'avqunfm',3,1332,'http://www.herzog.org/'),(70,24,'pfeavqz',7,3518,'http://stamm.com/'),(71,15,'yjyevut',2,NULL,NULL),(72,13,'zuvtjqv',4,NULL,NULL),(73,4,'kxwvozh',5,5623,'http://klocko.net/'),(74,29,'pyqthup',6,5940,'http://www.altenwerth.com/'),(75,76,'fxpcckl',4,7599,'http://raynorkihn.com/'),(76,4,'jvjmpot',7,1318,'http://schaden.biz/'),(77,5,'efllkkm',3,1175,'http://www.nitzsche.com/'),(78,24,'gllhrzz',3,1021,'http://bernhard.com/'),(79,58,'ttfgkzq',1,9407,'http://mcculloughskiles.info/'),(80,22,'kcnsivu',3,3500,'http://runolfsdottir.info/'),(81,13,'upnmujp',1,8375,'http://howemitchell.com/'),(82,13,'fuferww',2,8184,'http://www.hoeger.org/'),(83,84,'elgdhbe',4,9618,'http://www.nienow.net/'),(84,24,'qwgprqj',3,1472,'http://www.fritschlangworth.info/'),(85,50,'kpqtskj',3,6186,'http://zboncakmcdermott.com/'),(86,5,'aankpcj',3,8836,'http://www.beier.com/'),(87,45,'dxysiqs',5,5182,'http://www.cole.com/'),(88,13,'ppolxli',5,7053,'http://bergstrom.com/'),(89,29,'rpnuwiu',7,1714,'http://wintheiser.org/'),(90,56,'gfocxtz',3,3572,'http://corkery.org/'),(91,4,'myesabb',1,2568,'http://barton.com/'),(92,87,'gmrwfzp',6,1627,'http://lindgutkowski.biz/'),(93,45,'kmahgyk',3,6634,'http://www.terry.net/'),(94,89,'hsbshtq',3,5000,'http://davisdooley.biz/'),(95,25,'kzpwlze',4,5023,'http://hudson.net/'),(96,15,'blpzguv',1,4133,'http://www.hettingermraz.net/'),(97,32,'cbupjed',5,2210,'http://www.harvey.com/'),(98,36,'yqwecdo',4,2000,'http://www.parisian.com/'),(99,22,'zqlityp',2,3500,'http://www.ruecker.com/'),(100,92,'yoqoaoe',1,NULL,NULL);

--
-- Table structure for table `s_city`
--

DROP TABLE IF EXISTS `s_city`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_city` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `POPULATION` int DEFAULT NULL,
  `REGION_ID` int DEFAULT NULL,
  `IS_REGION_CENTER` char(1) COLLATE utf8_unicode_ci DEFAULT 'N',
  `OBJECTS_CNT` int DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `s_city_s_region_ID_fk` (`REGION_ID`),
  CONSTRAINT `s_city_s_region_ID_fk` FOREIGN KEY (`REGION_ID`) REFERENCES `s_region` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_city`
--

INSERT INTO `s_city` VALUES (1,'Санкт-Петербург','Omnis velit porro repellendus autem soluta. Quo nihil enim et. Maiores quo qui facilis dolorem et iste sequi. Facere sit repellendus et quas unde.',464358,1,'N',0),(2,'Курган','Sapiente rerum optio quo exercitationem temporibus fugit ex. Beatae sunt culpa veritatis at accusamus enim. Sit quam enim qui saepe nobis. Autem at cumque molestias officiis.',NULL,2,'N',0),(3,'Новосибирск','Facere delectus corporis qui nisi dolor suscipit. Illum dolorum reprehenderit est quidem omnis. Nobis consequatur qui incidunt qui sed soluta. Quasi blanditiis doloribus ipsum eum qui qui quo.',1918325,3,'N',0),(4,'Калининград','Voluptate perferendis libero fugiat placeat. Voluptates optio numquam nobis optio. Quae ex voluptatem sed iste.',4604342,4,'Y',0),(5,'Рязань','Assumenda in aut ut autem sequi et sit. Sit non reiciendis quasi quisquam. Error neque ullam vel molestiae tempore.',4029860,1,'N',0),(6,'Псков','Provident sit quo aut sed officia id. Magni voluptatibus animi vitae vero. Consectetur enim excepturi nostrum ut enim nihil.',NULL,2,'N',0),(7,'Королев','Quos non aperiam id officia nam tenetur velit. Illo quos nihil nesciunt beatae quidem dolor. Magni laborum illum ea cupiditate.',2758769,3,'N',0),(8,'Сургут','Ut sunt doloribus dolore iusto dolore rerum exercitationem voluptatum. Illum quibusdam cupiditate natus alias. Quos dolorem quis ab officiis inventore iure iure. Cum dolorum ullam suscipit ea dolorem ut dicta.',3740974,4,'N',0),(9,'Ханты-Мансийск','Voluptatibus numquam vel magni laudantium accusantium provident qui. Eum nemo neque repellendus. Quae qui quia quaerat voluptas illum voluptas earum. Voluptate accusantium odit similique voluptatibus.',4743514,1,'N',0),(10,'Хабаровск','Mollitia neque quasi quo fugiat ut. Maxime non at consequatur velit voluptas. Voluptatem non in corrupti quasi.',1223711,2,'N',0),(11,'Кострома','Et distinctio beatae rem voluptatem sunt adipisci enim nihil. Qui eius neque repellendus et et reprehenderit voluptates. Quas ab eos perferendis deserunt qui sequi. Vel et animi vitae aut neque. Voluptas in accusantium hic harum delectus saepe rerum.',NULL,3,'N',0),(12,'Киров','Exercitationem qui magnam eum optio dolor aliquid. Laboriosam et et nemo maxime aperiam corrupti sit quam. Id voluptas nam consequatur corrupti autem modi.',1509150,4,'N',0),(13,'Москва','Laudantium ut dolor molestias. Deserunt dicta quos possimus quod necessitatibus. Consequatur alias aliquid illo rerum aut. Quo libero quis dolor quasi.',1500481,1,'Y',0),(14,'Когалым','Quis ut ut quis maiores minima. Adipisci laborum eum fugiat alias.',123660,2,'Y',0);

--
-- Table structure for table `s_contract`
--

DROP TABLE IF EXISTS `s_contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_contract` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int DEFAULT NULL,
  `OWNER_ID` int DEFAULT NULL,
  `DATE_START` date DEFAULT NULL,
  `DATE_END` date DEFAULT NULL,
  `SUM` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_contract_s_object_ID_fk` (`OBJECT_ID`),
  KEY `s_contract_s_user_ID_fk` (`OWNER_ID`),
  CONSTRAINT `s_contract_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE SET NULL,
  CONSTRAINT `s_contract_s_user_ID_fk` FOREIGN KEY (`OWNER_ID`) REFERENCES `s_user` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_contract`
--

INSERT INTO `s_contract` VALUES (1,70,3,'2018-10-02','2021-12-03',39396),(2,60,20,'2018-12-01','2022-01-31',84631),(3,99,39,'2018-12-10','2022-02-20',38782),(4,61,21,'2019-01-05','2022-03-09',57240),(5,80,10,'2019-02-11','2022-04-11',26520),(6,35,1,'2019-03-02','2022-04-23',82745),(7,76,27,'2019-03-16','2022-06-27',84002),(8,28,12,'2019-03-27','2022-08-10',58412),(9,79,32,'2019-04-04','2022-08-13',64728),(10,48,9,'2019-04-07','2022-08-20',10467),(11,61,40,'2019-04-15','2022-09-20',17300),(12,42,6,'2019-04-20','2022-11-21',38465),(13,32,24,'2019-05-13','2022-12-04',31266),(14,84,22,'2019-06-10','2022-12-19',63140),(15,11,22,'2019-06-12','2023-01-03',38593),(16,43,33,'2019-06-14','2023-01-11',90266),(17,61,1,'2019-08-25','2023-01-24',49666),(18,31,24,'2019-08-29','2023-06-08',60633),(19,100,37,'2019-09-12','2023-10-26',75028),(20,11,32,'2019-09-15','2023-11-03',54559),(21,14,18,'2019-10-14','2023-11-20',80601),(22,79,36,'2019-10-27','2023-11-26',45963),(23,13,3,'2019-11-11','2023-12-03',27172),(24,19,37,'2019-12-10','2023-12-13',29411),(25,85,27,'2018-10-02','2021-12-03',40405),(26,12,18,'2018-12-01','2022-01-31',88874),(27,65,22,'2018-12-10','2022-02-20',28450),(28,59,39,'2019-01-05','2022-03-09',47443),(29,12,17,'2019-02-11','2022-04-11',91958),(30,50,9,'2019-03-02','2022-04-23',25170),(31,97,38,'2019-03-16','2022-06-27',21894),(32,3,23,'2019-03-27','2022-08-10',66307),(33,95,13,'2019-04-04','2022-08-13',96227),(34,16,38,'2019-04-07','2022-08-20',25125),(35,24,11,'2019-04-15','2022-09-20',28252),(36,73,15,'2019-04-20','2022-11-21',39543),(37,72,21,'2019-05-13','2022-12-04',88046),(38,27,34,'2019-06-10','2022-12-19',84688),(39,59,19,'2019-06-12','2023-01-03',38707),(40,75,17,'2019-06-14','2023-01-11',51348),(41,12,35,'2019-08-25','2023-01-24',85373),(42,87,31,'2019-08-29','2023-06-08',57510),(43,40,19,'2019-09-12','2023-10-26',93832),(44,72,21,'2019-09-15','2023-11-03',49837),(45,88,9,'2019-10-14','2023-11-20',33734),(46,73,34,'2019-10-27','2023-11-26',19585),(47,15,31,'2019-11-11','2023-12-03',30061),(48,40,4,'2019-12-10','2023-12-13',81096),(49,8,23,'2019-12-20','2021-12-03',91682),(50,3,13,'2018-10-02','2022-01-31',99370),(51,83,31,'2018-12-01','2022-02-20',57402),(52,69,22,'2018-12-10','2022-03-09',61860),(53,27,39,'2019-01-05','2022-04-11',14643),(54,38,34,'2019-02-11','2022-04-23',89785),(55,41,5,'2019-03-02','2022-06-27',81998),(56,28,21,'2019-03-16','2022-08-10',89972),(57,99,6,'2019-03-27','2022-08-13',17063),(58,28,16,'2019-04-04','2022-08-20',75267),(59,60,40,'2019-04-07','2022-09-20',26717),(60,90,19,'2019-04-15','2022-11-21',73040),(61,21,25,'2019-04-20','2022-12-04',73181),(62,30,15,'2019-05-13','2022-12-19',66859),(63,38,28,'2019-06-10','2023-01-03',66846),(64,45,18,'2019-06-12','2023-01-11',53552),(65,26,19,'2019-06-14','2023-01-24',81381),(66,76,4,'2019-08-25','2023-06-08',86743),(67,22,18,'2019-08-29','2023-10-26',51935),(68,63,20,'2019-09-12','2023-11-03',97718),(69,40,40,'2019-09-15','2023-11-20',25156),(70,34,32,'2019-10-14','2023-11-26',40612),(71,13,25,'2019-10-27','2023-12-03',99834),(72,32,5,'2019-11-11','2023-12-13',39182),(73,75,24,'2019-12-10','2021-12-03',46233),(74,50,14,'2019-12-20','2022-01-31',60940),(75,58,16,'2018-10-02','2022-02-20',86987),(76,80,32,'2018-12-01','2022-03-09',96008),(77,2,4,'2018-12-10','2022-04-11',33324),(78,14,16,'2019-01-05','2022-04-23',65560),(79,79,24,'2019-02-11','2022-06-27',73933),(80,84,2,'2019-03-02','2022-08-10',47250),(81,5,24,'2019-03-16','2022-08-13',94097),(82,13,11,'2019-03-27','2022-08-20',65181),(83,3,30,'2019-04-04','2022-09-20',12058),(84,75,17,'2019-04-07','2022-11-21',18684),(85,75,4,'2019-04-15','2022-12-04',86559),(86,22,35,'2019-04-20','2022-12-19',91999),(87,69,22,'2019-05-13','2023-01-03',73607),(88,98,18,'2019-06-10','2023-01-11',85016),(89,13,19,'2019-06-12','2023-01-24',61353),(90,77,29,'2019-06-14','2023-06-08',81780),(91,87,23,'2019-08-25','2023-10-26',39870),(92,49,35,'2019-08-29','2023-11-03',52239),(93,66,26,'2019-09-12','2023-11-20',94788),(94,26,18,'2019-09-15','2023-11-26',16985),(95,21,4,'2019-10-14','2023-12-03',80585),(96,49,11,'2019-10-27','2023-12-13',36931),(97,68,25,'2019-11-11','2023-12-14',92686),(98,52,29,'2019-12-10','2021-12-03',72057),(99,35,11,'2019-12-20','2022-01-31',88742),(100,13,4,'2018-10-02','2022-02-20',84796),(101,35,14,'2018-12-01','2022-03-09',65755),(102,96,2,'2018-12-10','2022-04-11',24570),(103,89,38,'2019-01-05','2022-04-23',31318),(104,47,1,'2019-02-11','2022-06-27',76255),(105,41,10,'2019-03-02','2022-08-10',27004),(106,71,11,'2019-03-16','2022-08-13',86895),(107,80,8,'2019-03-27','2022-08-20',88372),(108,15,19,'2019-04-04','2022-09-20',89940),(109,83,17,'2019-04-07','2022-11-21',66694),(110,90,2,'2019-04-15','2022-12-04',17739),(111,49,16,'2019-04-20','2022-12-19',90158),(112,29,7,'2019-05-13','2023-01-03',37587),(113,99,32,'2019-06-10','2023-01-11',92337),(114,87,14,'2019-06-12','2023-01-24',50399),(115,7,40,'2019-06-14','2023-06-08',25179),(116,43,17,'2019-08-25','2023-10-26',10256),(117,35,16,'2019-08-29','2023-11-03',13185),(118,46,9,'2019-09-12','2023-11-20',26329),(119,31,37,'2019-09-15','2023-11-26',52909),(120,23,29,'2019-10-14','2023-12-03',98455),(121,16,38,'2019-10-27','2023-12-13',18405),(122,98,39,'2019-11-11','2023-12-14',17030),(123,13,5,'2019-12-10','2021-12-03',35591),(124,42,38,'2019-12-20','2022-01-31',42298),(125,53,13,'2018-10-02','2022-02-20',75758),(126,98,1,'2018-12-01','2022-03-09',46108),(127,69,11,'2018-12-10','2022-04-11',72751),(128,18,27,'2019-01-05','2022-04-23',73604),(129,6,2,'2019-02-11','2022-06-27',84260),(130,1,5,'2019-03-02','2022-08-10',84956),(131,5,17,'2019-03-16','2022-08-13',72688),(132,54,16,'2019-03-27','2022-08-20',32073),(133,80,40,'2019-04-04','2022-09-20',15474),(134,61,5,'2019-04-07','2022-11-21',50665),(135,92,34,'2019-04-15','2022-12-04',53451),(136,82,3,'2019-04-20','2022-12-19',62629),(137,76,32,'2019-05-13','2023-01-03',81204),(138,3,35,'2019-06-10','2023-01-11',77687),(139,92,18,'2019-06-12','2023-01-24',74102),(140,82,18,'2019-06-14','2023-06-08',79626),(141,75,32,'2019-08-25','2023-10-26',12339),(142,46,18,'2019-08-29','2023-11-03',57355),(143,4,26,'2019-09-12','2023-11-20',56251),(144,10,4,'2019-09-15','2023-11-26',79638),(145,68,4,'2019-10-14','2023-12-03',26713),(146,22,29,'2019-10-27','2023-12-13',29568),(147,52,30,'2019-11-11','2023-12-14',37298),(148,11,13,'2019-12-10','2021-12-03',60721),(149,74,29,'2019-12-20','2022-01-31',88119),(150,43,26,'2018-10-02','2022-02-20',88629),(151,53,10,'2018-12-01','2022-03-09',64992),(152,72,12,'2018-12-10','2022-04-11',69561),(153,4,30,'2019-01-05','2022-04-23',84813),(154,16,38,'2019-02-11','2022-06-27',29547),(155,19,39,'2019-03-02','2022-08-10',58656),(156,39,38,'2019-03-16','2022-08-13',59793),(157,76,34,'2019-03-27','2022-08-20',15278),(158,36,32,'2019-04-04','2022-09-20',10436),(159,48,19,'2019-04-07','2022-11-21',42642),(160,90,7,'2019-04-15','2022-12-04',37175),(161,56,5,'2019-04-20','2022-12-19',48890),(162,88,3,'2019-05-13','2023-01-03',61414),(163,85,39,'2019-06-10','2023-01-11',75636),(164,39,24,'2019-06-12','2023-01-24',62972),(165,68,33,'2019-06-14','2023-06-08',40887),(166,24,9,'2019-08-25','2023-10-26',43474),(167,5,39,'2019-08-29','2023-11-03',60186),(168,49,3,'2019-09-12','2023-11-20',35890),(169,71,26,'2019-09-15','2023-11-26',30380),(170,3,36,'2019-10-14','2023-12-03',54373),(171,62,17,'2019-10-27','2023-12-13',74654),(172,82,15,'2019-11-11','2023-12-14',97401),(173,26,7,'2019-12-10','2021-12-03',20185),(174,17,30,'2019-12-20','2022-01-31',81654),(175,63,3,'2018-10-02','2022-02-20',37846),(176,88,8,'2018-12-01','2022-03-09',70389),(177,17,31,'2018-12-10','2022-04-11',47445),(178,25,1,'2019-01-05','2022-04-23',12985),(179,73,26,'2019-02-11','2022-06-27',64098),(180,60,17,'2019-03-02','2022-08-10',89095),(181,45,34,'2019-03-16','2022-08-13',62096),(182,61,20,'2019-03-27','2022-08-20',75944),(183,79,4,'2019-04-04','2022-09-20',19737),(184,57,20,'2019-04-07','2022-11-21',22261),(185,74,24,'2019-04-15','2022-12-04',91694),(186,37,14,'2019-04-20','2022-12-19',89956),(187,100,8,'2019-05-13','2023-01-03',14286),(188,73,11,'2019-06-10','2023-01-11',85723),(189,36,36,'2019-06-12','2023-01-24',44914),(190,98,40,'2019-06-14','2023-06-08',88397),(191,96,35,'2019-08-25','2023-10-26',48758),(192,16,5,'2019-08-29','2023-11-03',62146),(193,61,17,'2019-09-12','2023-11-20',41691),(194,13,14,'2019-09-15','2023-11-26',69875),(195,4,29,'2019-10-14','2023-12-03',94705),(196,74,20,'2019-10-27','2023-12-13',43466),(197,55,14,'2019-11-11','2023-12-14',68106),(198,98,14,'2019-12-10','2021-12-03',67104),(199,44,22,'2019-12-20','2022-01-31',17938),(200,82,7,'2018-10-02','2022-02-20',30674),(201,13,8,'2018-12-01','2022-03-09',33200),(202,53,5,'2018-12-10','2022-04-11',83847),(203,37,10,'2019-01-05','2022-04-23',34856),(204,38,29,'2019-02-11','2022-06-27',34786),(205,14,15,'2019-03-02','2022-08-10',27855),(206,70,4,'2019-03-16','2022-08-13',86853),(207,21,34,'2019-03-27','2022-08-20',48000),(208,21,33,'2019-04-04','2022-09-20',25455),(209,25,14,'2019-04-07','2022-11-21',41773),(210,16,12,'2019-04-15','2022-12-04',80089),(211,5,36,'2019-04-20','2022-12-19',97434),(212,77,24,'2019-05-13','2023-01-03',46031),(213,24,30,'2019-06-10','2023-01-11',22791),(214,93,27,'2019-06-12','2023-01-24',33403),(215,28,30,'2019-06-14','2023-06-08',59045),(216,85,17,'2019-08-25','2023-10-26',97721),(217,93,15,'2019-08-29','2023-11-03',46855),(218,53,12,'2019-09-12','2023-11-20',14112),(219,62,36,'2019-09-15','2023-11-26',78428),(220,1,31,'2019-10-14','2023-12-03',97580);

--
-- Table structure for table `s_object`
--

DROP TABLE IF EXISTS `s_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_object` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `CITY_ID` int DEFAULT NULL,
  `IS_ACTIVE` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_object_s_city_ID_fk` (`CITY_ID`),
  KEY `s_object_s_object_type_ID_fk` (`TYPE`),
  CONSTRAINT `s_object_s_city_ID_fk` FOREIGN KEY (`CITY_ID`) REFERENCES `s_city` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_object`
--

INSERT INTO `s_object` VALUES (1,'Gusikowski, Lebsack and Doyle','Sint ut ut earum ad iste quae. Asperiores aut iste voluptatem nemo ratione dignissimos magni cum. Enim harum id quia asperiores. Quibusdam excepturi consequatur ut officia.',1,'Y','apart'),(2,'Satterfield Group','Et nihil sit nobis quia quia voluptatibus deserunt libero. Rerum facilis ut similique ex sed rerum.',2,'N','sight'),(3,'Cormier-Thompson','Sunt et quibusdam voluptates vero omnis. Voluptatem et voluptatem cupiditate. Illum et et cumque. Adipisci et explicabo veniam atque et impedit iusto dolores.',3,'Y','sight'),(4,'Roob Ltd','Dolores debitis officiis officiis quidem dolor iusto laudantium ex. Sit impedit qui esse voluptates et dolorem. Qui et quo minus sit. Dolor est libero nulla sit dolorem.',4,'N','hotel'),(5,'Abbott-Abernathy','Doloribus expedita optio voluptas odit saepe hic. Quam dolor vitae et praesentium. Cumque reiciendis voluptate in in.',5,'Y','hotel'),(6,'Wisozk, Smitham and Greenfelder','Eum pariatur et rerum voluptatibus at. Blanditiis ullam harum sint magni sequi. Aperiam id omnis ea aut aliquid.',6,'N','sight'),(7,'Kessler-Donnelly','Hic quo totam soluta quia consequatur est similique consequatur. Soluta aut magni incidunt quo reprehenderit. Ullam placeat sit beatae ut.',7,'N','sight'),(8,'Keebler and Sons','Molestias nihil nihil assumenda perspiciatis provident sunt. Nemo commodi exercitationem quia enim rem a dolor. Aut et harum expedita dolor non id ut et. Quae dolore fuga incidunt optio omnis beatae vitae. Porro suscipit assumenda sit nesciunt.',8,'N','sight'),(9,'Miller LLC','Molestias quas earum maxime reiciendis. Esse rerum voluptatem exercitationem aut dolores sint et. Natus facilis recusandae aut id ullam. Quaerat est qui accusamus ut optio consequatur sit optio.',9,'N','apart'),(10,'Roberts PLC','In molestiae dolorem et quia consequatur. Optio vel corrupti dolor aut.',10,'Y','apart'),(11,'King Ltd','Voluptatem enim omnis corporis non. Alias perferendis vel aut quia qui. Sit quia placeat pariatur id nesciunt sit.',11,'N','hotel'),(12,'Weissnat Ltd','Non esse quod nihil modi harum. Sed accusantium quia dolores iure provident corporis modi. Dolorem molestiae expedita debitis magni autem. Et esse temporibus fugiat praesentium.',12,'N','apart'),(13,'Ortiz, Hirthe and Trantow','Voluptates nesciunt cumque ut alias aperiam. Dignissimos cumque id non. Illo assumenda perferendis est doloribus. Rerum et rerum beatae qui dolor eum.',13,'Y','hotel'),(14,'Cummerata LLC','Velit aut aut est deleniti qui. Pariatur autem recusandae est id saepe non. Ut eum est itaque. Sunt numquam velit autem.',14,'Y','sight'),(15,'Kulas, Schumm and Schroeder','Itaque et quo eum perferendis explicabo iusto odit. Consequatur possimus et ut voluptatem est quis. Quia dolores recusandae accusamus iusto rerum molestias.',1,'Y','hotel'),(16,'Bednar, Cassin and Tillman','In voluptatem provident porro quibusdam dolore dolorem. Qui fuga nam vel aut non quo. Voluptates molestias nobis harum autem impedit. Necessitatibus qui itaque praesentium culpa aut fugiat quia praesentium. Dolorem odio atque nesciunt qui alias.',2,'N','apart'),(17,'Macejkovic LLC','Soluta repellat totam ullam velit ducimus id assumenda. Non unde dolor neque molestiae vero. Alias possimus porro ratione fuga. Ut hic blanditiis sint vel rerum minus corporis.',3,'Y','hotel'),(18,'Predovic-Torp','Ducimus quia nihil incidunt. Minus sunt voluptatem amet quidem vel quasi velit. Voluptatem optio dignissimos distinctio aut repellat sit omnis.',4,'Y','sight'),(19,'Schmeler-Hand','Soluta corporis perferendis perspiciatis reiciendis delectus. Aut fuga quo et praesentium ut voluptates sint. Iste consequuntur doloribus veritatis deleniti.',5,'N','sight'),(20,'Pouros Ltd','Adipisci eligendi rerum dolorum maxime tenetur velit. Vero id et delectus sed asperiores quos. Ea possimus consectetur ut accusamus.',6,'Y','apart'),(21,'Sawayn-Haag','Numquam consequatur qui est corrupti. Dolor culpa qui sed quasi. Id aut eos porro ipsa et sunt inventore.',7,'Y','apart'),(22,'Tillman, Larson and Berge','Asperiores nobis molestiae voluptas magnam asperiores tempora debitis. Enim autem voluptate dolorum nam veritatis autem ea. Minus expedita error quisquam doloremque voluptatibus. Aliquid nobis placeat similique dolores enim consequuntur quisquam.',8,'N','hotel'),(23,'Kirlin-Weber','Accusantium ut nesciunt soluta reprehenderit cupiditate. Minus nisi harum sapiente quod aspernatur consequuntur temporibus nobis. Distinctio voluptatum adipisci voluptatibus sed totam optio quo.',9,'N','sight'),(24,'Beer Ltd','Labore perferendis at aut quia ea temporibus atque voluptates. Architecto dolorem est qui nihil sunt nostrum ea. Eius dolore expedita aut voluptatem eum. Aperiam quo omnis eum quibusdam voluptatem. Saepe dolor necessitatibus et earum labore.',10,'N','hotel'),(25,'Pagac-Gottlieb','Dolorem et totam maiores. Rerum itaque officia sit corrupti cum nostrum sit tempore. Odit eum quo expedita asperiores.',11,'N','hotel'),(26,'McClure-Larkin','Voluptas commodi saepe illum exercitationem exercitationem. Est nulla consectetur laudantium nihil reprehenderit. Quibusdam harum voluptas quo ut qui et.',12,'N','sight'),(27,'Blick-Kuhlman','Minus doloribus quis cum magni molestias odit. Minus est ut iure laborum cupiditate reprehenderit veniam unde. Magni delectus enim aliquam cum qui. Culpa molestiae perferendis qui eveniet sequi enim non iure.',13,'Y','sight'),(28,'Schroeder, Erdman and Ernser','Quod ut voluptatem tempore blanditiis odio molestiae debitis. Expedita quam commodi cumque rem repellat quia quia. Facere voluptatem dolor nihil ut non expedita aliquam.',14,'N','apart'),(29,'Feeney Group','Voluptatem deserunt illo illo voluptate ut autem magnam. Molestiae non dolores aut nisi qui blanditiis ducimus. Unde ut quo repellat praesentium at eius error velit.',1,'N','hotel'),(30,'Heidenreich Group','Tenetur libero quas et magni. Quisquam ipsam suscipit qui dolor. Veritatis aut mollitia aliquam vel. Esse dolorem ratione ex at officia magni non.',2,'Y','sight'),(31,'Kovacek Ltd','Rem deserunt consequatur consequatur vitae accusantium reiciendis dolores corporis. Odit reprehenderit asperiores eos sapiente vel ad dolores. Soluta voluptatem alias inventore quia velit.',3,'N','apart'),(32,'Kreiger LLC','Unde sit cum et amet tempore excepturi suscipit. Rerum voluptatum odit et reiciendis sit dolorem quidem deleniti. Consectetur eaque eum possimus nihil delectus aperiam libero.',4,'Y','hotel'),(33,'Wolf, Lemke and Brown','Inventore et velit sed aut qui similique maiores. Est enim rerum et laborum corrupti dolore quis. Velit amet nemo at saepe.',5,'N','sight'),(34,'Ryan-Bayer','Aperiam harum nam alias in autem. Voluptas eaque nihil eos voluptas dolores dolorum eligendi. Enim et et iure possimus. Pariatur velit veniam perspiciatis nihil similique quae. Commodi eum rerum quibusdam impedit nesciunt non.',6,'N','sight'),(35,'Huels, Ortiz and Jacobi','Eum explicabo optio sit. Nihil quibusdam sint distinctio blanditiis minus.',7,'Y','sight'),(36,'Shanahan Group','Voluptatem sunt vel cum assumenda fugit et. Ea consequatur alias et dolorum. Aspernatur nostrum eos iste labore eius aut autem at.',8,'Y','hotel'),(37,'Spencer-Thompson','Minima animi animi dignissimos dolorum nostrum qui ex. Rem facere blanditiis in velit sunt et. At iste quae temporibus tenetur consequatur autem minima. Consequatur voluptate nam magni.',9,'Y','apart'),(38,'Kautzer-Reinger','Sapiente repudiandae sed officia minus quo. Ut enim eius et qui. Consequatur ut rem reprehenderit magni.',10,'Y','sight'),(39,'Renner Group','Explicabo omnis at sed id repellendus sit repudiandae. Ducimus ipsum autem nam quos. Praesentium est deserunt minus perferendis. Officiis aliquam at illo omnis vel in occaecati nihil. Laudantium totam aut dolores facilis.',11,'N','sight'),(40,'Kihn Group','Iure sed et porro quasi illum ea deserunt nam. Et et recusandae illo facere. Earum excepturi facilis officiis et.',12,'Y','apart'),(41,'Hyatt, Stamm and Herman','Quisquam beatae expedita quidem quo ex qui aut. Sapiente ea corporis voluptatem expedita et eum. Nemo ipsa incidunt aut quia voluptatem vel. Quia corrupti ipsum consequuntur eaque ut odio inventore reprehenderit.',13,'N','sight'),(42,'Oberbrunner-Cole','In ab fuga adipisci quia itaque sint magnam. Distinctio quidem nulla neque et quidem illum consequatur. Suscipit illum omnis aperiam accusantium facilis architecto.',14,'Y','apart'),(43,'VonRueden LLC','Maiores molestias explicabo dolorem rerum cupiditate expedita est. Aut velit corporis et perspiciatis autem. Incidunt unde quaerat et at aut et officiis.',1,'Y','apart'),(44,'Huel-Kulas','Quas velit aut dicta aliquam. Magni earum nisi optio vel sint. Aspernatur est consequuntur eos et beatae. Quidem harum et ad.',2,'N','hotel'),(45,'Wolff, Braun and Lang','Autem hic quaerat reiciendis odio ab impedit. At accusamus dolorem qui et omnis corrupti. Maxime aut dolorem saepe magni. Quo ea dolorum molestiae ut qui. Dolorem nulla inventore excepturi ut porro numquam.',3,'N','hotel'),(46,'Feeney and Sons','At quia ut eum. Soluta id et aspernatur inventore laudantium deleniti.',4,'N','apart'),(47,'Kshlerin-Gusikowski','Cum dolore sint facilis quis rerum itaque eaque. Eligendi error incidunt consequatur numquam. Ullam delectus sequi aut aut ad. Voluptatem expedita quas asperiores animi atque iure at.',5,'N','sight'),(48,'Nitzsche, Durgan and Moore','Eos non dolor occaecati vero voluptates. Est excepturi doloremque in et. Sunt eius delectus tempora velit nostrum voluptas. Qui eligendi ut quaerat.',6,'N','apart'),(49,'Goldner-Frami','Nemo perferendis vel dolorem quam ut voluptate animi. Molestias laborum quam eius molestiae. Mollitia corporis qui odit.',7,'Y','sight'),(50,'Stanton-Abshire','Quidem laboriosam maxime aut ex exercitationem sed cupiditate quas. Voluptatem quidem vel et. Necessitatibus ipsa porro sint vitae esse.',8,'N','hotel'),(51,'Buckridge Group','Ea voluptas aperiam vero nihil a. Cumque numquam harum rerum non dignissimos ratione. Tenetur et porro cupiditate voluptatibus quia ducimus qui quidem. Porro consectetur magnam ut aut aut exercitationem aliquam.',9,'N','apart'),(52,'Nader-Streich','Ducimus ea ea quia debitis. Et voluptas ipsa dolorum eos. Qui non deleniti dicta veritatis reprehenderit et nihil. Quia cum non iste aliquid provident modi.',10,'Y','sight'),(53,'Greenfelder Group','Voluptatum adipisci ut reprehenderit optio voluptatum. Perspiciatis ut aut eius est assumenda omnis. Expedita vero velit aut minus. Possimus et ab et sint.',11,'N','apart'),(54,'Prosacco-Abshire','Nisi ex asperiores voluptas illum. Quia accusamus blanditiis fuga animi assumenda. Deserunt eum vel iusto et.',12,'Y','apart'),(55,'Schultz-Crona','Quis aut voluptates eum non ducimus hic. Rerum quidem eum dolor non fugiat earum. In quia quidem ut. Sequi sint minus perspiciatis sit non.',13,'Y','sight'),(56,'Tremblay, D\'Amore and Olson','Laborum quos voluptate accusantium voluptas porro veniam. Quia ratione neque velit delectus. Ipsa et dicta non at velit rerum minima.',14,'Y','hotel'),(57,'Kihn-Green','Dolore dicta qui fugiat aspernatur. Et vel fugit adipisci. Aliquid magni iste at ipsam quia corporis. Commodi facilis sint atque molestiae odio vero.',1,'Y','sight'),(58,'Stokes-Moore','Nisi maiores provident facere ad. Qui quaerat voluptas dolores ut numquam repudiandae. Est ut voluptatum alias eum. Doloremque ea velit recusandae suscipit sint voluptate voluptate.',2,'N','hotel'),(59,'Dooley-Johnson','Deserunt illum harum quisquam numquam officia sit doloremque. Optio nemo iure quas maiores nihil ratione. Expedita optio officia quia qui enim enim. Perspiciatis praesentium dolorem aut quidem rerum est laboriosam.',3,'Y','apart'),(60,'Towne-Feest','Impedit earum culpa non soluta non atque id. Vero placeat possimus omnis ut fuga sed veritatis. Ex quae dolorem officia sit.',4,'Y','apart'),(61,'Dietrich Inc','Non consequatur voluptas dolor qui. Velit harum qui quos et expedita.',5,'N','sight'),(62,'Ullrich, Harris and D\'Amore','In enim voluptatem et nostrum. Consequuntur veritatis nemo non sit veritatis. Quia modi dolorum suscipit est adipisci quidem. Commodi vel quasi accusantium recusandae id.',6,'N','apart'),(63,'Padberg, Lemke and Borer','Qui unde adipisci mollitia autem atque hic autem. Eos aliquam molestias nihil in voluptas delectus. Ut enim dolores exercitationem. Saepe aut rerum delectus rerum laboriosam ea.',7,'N','apart'),(64,'Buckridge, Greenfelder and Mills','Beatae magnam ut recusandae. Et ut tempora facilis hic. Temporibus soluta numquam aut magni qui voluptatem. Fuga quibusdam consectetur doloribus dolorum dolor.',8,'N','apart'),(65,'Mosciski, Wehner and Nikolaus','Est omnis qui tempore dolorem sunt in repellendus id. Ut similique aut numquam sit tempora eligendi hic. Ratione voluptatem et dolorem sit.',9,'N','apart'),(66,'Cormier, Block and Feil','Tenetur expedita rerum dolor molestiae. Molestiae ea nihil facere ea quia. Consequuntur aut velit ab natus.',10,'N','sight'),(67,'Feest-Runte','Aliquam architecto qui adipisci fuga aut consequatur. Dolorem quo placeat odit et. Voluptas ut et deserunt ipsum distinctio. Officia ut voluptas harum recusandae aut sunt.',11,'N','apart'),(68,'Fritsch Ltd','Explicabo aut fugit omnis nisi est. Deleniti nisi quia et. Et sit modi reprehenderit sint quia minima neque. Voluptatem est consequatur voluptas. Quis maxime sed consequuntur facilis eveniet voluptas nemo.',12,'N','sight'),(69,'Ruecker, Littel and Littel','Quasi et aut et ut nemo architecto. Distinctio beatae culpa dolores autem quo. Fugit quia et voluptatem accusamus qui. Doloremque assumenda ab ut ut est aut.',13,'N','hotel'),(70,'Kassulke Group','Natus esse sequi cumque dicta. Vero omnis voluptas saepe mollitia ut totam. Aliquam omnis excepturi molestiae sit dolore dolorem voluptatibus amet. Autem a ipsum facilis nihil ab.',14,'N','sight'),(71,'DuBuque Ltd','Vero qui distinctio quibusdam est est. Sint ut iure omnis velit consequatur. Consequatur accusantium ex est repellat id aut. Iusto est et quae enim.',1,'N','apart'),(72,'Heaney-Muller','Perferendis quas odit dolore nulla. Exercitationem quisquam ratione aut numquam deserunt. Enim eos molestias et est ea cumque provident ut.',2,'N','hotel'),(73,'Jacobi, Nader and Feil','Eos pariatur aut maiores deserunt quibusdam illum. Voluptate officia ea illo voluptatibus. Placeat aut recusandae qui autem quibusdam ipsa nostrum. Molestiae et qui beatae ut.',3,'N','apart'),(74,'Green, Hermann and O\'Hara','Occaecati et sit suscipit. At qui ut occaecati nemo atque aliquid. Et nemo minus minus. Ex quaerat tenetur iusto architecto tempora doloribus amet ut.',4,'N','apart'),(75,'Buckridge-Torphy','Est dolores vel saepe voluptatum numquam odio. Esse sint autem dolores quo natus neque. Tenetur voluptatem fuga dignissimos iure.',5,'Y','sight'),(76,'Rosenbaum, Rolfson and Leffler','Quae nam architecto facere quaerat. Consequuntur corporis est aut et. Iure ut modi molestias sunt. Rerum veritatis totam accusamus consectetur. Eius sequi et in aliquam nesciunt esse ut.',6,'N','hotel'),(77,'Zulauf and Sons','Consequuntur architecto et et omnis ea aperiam. Amet ipsa sapiente corrupti dignissimos sint et sint. Sed quia eius alias nam et. Debitis non vero eum earum voluptas enim.',7,'N','hotel'),(78,'Moen, Raynor and Conroy','Dolor saepe optio eveniet aut. Et ut sit sed sint voluptate qui consequatur laboriosam. Laboriosam ut rerum fuga molestiae. Officia vitae modi in asperiores sit est.',8,'Y','apart'),(79,'Kirlin-Sipes','Voluptate ea nisi autem dolorum quo eos est. Perspiciatis rem nulla cum. Dolores voluptate illo ad quia cumque. Mollitia rem eos ipsum voluptas.',9,'Y','sight'),(80,'Kris and Sons','Unde rerum atque enim animi officia nisi odit dignissimos. Rerum autem nihil nihil iusto.',10,'Y','hotel'),(81,'Schamberger Ltd','Animi nesciunt voluptate eaque reprehenderit molestias. Minima est qui aut voluptas. A architecto ex optio saepe.',11,'Y','hotel'),(82,'Koss Ltd','Maiores non velit vero rerum et corrupti ad. Quidem occaecati dignissimos aut ad sit rerum a qui.',12,'Y','apart'),(83,'Blick Inc','Nesciunt vitae deserunt harum tempora sunt. Nostrum nihil ad et similique aut. Fugiat est voluptas dolorum. Inventore et tenetur itaque fuga.',13,'Y','apart'),(84,'Quitzon-Durgan','Quod tempore ea atque ipsa. Blanditiis non nesciunt nihil rerum. Velit quas veniam accusamus dolorum necessitatibus. Quis et nulla eaque voluptas.',14,'N','hotel'),(85,'Howell-Dooley','Ut est consequatur nihil odit in. Nam earum laudantium non neque perspiciatis repellat illo. Non repellat qui rerum voluptatibus ut et. Ut dicta in consequatur quis saepe accusantium quae earum.',1,'Y','apart'),(86,'Heidenreich and Sons','Odit est dolorem vel non. Magni quisquam molestiae impedit corporis. Velit voluptas sunt aliquid eius quae error ratione animi. Ex tenetur velit perferendis.',2,'Y','apart'),(87,'Lesch PLC','Consequatur fuga natus sed eos velit rerum cum. Debitis possimus consequatur aut aliquid et. Neque modi esse quaerat magnam. Rerum architecto aspernatur doloribus animi provident et iusto.',3,'N','hotel'),(88,'Satterfield-Marquardt','Est tempora delectus commodi similique nam ipsam quidem. Modi corporis non dolor eaque. Ea ratione repellat nobis dolorem perspiciatis iste veniam cumque.',4,'N','hotel'),(89,'Dickinson-Kautzer','Quo dicta est est eveniet quo porro eius. Modi totam quo id optio non perferendis non. Eaque nesciunt quo ea mollitia qui praesentium. Quaerat non enim dolores sed odit illum omnis ut.',5,'Y','hotel'),(90,'Waelchi PLC','Est est ut eveniet velit totam atque. Enim est ipsum sint dolor amet. Aliquid repellat atque assumenda et neque sequi.',6,'N','apart'),(91,'Larkin Inc','Placeat fugit molestiae repellendus. Id qui temporibus natus rem enim.',NULL,'N','sight'),(92,'Bode, Feest and Johns','Autem ad amet numquam amet sed nemo. Eius ut dolore quas beatae nesciunt ut. Impedit aut similique in. Doloribus tenetur optio recusandae iusto corrupti laudantium laudantium eius.',8,'Y','hotel'),(93,'Mayert-Wilderman','Doloremque veniam occaecati et quis fuga nesciunt. Rem quis ducimus saepe commodi officiis similique. Sed eius asperiores accusamus enim.',9,'Y','apart'),(94,'Stracke LLC','Reprehenderit eligendi est excepturi atque nulla. Quod ea aut corporis ratione odio laudantium eius. Numquam velit voluptate sint aspernatur nostrum atque. Facilis nisi voluptas vitae esse ut aperiam dicta laborum. Aut quam cumque qui laboriosam rem.',10,'Y','hotel'),(95,'Kris-Ortiz','Et sit et beatae qui perspiciatis est eum. Illum culpa et consequatur et incidunt omnis reprehenderit. Quae deleniti dolor blanditiis hic tenetur occaecati. Ex minus esse facilis consequatur. Hic ut autem placeat excepturi.',NULL,'N','hotel'),(96,'Jenkins-Deckow','Fugit alias voluptatem placeat quia quidem deleniti. Omnis at architecto ratione quod natus. Odit dolores quod eius commodi et sit. Delectus debitis quis repellendus.',12,'Y','hotel'),(97,'Schultz-Kirlin','Reiciendis blanditiis aut id est ipsam alias expedita. Laborum ut culpa maxime dolorem aliquid libero rerum. Error recusandae explicabo odio officia. Adipisci aut omnis non molestias sed.',13,'Y','sight'),(98,'Bauch-Ruecker','Dolorem aut consequuntur quod sed esse officia. Non qui magnam sit qui sit. Quaerat molestiae necessitatibus dolores exercitationem doloribus qui. Esse quaerat quibusdam magnam eaque delectus debitis qui.',14,'N','apart'),(99,'Nienow Inc','Labore voluptatum voluptatem molestiae fugit omnis illum sit. Praesentium id similique esse cum et magni. Repellat voluptatibus facere modi ut.',1,'Y','apart'),(100,'Jerde, Kautzer and Kertzmann','Reprehenderit rerum dolorem laboriosam at est. Omnis debitis consequatur eaque nihil harum voluptatem laboriosam. Voluptatem fuga nam nam aspernatur molestias tempora. Soluta consequuntur maxime temporibus et.',2,'Y','sight'),(110,'Fusion express11','DESCRIPTION',1,'N','hotel');
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `on_add_object` AFTER INSERT ON `s_object` FOR EACH ROW UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT + 1 WHERE s_city.ID = NEW.CITY_ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `on_update_object` AFTER UPDATE ON `s_object` FOR EACH ROW IF OLD.CITY_ID != NEW.CITY_ID THEN
	UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT - 1 WHERE s_city.ID = OLD.CITY_ID;
	UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT + 1 WHERE s_city.ID = NEW.CITY_ID;
    END IF */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`127.0.0.1`*/ /*!50003 TRIGGER `on_delete_object` AFTER DELETE ON `s_object` FOR EACH ROW UPDATE s_city SET OBJECTS_CNT = OBJECTS_CNT - 1 WHERE s_city.ID = OLD.CITY_ID */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `s_object_clicks`
--

DROP TABLE IF EXISTS `s_object_clicks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_object_clicks` (
  `OBJECT_ID` int DEFAULT NULL,
  `BOOKING_SYSTEM_ID` int DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `CLICKS` int DEFAULT NULL,
  KEY `s_object_clicks_s_booking_ID_fk` (`BOOKING_SYSTEM_ID`),
  KEY `s_object_clicks_s_object_ID_fk` (`OBJECT_ID`),
  CONSTRAINT `s_object_clicks_s_booking_ID_fk` FOREIGN KEY (`BOOKING_SYSTEM_ID`) REFERENCES `s_booking` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `s_object_clicks_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_object_clicks`
--

INSERT INTO `s_object_clicks` VALUES (1,2,'1980-03-02',1),(2,5,'1973-08-13',49),(3,6,'1977-07-27',87),(4,4,'1994-08-12',19),(5,4,'1972-01-22',65),(6,1,'1996-03-09',1),(7,2,'2003-12-20',94),(8,6,'2018-07-21',49),(9,3,'2001-04-11',38),(10,4,'1994-06-24',0),(11,1,'1991-01-13',8),(12,3,'1984-12-04',2),(13,3,'2002-01-30',91),(14,6,'1990-02-07',27),(15,1,'2005-02-28',13),(16,4,'1972-02-02',97),(17,5,'1992-11-23',85),(18,7,'2003-06-28',29),(19,2,'1989-05-07',17),(20,6,'2007-04-29',55),(21,5,'2004-08-11',82),(22,1,'1975-12-15',51),(23,2,'1989-03-15',44),(24,5,'1984-12-20',51),(25,4,'1988-08-12',70),(26,6,'1977-05-09',32),(27,7,'2013-02-07',51),(28,1,'1989-02-24',94),(29,5,'1973-03-15',78),(30,7,'2006-03-07',44),(31,6,'1992-10-11',73),(32,7,'1993-01-29',34),(33,5,'1983-09-15',25),(34,5,'1995-07-08',61),(35,3,'1974-04-14',91),(36,1,'1979-07-06',56),(37,5,'1973-10-07',34),(38,5,'2005-07-31',77),(39,7,'2003-07-02',56),(40,1,'1985-03-19',6),(41,1,'1976-01-08',74),(42,7,'1971-11-19',79),(43,4,'1995-09-28',29),(44,4,'2017-06-16',64),(45,6,'2000-10-28',29),(46,4,'1978-02-03',97),(47,7,'2016-03-06',1),(48,3,'2016-02-28',22),(49,4,'1971-04-18',9),(50,2,'2019-09-30',25),(51,2,'1976-11-02',45),(52,1,'2019-12-01',20),(53,3,'1988-06-26',75),(54,4,'2009-11-27',59),(55,6,'2019-10-02',18),(56,6,'2004-10-31',46),(57,3,'2005-08-29',65),(58,5,'1979-12-20',90),(59,6,'2002-02-03',85),(60,1,'1973-04-25',18),(61,4,'2020-02-16',11),(62,5,'2017-09-03',0),(63,7,'1994-06-16',51),(64,1,'2009-01-31',85),(65,3,'2017-11-18',35),(66,3,'2019-03-27',14),(67,2,'2005-06-15',4),(68,1,'2016-04-14',51),(69,1,'1972-01-07',76),(70,2,'2013-10-08',81),(71,1,'2018-03-20',74),(72,1,'2007-03-10',23),(73,2,'1984-02-07',5),(74,5,'2004-01-01',30),(75,4,'1987-08-30',63),(76,1,'1999-03-02',18),(77,1,'2001-06-14',0),(78,4,'2001-08-09',73),(79,3,'1994-02-25',31),(80,5,'1978-05-29',50),(81,6,'1971-08-11',0),(82,5,'2015-08-19',45),(83,6,'1977-12-16',98),(84,1,'2008-12-24',12),(85,2,'1991-10-28',56),(86,4,'1977-12-22',98),(87,6,'2002-05-04',38),(88,4,'1978-02-20',77),(89,1,'1996-10-19',53),(90,5,'1983-04-27',99),(91,4,'1972-08-03',73),(92,5,'1979-02-05',77),(93,2,'2017-06-08',4),(94,4,'1987-03-06',31),(95,6,'2006-10-10',61),(96,4,'1975-08-25',6),(97,6,'1991-01-05',82),(98,1,'2018-12-14',43),(99,5,'1999-04-03',21),(100,6,'2005-05-14',6),(1,2,'1994-11-22',32),(2,5,'2008-12-05',71),(3,7,'2006-09-26',27),(4,3,'2008-07-28',25),(5,3,'1992-01-10',50),(6,4,'1997-11-23',75),(7,3,'1999-01-24',59),(8,4,'2017-10-03',7),(9,1,'2009-11-01',50),(10,6,'1998-01-27',19),(11,1,'2003-05-17',88),(12,6,'1971-11-23',98),(13,4,'2002-10-21',23),(14,6,'1981-11-14',33),(15,6,'1978-11-24',40),(16,5,'2009-04-23',29),(17,2,'1993-06-08',61),(18,5,'2004-10-29',38),(19,2,'1983-11-02',36),(20,3,'1971-02-28',68),(21,2,'1988-10-10',76),(22,6,'1999-02-21',9),(23,1,'1971-03-14',6),(24,4,'1987-02-23',91),(25,2,'2007-01-15',68),(26,6,'2022-03-31',88),(27,1,'1999-12-05',10),(28,1,'1970-12-02',9),(29,6,'2015-09-10',8),(30,5,'2002-09-06',77),(31,6,'1988-11-30',21),(32,7,'1975-09-24',31),(33,3,'1976-05-15',9),(34,6,'1975-04-03',49),(35,3,'2020-01-21',81),(36,5,'1989-11-30',86),(37,2,'2017-02-05',25),(38,5,'2002-06-30',38),(39,1,'2006-06-18',7),(40,2,'1979-11-25',23),(41,4,'1990-03-15',16),(42,1,'2000-12-11',57),(43,1,'1971-07-12',25),(44,7,'1998-09-24',13),(45,6,'2008-09-26',0),(46,6,'1981-02-22',4),(47,5,'1996-01-30',96),(48,1,'2010-12-08',71),(49,4,'2018-06-21',5),(50,6,'2013-12-18',28),(51,4,'2002-05-17',80),(52,5,'2017-03-26',34),(53,5,'2008-01-16',97),(54,4,'1998-08-05',56),(55,2,'1978-01-26',97),(56,6,'1990-03-21',7),(57,3,'2016-04-06',82),(58,2,'1981-12-26',69),(59,7,'1998-04-11',5),(60,2,'2003-03-02',34),(61,6,'2006-11-22',21),(62,6,'1996-06-09',12),(63,2,'1977-09-09',10),(64,1,'1973-03-16',29),(65,4,'1988-02-26',75),(66,4,'1997-01-08',22),(67,5,'2011-06-26',98),(68,6,'1999-05-07',66),(69,2,'1982-12-02',59),(70,5,'2022-02-12',8),(71,1,'1992-09-07',48),(72,5,'1985-07-13',82),(73,6,'1997-05-27',77),(74,1,'2008-12-30',57),(75,5,'1970-03-16',62),(76,5,'1975-08-13',18),(77,7,'2018-06-13',35),(78,2,'1984-04-11',97),(79,6,'2016-10-01',99),(80,3,'1983-03-28',38),(81,1,'2013-12-17',6),(82,2,'1978-09-17',19),(83,7,'1975-04-19',35),(84,5,'1987-11-30',42),(85,6,'1979-05-17',18),(86,1,'1987-05-18',62),(87,4,'2000-05-24',31),(88,2,'2012-04-16',61),(89,3,'2008-04-30',75),(90,4,'2005-04-15',69),(91,3,'1977-03-16',90),(92,1,'2012-06-02',32),(93,2,'1988-02-27',5),(94,4,'1976-04-28',69),(95,2,'1980-04-28',88),(96,5,'1995-04-08',80),(97,1,'2002-01-04',55),(98,7,'1978-07-01',42),(99,4,'1992-08-27',47),(100,2,'2001-08-31',13),(1,4,'1982-04-06',34),(2,4,'1973-06-21',45),(3,7,'1982-04-06',69),(4,3,'2000-04-01',42),(5,4,'1977-08-13',48),(6,4,'1999-01-09',35),(7,7,'2003-04-26',46),(8,3,'1975-04-26',45),(9,6,'2015-09-26',88),(10,5,'2009-05-28',29),(11,5,'2018-12-26',91),(12,7,'1977-04-20',84),(13,7,'2014-06-27',99),(14,5,'2018-02-07',36),(15,5,'2016-01-06',85),(16,6,'1984-09-27',24),(17,6,'1995-06-26',14),(18,2,'1973-07-11',62),(19,7,'1999-06-02',22),(20,1,'2003-04-19',84),(21,5,'2019-08-11',57),(22,3,'1991-07-30',70),(23,2,'2015-07-15',56),(24,6,'1971-08-18',7),(25,7,'1992-04-20',89),(26,3,'1986-10-23',73),(27,4,'2018-09-21',42),(28,7,'2008-12-23',96),(29,2,'2019-02-14',68),(30,7,'2022-01-08',35),(31,2,'1974-01-10',67),(32,6,'1975-01-03',94),(33,3,'2011-09-30',97),(34,1,'1985-10-01',54),(35,2,'2019-03-15',73),(36,6,'2004-06-09',32),(37,5,'2016-05-20',3),(38,1,'1983-08-28',94),(39,2,'2003-07-06',95),(40,4,'1970-05-17',20),(41,6,'2014-06-20',61),(42,7,'1972-10-24',77),(43,3,'1974-06-22',42),(44,5,'2000-11-25',72),(45,4,'2003-12-06',71),(46,1,'2016-02-11',70),(47,4,'1976-08-04',65),(48,3,'2018-07-01',27),(49,2,'2000-06-25',10),(50,3,'2003-10-24',78),(51,3,'2022-08-08',65),(52,6,'2001-05-16',10),(53,6,'1972-12-10',24),(54,5,'1992-10-29',8),(55,5,'2003-04-06',98),(56,5,'1978-01-16',24),(57,7,'1995-02-26',20),(58,1,'1995-01-07',74),(59,4,'1984-05-12',68),(60,2,'1973-07-12',90),(61,7,'2013-01-24',30),(62,5,'1979-03-02',18),(63,1,'2001-11-02',33),(64,2,'1989-03-12',97),(65,6,'2001-07-01',65),(66,2,'1986-01-13',80),(67,1,'1980-12-12',22),(68,4,'2013-12-04',43),(69,3,'2018-08-07',54),(70,2,'2002-06-29',66),(71,7,'2007-05-13',9),(72,1,'2011-09-07',77),(73,1,'2021-08-29',11),(74,3,'1994-08-02',77),(75,5,'2015-06-18',40),(76,5,'1970-11-26',43),(77,3,'2012-06-11',42),(78,2,'2021-12-25',50),(79,7,'2004-05-22',5),(80,5,'2004-06-13',34),(81,4,'1987-07-22',12),(82,3,'2020-05-05',86),(83,4,'1978-04-10',89),(84,2,'1983-10-02',7),(85,7,'2002-01-31',33),(86,1,'1982-11-24',14),(87,7,'1987-12-13',9),(88,7,'1982-09-30',60),(89,1,'2022-04-22',47),(90,3,'1999-11-07',29),(91,2,'1986-10-06',69),(92,7,'1980-11-21',58),(93,1,'1990-05-23',94),(94,2,'2010-02-11',99),(95,2,'1971-09-30',94),(96,6,'2020-04-05',8),(97,3,'2012-02-17',95),(98,3,'1994-10-04',54),(99,3,'2006-06-23',18),(100,5,'1972-07-24',25),(1,4,'1971-07-11',16),(2,2,'1977-08-03',45),(3,6,'1998-08-01',34),(4,5,'1984-11-11',41),(5,5,'1970-10-23',8),(6,4,'2017-05-15',64),(7,3,'2000-06-09',3),(8,7,'2012-06-02',46),(9,5,'2021-03-24',82),(10,2,'1991-09-05',65),(11,5,'2005-11-19',13),(12,1,'1981-06-19',15),(13,4,'2012-07-20',91),(14,1,'2002-02-05',42),(15,3,'2003-09-20',24),(16,4,'1982-12-31',96),(17,1,'2018-05-22',62),(18,2,'2005-08-31',3),(19,3,'1976-08-19',2),(20,1,'2017-05-10',83),(21,5,'1970-12-30',50),(22,4,'2012-04-28',82),(23,1,'1985-11-23',42),(24,6,'1990-12-07',37),(25,6,'1994-10-10',74),(26,3,'2010-06-25',83),(27,5,'1987-06-25',11),(28,2,'1970-12-02',72),(29,5,'2014-03-05',70),(30,7,'1988-07-14',26),(31,7,'1976-10-31',21),(32,2,'2000-06-28',44),(33,2,'1984-07-08',62),(34,5,'2002-03-13',17),(35,7,'1996-01-16',56),(36,6,'1991-04-07',49),(37,1,'1987-01-03',97),(38,2,'1991-09-23',7),(39,6,'2016-09-08',35),(40,5,'2011-07-09',88),(41,4,'2001-02-21',23),(42,3,'2019-07-11',92),(43,6,'1997-12-07',95),(44,1,'1974-05-26',26),(45,3,'1991-06-03',69),(46,2,'2007-04-24',47),(47,4,'1977-08-15',16),(48,3,'1997-04-09',24),(49,4,'2015-05-18',96),(50,7,'1987-12-19',3),(51,4,'2019-08-20',60),(52,2,'1973-09-13',7),(53,3,'2012-02-23',89),(54,5,'1983-09-21',83),(55,7,'1996-12-25',31),(56,1,'1999-12-22',29),(57,1,'2005-03-07',44),(58,4,'1981-09-02',84),(59,3,'2001-05-02',62),(60,5,'1986-03-28',83),(61,3,'1987-07-26',98),(62,2,'1997-01-25',25),(63,7,'1985-08-20',58),(64,4,'2000-08-15',12),(65,6,'1986-02-25',90),(66,6,'1991-03-29',23),(67,2,'2019-11-30',21),(68,6,'1976-07-02',7),(69,1,'2008-01-09',33),(70,7,'2006-08-15',84),(71,4,'2006-04-07',14),(72,4,'2011-12-08',67),(73,3,'1972-01-19',27),(74,2,'2015-03-14',8),(75,4,'2014-03-06',5),(76,5,'1986-11-29',16),(77,4,'2003-10-20',63),(78,7,'1991-07-05',54),(79,1,'1983-08-18',1),(80,7,'2003-08-09',63),(81,6,'1989-08-21',95),(82,5,'1981-11-25',44),(83,1,'1982-12-06',62),(84,2,'1999-09-19',91),(85,3,'2021-03-25',78),(86,1,'2021-02-25',67),(87,3,'2009-05-18',6),(88,3,'2001-03-19',27),(89,4,'2007-12-11',43),(90,5,'1973-03-02',96),(91,1,'1974-04-03',73),(92,6,'1990-08-07',25),(93,6,'1990-08-31',98),(94,1,'1971-01-15',99),(95,3,'1980-07-19',85),(96,5,'1982-09-15',5),(97,6,'1997-07-29',17),(98,5,'1989-06-10',99),(99,3,'1971-02-25',19),(100,7,'1994-02-06',5);

--
-- Table structure for table `s_object_owner`
--

DROP TABLE IF EXISTS `s_object_owner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_object_owner` (
  `OBJECT_ID` int DEFAULT NULL,
  `USER_ID` int DEFAULT NULL,
  KEY `s_object_owner_s_object_ID_fk` (`OBJECT_ID`),
  KEY `s_object_owner_s_user_ID_fk` (`USER_ID`),
  CONSTRAINT `s_object_owner_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `s_object_owner_s_user_ID_fk` FOREIGN KEY (`USER_ID`) REFERENCES `s_user` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_object_owner`
--

INSERT INTO `s_object_owner` VALUES (1,26),(2,6),(3,5),(4,34),(5,34),(6,29),(7,37),(8,18),(9,10),(10,39),(11,32),(12,19),(13,2),(14,33),(15,15),(16,25),(17,8),(18,24),(19,27),(20,3),(21,36),(22,18),(23,13),(24,7),(25,16),(26,7),(27,38),(28,21),(29,16),(30,19),(31,18),(32,1),(33,25),(34,22),(35,34),(36,18),(37,10),(38,31),(39,36),(40,19),(41,30),(42,28),(43,38),(44,31),(45,20),(46,12),(47,15),(48,27),(49,36),(50,2),(51,29),(52,32),(53,20),(54,1),(55,38),(56,35),(57,8),(58,36),(59,16),(60,23),(61,15),(62,33),(63,24),(64,39),(65,14),(66,17),(67,17),(68,23),(69,7),(70,12),(71,2),(72,37),(73,40),(74,40),(75,27),(76,19),(77,12),(78,1),(79,6),(80,7),(81,3),(82,34),(83,39),(84,22),(85,35),(86,36),(87,16),(88,3),(89,32),(90,31),(91,25),(92,6),(93,24),(94,8),(95,5),(96,37),(97,25),(98,22),(99,20),(110,15);

--
-- Table structure for table `s_object_phone`
--

DROP TABLE IF EXISTS `s_object_phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_object_phone` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int DEFAULT NULL,
  `VALUE` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_phone_s_object_ID_fk` (`OBJECT_ID`),
  CONSTRAINT `s_phone_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=189 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_object_phone`
--

INSERT INTO `s_object_phone` VALUES (1,33,'688-987-2317'),(2,31,'096.802.3836x98897'),(3,71,'184.431.1762'),(4,47,'(382)075-4844x810'),(5,2,'370-498-0624'),(6,95,'09535195525'),(7,18,'1-949-273-2882x8396'),(8,71,'1-080-336-0400x577'),(9,32,'969-652-3625x148'),(10,38,'(675)838-6301'),(11,94,'1-486-586-3233x04779'),(12,56,'(051)323-9511'),(13,73,'197.682.4361x234'),(14,58,'1-552-276-1330x63741'),(15,79,'04793043240'),(16,16,'1-801-131-8196x14909'),(17,97,'(541)345-1322'),(18,77,'1-942-451-5052'),(19,27,'197-463-8150'),(20,29,'1-963-409-7050'),(21,59,'03669874616'),(22,92,'1-519-815-7229x399'),(23,54,'(002)275-8495x78120'),(24,43,'935-659-7175x2980'),(25,30,'(203)797-2459'),(26,38,'(490)631-1883'),(27,51,'+43(8)0956780867'),(28,21,'595.048.9808x09216'),(29,57,'(236)828-4558'),(30,31,'+24(7)8182101076'),(31,11,'1-629-800-5926'),(32,90,'1-415-245-1543'),(33,61,'+92(7)7012543448'),(34,82,'769.682.0121x444'),(35,37,'772-359-5548x8127'),(36,63,'134.201.4998x077'),(37,76,'(206)493-6490'),(38,54,'07704625376'),(39,33,'+84(1)8468239688'),(40,8,'859-122-3976x99048'),(41,91,'419.703.1389x8105'),(42,27,'680-869-8634x163'),(43,63,'(014)689-8671'),(44,64,'166-548-6263'),(45,84,'(406)689-7355x91168'),(46,42,'+16(6)5655007360'),(47,79,'1-368-892-8910x9968'),(48,80,'669.841.0036'),(49,19,'506.533.3706x09678'),(50,6,'1-351-529-2685x9803'),(51,9,'1-799-658-3615x23162'),(52,78,'434-677-1062x441'),(53,97,'635.709.3800'),(54,62,'1-175-824-3814x606'),(55,20,'703.963.7820x7107'),(56,26,'853-764-4802x9338'),(57,99,'1-837-344-7192x9800'),(58,71,'(497)383-0755x097'),(59,47,'+76(3)6213303801'),(60,56,'881-003-2818'),(61,1,'04665411923'),(62,58,'472.625.8562'),(63,46,'(097)797-5937x987'),(64,62,'(821)731-2356x406'),(65,40,'1-456-208-0465x7579'),(66,82,'747.230.7024x043'),(67,24,'(891)550-1159'),(68,16,'(650)211-6741'),(69,36,'1-691-191-3663x591'),(70,57,'143-592-7805x337'),(71,23,'(092)958-3402x728'),(72,27,'(159)781-4258'),(73,83,'994-577-6822x6995'),(74,85,'(071)052-1198x180'),(75,90,'285-005-8340x343'),(76,67,'(714)964-6735'),(77,27,'811-734-8865'),(78,68,'+02(9)1989741791'),(79,47,'07749674847'),(80,45,'1-640-813-9682x170'),(81,74,'+30(5)0666905544'),(82,55,'954-108-6405x95214'),(83,22,'+35(1)7585632350'),(84,70,'740.691.6262'),(85,17,'233-727-7318x5051'),(86,42,'1-157-225-8992'),(87,96,'(484)882-0080x42599'),(88,15,'1-241-435-4296x1919'),(89,12,'967-366-1620'),(90,43,'602-567-6744x747'),(91,71,'1-216-795-0236x9665'),(92,13,'05489274919'),(93,100,'1-417-918-1174'),(94,16,'1-519-313-3299x6878'),(95,74,'493.793.1831x9647'),(96,39,'816.684.1477'),(97,97,'(210)700-6925x182'),(98,98,'992-522-3190x19116'),(99,54,'238-096-0110x794'),(100,32,'263.724.0883x978'),(101,54,'(006)684-3795'),(102,77,'+07(0)4846145236'),(103,59,'332-637-3909x6241'),(104,37,'+58(2)6001773995'),(105,61,'(264)092-0145'),(106,48,'+22(4)6862011471'),(107,3,'1-858-505-6625x941'),(108,88,'+56(2)3365148939'),(109,16,'03789032122'),(110,49,'(078)882-0914x123'),(111,32,'+73(7)1887730335'),(112,89,'506-037-3346x760'),(113,4,'(550)438-9682x948'),(114,54,'694-760-9150x88917'),(115,58,'242-602-6227x6601'),(116,20,'(640)284-9333x036'),(117,95,'(984)293-6024x18925'),(118,54,'(367)254-1113'),(119,35,'+32(4)5946526866'),(120,7,'1-516-603-2257'),(121,96,'(952)029-8295'),(122,5,'690.738.3294'),(123,19,'068.048.0155'),(124,95,'302.199.2760x05624'),(125,21,'1-116-946-0844'),(126,93,'1-244-609-2777'),(127,34,'1-867-482-0304'),(128,17,'028-128-2322x02362'),(129,90,'983.034.6633x3661'),(130,88,'1-348-977-0009x895'),(131,49,'(512)910-1068'),(132,44,'+80(4)4985462268'),(133,64,'396.514.2878x57654'),(134,8,'05639420297'),(135,80,'(839)681-7943'),(136,25,'266-744-6650x085'),(137,55,'035-757-7666x119'),(138,82,'672.873.4228x055'),(139,12,'752.093.6820'),(140,70,'1-692-521-4799x323'),(141,30,'736.808.1546'),(142,44,'032.984.7697x758'),(143,58,'1-432-741-5199'),(144,33,'+31(4)6212302627'),(145,97,'(220)923-6490'),(146,16,'971-997-0629'),(147,53,'1-834-221-9229'),(148,91,'822.020.3018x70217'),(149,70,'+03(9)9102071443'),(150,87,'067.725.1034x6466'),(151,98,'187.137.2621x21476'),(152,65,'434-422-3659x584'),(153,91,'02969391303'),(154,16,'07480213238'),(155,60,'(517)182-7314'),(156,12,'(057)151-9308x9792'),(157,9,'+60(3)6323284693'),(158,94,'978-540-8149x24592'),(159,28,'02409103166'),(160,98,'1-262-290-2854x0294'),(161,81,'903.831.5442x629'),(162,77,'993-108-8427x10328'),(163,41,'01987259419'),(164,45,'(639)512-8345'),(165,84,'1-032-459-6999x27479'),(166,21,'+78(1)7061589861'),(167,70,'(318)617-6246x297'),(168,39,'+56(4)4732313335'),(169,2,'416-971-1291x470'),(170,81,'137.273.0133x850'),(171,8,'05520668550'),(172,32,'08027359598'),(173,24,'143-383-6417x48016'),(174,66,'+09(2)6574935773'),(175,65,'(921)909-0967'),(176,21,'1-712-441-8860x9479'),(177,81,'1-839-544-1583x32500'),(178,17,'1-504-301-1068x971'),(179,12,'942-224-7890'),(180,50,'(048)691-7943');

--
-- Table structure for table `s_object_service`
--

DROP TABLE IF EXISTS `s_object_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_object_service` (
  `OBJECT_ID` int DEFAULT NULL,
  `SERVICE_ID` int DEFAULT NULL,
  KEY `s_object_service_s_object_ID_fk` (`OBJECT_ID`),
  KEY `s_object_service_s_service_ID_fk` (`SERVICE_ID`),
  CONSTRAINT `s_object_service_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `s_object_service_s_service_ID_fk` FOREIGN KEY (`SERVICE_ID`) REFERENCES `s_service` (`ID`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_object_service`
--

INSERT INTO `s_object_service` VALUES (84,199),(15,44),(2,42),(76,246),(42,194),(1,51),(8,180),(1,154),(5,148),(61,107),(74,23),(71,136),(68,133),(9,165),(34,139),(81,45),(35,238),(35,92),(12,26),(36,133),(88,90),(74,238),(8,184),(57,31),(33,43),(55,14),(27,64),(60,235),(79,169),(60,31),(23,100),(30,145),(35,163),(95,117),(76,74),(100,158),(66,182),(59,183),(46,37),(86,196),(32,101),(84,146),(66,107),(52,111),(11,28),(57,83),(52,216),(91,215),(52,213),(33,67),(15,80),(90,200),(5,119),(54,126),(63,96),(29,236),(79,30),(53,110),(55,10),(89,161),(16,112),(98,166),(32,220),(53,206),(73,211),(9,219),(16,246),(68,51),(46,52),(71,21),(59,247),(3,93),(11,137),(81,162),(59,173),(30,185),(14,67),(40,112),(15,230),(28,219),(77,90),(75,231),(35,106),(13,201),(63,208),(89,54),(82,227),(59,230),(46,98),(57,10),(9,215),(78,55),(13,45),(67,67),(10,235),(14,215),(30,222),(78,160),(31,226),(45,234),(74,81),(15,137),(23,183),(47,171),(13,9),(72,51),(90,124),(43,4),(68,23),(28,192),(3,105),(63,81),(31,102),(97,153),(31,101),(55,10),(73,174),(59,239),(43,13),(64,137),(9,89),(75,244),(86,44),(99,131),(27,67),(30,73),(69,229),(62,246),(33,145),(60,158),(98,36),(67,177),(84,63),(67,66),(31,74),(81,97),(66,140),(37,126),(73,87),(3,248),(62,79),(29,74),(23,224),(28,138),(48,218),(18,113),(2,212),(16,213),(10,205),(12,100),(12,230),(79,191),(48,36),(27,51),(50,72),(20,26),(60,120),(40,208),(38,169),(38,211),(55,140),(30,140),(41,113),(41,125),(27,130),(90,95),(44,170),(15,228),(83,102),(12,78),(70,77),(42,74),(79,203),(13,39),(49,125),(100,7),(6,73),(59,115),(74,249),(96,2),(52,213),(39,237),(53,132),(86,87),(94,243),(66,157),(28,19),(92,16),(89,11),(22,91),(55,53),(40,150),(51,244),(6,60),(97,3),(25,120),(87,157),(43,98),(16,71),(74,22),(26,99),(72,133),(47,158),(59,88),(68,202),(72,53),(2,26),(81,130),(8,217),(76,11),(88,250),(53,185),(63,237),(13,195),(23,216),(87,120),(26,144),(1,181),(21,149),(8,220),(41,196),(9,105),(89,225),(94,241),(77,173),(1,160),(69,133),(38,78),(48,126),(9,176),(37,239),(19,156),(53,47),(35,184),(79,105),(62,47),(21,176),(61,22),(60,134),(6,91),(23,15),(1,228),(59,95),(22,16),(88,78),(77,62),(27,237),(87,198),(14,53),(53,230),(110,11),(110,15),(110,3);

--
-- Table structure for table `s_options`
--

DROP TABLE IF EXISTS `s_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_options` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_options`
--

INSERT INTO `s_options` VALUES (1,'database_version','11');

--
-- Table structure for table `s_props_apart`
--

DROP TABLE IF EXISTS `s_props_apart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_props_apart` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int DEFAULT NULL,
  `ROOMS` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_props_apart_s_object_ID_fk` (`OBJECT_ID`),
  CONSTRAINT `s_props_apart_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_props_apart`
--

INSERT INTO `s_props_apart` VALUES (1,92,2),(2,2,1),(3,74,1),(4,60,6),(5,24,6),(6,54,5),(7,36,3),(8,73,3),(9,100,1),(10,14,1),(11,50,1),(12,81,5),(13,14,6),(14,72,4),(15,24,2),(16,71,1),(17,70,1),(18,38,3),(19,20,4),(20,23,3),(21,25,3),(22,35,2),(23,64,4),(24,24,6),(25,44,6),(26,40,5),(27,99,3),(28,11,5),(29,33,4),(30,82,2),(31,65,6),(32,25,6),(33,84,3),(34,38,5),(35,85,6),(36,8,3),(37,92,4),(38,20,1),(39,81,5),(40,91,1);

--
-- Table structure for table `s_props_hotel`
--

DROP TABLE IF EXISTS `s_props_hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_props_hotel` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `STARS` tinyint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_props_hotel_s_object_ID_fk` (`OBJECT_ID`),
  CONSTRAINT `s_props_hotel_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_props_hotel`
--

INSERT INTO `s_props_hotel` VALUES (1,85,'Мини-отель',3),(3,36,'Бизнес-класс',4),(4,100,'Гостевой дом',5),(5,76,'Бизнес-класс',3),(6,70,'Бизнес-класс',5),(7,48,'Бизнес-класс',5),(8,15,'Бизнес-класс',3),(10,92,'Гостевой дом',5),(12,99,'Мини-отель',5),(13,67,'Гостевой дом',5),(14,54,'Бизнес-класс',3),(15,98,'Бизнес-класс',4),(16,50,'Мини-отель',3),(17,73,'Гостевой дом',3),(18,94,'Бизнес-класс',5),(19,40,'Бизнес-класс',4),(22,84,'Бизнес-класс',5),(23,14,'Мини-отель',4),(24,41,'Бизнес-класс',5),(27,77,'Гостевой дом',3),(28,44,'Гостевой дом',5),(29,81,'Гостевой дом',4),(30,43,'Гостевой дом',3),(31,87,'Бизнес-класс',5),(33,90,'Мини-отель',3),(34,22,'Мини-отель',5),(35,65,'Мини-отель',5),(36,66,'Мини-отель',3),(37,95,'Гостевой дом',3),(38,13,'Гостевой дом',3),(39,80,'Мини-отель',5),(40,10,'Гостевой дом',3);

--
-- Table structure for table `s_props_sight`
--

DROP TABLE IF EXISTS `s_props_sight`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_props_sight` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `OBJECT_ID` int DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `YEAR_FOUND` smallint DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `s_props_sight_s_object_ID_fk` (`OBJECT_ID`),
  CONSTRAINT `s_props_sight_s_object_ID_fk` FOREIGN KEY (`OBJECT_ID`) REFERENCES `s_object` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_props_sight`
--

INSERT INTO `s_props_sight` VALUES (1,96,'Парк',1965),(2,32,'Аквапарк',1996),(3,77,'Аквапарк',1996),(4,83,'Аквапарк',2007),(5,83,'Аквапарк',2006),(6,25,'Парк аттракционов',1988),(7,67,'Аквапарк',1998),(8,77,'Парк',1980),(9,55,'Музей',2014),(10,33,'Музей',1981),(11,65,'Парк',2014),(12,92,'Парк аттракционов',1961),(13,88,'Музей',1988),(14,92,'Аквапарк',1960),(15,44,'Музей',1973),(16,65,'Парк аттракционов',2013),(17,45,'Аквапарк',1989),(18,41,'Парк аттракционов',2001),(19,7,'Музей',1995),(20,56,'Аквапарк',2016),(21,63,'Парк аттракционов',1985),(22,30,'Парк аттракционов',1970),(23,78,'Парк аттракционов',2012),(24,31,'Музей',1969),(25,37,'Парк',1966),(26,62,'Музей',1999),(27,19,'Музей',1981),(28,28,'Парк',2001),(29,96,'Парк',2004),(30,17,'Парк',1998),(31,98,'Музей',1996),(32,91,'Аквапарк',2015),(33,49,'Парк аттракционов',1981),(34,75,'Парк',1970),(35,74,'Парк',1994),(36,31,'Аквапарк',1989),(37,99,'Музей',1985),(38,41,'Парк аттракционов',1995),(39,8,'Парк аттракционов',1974),(40,54,'Парк аттракционов',1975);

--
-- Table structure for table `s_region`
--

DROP TABLE IF EXISTS `s_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_region` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `REGION_CODE` int DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_region`
--

INSERT INTO `s_region` VALUES (1,'New Mexico',62),(2,'New York',47),(3,'Montana',16),(4,'Wyoming',29);

--
-- Table structure for table `s_service`
--

DROP TABLE IF EXISTS `s_service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_service` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=251 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_service`
--

INSERT INTO `s_service` VALUES (1,'Gusikowski Inc','Qui quas nihil dolorem facere nulla occaecati. Libero et sapiente nemo libero id.'),(2,'Huels Inc','Sunt id laborum sunt non placeat. Veniam rerum eum eum aut quis maxime aliquam.'),(3,'Lowe-Oberbrunner','Quis laborum distinctio delectus.'),(4,'Wolf Ltd','Est ullam et distinctio qui consequatur vero. Eligendi error similique voluptatum ipsam.'),(5,'Mayer LLC','Sed possimus dignissimos repellendus quam doloremque quasi. In quia aut velit officiis voluptate.'),(6,'Schaden-Schmitt','Deserunt nostrum quia eligendi corrupti. Consequuntur enim qui adipisci ipsum voluptatem.'),(7,'Kozey, Gutmann and Cole','Et et quo voluptatem. Ut omnis quis sapiente dolor blanditiis et.'),(8,'Ratke LLC','Unde fuga culpa quia quia saepe dicta libero.'),(9,'Senger-Klocko','Voluptatem et eligendi in tempora excepturi aliquid consectetur.'),(10,'Koch, Hessel and Miller','Dolor sed molestiae dolorem. Expedita et soluta aperiam ex.'),(11,'Keebler PLC','Voluptas qui voluptas quas eligendi vitae necessitatibus dolor.'),(12,'Schroeder-McClure','At est labore eligendi repudiandae est. Sint laboriosam sit est tempore numquam.'),(13,'Muller, Hessel and Krajcik','Exercitationem ut molestiae id repellendus nostrum aperiam.'),(14,'Homenick, Stanton and Bashirian','Et eligendi rerum id corporis cum nisi qui. Non omnis dicta sit.'),(15,'Bailey, Kreiger and Schinner','Labore quod et autem autem rerum amet voluptates. Dolore porro quia provident.'),(16,'Skiles Inc','Velit nobis sapiente optio et sed modi doloribus. Accusantium omnis in alias officia.'),(17,'Schmitt PLC','Vitae consequuntur eius illo doloribus est ipsum. Explicabo eos tempora vitae voluptatum molestiae recusandae.'),(18,'Rolfson-Hand','Expedita dolorem mollitia repudiandae nisi.'),(19,'Emard-Crona','Maiores distinctio asperiores necessitatibus ducimus.'),(20,'Corwin-Ebert','Veniam ducimus explicabo neque est. Dignissimos soluta illum dolores architecto dolores.'),(21,'Howell LLC','Eum recusandae corporis est ipsum.'),(22,'Marquardt-Lind','Expedita veritatis omnis et rerum totam.'),(23,'Wilkinson-Sipes','Ducimus enim quia qui sequi necessitatibus autem dolorem. Aliquam ipsum non laudantium dolores qui.'),(24,'Dare Inc','Sint error qui asperiores. Ducimus omnis fuga est nulla.'),(25,'Erdman, Hodkiewicz and Hoppe','Voluptatem dolor eveniet dolores eos reprehenderit.'),(26,'Williamson PLC','Nostrum ea libero excepturi.'),(27,'Beier PLC','Placeat natus minima aperiam omnis est eos.'),(28,'Anderson, Weissnat and Bauch','Tempora fugit qui et eum ut ipsum voluptatem quia. Recusandae quos nulla non rerum.'),(29,'Cronin-Ullrich','Enim aliquam sed dolor adipisci dolorem dolorem.'),(30,'Pagac PLC','Sed est in ducimus tempora hic eligendi rerum. Commodi officia eaque animi quisquam aut amet aut.'),(31,'Gulgowski, Larkin and Ullrich','Autem et tempore velit rerum minima culpa sunt.'),(32,'Blanda and Sons','Odio a et ea ea tempora illo. Alias commodi assumenda non aliquam.'),(33,'Adams LLC','Consequuntur veritatis autem aut ut nihil nisi. Ipsa odio eligendi excepturi qui atque.'),(34,'Gutkowski-Schumm','Vitae vel enim vitae suscipit quas. Laborum et amet adipisci quia nulla qui accusamus.'),(35,'Romaguera, Cremin and Olson','Perferendis aut natus repellat omnis. Sint eum eos quia odit rerum ut mollitia.'),(36,'Champlin-McClure','Illum ratione quia tempora totam error atque. Voluptate ab voluptate itaque autem laboriosam dolorem.'),(37,'Braun-Parisian','Eum expedita saepe provident consequatur cumque. In suscipit reiciendis voluptatibus minus repellendus eos iure.'),(38,'Borer Group','Optio accusantium nostrum accusamus repudiandae ut cumque eligendi. Esse nulla cupiditate laborum non.'),(39,'Ledner-Braun','Quia magni dolores aperiam.'),(40,'Denesik-Bechtelar','Cumque modi odio nobis maxime.'),(41,'Welch-Olson','Nemo qui natus sed atque ipsam vero ut. Tempore fugit quos corrupti aut non veritatis.'),(42,'Welch-Zieme','Omnis dolorem sed amet architecto perspiciatis laboriosam voluptatum commodi.'),(43,'Wehner, Prohaska and Abshire','Dolorem hic et mollitia maiores alias et.'),(44,'Bogisich, Feil and Block','Aut quis sed et nostrum sed amet. Cum impedit ratione sint amet dicta.'),(45,'Strosin-Denesik','Corporis dolorem cum dicta reprehenderit repellendus sed et excepturi. Id voluptas consequatur dolores cum.'),(46,'Nader-Schaden','Alias harum non eos et doloremque consequatur et illum.'),(47,'Feeney-Metz','Et veritatis reiciendis similique enim commodi aut et. Eaque eum possimus corrupti est eos eum.'),(48,'Fritsch, McClure and Smith','Omnis dicta facere omnis exercitationem odio animi.'),(49,'Hickle, Lesch and Wehner','Aut autem itaque odio maiores molestiae eaque molestiae ducimus. Inventore sint non consequatur iure labore tempora vel.'),(50,'Kilback-Effertz','Totam ipsum quos doloribus quibusdam libero et.'),(51,'Wunsch, Cole and Hahn','Quia ducimus rerum laborum corrupti nam tenetur quia.'),(52,'Schuppe, Shields and Nolan','Necessitatibus ipsum sapiente at incidunt neque et aut explicabo. Consequuntur et ut cum dolorum.'),(53,'Mueller, Denesik and Schinner','Sed autem quasi illum cumque facilis minus. Tempora nihil magni hic voluptas quaerat fugit sit labore.'),(54,'Brekke, Hane and Wehner','Omnis repudiandae architecto inventore veritatis natus neque. Est id dolor quia rerum tenetur.'),(55,'Hudson-Mueller','Quia illum saepe nobis cumque vel.'),(56,'Stanton, Brown and Schroeder','Facere expedita earum doloremque consequatur atque. Repellat dolor sequi et ut necessitatibus enim temporibus.'),(57,'Ziemann, Steuber and Dach','Praesentium placeat error recusandae id eaque fuga. Eos earum qui quam eveniet aut sapiente autem.'),(58,'Jacobson Ltd','Dolor explicabo tempore dolorum ex quis soluta.'),(59,'Reilly-Gleichner','Non voluptate voluptas eaque eos excepturi veniam nam.'),(60,'Hintz-Gaylord','Consectetur et quaerat deleniti accusantium. Ducimus eum et illo aut.'),(61,'Swift PLC','Pariatur itaque veniam qui rerum qui molestiae deserunt. Reprehenderit repellendus ab dolores rerum.'),(62,'Heaney, Stracke and Kulas','Sit id repellat eligendi ea distinctio.'),(63,'Renner, Jacobson and Nader','At omnis maxime est repellendus aspernatur voluptatem ut.'),(64,'Witting and Sons','Quasi beatae officia quo ad soluta harum omnis nisi.'),(65,'Kerluke and Sons','Est dolorem et molestiae natus magnam non ut. Tenetur labore nihil aut quod quis earum voluptas.'),(66,'Rosenbaum, Schuppe and Schuster','Iste unde atque rerum reprehenderit officiis harum ipsa. Ut voluptatem neque est.'),(67,'Okuneva-Bahringer','Neque rerum sed temporibus aut maiores.'),(68,'Crooks Group','Vero omnis nulla non est error repudiandae magni. In minima ut eius minus.'),(69,'Wuckert-Stracke','Laboriosam quibusdam quisquam dolore. Nesciunt odit rerum ut nisi ea fugiat.'),(70,'Huels Ltd','Ducimus voluptate suscipit accusantium ut ratione ullam. Eveniet ipsum id dignissimos in minima quidem illo et.'),(71,'Wiza and Sons','Qui expedita temporibus rem sed deleniti id.'),(72,'Walter, Mraz and Conroy','Et mollitia ea velit minus incidunt esse unde. Reiciendis nesciunt sed maxime expedita quae.'),(73,'Adams, Volkman and Langworth','Eum dolorum id eos cumque ut voluptas. Autem eaque sint illum laboriosam.'),(74,'Grant, Ward and Tillman','Consequuntur saepe quo minima alias.'),(75,'Roob-Shields','Qui debitis voluptas esse ut et unde debitis. Alias aliquam iste maiores consequatur incidunt.'),(76,'Witting-Shields','Molestiae consequuntur nostrum consectetur ut.'),(77,'Purdy, Blanda and Gutkowski','Cumque et iure delectus fugiat consequatur tempora accusantium. Quia impedit occaecati odit perspiciatis.'),(78,'Zulauf LLC','Aliquam modi architecto quo suscipit perspiciatis.'),(79,'Douglas, Metz and Hartmann','Rerum aut est aut voluptas mollitia. Deleniti earum ut ipsam occaecati temporibus beatae veniam.'),(80,'Gusikowski Ltd','Possimus sint quidem numquam quibusdam debitis cum.'),(81,'Becker-Towne','Sunt nostrum eveniet autem inventore.'),(82,'Shanahan Group','Velit enim adipisci accusamus praesentium et quia sapiente ratione.'),(83,'Romaguera, Reichert and Strosin','Aperiam expedita officia alias aut dolore harum et.'),(84,'Simonis Inc','Modi ut corporis fuga facilis et.'),(85,'O\'Hara-Schumm','Quia sequi nihil dolorem nulla. Quam occaecati esse consectetur perspiciatis.'),(86,'Wyman Inc','Similique vitae voluptatum quis.'),(87,'Christiansen-Parker','Optio quidem et dolorem qui consequatur asperiores voluptatem. Suscipit cumque possimus quis eaque nostrum.'),(88,'Langosh PLC','Ut vero sint nisi perferendis ut eum velit.'),(89,'Bosco LLC','Qui culpa laboriosam itaque corporis sunt molestiae quo. Earum sed qui soluta nulla.'),(90,'Gutmann-Hermann','Modi dolores doloribus quas atque veniam. Voluptas suscipit soluta laudantium dolor.'),(91,'Kovacek LLC','Iure aut voluptas et modi iste itaque. Voluptas id deserunt optio quaerat omnis sint praesentium.'),(92,'Lemke-Williamson','Suscipit officia minima reiciendis.'),(93,'Donnelly Group','In adipisci laboriosam nobis earum.'),(94,'Rau-Schaefer','Ratione dolore reiciendis maxime et quisquam quo accusamus. Ut est dolores laudantium iusto rerum accusamus quas.'),(95,'Connelly-Klocko','Maxime voluptas sint nobis ullam aliquam.'),(96,'Jakubowski, Smith and Sanford','Omnis voluptatem modi dolor ipsam ab sed asperiores.'),(97,'Rath, Rutherford and Kuvalis','Quia excepturi molestiae omnis aut eos. Perferendis quam repellendus odit eaque in sunt distinctio sed.'),(98,'King Ltd','Quia totam ad ea vel eos sed.'),(99,'Marvin LLC','Sit facilis culpa sunt quod eaque delectus est. Sunt nobis sit porro ut sapiente.'),(100,'Wiegand, Schroeder and Kuvalis','Perspiciatis asperiores ea ea nulla mollitia omnis sequi. Quis expedita veniam et autem.'),(101,'Anderson-Ullrich','Non minus itaque sapiente et sit aliquam animi. Neque ut corrupti nostrum rem.'),(102,'Haag, Schmidt and Bode','Voluptas est hic et nemo.'),(103,'Waelchi LLC','Laudantium illum libero non.'),(104,'Roob-Padberg','Veritatis modi eius debitis voluptates nostrum dolorem. Vitae excepturi nisi dolor eum delectus provident dolor.'),(105,'Terry PLC','Aut saepe dolorum id sint doloremque quia.'),(106,'Trantow Ltd','Ipsum ullam nihil facere ut.'),(107,'Gottlieb-Anderson','Qui accusamus voluptas alias nam aut et explicabo.'),(108,'Nolan Group','Quis et fugit totam qui molestias. Fuga dignissimos accusantium nisi alias sit officiis quis.'),(109,'Hauck Group','Sed qui qui dolorum aut laboriosam omnis.'),(110,'Ziemann, Jaskolski and Nikolaus','Est saepe neque ducimus.'),(111,'Robel-Watsica','Qui quia libero laborum id. Quo saepe quia ratione dolor saepe sit sapiente.'),(112,'Terry, Bins and Rau','Non provident maxime dicta natus incidunt aliquid animi. Quidem repellat saepe assumenda est illum fugiat omnis.'),(113,'Prosacco, Kulas and Senger','Consectetur quia quaerat omnis dolorum a iusto similique. Odit qui sapiente officiis.'),(114,'Kling-Nitzsche','Et quia error non laudantium. Autem omnis qui libero.'),(115,'Purdy, Turcotte and Block','Quia consequatur eligendi culpa quia nulla vel sunt omnis. At culpa vel qui est nihil minima magni.'),(116,'Miller, Koch and Leannon','Dolorem sunt consectetur hic doloribus molestiae nulla.'),(117,'Heathcote-Schimmel','Aut ipsam ab aut.'),(118,'Prohaska LLC','Fugiat dicta doloremque occaecati veniam tempore eius.'),(119,'Howe-Kozey','Rerum vel eligendi nihil est nulla qui molestiae. Laboriosam voluptatem earum atque.'),(120,'Conroy-Hamill','Velit commodi vitae odit dignissimos autem blanditiis totam.'),(121,'Hermann-Smitham','Sit dolor quaerat sint necessitatibus iste. Delectus architecto et reiciendis rem quis.'),(122,'Veum, Reinger and Olson','Accusantium laborum iusto rerum officia et accusantium. Consectetur vitae et sequi nam vero sit.'),(123,'Gutkowski Ltd','Voluptatibus optio fugiat quae eveniet qui dolorum commodi.'),(124,'Turner, Kub and Jerde','Non minima omnis sit. Occaecati ullam porro deleniti asperiores reiciendis quasi occaecati voluptas.'),(125,'Bernhard Inc','Autem temporibus dolorem praesentium ipsa et consequatur.'),(126,'Weissnat and Sons','Est optio corrupti rem eligendi.'),(127,'Fay, Heller and Keeling','Et alias nihil amet sed dolores.'),(128,'Goldner LLC','Error omnis et nisi velit quo numquam impedit at.'),(129,'Little, Jones and Gleason','Necessitatibus alias quam veniam repellendus repellendus.'),(130,'Collins-Nicolas','Quo vero illum omnis quasi ipsum earum quas nihil. Consequatur ratione commodi vitae culpa veniam autem culpa eos.'),(131,'Powlowski, Howe and Corkery','Enim blanditiis esse officiis molestiae ut ullam soluta. Autem deleniti sed aut deserunt provident est sed.'),(132,'Kautzer-Tromp','Consequuntur sunt voluptatem et unde explicabo quos aut fugiat.'),(133,'Schultz, Effertz and Kerluke','Molestias laborum cumque dolor ut voluptate error veritatis. Culpa autem omnis explicabo rerum incidunt.'),(134,'Kozey Ltd','Deleniti labore veritatis adipisci quia.'),(135,'Friesen-Reichel','Quidem facilis molestiae nulla facere eum est reiciendis. Et sequi quidem sed alias.'),(136,'Cremin, Johnson and Emard','Quidem exercitationem animi enim qui et.'),(137,'Crona Ltd','Neque magni nemo hic id et culpa.'),(138,'Wyman, Bernier and Rau','Dolorem sed dolor illo et.'),(139,'Ward-Corkery','Dolorem et mollitia et nulla. Et laudantium quod natus ad ratione ipsum voluptatum expedita.'),(140,'Lebsack-Hilpert','Est aut doloremque rerum at aut eum. Soluta fugit ullam necessitatibus quisquam ullam nam fugiat corporis.'),(141,'Hayes-Mraz','Repellat perferendis omnis quae voluptas consequatur.'),(142,'Herzog LLC','Deleniti aut dolore sed voluptas aliquam consequatur. Libero nesciunt error aut nemo voluptatibus cum unde.'),(143,'Weber, Schumm and Koelpin','Soluta qui nobis et non laborum quidem beatae. Quia nam est quo repudiandae voluptatibus.'),(144,'Kuvalis Inc','Ipsam itaque accusantium explicabo ea voluptatem commodi et impedit. Aspernatur quasi illum magnam cum.'),(145,'Hintz Inc','Est omnis ut explicabo et perferendis unde voluptatibus.'),(146,'Powlowski PLC','Omnis minima consequatur voluptatem maiores.'),(147,'Bergstrom, Renner and Murray','Atque qui occaecati et dolore provident voluptatem ducimus rerum.'),(148,'Bartell, Kassulke and Kohler','Nemo dolor ab iure quibusdam rerum.'),(149,'Graham, Sipes and Hirthe','Labore praesentium qui voluptas a.'),(150,'McLaughlin, Wisozk and Casper','Voluptas molestiae nobis nisi ratione doloremque nihil veritatis. Aut non qui id blanditiis omnis.'),(151,'Schaefer and Sons','Sit dolorum suscipit fuga pariatur voluptatem quisquam aspernatur.'),(152,'Runte Ltd','Quia dolores quaerat dolorem numquam.'),(153,'Raynor, Anderson and Wilderman','Eveniet eum dolorem voluptatibus facilis id dolorum error assumenda. Minima aut repellat nostrum voluptatum.'),(154,'Buckridge, Satterfield and Trantow','Vero iure aut reiciendis deleniti. Doloremque est itaque temporibus modi molestiae.'),(155,'Bernier PLC','Asperiores fugiat voluptas laboriosam distinctio. Voluptatibus expedita facilis sit animi consequatur.'),(156,'Conroy Inc','Eveniet aut tenetur sed in repellat.'),(157,'O\'Conner, Ritchie and Auer','Voluptates repudiandae eos quam.'),(158,'Yost PLC','Non qui optio voluptatem voluptatem ipsa voluptas animi reiciendis. Veritatis provident quibusdam qui omnis eius incidunt similique aut.'),(159,'Cummings-O\'Kon','Et rerum nesciunt odio.'),(160,'Hettinger Group','Blanditiis voluptates saepe excepturi officia harum quae.'),(161,'Klocko LLC','Saepe et aut voluptate enim atque mollitia.'),(162,'O\'Kon Ltd','Odio provident alias maiores debitis neque itaque. Quod perferendis commodi qui voluptate quia iure animi.'),(163,'Monahan and Sons','Reiciendis omnis voluptatem aperiam architecto maiores aliquid suscipit.'),(164,'Spinka, Leuschke and Frami','Asperiores error quos reiciendis iure consectetur. Dolor vitae temporibus quia nisi alias et et.'),(165,'Johnson, Haley and Gibson','Temporibus magnam sint nam veritatis tempore.'),(166,'Zieme Inc','Hic suscipit quaerat consequatur voluptatem non est laudantium. Quaerat quia quas provident dolores laboriosam.'),(167,'Roberts and Sons','Aut odit est illo rem qui in non omnis. Ut expedita hic officia exercitationem.'),(168,'Smitham Inc','Expedita qui voluptas rem voluptatem sit.'),(169,'Kshlerin-Schmitt','Ea fugit et necessitatibus est. Eos libero labore dolorem nisi est.'),(170,'Gutmann and Sons','Ipsam nulla enim dolores aut. Et sunt et dolores.'),(171,'Effertz, Cremin and O\'Hara','Dignissimos tenetur exercitationem repellat eos harum atque doloremque. Ea suscipit beatae voluptatem incidunt inventore quasi excepturi dolores.'),(172,'Herzog-Zboncak','Ducimus provident aspernatur blanditiis ipsa sint voluptatem voluptas. Pariatur recusandae eveniet odit dolorum rerum id perspiciatis.'),(173,'Williamson Group','Et voluptate veniam ut ut incidunt sunt. Est dolorem enim reprehenderit.'),(174,'Marquardt-Rosenbaum','Similique quia totam aut dolore autem sed omnis. Ut dolores veniam et soluta.'),(175,'Schaden PLC','Consectetur qui neque fugiat temporibus. Distinctio natus est consequuntur mollitia quia placeat.'),(176,'Gerhold-Douglas','Officiis consequatur est quidem totam atque quia. Molestiae alias et autem quidem et.'),(177,'Pagac Inc','Numquam voluptates aliquam facilis omnis ea molestiae ipsa. Possimus quis quae ea vero est hic perferendis.'),(178,'Mante-Olson','Dolore unde sit qui perferendis.'),(179,'Schowalter Inc','Necessitatibus sequi suscipit amet libero nostrum quia. Voluptatem deserunt nemo eum et.'),(180,'Hartmann PLC','Voluptatibus molestiae omnis et enim et dolorem qui. Ipsum veritatis et voluptatum voluptatem exercitationem.'),(181,'Rolfson Group','Aut voluptatibus unde blanditiis quod eaque maiores. Sed doloribus modi cupiditate facilis consectetur modi aut.'),(182,'Gutmann-Purdy','Fugiat occaecati quae expedita et.'),(183,'Collier, Durgan and Sauer','Corrupti voluptate hic expedita et ut et sit. Unde voluptas fugiat adipisci reiciendis velit.'),(184,'Koepp LLC','Excepturi nam deserunt non hic voluptatem.'),(185,'Brakus-Metz','Accusantium dolore laborum rerum harum labore aut repudiandae magnam. Cumque animi exercitationem atque ipsa dolore.'),(186,'Pagac-Pollich','Necessitatibus deserunt nihil necessitatibus cupiditate harum.'),(187,'Bruen-Goodwin','Nisi eos quidem consectetur minus. Rem iusto consequatur accusamus ea repellendus.'),(188,'Mitchell LLC','Aut commodi neque vero sint minima et.'),(189,'Lehner, Eichmann and Morissette','Praesentium rerum eum placeat dolor omnis qui.'),(190,'Ferry-Prohaska','Molestiae consequuntur eveniet earum modi omnis et. Est tenetur aut sit quasi mollitia dignissimos exercitationem.'),(191,'Dooley PLC','Omnis doloribus id est aut consequuntur consectetur.'),(192,'Dare-Will','Vel tempore minima quasi qui.'),(193,'Stokes-Breitenberg','Quaerat culpa facere quis id hic necessitatibus. Ut architecto distinctio praesentium inventore aut dolor.'),(194,'Terry Inc','Magnam enim unde eum numquam. Quae quasi sed molestiae eligendi non eveniet cupiditate eum.'),(195,'Kuhn-Ondricka','Iure excepturi deleniti amet corrupti doloribus dolores quibusdam. Eius eaque quis et sed ab doloremque quia.'),(196,'Mertz-Carter','Laudantium fugit quia et id maxime in ut. Porro est ut quo dignissimos accusamus quo.'),(197,'Larkin Ltd','Aperiam ea facilis est sunt sunt dolore laboriosam.'),(198,'Anderson PLC','Fuga eligendi est perferendis.'),(199,'Wolf and Sons','Officiis impedit blanditiis ipsa omnis sed similique similique.'),(200,'Wiza LLC','Alias sit quis et corrupti laboriosam nam dolorem id. Quas est adipisci aut saepe rerum.'),(201,'Waters, Anderson and Conn','Id voluptatum saepe id culpa ut nihil ipsa.'),(202,'Wolff PLC','Dolores iusto omnis earum incidunt exercitationem sint.'),(203,'Medhurst PLC','Commodi sunt expedita in odio dolorem. Tempora eos libero nisi sit quo.'),(204,'Rath Inc','Veritatis consequatur ut suscipit nisi sint. Reprehenderit sed quia totam sit enim.'),(205,'Smith Inc','Sunt deserunt neque et fugiat fugit quo est.'),(206,'Gerlach PLC','Repellat ut dolore magnam neque magnam et. Maxime est est nihil aut atque dignissimos et aut.'),(207,'Quigley PLC','Et voluptatum nisi tempore nobis.'),(208,'Leffler LLC','In amet quis nesciunt a atque.'),(209,'McGlynn, Lynch and Cronin','Consectetur quis veritatis accusamus.'),(210,'Welch-Bogan','Provident quam incidunt quisquam dolores commodi vitae.'),(211,'Jacobs-Swift','Velit quidem explicabo optio adipisci consectetur itaque impedit. Qui doloribus consequuntur quibusdam nulla quaerat velit animi.'),(212,'Ferry-Herman','Et veritatis velit quis est earum id blanditiis.'),(213,'Terry-Kling','Voluptas est id velit. A sit non ex rerum laudantium.'),(214,'Breitenberg PLC','Explicabo sunt eos perspiciatis eaque reiciendis cum ut error.'),(215,'Thompson Ltd','Enim hic necessitatibus aut consequatur quia iure ullam. Quisquam provident omnis et mollitia nihil quam ea ab.'),(216,'Waters Group','Qui ut ipsum nulla commodi. Et aut nulla aut neque et modi accusantium.'),(217,'Kovacek, Pollich and White','Quaerat ut tempora architecto a. Sed cumque ipsa qui voluptas est a sunt.'),(218,'Dicki and Sons','Iusto tenetur sed non animi quibusdam sed. Incidunt in eum ut magni perferendis enim.'),(219,'Herzog, Beier and Rodriguez','Quos eligendi doloribus natus ex esse mollitia.'),(220,'Jones, Williamson and Doyle','Nihil saepe est optio.'),(221,'Johnson, Lebsack and Nolan','Ut impedit ducimus reprehenderit sint laudantium est accusantium. Corrupti est temporibus nobis aliquam aut natus.'),(222,'Schuster, Littel and Farrell','Et iusto suscipit laudantium ab modi. Repellat aut nobis et quo expedita ullam aut non.'),(223,'Friesen-Macejkovic','Eaque repudiandae sint voluptas repellendus maxime provident.'),(224,'Williamson LLC','Corrupti quisquam quia voluptatibus dignissimos fugit rerum veniam.'),(225,'Macejkovic Group','Sint eum cupiditate molestiae.'),(226,'Ferry-Konopelski','Fugiat esse impedit quibusdam officiis quia ex commodi ipsum.'),(227,'Carter, Considine and Schoen','In laudantium enim quas sed sunt.'),(228,'Ondricka-Thompson','Cupiditate veritatis et perferendis vel sint.'),(229,'Morissette-Sawayn','Omnis in molestias adipisci ducimus rerum dolores. Libero ut itaque saepe est quia et.'),(230,'Bartoletti-Tremblay','Et saepe occaecati voluptas ut vitae.'),(231,'Bergnaum-Mann','Ratione eius unde ut aliquam. Odit enim doloribus dolor quae.'),(232,'Kulas, Hirthe and Murphy','Consequatur hic dolorem aut dolorem ut.'),(233,'Wiza-Walker','Ex quia praesentium consequatur adipisci et assumenda.'),(234,'Grady-Rau','Voluptas id animi qui suscipit quis.'),(235,'Hansen-Deckow','Molestiae ad dignissimos laboriosam vel ut. Numquam sit natus dolore excepturi dolor tenetur.'),(236,'Botsford-Larson','Soluta tempora quis non aut ad nihil nobis. Nemo vero dolor porro porro quibusdam repellendus.'),(237,'Moore, Breitenberg and Schmeler','Esse minima perferendis molestiae sit ut dolores.'),(238,'Murray Ltd','Commodi ut sint in ut.'),(239,'Ryan PLC','Consectetur autem explicabo nulla alias. Dolores et est nemo voluptatem aperiam.'),(240,'Lind and Sons','Amet quia sit aut et excepturi.'),(241,'Klocko-Johnston','Autem fugiat velit excepturi repellat voluptatem accusantium. Incidunt mollitia assumenda magnam deleniti voluptatem.'),(242,'O\'Conner-Blick','Nostrum tempora tenetur provident nihil praesentium voluptas.'),(243,'Schuster LLC','Nostrum assumenda aliquid maiores. Facere incidunt atque dolores vitae qui et.'),(244,'Rohan PLC','Ad excepturi sint ab adipisci nobis libero.'),(245,'Romaguera Group','Aut illo architecto et iure labore est deserunt.'),(246,'Denesik and Sons','Ducimus magnam possimus et quia ducimus neque tenetur laborum. Magnam impedit neque dolorem quia molestiae ut qui.'),(247,'Reinger and Sons','Amet magnam voluptatibus vero et nemo.'),(248,'Stracke, Fisher and Mayert','Est fugit sed alias quis dolorum quo blanditiis. Ea aut consequatur ut reprehenderit molestias velit.'),(249,'Heller, Parisian and Kulas','Tempore sed quos ratione eum omnis praesentium ea excepturi. Aut officia voluptas quisquam aliquam nam.'),(250,'Kassulke, Lakin and Hessel','Nemo iste error et fuga laboriosam. Modi fugit labore ut culpa consectetur.');

--
-- Table structure for table `s_user`
--

DROP TABLE IF EXISTS `s_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `s_user` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NAME` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `DATE_REG` datetime DEFAULT CURRENT_TIMESTAMP,
  `PHONE` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `EMAIL` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `IS_ACTIVE` char(1) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `s_user`
--

INSERT INTO `s_user` VALUES (1,'Mr. Monserrat Trantow DDS','2021-05-08 00:00:00','1-724-401-8902','camilla87@example.org','N'),(2,'Lane Von','1994-07-28 00:00:00','1-598-947-5014x62222','blarkin@example.net','N'),(3,'Florencio Bednar','1990-12-26 00:00:00','362-693-2838x82174','lemke.viva@example.com','Y'),(4,'Lance Marquardt III','1986-06-23 00:00:00','1-107-428-4567x251','wava.schaden@example.net','Y'),(5,'Mr. Joel Koch','1991-05-23 00:00:00','1-918-060-5775x458','emelie.bogan@example.net','Y'),(6,'Gene Romaguera PhD','1982-05-09 00:00:00','1-034-328-0345x426','hilll.lurline@example.net','Y'),(7,'Mr. Rodrigo Schmitt','1978-06-07 00:00:00','+71(1)2011382577','tremblay.stephanie@example.org','N'),(8,'Willie Cremin','1978-05-22 00:00:00','+22(6)5048811657','vschuppe@example.com','Y'),(9,'Mrs. Elizabeth Corkery','2008-03-24 00:00:00','+88(8)9954183799','gvandervort@example.org','Y'),(10,'Flossie Boyer PhD','2010-01-18 00:00:00','201.330.6238','vfeeney@example.net','Y'),(11,'Neha Crona','2002-05-13 00:00:00','+06(1)3327861433','korbin28@example.net','N'),(12,'Murray Wilderman','1992-04-14 00:00:00','(652)076-5852x26199','kbins@example.net','Y'),(13,'Ena Kuvalis','1989-01-07 00:00:00','1-055-624-4735x6891','jameson02@example.com','N'),(14,'Hillard Dooley','2000-04-14 00:00:00','1-182-349-4176x7590','amelia.trantow@example.org','N'),(15,'Daniella Mraz','2003-09-10 00:00:00','175.835.3012x1258','quitzon.marie@example.com','N'),(16,'Noe Walsh','2018-09-04 00:00:00','969-840-0988','jacobi.trace@example.org','N'),(17,'Destini Torp','1996-04-07 00:00:00','(318)394-0711x456','dupton@example.com','N'),(18,'Nils Gaylord','2022-01-25 00:00:00','018-965-6494x221','rau.jennings@example.org','N'),(19,'Elena Renner','2007-05-23 00:00:00','(515)524-0791','rempel.jacques@example.org','N'),(20,'Caleb Stamm DDS','1978-06-15 00:00:00','(161)639-8788x917','zrohan@example.org','N'),(21,'Prof. Camron Rodriguez Jr.','2006-08-31 00:00:00','793-236-2956x0189','thad54@example.com','Y'),(22,'Ms. Hattie Funk','2021-03-23 00:00:00','(555)358-0137','reichel.carson@example.com','Y'),(23,'Anna Heaney','1972-06-06 00:00:00','942.517.9053x1585','cheyanne11@example.org','N'),(24,'Karlee Kuhic Jr.','1995-01-30 00:00:00','523.312.1563x106','corwin.douglas@example.org','N'),(25,'Georgette Olson','1981-06-20 00:00:00','(976)143-2689','elaina71@example.com','N'),(26,'Arturo Pagac','2004-02-25 00:00:00','068.127.8498','kiehn.jack@example.net','Y'),(27,'Prof. Xavier Feest PhD','2014-04-17 00:00:00','716.307.1221','vrobel@example.com','Y'),(28,'Rosalyn Metz','1980-10-26 00:00:00','+60(6)3837904092','gwendolyn.bins@example.net','Y'),(29,'Terence Cormier PhD','2002-06-05 00:00:00','253.377.2855','hershel.steuber@example.org','Y'),(30,'Darion Thompson DVM','2021-11-06 00:00:00','09563567434','bins.rylee@example.org','Y'),(31,'Martina Anderson','1978-11-28 00:00:00','203-259-4483','daisy85@example.com','N'),(32,'Naomie Lubowitz','1983-03-01 00:00:00','836-548-9231','mackenzie.ullrich@example.com','N'),(33,'Johan Rogahn','1989-01-07 00:00:00','(539)888-3272x1599','hmraz@example.org','Y'),(34,'Kenyon Monahan','1983-10-05 00:00:00','1-635-890-0187x315','grady.mariam@example.com','N'),(35,'Kelsie Johnson IV','2020-05-09 00:00:00','953-797-5417','hhilll@example.com','Y'),(36,'Sally Gerhold IV','2007-03-06 00:00:00','1-543-547-8477x849','johns.brigitte@example.net','Y'),(37,'Shanna Schimmel PhD','1994-11-10 00:00:00','07124073373','quinn.terry@example.org','N'),(38,'Eloy Romaguera','2002-12-23 00:00:00','268.122.1901x2207','lavinia.kihn@example.com','N'),(39,'Gabrielle Nicolas','2010-07-23 00:00:00','(552)205-5799x20310','emile.fritsch@example.net','Y'),(40,'Pedro Vandervort','2006-05-27 00:00:00','1-403-495-2987x2657','frida02@example.org','Y');

--
-- Temporary view structure for view `v14`
--

DROP TABLE IF EXISTS `v14`;
/*!50001 DROP VIEW IF EXISTS `v14`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v14` AS SELECT 
 1 AS `ID`,
 1 AS `NAME`,
 1 AS `DATE_START`,
 1 AS `DATE_END`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v15`
--

DROP TABLE IF EXISTS `v15`;
/*!50001 DROP VIEW IF EXISTS `v15`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `v15` AS SELECT 
 1 AS `ID`,
 1 AS `NAME`,
 1 AS `PHONES`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `v14`
--

/*!50001 DROP VIEW IF EXISTS `v14`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `v14` AS select `o`.`ID` AS `ID`,`o`.`NAME` AS `NAME`,`sc`.`DATE_START` AS `DATE_START`,`sc`.`DATE_END` AS `DATE_END` from (`s_object` `o` left join `s_contract` `sc` on((`o`.`ID` = `sc`.`OBJECT_ID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v15`
--

/*!50001 DROP VIEW IF EXISTS `v15`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`127.0.0.1` SQL SECURITY DEFINER */
/*!50001 VIEW `v15` AS select `o`.`ID` AS `ID`,`o`.`NAME` AS `NAME`,group_concat(`sop`.`VALUE` separator ', ') AS `PHONES` from (`s_object` `o` left join `s_object_phone` `sop` on((`o`.`ID` = `sop`.`OBJECT_ID`))) group by `o`.`ID`,`o`.`NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-16 10:51:19
