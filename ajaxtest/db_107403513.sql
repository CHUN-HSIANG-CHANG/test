CREATE DATABASE  IF NOT EXISTS `db_107403513` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db_107403513`;
-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: 192.168.56.101    Database: db_107403513
-- ------------------------------------------------------
-- Server version	5.7.30-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tbl_Seat`
--

DROP TABLE IF EXISTS `tbl_Seat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Seat` (
  `seat_id` varchar(3) NOT NULL,
  PRIMARY KEY (`seat_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Seat`
--

LOCK TABLES `tbl_Seat` WRITE;
/*!40000 ALTER TABLE `tbl_Seat` DISABLE KEYS */;
INSERT INTO `tbl_Seat` VALUES ('10A'),('10B'),('10C'),('10D'),('1A'),('1B'),('1C'),('1D'),('2A'),('2B'),('2C'),('2D'),('3A'),('3B'),('3C'),('3D'),('4A'),('4B'),('4C'),('4D'),('5A'),('5B'),('5C'),('5D'),('6A'),('6B'),('6C'),('6D'),('7A'),('7B'),('7C'),('7D'),('8A'),('8B'),('8C'),('8D'),('9A'),('9B'),('9C'),('9D');
/*!40000 ALTER TABLE `tbl_Seat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Station`
--

DROP TABLE IF EXISTS `tbl_Station`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Station` (
  `station_id` int(10) NOT NULL AUTO_INCREMENT,
  `station_name` varchar(45) NOT NULL,
  `location_marker` int(10) NOT NULL,
  `time_marker` int(10) NOT NULL,
  PRIMARY KEY (`station_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Station`
--

LOCK TABLES `tbl_Station` WRITE;
/*!40000 ALTER TABLE `tbl_Station` DISABLE KEYS */;
INSERT INTO `tbl_Station` VALUES (1,'台北',1,0),(2,'桃園',3,20),(3,'新竹',4,30),(4,'台中',8,60),(5,'高雄',15,120);
/*!40000 ALTER TABLE `tbl_Station` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Ticket`
--

DROP TABLE IF EXISTS `tbl_Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Ticket` (
  `ticket_id` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `train_id` int(10) NOT NULL,
  `arrival_station` int(10) NOT NULL,
  `departure_station` int(10) NOT NULL,
  `seat_id` varchar(3) NOT NULL,
  `train_date` date NOT NULL,
  `price` int(11) NOT NULL,
  `book_time` datetime NOT NULL,
  `pay_time` datetime DEFAULT NULL,
  PRIMARY KEY (`ticket_id`),
  KEY `userID_idx` (`userID`),
  KEY `fk_tbl_Ticket_tbl_Train_idx` (`train_id`),
  KEY `fk_tbl_Ticket_tbl_Seat_idx` (`seat_id`),
  KEY `fk_tbl_Ticket_tbl_Station_idx` (`arrival_station`),
  KEY `fk_departure_station_tbl_Station_idx` (`departure_station`),
  CONSTRAINT `fk_arrival_station_tbl_Station` FOREIGN KEY (`arrival_station`) REFERENCES `tbl_Station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_departure_station_tbl_Station` FOREIGN KEY (`departure_station`) REFERENCES `tbl_Station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Ticket_tbl_Seat` FOREIGN KEY (`seat_id`) REFERENCES `tbl_Seat` (`seat_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Ticket_tbl_Train` FOREIGN KEY (`train_id`) REFERENCES `tbl_Train` (`train_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_Ticket_tbl_User` FOREIGN KEY (`userID`) REFERENCES `tbl_User` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Ticket`
--

LOCK TABLES `tbl_Ticket` WRITE;
/*!40000 ALTER TABLE `tbl_Ticket` DISABLE KEYS */;
INSERT INTO `tbl_Ticket` VALUES (1,1,1,2,1,'1D','2020-06-10',200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(2,1,1,5,2,'3B','2020-06-10',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(3,2,2,5,2,'2A','2020-06-10',1200,'2020-06-10 07:00:00','2020-06-10 07:15:00'),(4,2,2,4,3,'2A','2020-06-12',400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(5,3,3,5,1,'3D','2020-06-13',1400,'2020-06-12 20:30:00','2020-06-13 07:35:00'),(6,4,3,3,2,'4B','2020-06-13',100,'2020-06-12 14:30:00','2020-06-12 17:35:00'),(7,5,4,2,5,'1A','2020-06-15',1200,'2020-06-15 10:22:00',NULL),(8,6,4,1,5,'2A','2020-06-15',1400,'2020-06-11 17:30:00','2020-06-11 17:35:00'),(9,7,5,2,4,'5A','2020-06-16',500,'2020-06-12 10:31:00',NULL),(10,7,5,2,4,'5B','2020-06-16',500,'2020-06-11 10:31:00',NULL),(11,7,5,2,4,'5C','2020-06-16',500,'2020-06-11 10:31:00','2020-06-11 11:35:00'),(12,8,6,2,3,'6C','2020-06-16',500,'2020-06-16 10:30:00','2020-06-16 10:36:00'),(13,8,2,4,2,'4B','2020-06-26',500,'2020-06-26 13:28:39',NULL),(15,8,6,2,3,'10B','2020-06-26',100,'2020-06-26 13:37:43','2020-06-26 13:37:59');
/*!40000 ALTER TABLE `tbl_Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_Train`
--

DROP TABLE IF EXISTS `tbl_Train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_Train` (
  `train_id` int(10) NOT NULL,
  `departure_station_id` int(10) NOT NULL,
  `arrival_time` time DEFAULT NULL,
  `departure_time` time DEFAULT NULL,
  `off_date` date DEFAULT NULL,
  `on_date` date NOT NULL,
  PRIMARY KEY (`train_id`,`departure_station_id`),
  KEY `fk_tbl_Train_tbl_Station_idx` (`departure_station_id`),
  CONSTRAINT `fk_tbl_Train_tbl_Station` FOREIGN KEY (`departure_station_id`) REFERENCES `tbl_Station` (`station_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_Train`
--

LOCK TABLES `tbl_Train` WRITE;
/*!40000 ALTER TABLE `tbl_Train` DISABLE KEYS */;
INSERT INTO `tbl_Train` VALUES (1,1,NULL,'07:00:00','2020-06-17','2020-01-01'),(1,2,'07:20:00','07:22:00','2020-06-17','2020-01-01'),(1,3,'07:32:00','07:34:00','2020-06-17','2020-01-01'),(1,4,'08:04:00','08:06:00','2020-06-17','2020-01-01'),(1,5,'09:06:00',NULL,'2020-06-17','2020-01-01'),(2,1,NULL,'10:00:00',NULL,'2020-01-01'),(2,2,'10:20:00','10:22:00',NULL,'2020-01-01'),(2,3,'10:32:00','10:34:00',NULL,'2020-01-01'),(2,4,'11:04:00',NULL,NULL,'2020-01-01'),(3,1,NULL,'13:00:00',NULL,'2020-02-01'),(3,2,'13:20:00','13:22:00',NULL,'2020-02-01'),(3,3,'13:32:00','13:34:00',NULL,'2020-02-01'),(3,4,'14:04:00','14:06:00',NULL,'2020-02-01'),(3,5,'15:06:00',NULL,NULL,'2020-02-01'),(4,1,'10:06:00',NULL,NULL,'2020-02-01'),(4,2,'09:44:00','09:46:00',NULL,'2020-02-01'),(4,3,'09:32:00','09:34:00',NULL,'2020-02-01'),(4,4,'09:00:00','09:02:00',NULL,'2020-02-01'),(4,5,NULL,'08:00:00',NULL,'2020-02-01'),(5,1,'13:04:00',NULL,NULL,'2020-02-01'),(5,2,'12:42:00','12:44:00',NULL,'2020-02-01'),(5,3,'12:30:00','12:32:00',NULL,'2020-02-01'),(5,4,NULL,'12:00:00',NULL,'2020-02-01'),(6,1,'19:06:00',NULL,NULL,'2020-01-01'),(6,2,'18:44:00','18:46:00',NULL,'2020-01-01'),(6,3,'18:32:00','18:34:00',NULL,'2020-01-01'),(6,4,'18:00:00','18:02:00',NULL,'2020-01-01'),(6,5,NULL,'17:00:00',NULL,'2020-01-01');
/*!40000 ALTER TABLE `tbl_Train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_User`
--

DROP TABLE IF EXISTS `tbl_User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_User` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `salt` char(64) NOT NULL,
  `registerDateTime` date NOT NULL,
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`userID`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `salt_UNIQUE` (`salt`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_User`
--

LOCK TABLES `tbl_User` WRITE;
/*!40000 ALTER TABLE `tbl_User` DISABLE KEYS */;
INSERT INTO `tbl_User` VALUES (1,'Marvel_Steve@gmail.com','Steve','Rogers','1918-07-04','63652315D22919A8EC76F58F982EC08A6244474F8082B8E75A1271B3C63948E9','2019-06-06',0),(2,'Marvel_Tony@gmail.com','Tony','Stark','1970-05-29','AA52032EAB8CC92F7B77CCE828940F95C2369F18DDF1C6B3A80A8A6195D137FB','2019-06-07',0),(3,'Marvel_Thor@gmail.com','Thor','God','1911-01-01','3C567E0EA40F26755BB221C96AB02CC726DE673E85016EC1D949D14E5B16B223','2019-06-08',0),(4,'Marvel_Peter@gmail.com','Peter','Parker','2000-08-10','95B79B147E492681F98C749E3AC329C1A975D3F4000FF25D0643D8D55A4E4E2B','2019-06-09',0),(5,'Marvel_David @gmail.com','David','Banner','1980-11-22','EB7F11AE33003238D3FF14094E3BC569F077B8F39DF472423FD339CE22B5F050','2019-06-10',0),(6,'Marvel_Natasha@gmail.com','Natasha','Romanoff','1984-11-22','5F79D14FB8A43CA9350E781EA1067B14B197D36671182C4C15E9EDBD921791DD','2019-06-11',0),(7,'Marvel_Wanda@gmail.com','Wanda','Maximoff','1980-08-02','9C681B6D73E80D3C1F10E06BDEB48914ABE207ADA83405DC14485B6AD060C021','2019-06-12',0),(8,'Marvel_Carol@gmail.com','Carol','Danvers','1980-08-01','6C40F0CC5D46DCE7D1A0E1D118E0750A7874087FC7199DDA34D171131002DCA9','2019-06-13',0),(9,'Marvel_Stephen@gmail.com','Stephen','Strange','1930-07-01','039FB5567A6B559BE9999BF854BEF1699A14CB912AF431CCF90D9941900D8788','2019-06-14',0),(10,'Marvel_Clint@gmail.com','Clint','Barton','1971-01-07','ABC1523C0333408EFF2B8CCF4248A0B2175723EBC65C8D05940B9D434B7A39A2','2019-06-15',0),(11,'deleted_User0','XXX','XXX','1970-01-01','deleted_Salt0','1970-01-01',1),(12,'deleted_User1','XXX','XXX','1970-01-01','deleted_Salt1','1970-01-01',1);
/*!40000 ALTER TABLE `tbl_User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tbl_UserCredential`
--

DROP TABLE IF EXISTS `tbl_UserCredential`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tbl_UserCredential` (
  `userCredential` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `HashedPwd` char(255) NOT NULL,
  `CreateDateTime` date NOT NULL,
  PRIMARY KEY (`userCredential`,`userID`),
  UNIQUE KEY `HashedPwd_UNIQUE` (`HashedPwd`),
  KEY `userID_idx` (`userID`),
  CONSTRAINT `fk_tbl_UserCredential_tbl_User` FOREIGN KEY (`userID`) REFERENCES `tbl_User` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tbl_UserCredential`
--

LOCK TABLES `tbl_UserCredential` WRITE;
/*!40000 ALTER TABLE `tbl_UserCredential` DISABLE KEYS */;
INSERT INTO `tbl_UserCredential` VALUES (1,1,'pfNFnTx50OjhU','2019-06-06'),(2,2,'brpgOmotwsnkA','2019-06-07'),(3,3,'brCHXrfmx/hRs','2019-06-08'),(4,4,'broklWTNGanYM','2019-06-09'),(5,5,'brrQ/CUvMgDMI','2019-06-10'),(6,6,'brCAXrfmx/hRs','2019-06-11'),(7,7,'bretXExZ676DI','2019-06-12'),(8,8,'brhAsn.S9pHfM','2019-06-13'),(9,9,'brv2uIUQT8QN2','2019-06-14'),(10,10,'brtnGNHRCIzXY','2019-06-15'),(11,11,'deleted_HashedPwd0','1970-01-01'),(12,12,'deleted_HashedPwd1','1970-01-01');
/*!40000 ALTER TABLE `tbl_UserCredential` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'db_107403513'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_BookTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_BookTicket`(
    in in_user_id int(10),
    in in_train_id int(11),
    in in_departure_station int,
    in in_arrival_station int,
    in in_train_date date,
	out num_row int(100)
)
BEGIN
     declare in_seat_id varchar(3);
     declare dpt_loc_mrk int;
     declare arv_loc_mrk int;
     declare computed_price int;
     
     SET  num_row = 0;
	 SELECT location_marker INTO arv_loc_mrk FROM tbl_Station WHERE station_id = in_arrival_station;
     SELECT location_marker INTO dpt_loc_mrk FROM tbl_Station WHERE station_id = in_departure_station;
     SET computed_price = ABS( (arv_loc_mrk - dpt_loc_mrk) * 100);
     
	 CREATE TEMPORARY TABLE tbl_available_seat
     SELECT seat_id
     FROM
     (
        SELECT seat_id FROM tbl_Seat
        UNION ALL
        SELECT seat_id FROM tbl_Ticket
        WHERE train_date = in_train_date AND train_id = in_train_id
     ) t
     GROUP BY seat_id
     HAVING COUNT(*) =1
     ORDER BY seat_id;
     
     SELECT * INTO in_seat_id FROM  tbl_available_seat  ORDER BY RAND() LIMIT 1;
     
     DROP TEMPORARY TABLE tbl_available_seat;
     
     if DATEDIFF(in_train_date , CURDATE() )= 0  AND -- 只能購買當天的票
        (SELECT isDeleted FROM tbl_User WHERE userID = in_user_id)=0 -- 且要是未刪除的使用者才可以購買
     then
     if exists(SELECT * FROM tbl_Train WHERE train_id = in_train_id 
                     AND departure_station_id = in_departure_station) 
                     AND exists (SELECT * FROM tbl_Train WHERE train_id = in_train_id 
                          AND departure_station_id = in_arrival_station)  -- 判斷是否有使用者輸入的離開站和終點站的車次
	 then
         -- 判斷off_date是否為空值
         if ((SELECT DISTINCT off_date FROM tbl_Train WHERE train_id = in_train_id ) is not NULL )
		 then
		   if exists(SELECT * FROM tbl_Train WHERE train_id = in_train_id 
                 AND (in_train_date BETWEEN on_date AND off_date)) -- 若off_date不為空值的話，除了要判斷該車次是否已上線，還需要判斷該車次是否已取消
           then
             INSERT INTO tbl_Ticket (ticket_id, userID, train_id, arrival_station,
                                     departure_station, seat_id, train_date, price, book_time, pay_time)
                          VALUES (NULL, in_user_id, in_train_id, in_arrival_station, 
								  in_departure_station, in_seat_id, in_train_date,computed_price, CURRENT_TIMESTAMP(), NULL);
             
             SELECT ticket_id, userID AS user_id, train_id, departure_station, arrival_station, seat_id, book_time, train_date
             FROM tbl_Ticket WHERE ticket_id =  (SELECT MAX(ticket_id) FROM tbl_Ticket);
      
             SELECT count(*) INTO num_row FROM tbl_Ticket WHERE ticket_id = (SELECT MAX(ticket_id) FROM tbl_Ticket);
			end if;
          else
            if exists(SELECT * FROM tbl_Train WHERE train_id = in_train_id 
                       AND in_train_date > on_date) -- 若off_date為空值的話，只需要判斷該車次是否已上線即可
            then
              INSERT INTO tbl_Ticket (ticket_id, userID, train_id, arrival_station,
                                      departure_station, seat_id, train_date, price, book_time, pay_time)
                          VALUES (NULL, in_user_id, in_train_id, in_arrival_station, 
					              in_departure_station, in_seat_id, in_train_date,computed_price, CURRENT_TIMESTAMP(), NULL);
               
               SELECT ticket_id, userID AS user_id, train_id, departure_station, arrival_station, seat_id, book_time, train_date
               FROM tbl_Ticket WHERE ticket_id =  (SELECT MAX(ticket_id) FROM tbl_Ticket);
      
               SELECT count(*) INTO num_row FROM tbl_Ticket WHERE ticket_id = (SELECT MAX(ticket_id) FROM tbl_Ticket);
            end if;
          end if; 
        end if; 
      end if;   
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_DeleteUserByUserID` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_DeleteUserByUserID`(
     in in_user_id int(10), 
     out affected_row_num int(100)
)
BEGIN
     declare num_of_del int; -- 有幾筆記錄被刪除了
     SET num_of_del = 0;
     SET  affected_row_num = 0;
     
     if not exists(SELECT * FROM tbl_Ticket WHERE userID = in_user_id)
     then
       if (SELECT isDeleted FROM tbl_User WHERE userID = in_user_id) =0 -- 尚未被刪除的使用者才可以刪除
       then
          SELECT COUNT(*) INTO num_of_del FROM tbl_User WHERE isDeleted = 1 ;
          
          UPDATE tbl_User
	      SET email = CONCAT('deleted_User',num_of_del),  -- 這樣email欄位就不會重複了
              first_name = 'XXX',
              last_name ='XXX',
              dob = '1970-01-01',
              salt = CONCAT('deleted_Salt',num_of_del),
              registerDateTime = '1970-01-01',
              isDeleted = 1
	      WHERE userID = in_user_id;
          
          UPDATE tbl_UserCredential                         -- tbl_UserCredential也要記得刪
	      SET HashedPwd = CONCAT('deleted_HashedPwd',num_of_del),
              CreateDateTime = '1970-01-01'
	      WHERE userID = in_user_id;
          
          SET  affected_row_num = ROW_COUNT();
       end if;
     end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_Delete_bookticket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_Delete_bookticket`(
    in in_user_id int(10),
    in in_ticket_id int(11), 
    out affected_row_num int(100)
)
BEGIN
		SET  affected_row_num  = 0;
        if exists (SELECT * FROM tbl_Ticket WHERE userID = in_user_id      
                     AND ticket_id = in_ticket_id  AND pay_time is NULL) AND  -- 只能刪尚未付款的訂票
				  exists (SELECT * FROM tbl_User WHERE userID = in_user_id AND isDeleted = 0) -- 使用者存在且尚未被刪除才可刪除訂票
        then             
          DELETE FROM tbl_Ticket 
		  WHERE userID = in_user_id
		  AND ticket_id = in_ticket_id ;
		  SET  affected_row_num  = ROW_COUNT();
         end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetBookTicketByUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_GetBookTicketByUser`(
    in in_userID int(10), 
    out num_row int(100)
)
BEGIN
	  SET num_row = 0;

      if exists(SELECT * FROM tbl_User WHERE userID = in_userID AND isDeleted = 0)
      then
		SELECT ticket_id, tbl_User.userID AS userID, train_id, seat_id, book_time 
        FROM tbl_Ticket
		INNER JOIN tbl_User 
		ON tbl_Ticket.userID = tbl_User.userID 
		WHERE tbl_User.userID = in_userID AND tbl_Ticket.pay_time IS NULL;  -- 尚未付款的訂票紀錄
	  
        SELECT count(*) INTO num_row 
        FROM tbl_User 
		INNER JOIN tbl_Ticket 
		ON tbl_User.userID = tbl_Ticket.userID 
		WHERE tbl_User.userID = in_userID AND tbl_Ticket.pay_time IS NULL;
      
      end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_GetStation` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_GetStation`(
     out num_row int
)
BEGIN

SELECT station_id,station_name FROM tbl_Station;
SELECT count(*) INTO num_row FROM tbl_Station;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_PayTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_PayTicket`(
    in in_user_id int(10),
    in in_ticket_id int(11),
    out affected_row_num int(100)
)
BEGIN
    declare bk_time datetime;
    declare dpt_date date;
    declare dpt_time time;
    declare tr_id int(10);
    declare dpt_station_id int(10);
    declare arv_station_id int(10);
    SET affected_row_num = 0;
     
    SELECT book_time INTO bk_time FROM tbl_Ticket WHERE ticket_id = in_ticket_id AND pay_time is NULL;
    SELECT train_date INTO dpt_date FROM tbl_Ticket WHERE ticket_id = in_ticket_id;
    SELECT departure_time INTO dpt_time FROM tbl_Train WHERE train_id = (SELECT train_id FROM tbl_Ticket WHERE ticket_id = in_ticket_id) AND departure_station_id = (SELECT departure_station FROM tbl_Ticket WHERE ticket_id = in_ticket_id);
    SELECT train_id INTO tr_id FROM tbl_Ticket WHERE ticket_id = in_ticket_id;
    SELECT departure_station INTO dpt_station_id FROM tbl_Ticket WHERE ticket_id = in_ticket_id;
    SELECT arrival_station INTO arv_station_id FROM tbl_Ticket WHERE ticket_id = in_ticket_id;
    if  bk_time is not NULL
    then
      if (TIMESTAMPDIFF(MINUTE, CURRENT_TIMESTAMP(), CONCAT(dpt_date,' ',dpt_time) )) >= 30 AND -- 車子離開30分鐘前不可以付款，且訂票後3天內才可付款，超過3天不能付款
          (TIMESTAMPDIFF(DAY,  bk_time, CURRENT_TIMESTAMP() ) ) <= 3
      then
        UPDATE tbl_Ticket
		SET pay_time = CURRENT_TIMESTAMP()
		WHERE userID = in_user_id AND ticket_id = in_ticket_id;
          
		SET affected_row_num = ROW_COUNT();
	  end if;
	end if;
    SELECT ticket_id, userID AS user_id, tbl_Ticket.train_id AS train_id, departure_station, arrival_station,
           seat_id, book_time, departure_time, arrival_time, price, pay_time
	FROM tbl_Ticket
	INNER JOIN 
       (SELECT train_id, departure_station_id, departure_time FROM tbl_Train WHERE train_id = tr_id AND departure_station_id = dpt_station_id) dpt
	ON tbl_Ticket.train_id = dpt.train_id
    INNER JOIN 
       (SELECT train_id, departure_station_id, arrival_time FROM tbl_Train WHERE train_id = tr_id AND departure_station_id = arv_station_id) arv
	ON tbl_Ticket.train_id = arv.train_id
			 WHERE userID = in_user_id AND ticket_id = in_ticket_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_QueryTicket` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_QueryTicket`(
    in in_departure_time time,
    in in_departure_station int,
    in in_arrival_station int, 
    out num_row int(100)
)
BEGIN
 
    declare dpt_loc_mrk int;
    declare arv_loc_mrk int;

    SET num_row = 0;
    
    SELECT location_marker INTO arv_loc_mrk FROM tbl_Station WHERE station_id = in_arrival_station;
    SELECT location_marker INTO dpt_loc_mrk FROM tbl_Station WHERE station_id = in_departure_station;
    
    if in_arrival_station > in_departure_station -- 南下
    then
    SELECT dpt.train_id AS train_id, dpt.departure_station_id AS departure_station, arv.departure_station_id AS arrival_station, departure_time, arrival_time, ABS( (arv_loc_mrk - dpt_loc_mrk) * 100) AS price
	FROM 
       (SELECT train_id, departure_station_id, departure_time FROM tbl_Train WHERE departure_station_id = in_departure_station AND departure_time >= in_departure_time) dpt
    INNER JOIN 
       (SELECT train_id, departure_station_id, arrival_time FROM tbl_Train WHERE departure_station_id = in_arrival_station) arv
	ON dpt.train_id = arv.train_id
    WHERE dpt.train_id <= 3 AND dpt.train_id NOT IN (SELECT train_id FROM tbl_Ticket WHERE train_date = CURDATE() GROUP BY train_id HAVING COUNT(*) >= 40); -- 判斷當日的某班次是否已經被訂40次了，即沒有座位了
    
    SELECT COUNT(*) INTO num_row
	FROM 
       (SELECT train_id, departure_station_id, departure_time FROM tbl_Train WHERE departure_station_id = in_departure_station AND departure_time >= in_departure_time) dpt
    INNER JOIN 
       (SELECT train_id, departure_station_id, arrival_time FROM tbl_Train WHERE departure_station_id = in_arrival_station) arv
	ON dpt.train_id = arv.train_id
    WHERE dpt.train_id <= 3 AND dpt.train_id NOT IN (SELECT train_id FROM tbl_Ticket WHERE train_date = CURDATE() GROUP BY train_id HAVING COUNT(*) >= 40);
	end if;
    
	if in_arrival_station < in_departure_station -- 北上
    then
    SELECT dpt.train_id AS train_id, dpt.departure_station_id AS departure_station, arv.departure_station_id AS arrival_station, departure_time, arrival_time, ABS( (arv_loc_mrk - dpt_loc_mrk) * 100) AS price
	FROM 
       (SELECT train_id, departure_station_id, departure_time FROM tbl_Train WHERE departure_station_id = in_departure_station AND departure_time >= in_departure_time) dpt
    INNER JOIN 
       (SELECT train_id, departure_station_id, arrival_time FROM tbl_Train WHERE departure_station_id = in_arrival_station) arv
	ON dpt.train_id = arv.train_id
    WHERE dpt.train_id >= 4 AND dpt.train_id NOT IN (SELECT train_id FROM tbl_Ticket WHERE train_date = CURDATE() GROUP BY train_id HAVING COUNT(*) >= 40);
    
    SELECT COUNT(*) INTO num_row
	FROM 
       (SELECT train_id, departure_station_id, departure_time FROM tbl_Train WHERE departure_station_id = in_departure_station AND departure_time >= in_departure_time) dpt
    INNER JOIN 
       (SELECT train_id, departure_station_id, arrival_time FROM tbl_Train WHERE departure_station_id = in_arrival_station) arv
	ON dpt.train_id = arv.train_id
    WHERE dpt.train_id >= 4 AND dpt.train_id NOT IN (SELECT train_id FROM tbl_Ticket WHERE train_date = CURDATE() GROUP BY train_id HAVING COUNT(*) >= 40);
     end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_RegisterUser` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_RegisterUser`(
    in in_email varchar(255),
    in in_firstname varchar(100),
    in in_lastname varchar(100),
    in in_Dob date, 
	in in_salt char(64),
    in in_hashedPwd char(255),
    out row_num int(100) 
)
sp_RegisterUser: BEGIN
    DECLARE affected_row_num INT;
    SET affected_row_num = 0;
    SET row_num = 0;

    if exists(SELECT email FROM tbl_User WHERE email = in_email)
     then
        leave sp_RegisterUser;   -- 若發現有重複的email時，直接離開stored procedure
    else 
        INSERT INTO tbl_User (userID, email, first_name, last_name, dob, salt, registerDateTime)
               VALUES (NULL, in_email, in_firstname, in_lastname, in_Dob, in_salt, CURDATE() );
        SET  affected_row_num = ROW_COUNT();
        
        if (affected_row_num = 1)  -- 當有功插入tbl_User時，才會插入tbl_UserCredential
        then
            SELECT COUNT(*) INTO row_num FROM tbl_User; -- 得到此使用者是在第幾列
            INSERT INTO tbl_UserCredential (userCredential, userID, HashedPwd, CreateDateTime)
               VALUES (NULL,(SELECT userID FROM tbl_User WHERE email = in_email) , in_hashedPwd, CURDATE() );
        end if;       
    end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ResetNewPassword` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_ResetNewPassword`(
    in in_userID int(10),
    in in_salt char(64), 
    in in_hashedPwd char(255),
    out affected_row_num int(100) 
)
BEGIN
      if exists(SELECT * FROM tbl_User WHERE userID = in_userID AND isDeleted =0)  -- 存在且未被刪除的使用者才可以更改salt和密碼
       then
          UPDATE tbl_UserCredential
	      SET HashedPwd = in_hashedPwd
	      WHERE userID = in_userID ;
          
          UPDATE tbl_User
	      SET salt = in_salt
	      WHERE userID = in_userID ;
	   end if;
       
          SET  affected_row_num = ROW_COUNT();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_UserLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`107403513`@`192.168.56.1` PROCEDURE `sp_UserLogin`(
    in in_email varchar(200),
    in in_hashedPwd char(255),
	out row_num int(100)
)
BEGIN

    if exists(SELECT * FROM tbl_User 
              JOIN tbl_UserCredential 
              ON tbl_User.userID = tbl_UserCredential.userID 
              WHERE tbl_User.email = in_email AND tbl_UserCredential.HashedPwd = in_hashedPwd AND isDeleted <> 1)
	  then
          SELECT userID INTO row_num FROM tbl_User WHERE email = in_email; -- 若登入成功就輸出該使用者是在第幾列
	else
		  SET  row_num = 0; -- 若登入失敗則輸出0
     end if;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-06-26 15:09:15
