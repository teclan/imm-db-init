

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

/*Table structure for table `devinfostatus_view` */

DROP TABLE IF EXISTS `devinfostatus_view`;

/*!50001 DROP VIEW IF EXISTS `devinfostatus_view` */;
/*!50001 DROP TABLE IF EXISTS `devinfostatus_view` */;

/*!50001 CREATE TABLE  `devinfostatus_view`(
 `ownerId` varchar(10) ,
 `devId` varchar(12) ,
 `isBF` int(1) ,
 `isActivation` int(1) ,
 `isTimeout` int(1) 
)*/;

/*Table structure for table `imm_alarmmainframe` */

DROP TABLE IF EXISTS `imm_alarmmainframe`;

/*!50001 DROP VIEW IF EXISTS `imm_alarmmainframe` */;
/*!50001 DROP TABLE IF EXISTS `imm_alarmmainframe` */;

/*!50001 CREATE TABLE  `imm_alarmmainframe`(
 `devId` varchar(12) ,
 `devName` varchar(255) ,
 `pnlActID` varchar(64) ,
 `areaId` varchar(18) ,
 `areaName` varchar(19) ,
 `devType` int(11) ,
 `devTypeName` varchar(32) ,
 `devModelId` int(11) ,
 `devModelName` varchar(32) ,
 `devIndex` varchar(12) ,
 `telAddr` varchar(48) ,
 `instMan` varchar(46) ,
 `devInstDate` varchar(20) ,
 `devLng` double ,
 `devlat` double ,
 `My_exp_devlat` varchar(6) ,
 `keyboardAddr` varchar(48) ,
 `pnlAddr` varchar(72) ,
 `pnlPowerAddr` varchar(48) ,
 `instUnit` varchar(40) ,
 `passCode` varchar(36) ,
 `pnlTel` varchar(100) ,
 `fMemo` varchar(255) 
)*/;

/*Table structure for table `imm_associateddevice` */

DROP TABLE IF EXISTS `imm_associateddevice`;

/*!50001 DROP VIEW IF EXISTS `imm_associateddevice` */;
/*!50001 DROP TABLE IF EXISTS `imm_associateddevice` */;

/*!50001 CREATE TABLE  `imm_associateddevice`(
 `userId` varchar(9) ,
 `devId` varchar(12) ,
 `devName` varchar(255) ,
 `devType` int(11) ,
 `devTypeName` varchar(32) ,
 `devModelId` int(11) ,
 `devModelName` varchar(32) ,
 `areaId` varchar(18) ,
 `areaName` varchar(19) ,
 `devState` int(11) 
)*/;

/*Table structure for table `imm_editowner` */

DROP TABLE IF EXISTS `imm_editowner`;

/*!50001 DROP VIEW IF EXISTS `imm_editowner` */;
/*!50001 DROP TABLE IF EXISTS `imm_editowner` */;

/*!50001 CREATE TABLE  `imm_editowner`(
 `roleId` varchar(32) ,
 `userAccount` varchar(18) ,
 `userPwd` varchar(16) ,
 `createDate` varchar(10) ,
 `userId` varchar(9) ,
 `userName` varchar(255) ,
 `userType` int(11) ,
 `userAddr` varchar(255) ,
 `userProperty` int(11) ,
 `businessId` varchar(24) ,
 `businessName` varchar(80) ,
 `centerId` varchar(32) ,
 `centerName` varchar(80) ,
 `payNO` varchar(64) ,
 `userServerType` int(11) ,
 `userServerTypeName` varchar(32) ,
 `contact` varchar(100) ,
 `contactPayNO` varchar(100) ,
 `cHmPhone` varchar(32) ,
 `cPhone` varchar(100) ,
 `cMobile` varchar(100) ,
 `nomRpt` int(11) ,
 `engageTest` int(11) ,
 `nomTest` int(11) ,
 `isVideoCheck` int(11) ,
 `areaId` varchar(18) ,
 `areaName` varchar(19) ,
 `isInsurance` int(11) ,
 `hasBak` int(11) ,
 `isPay` int(11) ,
 `usrAlmType` varchar(10) ,
 `uMem` varchar(255) ,
 `operName` varchar(100) ,
 `define2` varchar(128) ,
 `badMem` varchar(255) ,
 `road` varchar(100) ,
 `define3` varchar(128) ,
 `define1` varchar(255) ,
 `define6` varchar(128) ,
 `fMemo` varchar(255) ,
 `define4` varchar(255) ,
 `instDate` varchar(10) ,
 `liveDate` varchar(10) ,
 `pnlTelType` varchar(12) 
)*/;

/*Table structure for table `masterdevinfo_view` */

DROP TABLE IF EXISTS `masterdevinfo_view`;

/*!50001 DROP VIEW IF EXISTS `masterdevinfo_view` */;
/*!50001 DROP TABLE IF EXISTS `masterdevinfo_view` */;

/*!50001 CREATE TABLE  `masterdevinfo_view`(
 `ownerId` varchar(10) ,
 `devId` varchar(12) 
)*/;

/*Table structure for table `mcs_devstatus_view` */

DROP TABLE IF EXISTS `mcs_devstatus_view`;

/*!50001 DROP VIEW IF EXISTS `mcs_devstatus_view` */;
/*!50001 DROP TABLE IF EXISTS `mcs_devstatus_view` */;

/*!50001 CREATE TABLE  `mcs_devstatus_view`(
 `devId` varchar(9) ,
 `ownId` varchar(9) ,
 `isBF` int(1) ,
 `updateTime` timestamp 
)*/;

/*Table structure for table `userinfo_view` */

DROP TABLE IF EXISTS `userinfo_view`;

/*!50001 DROP VIEW IF EXISTS `userinfo_view` */;
/*!50001 DROP TABLE IF EXISTS `userinfo_view` */;

/*!50001 CREATE TABLE  `userinfo_view`(
 `userId` varchar(9) ,
 `userName` varchar(255) ,
 `cMobile` varchar(100) 
)*/;

/*Table structure for table `userinfostatus_view` */

DROP TABLE IF EXISTS `userinfostatus_view`;

/*!50001 DROP VIEW IF EXISTS `userinfostatus_view` */;
/*!50001 DROP TABLE IF EXISTS `userinfostatus_view` */;

/*!50001 CREATE TABLE  `userinfostatus_view`(
 `userId` varchar(9) ,
 `userName` varchar(255) ,
 `businessId` varchar(24) ,
 `businessName` varchar(80) 
)*/;

/*Table structure for table `view_mcs_member` */

DROP TABLE IF EXISTS `view_mcs_member`;

/*!50001 DROP VIEW IF EXISTS `view_mcs_member` */;
/*!50001 DROP TABLE IF EXISTS `view_mcs_member` */;

/*!50001 CREATE TABLE  `view_mcs_member`(
 `groupId` varchar(32) ,
 `groupName` varchar(32) ,
 `areaId` varchar(18) ,
 `userId` varchar(32) ,
 `isAlarm` int(1) ,
 `isBF` int(1) ,
 `isBYpass` int(4) ,
 `isTimeout` int(1) ,
 `isActivation` int(1) ,
 `userAddr` varchar(255) ,
 `cPhone` varchar(100) ,
 `businessId` varchar(24) ,
 `businessName` varchar(80) ,
 `userName` varchar(255) ,
 `updateTime` varchar(19) 
)*/;

/*View structure for view devinfostatus_view */

/*!50001 DROP TABLE IF EXISTS `devinfostatus_view` */;
/*!50001 DROP VIEW IF EXISTS `devinfostatus_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `devinfostatus_view` AS select `dev`.`ownerId` AS `ownerId`,`dev`.`devId` AS `devId`,`bcf`.`isBF` AS `isBF`,`m`.`isActivation` AS `isActivation`,`m`.`isTimeout` AS `isTimeout` from ((`masterdevinfo_view` `dev` left join `mcs_devstatus_view` `bcf` on((`bcf`.`devId` = convert(`dev`.`devId` using utf8)))) left join `mcs_customer_status` `m` on((convert(`dev`.`devId` using utf8) = `m`.`devId`))) */;

/*View structure for view imm_alarmmainframe */

/*!50001 DROP TABLE IF EXISTS `imm_alarmmainframe` */;
/*!50001 DROP VIEW IF EXISTS `imm_alarmmainframe` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `imm_alarmmainframe` AS select `imm_devinfo`.`devId` AS `devId`,`imm_devinfo`.`devName` AS `devName`,`imm_devinfo`.`pnlActID` AS `pnlActID`,`imm_devinfo`.`areaId` AS `areaId`,`imm_area`.`areaName` AS `areaName`,`imm_devinfo`.`devType` AS `devType`,`imm_devtype`.`devTypeName` AS `devTypeName`,`imm_devinfo`.`devModelId` AS `devModelId`,`imm_devmodel`.`devModelName` AS `devModelName`,`imm_alarmhostattr`.`devIndex` AS `devIndex`,`imm_alarmhostattr`.`telAddr` AS `telAddr`,`imm_devinfo`.`instMan` AS `instMan`,`imm_devinfo`.`devInstDate` AS `devInstDate`,`imm_devinfo`.`devLng` AS `devLng`,`imm_devinfo`.`devlat` AS `devlat`,'devlat' AS `My_exp_devlat`,`imm_alarmhostattr`.`keyboardAddr` AS `keyboardAddr`,`imm_devinfo`.`pnlAddr` AS `pnlAddr`,`imm_alarmhostattr`.`pnlPowerAddr` AS `pnlPowerAddr`,`imm_devinfo`.`instUnit` AS `instUnit`,`imm_alarmhostattr`.`passCode` AS `passCode`,`imm_alarmhostattr`.`pnlTel` AS `pnlTel`,`imm_devinfo`.`fMemo` AS `fMemo` from ((((`imm_devinfo` left join `imm_area` on((`imm_devinfo`.`areaId` = `imm_area`.`areaId`))) left join `imm_devtype` on((`imm_devinfo`.`devType` = `imm_devtype`.`devType`))) left join `imm_devmodel` on((`imm_devinfo`.`devModelId` = `imm_devmodel`.`devModelId`))) left join `imm_alarmhostattr` on((`imm_devinfo`.`devId` = `imm_alarmhostattr`.`devId`))) */;


/*View structure for view masterdevinfo_view */

/*!50001 DROP TABLE IF EXISTS `masterdevinfo_view` */;
/*!50001 DROP VIEW IF EXISTS `masterdevinfo_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `masterdevinfo_view` AS select `imm_devinfo`.`ownerId` AS `ownerId`,`imm_devinfo`.`devId` AS `devId` from `imm_devinfo` where (`imm_devinfo`.`controlType` = 'master') union all select `imm_devinfo`.`ownerId` AS `ownerId`,`imm_devinfo`.`devId` AS `devId` from `imm_devinfo` where (`imm_devinfo`.`controlType` = 'both') */;

/*View structure for view mcs_devstatus_view */

/*!50001 DROP TABLE IF EXISTS `mcs_devstatus_view` */;
/*!50001 DROP VIEW IF EXISTS `mcs_devstatus_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `mcs_devstatus_view` AS select `mcs_devstatus`.`devId` AS `devId`,max(`mcs_devstatus`.`ownId`) AS `ownId`,(case when (sum(`mcs_devstatus`.`isBF`) < count(`mcs_devstatus`.`isBF`)) then 0 else 1 end) AS `isBF`,max(`mcs_devstatus`.`updateTime`) AS `updateTime` from `mcs_devstatus` group by `mcs_devstatus`.`devId` */;

/*View structure for view userinfo_view */

/*!50001 DROP TABLE IF EXISTS `userinfo_view` */;
/*!50001 DROP VIEW IF EXISTS `userinfo_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `userinfo_view` AS select `i`.`userId` AS `userId`,`i`.`userName` AS `userName`,`c`.`cMobile` AS `cMobile` from (`imm_userinfo` `i` left join `imm_customerattr` `c` on((`c`.`userId` = `i`.`userId`))) where ((`i`.`userType` = '1') and (`i`.`areaId` is not null)) order by `i`.`userId` */;

/*View structure for view userinfostatus_view */

/*!50001 DROP TABLE IF EXISTS `userinfostatus_view` */;
/*!50001 DROP VIEW IF EXISTS `userinfostatus_view` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `userinfostatus_view` AS select `imm_userinfo`.`userId` AS `userId`,`imm_userinfo`.`userName` AS `userName`,`imm_customerattr`.`businessId` AS `businessId`,`imm_business`.`businessName` AS `businessName` from (((`imm_userinfo` left join `mcs_customer_status` on((convert(`imm_userinfo`.`userId` using utf8) = `mcs_customer_status`.`userId`))) left join `imm_customerattr` on((`imm_customerattr`.`userId` = `imm_userinfo`.`userId`))) left join `imm_business` on((`imm_business`.`businessId` = `imm_customerattr`.`businessId`))) */;

/*View structure for view view_mcs_member */

/*!50001 DROP TABLE IF EXISTS `view_mcs_member` */;
/*!50001 DROP VIEW IF EXISTS `view_mcs_member` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `view_mcs_member` AS select `mcs_group`.`groupId` AS `groupId`,`mcs_group`.`groupName` AS `groupName`,`mcs_group`.`areaId` AS `areaId`,`mcs_group_user`.`userId` AS `userId`,`mcs_customer_status`.`isAlarm` AS `isAlarm`,`mcs_customer_status`.`isBF` AS `isBF`,`mcs_customer_status`.`isBYpass` AS `isBYpass`,`mcs_customer_status`.`isTimeout` AS `isTimeout`,`mcs_customer_status`.`isActivation` AS `isActivation`,`imm_customerattr`.`userAddr` AS `userAddr`,`imm_customerattr`.`cPhone` AS `cPhone`,`imm_customerattr`.`businessId` AS `businessId`,`imm_customerattr`.`businessName` AS `businessName`,`imm_userinfo`.`userName` AS `userName`,`mcs_customer_status`.`updateTime` AS `updateTime` from ((((`mcs_customer_status` join `mcs_group_user` on((`mcs_group_user`.`userId` = convert(`mcs_customer_status`.`userId` using utf8)))) join `mcs_group` on((`mcs_group`.`groupId` = `mcs_group_user`.`groupId`))) join `imm_userinfo` on((`mcs_customer_status`.`userId` = convert(`imm_userinfo`.`userId` using utf8)))) join `imm_customerattr` on((`mcs_customer_status`.`userId` = convert(`imm_customerattr`.`userId` using utf8)))) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

