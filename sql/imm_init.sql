
DROP TABLE IF EXISTS `identifier_info`@

CREATE TABLE `identifier_info` (
  `id` varchar(9) NOT NULL,
  `userUsed` int(1) NOT NULL DEFAULT '0' COMMENT '是否被用户使用，1： 是  0：否',
  `devUsed` int(1) NOT NULL DEFAULT '0' COMMENT '是否被设备使用，1： 是  0：否',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='编号库'@


DROP TABLE IF EXISTS `imm_alarm_forward`@

CREATE TABLE `imm_alarm_forward` (
  `devId` varchar(16) NOT NULL COMMENT '设备编号',
  `stationNum` varchar(50) NOT NULL COMMENT '工作站编号'
) ENGINE=InnoDB DEFAULT CHARSET=utf8@



DROP TABLE IF EXISTS `imm_alarmcause`@

CREATE TABLE `imm_alarmcause` (
  `alarmcode` int(11) NOT NULL COMMENT '报警原因id',
  `alarmcontent` varchar(16) NOT NULL COMMENT '报警原因内容',
  PRIMARY KEY (`alarmcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_alarmcause`(`alarmcode`,`alarmcontent`) values (1,'111用户试机'),(2,'121技术试机'),(3,'211公司出警真警'),(4,'212公司出警误报'),(5,'213指挥中心出警误报'),(6,'214指挥中心真警'),(7,'215公司及指挥中心真警'),(8,'216公司及指挥中心误报'),(9,'311误报用户原因'),(10,'321误报环境原因'),(11,'331误报安装原因'),(12,'341误报设备原因'),(13,'351误报未知原因'),(14,'411线路故障'),(15,'421欠费停机'),(16,'431设备原因故障'),(17,'441未知原因故障'),(18,'511用户未布防')@


DROP TABLE IF EXISTS `imm_alarmhostattr`@

CREATE TABLE `imm_alarmhostattr` (
  `devId` varchar(12) CHARACTER SET gbk NOT NULL COMMENT '设备编号',
  `devIndex` varchar(12) CHARACTER SET gbk DEFAULT NULL COMMENT '设备索引',
  `telAddr` varchar(48) CHARACTER SET gbk DEFAULT NULL COMMENT '电话位置',
  `keyboardAddr` varchar(48) CHARACTER SET gbk DEFAULT NULL COMMENT '键盘位置',
  `pnlPowerAddr` varchar(48) CHARACTER SET gbk DEFAULT NULL COMMENT '电源位置',
  `pnlTel` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '联网电话',
  `pnlHdTel` varchar(26) CHARACTER SET gbk DEFAULT NULL COMMENT '无线卡号',
  `passCode` varchar(36) DEFAULT NULL COMMENT '安装员码',
  `RegexPWD` varchar(16) DEFAULT NULL COMMENT '回控码',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `define1` int(11) DEFAULT NULL COMMENT '预留字段',
  `define2` int(11) DEFAULT NULL COMMENT '预留字段',
  `define3` int(11) DEFAULT NULL COMMENT '预留字段',
  `define4` int(11) DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define7` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define8` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define9` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define10` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`devId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_almtype`@

CREATE TABLE `imm_almtype` (
  `almType` int(11) NOT NULL COMMENT '警情类型编号',
  `almTypeName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '警情类型名称',
  PRIMARY KEY (`almType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


insert  into `imm_almtype`(`almType`,`almTypeName`) values (-1,'未知(默认)'),(1,'24小时盗警'),(2,'报警'),(3,'盗警'),(4,'火警'),(5,'劫警'),(6,'紧急'),(7,'其他'),(8,'窃警'),(9,'警情类型')@


DROP TABLE IF EXISTS `imm_application`@

CREATE TABLE `imm_application` (
  `applicationId` varchar(40) CHARACTER SET gbk NOT NULL COMMENT '应用编号',
  `applicationName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '应用名称',
  `applicationUrl` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '应用网址',
  PRIMARY KEY (`applicationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


insert  into `imm_application`(`applicationId`,`applicationName`,`applicationUrl`) values ('',NULL,NULL),('IntegratedMM','管理平台',NULL),('Monitor_Video','实时监控',NULL),('Monitor_VideoRecords','录像查看',NULL),('RDAcenter','联网报警',NULL),('snowBrightWJ','雪亮万家',NULL),('Sys_GPSMonitor','校车管控',NULL)@


DROP TABLE IF EXISTS `imm_area`@

CREATE TABLE `imm_area` (
  `areaId` varchar(35) CHARACTER SET gbk NOT NULL COMMENT '区域编号',
  `areaName` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '区域名称',
  `parentAreaId` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '父节点编号',
  `fMemo` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `areaType` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '区域类型（区域/目录）',
  `parents` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '父节点路径',
  `dataFrom` varchar(255) DEFAULT NULL,
  `platformId` varchar(20) COMMENT '所属平台ID',
  PRIMARY KEY (`areaId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@



DROP TABLE IF EXISTS `imm_assemble_cfg`@

CREATE TABLE `imm_assemble_cfg` (
  `id` varchar(20) NOT NULL COMMENT '记录标识ID，与platformId一致',
  `platform_id` varchar(20) NOT NULL COMMENT '平台ID',
  `platform_name` varchar(255) NOT NULL COMMENT '平台名称',
  `platform_host` varchar(20) NOT NULL COMMENT '平台IP',
  `platform_type` varchar(10) NOT NULL COMMENT '子平台类型(本平台/上级平台/子平台)',
  `memo` varchar(50) NOT NULL COMMENT '备注',
  `dataFrom` varchar(255) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_business`@

CREATE TABLE `imm_business` (
  `businessId` int(24) NOT NULL COMMENT '用户行业编号',
  `businessName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '用户行业名称',
  PRIMARY KEY (`businessId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@


insert  into `imm_business`(`businessId`,`businessName`) values (1,'保险'),(4,'厂矿企业'),(7,'村镇'),(8,'电信'),(11,'公安'),(12,'公司'),(14,'加油站'),(15,'宾馆、饭店'),(16,'餐饮、娱乐'),(18,'教育'),(19,'金融'),(20,'科研'),(23,'企业'),(26,'事业、机关'),(28,'收费站'),(31,'网吧'),(33,'卫生'),(38,'学校'),(39,'烟草'),(40,'医院'),(42,'邮政'),(44,'幼儿园'),(48,'证券'),(49,'个人'),(50,'门市'),(51,'能源'),(52,'通信'),(53,'文教'),(54,'政府机关'),(56,'珠宝'),(64,'药店'),(65,'信用社'),(73,'石油'),(75,'汽车销售'),(80,'集体'),(83,'行政机关'),(85,'邯钢'),(88,'国有'),(91,'国家机关'),(93,'供电'),(96,'电视监控'),(97,'单位')@


DROP TABLE IF EXISTS `imm_business_copy`@

CREATE TABLE `imm_business_copy` (
  `businessId` int(24) NOT NULL COMMENT '用户行业编号',
  `businessName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '用户行业名称',
  PRIMARY KEY (`businessId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_camera`@

CREATE TABLE `imm_camera` (
  `devId` varchar(12) NOT NULL COMMENT 'varchar',
  `devChannelId` varchar(4) NOT NULL COMMENT '通道号',
  `videoUrlSuf` varchar(255) DEFAULT NULL COMMENT '视频播放串后缀',
  `videoServer` varchar(15) DEFAULT NULL COMMENT '流转服务（IP(15)），与nvr内容一致',
  `cameraName` varchar(255) DEFAULT NULL COMMENT '摄像机名称',
  `atPos` varchar(128) DEFAULT NULL COMMENT '摄像机位置',
  `instDate` varchar(10) DEFAULT NULL COMMENT '安装时间',
  `wantDo` varchar(20) DEFAULT NULL COMMENT '反应类型',
  `almType` varchar(40) DEFAULT NULL COMMENT '警情类型',
  `cameraModeId` int(11) DEFAULT '-1' COMMENT '摄像机型号，默认-1',
  `cameraType` varchar(40) DEFAULT NULL COMMENT '摄像机类型',
  `fMemo` varchar(255) DEFAULT NULL COMMENT '备注',
  `updatetime` varchar(19) DEFAULT NULL COMMENT '更新时间',
  `syncTime` varchar(19) DEFAULT NULL COMMENT '同步时间',
  `devMonitorId` varchar(32) DEFAULT NULL COMMENT '设备监控点编号',
  `define2` varchar(32) DEFAULT NULL COMMENT '预留字段',
  `define3` varchar(32) DEFAULT NULL COMMENT '预留字段',
  `define4` varchar(32) DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(32) DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(32) DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  `relateNVR` varchar(12) DEFAULT NULL COMMENT '关联的NVR设备编号',
  PRIMARY KEY (`devId`,`devChannelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_cameramodel`@

CREATE TABLE `imm_cameramodel` (
  `cameraModelId` int(11) NOT NULL COMMENT '摄像机型号编号',
  `cameraModelName` varchar(50) DEFAULT NULL COMMENT '摄像机型号名称',
  `cameraMemo` varchar(20) DEFAULT NULL COMMENT '摄像机用途',
  `cameraKind` varchar(20) DEFAULT NULL,
  `buyPrice` float DEFAULT '0' COMMENT '摄像机价格',
  `servicePrice` float DEFAULT '0' COMMENT '服务费用',
  `wantDo` varchar(20) DEFAULT NULL COMMENT '反应类型',
  `almType` varchar(16) DEFAULT NULL COMMENT '警情类型',
  PRIMARY KEY (`cameraModelId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


insert  into `imm_cameramodel`(`cameraModelId`,`cameraModelName`,`cameraMemo`,`cameraKind`,`buyPrice`,`servicePrice`,`wantDo`,`almType`) values (-1,'未知(默认)','','未知(默认)',0,0,'-1','-1'),(1,'DS-2CD1021-I',NULL,'枪机',0,0,NULL,NULL)@


DROP TABLE IF EXISTS `imm_cameratype`@

CREATE TABLE `imm_cameratype` (
  `cameraType` int(11) NOT NULL COMMENT '摄像机类型编号',
  `cameraTypeName` varchar(50) DEFAULT NULL COMMENT '摄像机类型名称',
  PRIMARY KEY (`cameraType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


insert  into `imm_cameratype`(`cameraType`,`cameraTypeName`) values (-1,'未知(默认)'),(1,'枪机')@


DROP TABLE IF EXISTS `imm_codetype`@

CREATE TABLE `imm_codetype` (
  `codeTypeId` int(11) NOT NULL COMMENT '事件类型编号',
  `codeType` varchar(10) DEFAULT NULL COMMENT '事件类型',
  PRIMARY KEY (`codeTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


insert  into `imm_codetype`(`codeTypeId`,`codeType`) values (0,'错误'),(1,'紧急'),(2,'警报'),(3,'火警'),(4,'劫盗'),(5,'监控'),(6,'故障事件'),(7,'撤布防'),(8,'遥控编程'),(9,'出入'),(10,'停用'),(11,'旁路'),(12,'测试报告'),(13,'状态报告'),(14,'用户'),(15,'计划任务'),(16,'编程')@


DROP TABLE IF EXISTS `imm_communicate_line`@

CREATE TABLE `imm_communicate_line` (
  `line` varchar(20) NOT NULL,
  `communicateLineName` varchar(20) NOT NULL,
  `fMemo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`line`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


insert  into `imm_communicate_line`(`line`,`communicateLineName`,`fMemo`) values ('-1','默认线路',''),('0','线路1',NULL),('1','线路2',NULL),('2','线路3',NULL)@


DROP TABLE IF EXISTS `imm_communicate_protocol`@

CREATE TABLE `imm_communicate_protocol` (
  `protocol` varchar(20) NOT NULL,
  `communicateProtocolName` varchar(20) NOT NULL,
  `fMemo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`protocol`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_communicate_protocol`(`protocol`,`communicateProtocolName`,`fMemo`) values ('-1','Ehome协议','')@

DROP TABLE IF EXISTS `imm_customerattr`@

CREATE TABLE `imm_customerattr` (
  `userId` varchar(9) CHARACTER SET gbk NOT NULL COMMENT '用户编号',
  `userAddr` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '用户地址',
  `userProperty` int(11) DEFAULT NULL COMMENT '用户属性',
  `businessId` varchar(24) CHARACTER SET gbk DEFAULT NULL COMMENT '用户行业',
  `businessName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '用户行业名称',
  `payNO` varchar(64) CHARACTER SET gbk DEFAULT NULL COMMENT '口令',
  `isHost` int(11) DEFAULT NULL COMMENT '是否机主',
  `contact` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '单位负责人',
  `contactPayNO` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人口令',
  `cHmPhone` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人家庭电话',
  `cPhone` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人电话',
  `cMobile` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人手机',
  `userServerType` int(11) DEFAULT NULL COMMENT '用户服务类型（A100中的用户类型，报警主机、视频报警主机、DVR等等）',
  `nomRpt` int(11) DEFAULT NULL COMMENT '定期撤布防用户',
  `engageTest` int(11) DEFAULT NULL COMMENT '定期测试用户',
  `nomTest` int(11) DEFAULT NULL COMMENT '紧急按钮用户',
  `isVideoCheck` int(11) DEFAULT NULL COMMENT '短信转发',
  `isInsurance` int(11) DEFAULT NULL COMMENT '投保',
  `hasBak` int(11) DEFAULT NULL COMMENT '是否来电正常',
  `isPay` int(11) DEFAULT NULL COMMENT '缴费状态',
  `usrAlmType` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '处警等级',
  `uMem` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '处警注释',
  `operName` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '录入人',
  `define2` varchar(128) CHARACTER SET gbk DEFAULT NULL COMMENT '暂停时间',
  `badMem` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '故障提示',
  `road` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '道路标志',
  `define3` varchar(128) CHARACTER SET gbk DEFAULT NULL COMMENT '布防时间',
  `define1` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '子行业',
  `define6` varchar(128) CHARACTER SET gbk DEFAULT NULL COMMENT '中心号',
  `instDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '安装日期',
  `liveDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '入网日期',
  `pnlTelType` varchar(12) CHARACTER SET gbk DEFAULT NULL COMMENT '入网类型',
  `pnlTel` varchar(32) DEFAULT NULL COMMENT '联网电话',
  `pnlHdTel` varchar(26) DEFAULT NULL COMMENT '无线卡号',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `define4` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注4',
  `define5` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define7` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define8` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define9` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define10` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_dealway`@

CREATE TABLE `imm_dealway` (
  `ownerId` varchar(10) DEFAULT NULL COMMENT '机主编号',
  `dealWayId` int(11) DEFAULT NULL COMMENT '序号',
  `fdata` varchar(2000) DEFAULT NULL COMMENT '内容',
  `fMemo` varchar(255) DEFAULT NULL COMMENT '备注',
  `dataFrom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_devinfo`@

CREATE TABLE `imm_devinfo` (
  `devId` varchar(12) CHARACTER SET gbk NOT NULL COMMENT '设备编号',
  `devName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '设备名称',
  `pnlActID` varchar(64) CHARACTER SET gbk DEFAULT NULL COMMENT '设备关联编号',
  `areaId` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '设备所属区域编号',
  `devType` int(11) DEFAULT NULL COMMENT '设备类型编号',
  `devModelId` int(11) DEFAULT NULL COMMENT '设备型号编号',
  `ownerId` varchar(10) DEFAULT NULL COMMENT '机主编号',
  `userName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '机主名称（用户名称）',
  `userAddr` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '机主地址（用户地址）',
  `contact` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '机主负责人姓名（用户负责人）',
  `cPhone` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '机主负责人电话（用户负责人电话）',
  `devLng` double DEFAULT NULL COMMENT '设备经度',
  `devlat` double DEFAULT NULL COMMENT '设备纬度',
  `pnlAddr` varchar(72) CHARACTER SET gbk DEFAULT NULL COMMENT '设备位置',
  `instMan` varchar(46) CHARACTER SET gbk DEFAULT NULL COMMENT '设备安装员',
  `devInstDate` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '设备安装时间',
  `instUnit` varchar(40) CHARACTER SET gbk DEFAULT NULL COMMENT '设备安装单位',
  `devState` int(11) DEFAULT '2' COMMENT '设备状态（0不在线；1在线；2未知）',
  `serverId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '服务器编号',
  `mapId` varchar(40) CHARACTER SET gbk DEFAULT NULL COMMENT '防区图编号',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `syncTime` varchar(19) DEFAULT NULL COMMENT '同步时间',
  `relateNVR` varchar(12) DEFAULT NULL COMMENT '关联NVR编号',
  `manufacturer` varchar(32) DEFAULT NULL COMMENT '厂商类型（例如HIK）',
  `controlType` varchar(20) DEFAULT '' COMMENT '控制类型：主设备/远程控制设备/都是 （master/remote/both）',
  `define1` int(11) DEFAULT NULL COMMENT '预留字段',
  `define2` int(11) DEFAULT NULL COMMENT '预留字段',
  `define3` int(11) DEFAULT NULL COMMENT '预留字段',
  `define4` int(11) DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define7` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define8` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define9` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define10` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  `platformId` varchar(20) DEFAULT NULL COMMENT '所属平台ID',
  PRIMARY KEY (`devId`),
  KEY `idx_imm_devinfo_2` (`controlType`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8@


DROP TABLE IF EXISTS `imm_devmodel`@

CREATE TABLE `imm_devmodel` (
  `devModelId` int(11) NOT NULL COMMENT '设备型号编号',
  `devModelName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '设备型号名称',
  `devType` int(11) DEFAULT NULL COMMENT '设备类型编号',
  `zoneNum` int(11) DEFAULT NULL COMMENT '防区个数',
  `prog_type` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '编程类型',
  `ChannelNum` int(11) DEFAULT NULL COMMENT '通道数',
  `ZoneNumEx` int(11) DEFAULT NULL COMMENT '扩展防区数',
  `CodeWayId_42` int(11) DEFAULT NULL COMMENT '2位编码方案',
  `CodeWayId_FSK` int(11) DEFAULT NULL COMMENT '4位编码方案',
  `CodeWayId_CID` int(11) DEFAULT NULL,
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`devModelId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@

insert  into `imm_devmodel`(`devModelId`,`devModelName`,`devType`,`zoneNum`,`prog_type`,`ChannelNum`,`ZoneNumEx`,`CodeWayId_42`,`CodeWayId_FSK`,`CodeWayId_CID`,`dataFrom`) values (62,'SP-4000(PM2000G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(63,'SP-4000(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(64,'SP-4000(WT300T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(65,'SP-5500',1,0,'DEFAULT',0,0,0,0,0,NULL),(66,'SP-5500(PCS250)',1,0,'DEFAULT',0,0,0,0,0,NULL),(67,'SP-5500(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(68,'SP-5500(WT300T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(69,'SP-6000',1,0,'DEFAULT',0,0,0,0,0,NULL),(70,'SP-6000(DS-19M04-GP/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(71,'SP-6000(DS-19M04-GS/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(72,'SP-6000(IP150)',1,0,'DEFAULT',0,0,0,0,0,NULL),(73,'SP-6000(LX8511)',1,0,'DEFAULT',0,0,0,0,0,NULL),(74,'SP-6000(PCS250)',1,0,'DEFAULT',0,0,0,0,0,NULL),(75,'SP-6000(PCS250G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(76,'SP-6000(PM2000D)',1,0,'DEFAULT',0,0,0,0,0,NULL),(77,'SP-6000(PM2000G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(78,'SP-6000(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(79,'SP-6000(UC300)',1,0,'DEFAULT',0,0,0,0,0,NULL),(80,'SP-6000(WT300T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(81,'SP-7000',1,0,'DEFAULT',0,0,0,0,0,NULL),(82,'SP-7000(DS-19M04-GP/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(83,'SP-7000(DS-19M04-GS/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(84,'SP-7000(IP150)',1,0,'DEFAULT',0,0,0,0,0,NULL),(85,'SP-7000(PCS250)',1,0,'DEFAULT',0,0,0,0,0,NULL),(86,'SP-7000(PCS250G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(87,'SP-7000(PM2000D)',1,0,'DEFAULT',0,0,0,0,0,NULL),(88,'SP-7000(PM2000G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(89,'SP-7000(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(90,'SP-7000(UC300)',1,0,'DEFAULT',0,0,0,0,0,NULL),(91,'SP-7000(WT300T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(92,'SY9214G-5S',1,0,'DEFAULT',0,0,0,0,0,NULL),(93,'SY9214G-XM',1,0,'DEFAULT',0,0,0,0,0,NULL),(94,'ZX8',1,0,'DEFAULT',0,0,0,0,0,NULL),(95,'海康三网',1,0,'DEFAULT',0,0,0,0,0,NULL),(96,'氯气主机',1,0,'DEFAULT',0,0,0,0,0,NULL),(97,'英安特',1,0,'DEFAULT',0,0,0,0,0,NULL),(58,'SP-4000(LX8511)',1,0,'DEFAULT',0,0,0,0,0,NULL),(59,'SP-4000(PCS250)',1,0,'DEFAULT',0,0,0,0,0,NULL),(60,'SP-4000(PCS250G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(61,'SP-4000(PM2000D)',1,0,'DEFAULT',0,0,0,0,0,NULL),(56,'SP-4000(DS-19M04-GP/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(57,'SP-4000(DS-19M04-GS/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(51,'PGM4',1,0,'DEFAULT',0,0,0,0,0,NULL),(52,'PM2000G(139G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(53,'SE-817',1,0,'DEFAULT',0,0,0,0,0,NULL),(54,'SK239G',1,0,'DEFAULT',0,0,0,0,0,NULL),(55,'SP-4000',1,0,'DEFAULT',0,0,0,0,0,NULL),(50,'PCS200',1,0,'DEFAULT',0,0,0,0,0,NULL),(46,'NT316',1,0,'DEFAULT',0,0,0,0,0,NULL),(47,'NT332',1,0,'DEFAULT',0,0,0,0,0,NULL),(48,'OMNI-400',1,0,'DEFAULT',0,0,0,0,0,NULL),(49,'PC1616',1,0,'DEFAULT',0,0,0,0,0,NULL),(45,'NT206',1,0,'DEFAULT',0,0,0,0,0,NULL),(98,'139G',1,0,'DEFAULT',0,0,0,0,0,NULL),(99,'PCS250G',1,0,'DEFAULT',0,0,0,0,0,NULL),(101,'PM2000G',1,0,'DEFAULT',0,0,0,0,0,NULL),(0,'SP-4000IP150',1,0,'DEFAULT',0,0,0,0,0,NULL),(102,'SP-4000(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(103,'SP-5500(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(104,'SP-6000(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(105,'SP-7000(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(100,'SP7000(PCS200)',1,0,'DEFAULT',0,0,0,0,0,NULL),(107,'SP6000(PCS200)',1,0,'DEFAULT',0,0,0,0,0,NULL),(108,'SP4000(PCS200)',1,0,'DEFAULT',0,0,0,0,0,NULL),(109,'英安特16A',1,0,'DEFAULT',0,0,0,0,0,NULL),(110,'728',1,0,'DEFAULT',0,0,0,0,0,NULL),(111,'738',1,0,'DEFAULT',0,0,0,0,0,NULL),(113,'HY-171VC/4',1,0,'DEFAULT',0,0,0,0,0,NULL),(114,'Infinit（无线主机模块）',1,0,'DEFAULT',0,0,0,0,0,NULL),(115,'Infinit（2GSM）',1,0,'DEFAULT',0,0,0,0,0,NULL),(116,'IP250G',1,0,'DEFAULT',0,0,0,0,0,NULL),(117,'KLG-X50',1,0,'DEFAULT',0,0,0,0,0,NULL),(118,'MTA311',1,0,'DEFAULT',0,0,0,0,0,NULL),(119,'PC1616(2GSM)',1,0,'DEFAULT',0,0,0,0,0,NULL),(120,'E55(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(121,'E55(广拓)',1,0,'DEFAULT',0,0,0,0,0,NULL),(122,'Infinit（CWS1104）',1,0,'DEFAULT',0,0,0,0,0,NULL),(123,'E55(NAT-2GSM)',1,0,'DEFAULT',0,0,0,0,0,NULL),(127,'OMNI400',1,0,'DEFAULT',0,0,0,0,0,NULL),(128,'SP7000(PCS260)',1,0,'DEFAULT',0,0,0,0,0,NULL),(129,'MG6250(GPRS14)',1,0,'DEFAULT',0,0,0,0,0,NULL),(131,'MG5000（PCS250）',1,0,'DEFAULT',0,0,0,0,0,NULL),(133,'DS-19M04-G',1,0,'DEFAULT',0,0,0,0,0,NULL),(134,'DS-19M04-T ',1,0,'DEFAULT',0,0,0,0,0,NULL),(1,'4110DL',1,0,'DEFAULT',0,0,0,0,0,NULL),(2,'728EX',1,0,'DEFAULT',0,0,0,0,0,NULL),(3,'728EX4',1,0,'DEFAULT',0,0,0,0,0,NULL),(4,'728ULT',1,0,'DEFAULT',0,0,0,0,0,NULL),(5,'728ULT(DS-19M04-GP/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(6,'728ULT(PM2000D)',1,0,'DEFAULT',0,0,0,0,0,NULL),(7,'738ULT',1,0,'DEFAULT',0,0,0,0,0,NULL),(8,'748ULT',1,0,'DEFAULT',0,0,0,0,0,NULL),(9,'8A',1,0,'DEFAULT',0,0,0,0,0,NULL),(10,'AW-BM1600',1,0,'DEFAULT',0,0,0,0,0,NULL),(11,'AW-BM1600-4A',1,0,'DEFAULT',0,0,0,0,0,NULL),(12,'AW-BM1600-4A（英飞特自带）',1,0,'DEFAULT',0,0,0,0,0,NULL),(13,'AW-BM1600-6A',1,0,'DEFAULT',0,0,0,0,0,NULL),(14,'AW-BM1600-6A（英飞特自带）',1,0,'DEFAULT',0,0,0,0,0,NULL),(15,'AW-BM1600-8A',1,0,'DEFAULT',0,0,0,0,0,NULL),(16,'AW-BM1600-8A（英飞特自带）',1,0,'DEFAULT',0,0,0,0,0,NULL),(18,'CP-816',1,0,'DEFAULT',0,0,0,0,0,NULL),(19,'CWS1104',1,0,'DEFAULT',0,0,0,0,0,NULL),(20,'DS-19A08-BNG',1,0,'DEFAULT',0,0,0,0,0,NULL),(21,'DS7400',1,0,'DEFAULT',0,0,0,0,0,NULL),(22,'E55',1,0,'DEFAULT',0,0,0,0,0,NULL),(23,'E55(139G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(24,'E55(DS-19M04-GP/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(25,'E55(PM2000D)',1,0,'DEFAULT',0,0,0,0,0,NULL),(26,'E55(PM2000G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(27,'EVO-192',1,0,'DEFAULT',0,0,0,0,0,NULL),(28,'EVO-192(PCS250)',1,0,'DEFAULT',0,0,0,0,0,NULL),(29,'EVO-192(PCS260)',1,0,'DEFAULT',0,0,0,0,0,NULL),(30,'EVO-192(PM2000G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(31,'EVO-48',1,0,'DEFAULT',0,0,0,0,0,NULL),(32,'HONEYWELL-2316',1,0,'DEFAULT',0,0,0,0,0,NULL),(33,'INANTER',1,0,'DEFAULT',0,0,0,0,0,NULL),(34,'Infinite',1,0,'DEFAULT',0,0,0,0,0,NULL),(35,'KB-A1188',1,0,'DEFAULT',0,0,0,0,0,NULL),(36,'KB-A1189',1,0,'DEFAULT',0,0,0,0,0,NULL),(37,'LX6221',1,0,'DEFAULT',0,0,0,0,0,NULL),(38,'LX6231',1,0,'DEFAULT',0,0,0,0,0,NULL),(39,'MG-5000',1,0,'DEFAULT',0,0,0,0,0,NULL),(40,'MG-5050',1,0,'DEFAULT',0,0,0,0,0,NULL),(41,'MG-6130',1,0,'DEFAULT',0,0,0,0,0,NULL),(42,'MG-6250',1,0,'DEFAULT',0,0,0,0,0,NULL),(43,'NT1-EG-V20',1,0,'DEFAULT',0,0,0,0,0,NULL),(44,'NT1-TEGW-V20',1,0,'DEFAULT',0,0,0,0,0,NULL),(135,'Vista120',1,0,'DEFAULT',0,0,0,0,0,NULL),(136,'SP6000（PCS260）',1,0,'DEFAULT',0,0,0,0,0,NULL),(137,'DS-19M04',1,0,'DEFAULT',0,0,0,0,0,NULL),(138,'SP4000(GPRS/GSM)',1,0,'DEFAULT',0,0,0,0,0,NULL),(139,'SP4000(2GSM)',1,0,'DEFAULT',0,0,0,0,0,NULL),(140,'SP6000(2GSM)',1,0,'DEFAULT',0,0,0,0,0,NULL),(141,'SP7000(2GSM)',1,0,'DEFAULT',0,0,0,0,0,NULL),(142,'SP6000(NAT)',1,0,'DEFAULT',0,0,0,0,0,NULL),(143,'SP7000(海康)',1,0,'DEFAULT',0,0,0,0,0,NULL),(146,'科立信KS－600C／D',1,0,'DEFAULT',0,0,0,0,0,NULL),(147,'电视监控',1,0,'DEFAULT',0,0,0,0,0,NULL),(148,'成都理想',1,0,'DEFAULT',0,0,0,0,0,NULL),(130,'728ULT(DS-19M04-GS/T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(149,'E55（DS-19M04-GS/T）',1,0,'DEFAULT',0,0,0,0,0,NULL),(150,'1759',1,0,'DEFAULT',0,0,0,0,0,NULL),(151,'748 ',1,0,'DEFAULT',0,0,0,0,0,NULL),(155,'EVO-192(300T)',1,0,'DEFAULT',0,0,0,0,0,NULL),(132,'EVO-192(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(126,'EVO-192(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(125,'EVO-192(PCS250G )',1,0,'DEFAULT',0,0,0,0,0,NULL),(154,'EVO-48(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(17,'CP-428',1,0,'DEFAULT',0,0,0,0,0,NULL),(152,'CP-428(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(106,'CP-816(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(153,'MG-5000(TC-35)',1,0,'DEFAULT',0,0,0,0,0,NULL),(112,'728ULT(CWS1104)',1,0,'DEFAULT',0,0,0,0,0,NULL),(156,'DS-2CD3T25D-15',1,0,'DEFAULT',0,0,0,0,0,NULL),(157,'DS-7208HV',1,0,'DEFAULT',0,0,0,0,0,NULL),(158,'DS-7816N-K2',1,0,'DEFAULT',0,0,0,0,0,NULL),(159,'SP-5500(PCS260)',1,0,'DEFAULT',0,0,0,0,0,NULL),(160,'SP-7000(PCS260G)',1,0,'DEFAULT',0,0,0,0,0,NULL),(161,'NT216',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000001,'net+NVR',10,0,NULL,4,0,0,0,0,NULL),(900000002,'wireNVR0001',9,0,NULL,4,0,0,0,0,NULL),(900000003,'wireNVR0003',9,0,NULL,8,0,0,0,0,NULL),(162,'GPRS',1,32,'',0,0,0,0,0,NULL),(163,'海康DS-19A08-BN',1,32,'',0,0,0,0,0,NULL),(164,'DS-19K00-B',1,32,'',0,0,0,0,0,NULL),(165,'DS-19A08-ENG-1',1,32,'',0,0,0,0,0,NULL),(166,'DS-19A08-ENG',1,32,'',0,0,0,0,0,NULL),(167,'DS-19A08',1,32,'',0,0,0,0,0,NULL),(168,'SK-139G',1,32,'',0,0,0,0,0,NULL),(169,'728ULT 139',1,32,'',0,0,0,0,0,NULL),(170,'E55、139G',1,32,'',0,0,0,0,0,NULL),(171,'9001无线',1,32,'',0,0,0,0,0,NULL),(172,'728ULT-VP',1,32,'',0,0,0,0,0,NULL),(173,'VS-01-A',1,32,'',0,0,0,0,0,NULL),(174,'INFINIT华',1,32,'',0,0,0,0,0,NULL),(175,'HC-2000',1,32,'',0,0,0,0,0,NULL),(176,'HC-200开拓',1,32,'',0,0,0,0,0,NULL),(177,'IMFINITE',1,32,'',0,0,0,0,0,NULL),(178,'IFINITE',1,32,'',0,0,0,0,0,NULL),(179,'E55,',1,32,'',0,0,0,0,0,NULL),(180,'无线主机',1,32,'',0,0,0,0,0,NULL),(181,'迈PM2000G',1,32,'',0,0,0,0,0,NULL),(183,'PM200G',1,32,'',0,0,0,0,0,NULL),(184,'MG2000',1,32,'',0,0,0,0,0,NULL),(185,'PM2000',1,32,'',0,0,0,0,0,NULL),(186,'PMG2000',1,32,'',0,0,0,0,0,NULL),(188,' PM2000G',1,32,'',0,0,0,0,0,NULL),(189,'SP6000/139G',1,32,'',0,0,0,0,0,NULL),(191,'4110DL,139',1,32,'',0,0,0,0,0,NULL),(192,'E55 PM2000',1,32,'',0,0,0,0,0,NULL),(193,'SP6000 丛文无线',1,32,'',0,0,0,0,0,NULL),(194,'SP6000丛文',1,32,'',0,0,0,0,0,NULL),(195,'SP6000/丛文',1,32,'',0,0,0,0,0,NULL),(196,'SP6000丛文无线',1,32,'',0,0,0,0,0,NULL),(197,'SP6000/CWS1104',1,32,'',0,0,0,0,0,NULL),(198,'E552GSM',1,32,'',0,0,0,0,0,NULL),(199,'SP6000/139',1,32,'',0,0,0,0,0,NULL),(201,'E552G无线',1,32,'',0,0,0,0,0,NULL),(202,'SP40002GSM',1,32,'',0,0,0,0,0,NULL),(203,'E55 NAT-29',1,32,'',0,0,0,0,0,NULL),(204,'SP7000/CWS1104',1,32,'DEFAULT',0,32,0,0,0,NULL),(205,'SP6000/2GSM',1,32,'',0,0,0,0,0,NULL),(206,'SP4000/139G',1,32,'',0,0,0,0,0,NULL),(207,'E55/NAT2GS',1,32,'',0,0,0,0,0,NULL),(208,'SP6000-CWS1104',1,32,'',0,0,0,0,0,NULL),(209,'SP6000/NAT',1,32,'',0,0,0,0,0,NULL),(210,'E55，NAT-2',1,32,'',0,0,0,0,0,NULL),(211,'MG6250',1,32,'',0,0,0,0,0,NULL),(212,'SP400OCWS1104无线',1,32,'',0,0,0,0,0,NULL),(213,'SP550OCWS1104无线',1,32,'',0,0,0,0,0,NULL),(214,'SP4000/丛文',1,32,'',0,0,0,0,0,NULL),(215,'EV048',1,64,'DEFAULT',0,0,0,0,0,NULL),(216,'728.139G',1,32,'',0,0,0,0,0,NULL),(217,'SP4000 NAT',1,32,'',0,0,0,0,0,NULL),(219,'E552GM',1,32,'',0,0,0,0,0,NULL),(220,' E55/2GSM',1,32,'',0,0,0,0,0,NULL),(221,'SP4000/2GSM',1,32,'',0,0,0,0,0,NULL),(222,'E55\\2GSM',1,32,'',0,0,0,0,0,NULL),(223,'E55、2GM',1,32,'',0,0,0,0,0,NULL),(224,'E55 GPRS/GSM',1,32,'',0,0,0,0,0,NULL),(225,'SP4000 GPRS/GSM',1,32,'',0,0,0,0,0,NULL),(226,'SP7000,2GSM',1,32,'',0,0,0,0,0,NULL),(227,'SP6000从文',1,32,'',0,0,0,0,0,NULL),(228,'SP4000/CWS',1,32,'',0,0,0,0,0,NULL),(229,'728EX,139G',1,32,'',0,0,0,0,0,NULL),(230,'SP6000，139G',1,32,'',0,0,0,0,0,NULL),(231,'4110DL 139',1,32,'',0,0,0,0,0,NULL),(232,'SP6000/丛文主机',1,32,'',0,0,0,0,0,NULL),(233,'SP6000CWS1104',1,32,'',0,0,0,0,0,NULL),(234,'SP6000/1104无线',1,32,'',0,0,0,0,0,NULL),(235,'SP4000/817',1,32,'',0,0,0,0,0,NULL),(236,'E55/丛文无线',1,32,'',0,0,0,0,0,NULL),(237,'CP816',1,32,'Contact_ID',0,0,0,0,0,NULL),(238,'P_2316',1,32,'P_2316',0,0,0,0,0,NULL),(239,'P_236',1,32,'P_236',0,0,0,0,0,NULL),(240,'P_238',1,32,'P_238',0,0,0,0,0,NULL),(241,'科隆CP-816',1,32,'',0,0,0,0,0,NULL),(243,'CP428',1,32,'',0,0,0,0,0,NULL),(245,'236TL',1,32,'',0,0,0,0,0,NULL),(246,'CK236',1,32,'',0,0,0,0,0,NULL),(248,'SP6000（新',1,32,'',0,0,0,0,0,NULL),(249,'OMINI600',1,32,'',0,0,0,0,0,NULL),(251,'EVO192',1,192,'DEFAULT',0,0,0,0,0,NULL),(253,'OMINI400',1,32,'',0,0,0,0,0,NULL),(254,'BD-668',1,32,'',0,0,0,0,0,NULL),(255,'SP60000',1,32,'',0,0,0,0,0,NULL),(258,'728ULT（原',1,32,'',0,0,0,0,0,NULL),(259,'OMIN600',1,32,'',0,0,0,0,0,NULL),(260,'OMIN400',1,32,'',0,0,0,0,0,NULL),(261,'728ULT-XL',1,32,'',0,0,0,0,0,NULL),(262,'AW-BM1600-6A(NT2)',1,32,'',0,0,0,0,0,NULL),(263,'OMNIN400',1,32,'',0,0,0,0,0,NULL),(264,'192',1,32,'',0,0,0,0,0,NULL),(265,'AWBM-1600-6A',1,32,'',0,0,0,0,0,NULL),(267,'728ULT(原有)',1,32,'',0,0,0,0,0,NULL),(268,'SP4000+1套1路气体报',1,32,'',0,0,0,0,0,NULL),(269,'VEO-48',1,32,'',0,0,0,0,0,NULL),(270,'VEO48',1,32,'',0,0,0,0,0,NULL),(271,'SP7000（原有）',1,32,'DEFAULT',0,0,1,2,0,NULL),(272,'728ULT原有',1,32,'',0,0,0,0,0,NULL),(273,'SP7000-XL',1,32,'DEFAULT',0,0,1,2,0,NULL),(274,'AW-BM1600-8A/S',1,32,'',0,0,0,0,0,NULL),(275,'RSTER120',1,32,'',0,0,0,0,0,NULL),(276,'EVO48',1,32,'',0,0,0,0,0,NULL),(277,'748+XT',1,32,'',0,0,0,0,0,NULL),(279,'OMN400',1,32,'',0,0,0,0,0,NULL),(280,'738ULT(用户提供原有',1,32,'',0,0,0,0,0,NULL),(281,'EV0192',1,200,'DEFAULT',0,200,0,0,0,NULL),(282,'SP4000+1套4路气体报',1,32,'',0,0,0,0,0,NULL),(283,'SP7000  20',1,32,'DEFAULT',0,0,1,2,0,NULL),(284,'G',1,32,'',0,0,0,0,0,NULL),(285,'麦杰6160',1,32,'',0,0,0,0,0,NULL),(286,'AW-BM-1600-8A',1,32,'',0,0,0,0,0,NULL),(287,'AW-BM-1600-6A',1,32,'',0,0,0,0,0,NULL),(289,'SP6000(原有）',1,32,'',0,0,0,0,0,NULL),(290,'EV192',1,32,'',0,0,0,0,0,NULL),(291,'SP4000+氯气主机',1,32,'',0,0,0,0,0,NULL),(292,'SP40000',1,32,'',0,0,0,0,0,NULL),(293,'SP6000 PCS250',1,32,'',0,0,0,0,0,NULL),(294,'SP4000  PCS250',1,32,'',0,0,0,0,0,NULL),(295,'SP7000PCS250',1,32,'DEFAULT',0,0,1,2,0,NULL),(296,'SP7000  PCS250',1,32,'DEFAULT',0,0,0,0,0,NULL),(297,'SP6000 19M04',1,32,'',0,0,0,0,0,NULL),(298,'SP7000  PM2000D',1,32,'DEFAULT',0,0,1,2,0,NULL),(299,'SP6000 PM2000D',1,32,'',0,0,0,0,0,NULL),(300,'728ULT PM2000D',1,32,'',0,0,0,0,0,NULL),(301,'SP7000 PM2',1,32,'DEFAULT',0,0,1,2,0,NULL),(302,'HONEYWELL',1,32,'DEFAULT',0,0,1,2,0,NULL),(303,'FOCUS236',1,32,'',0,0,0,0,0,NULL),(304,'霍尼威尔23',1,32,'',0,0,0,0,0,NULL),(305,'福科斯',1,32,'',0,0,0,0,0,NULL),(306,'福克斯',1,32,'',0,0,0,0,0,NULL),(307,'霍尼威尔',1,32,'',0,0,0,0,0,NULL),(308,'福克斯236',1,32,'',0,0,0,0,0,NULL),(309,'SP6000 DS-',1,32,'',0,0,0,0,0,NULL),(310,'SP6000 19M',1,32,'',0,0,0,0,0,NULL),(311,'SP7000 19M',1,32,'DEFAULT',0,0,1,2,0,NULL),(312,'SP4000  19',1,32,'',0,0,0,0,0,NULL),(313,'SP4000 19M-04',1,32,'',0,0,0,0,0,NULL),(314,'SP4000 190M',1,32,'',0,0,0,0,0,NULL),(315,'霍尼维尔23',1,32,'',0,0,0,0,0,NULL),(316,'霍尼维尔',1,32,'',0,0,0,0,0,NULL),(317,'SP7000 PCS250',1,32,'DEFAULT',0,0,1,2,0,NULL),(318,'SP6000  PCS250',1,32,'',0,0,0,0,0,NULL),(319,'SP7000 19M-04',1,32,'',0,0,0,0,0,NULL),(320,'SP4000  PCS-250',1,32,'',0,0,0,0,0,NULL),(321,'SP-7000模块250',1,32,'',0,0,0,0,0,NULL),(323,'YK-DVR24（',1,32,'',0,0,0,0,0,NULL),(324,'无（香河开',1,32,'',0,0,0,0,0,NULL),(325,'视霸-16',1,32,'',0,0,0,0,0,NULL),(326,'普天-16',1,32,'',0,0,0,0,0,NULL),(327,'E融-24',1,32,'',0,0,0,0,0,NULL),(328,'巨融',1,32,'',0,0,0,0,0,NULL),(329,'智腾主机',1,32,'',0,0,0,0,0,NULL),(330,'SP7000 19M04',1,32,'',0,0,0,0,0,NULL),(331,'SP4000  PM2000',1,32,'',0,0,0,0,0,NULL),(332,'SP7000  19',1,32,'',0,0,0,0,0,NULL),(333,'SP6000  19',1,32,'',0,0,0,0,0,NULL),(334,'SP6000 PM2',1,32,'',0,0,0,0,0,NULL),(335,'SP6000  PM',1,32,'',0,0,0,0,0,NULL),(336,'SP7000  PM',1,32,'',0,0,0,0,0,NULL),(337,'263PLUS',1,32,'',0,0,0,0,0,NULL),(338,'SP-7000PM2',1,32,'',0,0,0,0,0,NULL),(339,'728ULPM200',1,32,'',0,0,0,0,0,NULL),(340,'728ULT V4.',1,32,'',0,0,0,0,0,NULL),(341,'SE-410/728',1,32,'',0,0,0,0,0,NULL),(342,'SP-7000 PM2000D',1,32,'',0,0,0,0,0,NULL),(343,'SP7000 PM2000D',1,32,'',0,0,0,0,0,NULL),(344,'SP-7000 PM',1,32,'',0,0,0,0,0,NULL),(345,'SP-4000  19M04',1,32,'',0,0,0,0,0,NULL),(346,'DS-19A08BNG',1,32,'',0,0,0,0,0,NULL),(347,'SP4000 PM2',1,32,'',0,0,0,0,0,NULL),(348,'SP-4000 19',1,32,'',0,0,0,0,0,NULL),(349,'SP-6000 19',1,32,'',0,0,0,0,0,NULL),(350,'SP4000 DS-',1,32,'',0,0,0,0,0,NULL),(351,'SP700019M-04',1,32,'',0,0,0,0,0,NULL),(352,'SP4000   1',1,32,'',0,0,0,0,0,NULL),(353,'SP6000  19M04',1,32,'',0,0,0,0,0,NULL),(354,'SP7000  19M04',1,32,'',0,0,0,0,0,NULL),(355,'SP4000  19M04',1,32,'',0,0,0,0,0,NULL),(356,'霍尼韦尔',1,32,'',0,0,0,0,0,NULL),(357,'SP7000 PCS250G',1,32,'',0,0,0,0,0,NULL),(358,'海康19A08',1,32,'',0,0,0,0,0,NULL),(359,'SP6000 250G',1,32,'',0,0,0,0,0,NULL),(360,'250G',1,32,'',0,0,0,0,0,NULL),(361,'SP4000 19M',1,32,'',0,0,0,0,0,NULL),(362,'海康威视',1,32,'',0,0,0,0,0,NULL),(363,'海康DS-19K00-B',1,32,'',0,0,0,0,0,NULL),(364,'728ULT 19M04',1,32,'',0,0,0,0,0,NULL),(365,'SP-6000 PM',1,32,'',0,0,0,0,0,NULL),(366,'SP7000枫叶250',1,32,'',0,0,0,0,0,NULL),(367,'MG5050',1,32,'',0,0,0,0,0,NULL),(368,'728ULT DS-',1,32,'',0,0,0,0,0,NULL),(369,'E55 19M04',1,32,'',0,0,0,0,0,NULL),(370,'E55  PM200',1,32,'',0,0,0,0,0,NULL),(371,'SP7000 DS-19M04-GS/T',1,32,'',0,0,0,0,0,NULL),(373,'SP4000PM20',1,32,'',0,0,0,0,0,NULL),(374,'SP400019M-04',1,32,'',0,0,0,0,0,NULL),(375,'728-VP',1,32,'',0,0,0,0,0,NULL),(376,'SP7000-19M04',1,32,'',0,0,0,0,0,NULL),(377,'728ULT-19M04',1,32,'',0,0,0,0,0,NULL),(378,'SP-7000 19M04',1,32,'',0,0,0,0,0,NULL),(379,'SP-6000  19M04',1,32,'',0,0,0,0,0,NULL),(380,'博士',1,32,'',0,0,0,0,0,NULL),(381,'SP-4000 19M04',1,32,'',0,0,0,0,0,NULL),(383,'SP4000 19M04',1,32,'',0,0,0,0,0,NULL),(384,'PM2000D/728ULT',1,32,'',0,0,0,0,0,NULL),(385,'博士CMS6',1,32,'',0,0,0,0,0,NULL),(386,'728ULT PM2',1,32,'',0,0,0,0,0,NULL),(387,'OMINI-400',1,32,'',0,0,0,0,0,NULL),(388,'748+',1,32,'',0,0,0,0,0,NULL),(389,'SP4000  250G',1,32,'',0,0,0,0,0,NULL),(390,'SP-6000  P',1,32,'',0,0,0,0,0,NULL),(391,'SP4000 PM2000D',1,32,'',0,0,0,0,0,NULL),(392,'728ULT PM-2000D',1,32,'',0,0,0,0,0,NULL),(393,'SP4000  PM',1,32,'',0,0,0,0,0,NULL),(394,'SP7000PM20',1,32,'',0,0,0,0,0,NULL),(395,'SP7000PM2000D',1,32,'',0,0,0,0,0,NULL),(396,'福科斯236',1,32,'',0,0,0,0,0,NULL),(397,'SP7000 DS-',1,32,'',0,0,0,0,0,NULL),(398,'霍尼维尔236',1,32,'',0,0,0,0,0,NULL),(399,'SP-7000/PM',1,32,'',0,0,0,0,0,NULL),(400,'236PLUS',1,32,'',0,0,0,0,0,NULL),(401,'福科斯FC23',1,32,'',0,0,0,0,0,NULL),(402,'HONEYNELL',1,32,'DEFAULT',0,0,1,2,0,NULL),(403,'福科斯FC236',1,32,'',0,0,0,0,0,NULL),(404,'PM2000D',1,32,'',0,0,0,0,0,NULL),(405,'E55-PM2000',1,32,'',0,0,0,0,0,NULL),(406,'SP4000PM2000D',1,32,'',0,0,0,0,0,NULL),(407,'PM2000/SP4',1,32,'',0,0,0,0,0,NULL),(408,'SP-4000 PM',1,32,'',0,0,0,0,0,NULL),(409,'236（HONEY',1,32,'DEFAULT',0,0,1,2,0,NULL),(410,'FC236',1,32,'',0,0,0,0,0,NULL),(411,'FC-236',1,32,'',0,0,0,0,0,NULL),(412,'霍尼威尔 2',1,32,'',0,0,0,0,0,NULL),(413,'SP-4000  P',1,32,'',0,0,0,0,0,NULL),(414,'SP7000 PM',1,32,'',0,0,0,0,0,NULL),(415,'SP-40000',1,32,'',0,0,0,0,0,NULL),(416,'SP4000/DS-',1,32,'',0,0,0,0,0,NULL),(417,'SP6000 DS19M04',1,32,'',0,0,0,0,0,NULL),(418,'SP-7000 19',1,32,'',0,0,0,0,0,NULL),(419,'HONEYWELL2',1,32,'DEFAULT',0,0,1,2,0,NULL),(420,'福科斯236  TC35',1,32,'',0,0,0,0,0,NULL),(421,'SP400019M04',1,32,'',0,0,0,0,0,NULL),(422,'SP600019M-04',1,32,'',0,0,0,0,0,NULL),(423,'SP7000  枫叶250',1,32,'',0,0,0,0,0,NULL),(424,'SP6000  枫叶250',1,32,'',0,0,0,0,0,NULL),(427,'SP4000P 19M04',1,32,'',0,0,0,0,0,NULL),(428,'SP6000/19M04',1,32,'',0,0,0,0,0,NULL),(429,'海康DS-19S08-BNQ',1,32,'',0,0,0,0,0,NULL),(433,'SP400019M0',1,32,'',0,0,0,0,0,NULL),(434,'SP4000 K10V',1,32,'',0,0,0,0,0,NULL),(435,'PC250G',1,32,'',0,0,0,0,0,NULL),(438,'海康DS-19A08-BNG（三',1,32,'',0,0,0,0,0,NULL),(439,'海康DS-19A08-BNG',1,32,'',0,0,0,0,0,NULL),(441,'海康DS-19A08',1,32,'',0,0,0,0,0,NULL),(442,'SP7000枫叶',1,32,'',0,0,0,0,0,NULL),(443,'SP4000 DS-19M04',1,32,'',0,0,0,0,0,NULL),(444,'728ULT  PM',1,32,'',0,0,0,0,0,NULL),(445,'728ULTPM20',1,32,'',0,0,0,0,0,NULL),(446,'728ULT PM-',1,32,'',0,0,0,0,0,NULL),(447,'CK 238C PL',1,32,'',0,0,0,0,0,NULL),(448,'GPRS模块DS-19M04-GP/',1,32,'',0,0,0,0,0,NULL),(449,'SP-6000  PM2000D',1,32,'',0,0,0,0,0,NULL),(450,'FC 236',1,32,'',0,0,0,0,0,NULL),(451,'SP-6000 19M04',1,32,'',0,0,0,0,0,NULL),(452,'SP6000 19M-04',1,32,'',0,0,0,0,0,NULL),(454,'728ULT  19',1,32,'',0,0,0,0,0,NULL),(455,'FC  236',1,32,'',0,0,0,0,0,NULL),(456,'SP-4000PM2',1,32,'',0,0,0,0,0,NULL),(457,'SP-6000 TC',1,32,'',0,0,0,0,0,NULL),(458,'SP4000 19',1,32,'',0,0,0,0,0,NULL),(460,'SP-6000（原有） 19M0',1,32,'',0,0,0,0,0,NULL),(462,'PGS250G',1,32,'',0,0,0,0,0,NULL),(463,'SP7000  250G',1,32,'',0,0,0,0,0,NULL),(464,'PM-2000D',1,32,'',0,0,0,0,0,NULL),(465,'SP-6000PM2',1,32,'',0,0,0,0,0,NULL),(466,'728ULT 410',1,32,'',0,0,0,0,0,NULL),(467,'SP6000PM20',1,32,'',0,0,0,0,0,NULL),(468,'SP4000 PM-',1,32,'',0,0,0,0,0,NULL),(469,'E55  19M-0',1,32,'',0,0,0,0,0,NULL),(470,'霍尼韦尔23',1,32,'',0,0,0,0,0,NULL),(471,'HONEYWE236',1,32,'DEFAULT',0,0,1,2,0,NULL),(472,'SP6000  DS',1,32,'',0,0,0,0,0,NULL),(473,'SP-4000  1',1,32,'',0,0,0,0,0,NULL),(474,'SP7000 19M04 SE-817',1,32,'',0,0,0,0,0,NULL),(475,'SP-7000 19M04 SE-817',1,32,'',0,0,0,0,0,NULL),(476,'SP7000/19M04',1,32,'',0,0,0,0,0,NULL),(477,'SP4000250G',1,32,'',0,0,0,0,0,NULL),(478,'SO4000',1,32,'',0,0,0,0,0,NULL),(479,'SP6000 250模块',1,32,'',0,0,0,0,0,NULL),(480,'728ULT-PM2',1,32,'',0,0,0,0,0,NULL),(481,'SP6000  19M-04',1,32,'',0,0,0,0,0,NULL),(482,'6130',1,32,'',0,0,0,0,0,NULL),(483,'BEL-908AS',1,32,'',0,0,0,0,0,NULL),(484,'728DZ8',1,32,'',0,0,0,0,0,NULL),(485,'无线MG6130',1,32,'',0,0,0,0,0,NULL),(486,'科立信',1,32,'',0,0,0,0,0,NULL),(487,'无线INFINI',1,32,'',0,0,0,0,0,NULL),(488,'无线1759MG',1,32,'',0,0,0,0,0,NULL),(489,'无线1759EX',1,32,'',0,0,0,0,0,NULL),(490,'无线MG-613',1,32,'',0,0,0,0,0,NULL),(491,'SP4000/加',1,32,'',0,0,0,0,0,NULL),(492,'科力信1799',1,32,'',0,0,0,0,0,NULL),(493,'科力信KB-A1799',1,32,'',0,0,0,0,0,NULL),(494,'MG5050/PA250G',1,32,'',0,0,0,0,0,NULL),(495,'MG6160',1,32,'',0,0,0,0,0,NULL),(496,'枫叶6250无',1,32,'',0,0,0,0,0,NULL),(498,'MG5050/GPRS14(无线模',1,32,'',0,0,0,0,0,NULL),(499,'6250',1,32,'',0,0,0,0,0,NULL),(500,'SP7000-PM2',1,32,'',0,0,0,0,0,NULL),(501,'SP6000PCS250G',1,32,'',0,0,0,0,0,NULL),(502,'大华08',1,32,'',0,0,0,0,0,NULL),(503,'大华4路',1,32,'',0,0,0,0,0,NULL),(504,'大华DH-DVR',1,32,'',0,0,0,0,0,NULL),(505,'DH-DVR0408',1,32,'',0,0,0,0,0,NULL),(506,'DH-DVR0804',1,32,'',0,0,0,0,0,NULL),(507,'DS-80164S',1,32,'',0,0,0,0,0,NULL),(508,'海康16号录',1,32,'',0,0,0,0,0,NULL),(509,'大华2路',1,32,'',0,0,0,0,0,NULL),(510,'大华',1,32,'',0,0,0,0,0,NULL),(511,'4路DV2',1,32,'',0,0,0,0,0,NULL),(512,'大华录像机',1,32,'',0,0,0,0,0,NULL),(513,'大华硬盘录',1,32,'',0,0,0,0,0,NULL),(514,'大华四路DV',1,32,'',0,0,0,0,0,NULL),(515,'大华4路DVR',1,32,'',0,0,0,0,0,NULL),(516,'海康DVR',1,32,'',0,0,0,0,0,NULL),(517,'大华DVR',1,32,'',0,0,0,0,0,NULL),(518,'大华DR',1,32,'',0,0,0,0,0,NULL),(519,'四路大华DV',1,32,'',0,0,0,0,0,NULL),(520,'大华四路录',1,32,'',0,0,0,0,0,NULL),(521,'四路大华',1,32,'',0,0,0,0,0,NULL),(522,'大华DH-080',1,32,'',0,0,0,0,0,NULL),(523,'大华16路DV',1,32,'',0,0,0,0,0,NULL),(524,'大华4路12H',1,32,'',0,0,0,0,0,NULL),(525,'16路DVR',1,32,'',0,0,0,0,0,NULL),(526,'大华4路录',1,32,'',0,0,0,0,0,NULL),(527,'大华DVD',1,32,'',0,0,0,0,0,NULL),(528,'四路大华DVR',1,32,'',0,0,0,0,0,NULL),(529,'4路大华DVR',1,32,'',0,0,0,0,0,NULL),(530,'大华4路录像机',1,32,'',0,0,0,0,0,NULL),(531,'大华四路DVR',1,32,'',0,0,0,0,0,NULL),(532,'海康DSS-8632N（网络',1,32,'',0,0,0,0,0,NULL),(533,'海康 7804',1,32,'',0,0,0,0,0,NULL),(534,'海康4路DS-7804HW-SNH',1,32,'',0,0,0,0,0,NULL),(535,'海康4路高清',1,32,'',0,0,0,0,0,NULL),(536,'实验室西墙',1,32,'',0,0,0,0,0,NULL),(537,'SP-7000XL',1,32,'',0,0,0,0,0,NULL),(538,'OMN-400',1,32,'',0,0,0,0,0,NULL),(539,'MG5000',1,32,'Contact_ID',0,0,0,0,0,NULL),(541,'MG6130',1,32,'',0,0,0,0,0,NULL),(542,'MJ-6130',1,32,'',0,0,0,0,0,NULL),(543,'INFINITE无',1,32,'',0,0,0,0,0,NULL),(544,'SP-6000-XZ',1,32,'',0,0,0,0,0,NULL),(545,'MG6250-XL',1,32,'',0,0,0,0,0,NULL),(546,'SP4000XL',1,32,'',0,0,0,0,0,NULL),(547,'SP4000-XL',1,32,'',0,0,0,0,0,NULL),(548,'SP6000-XL',1,32,'',0,0,0,0,0,NULL),(549,'SP6000XL',1,32,'',0,0,0,0,0,NULL),(550,'SP7000XL',1,32,'DEFAULT',0,0,1,2,0,NULL),(551,'SP-6000XL',1,32,'',0,0,0,0,0,NULL),(552,'OMNI',1,32,'',0,0,0,0,0,NULL),(553,'SP70000',1,32,'DEFAULT',0,32,1,2,0,NULL),(554,'P6000',1,32,'',0,0,0,0,0,NULL),(555,'E55主机',1,32,'',0,0,0,0,0,NULL),(556,'EV-048',1,32,'',0,0,0,0,0,NULL),(557,'E0048',1,32,'',0,0,0,0,0,NULL),(558,'SP-4000XL',1,32,'',0,0,0,0,0,NULL),(559,'SJP4000',1,32,'',0,0,0,0,0,NULL),(560,'SP4000TC35',1,32,'',0,0,0,0,0,NULL),(561,'SP4000 TC3',1,32,'',0,0,0,0,0,NULL),(562,'SP-6000TC-',1,32,'',0,0,0,0,0,NULL),(563,'SP-4000-XL',1,32,'',0,0,0,0,0,NULL),(564,'SP-4000 TC',1,32,'',0,0,0,0,0,NULL),(565,'枫叶6250',1,32,'',0,0,0,0,0,NULL),(566,'枫叶6130',1,32,'',0,0,0,0,0,NULL),(567,'SP-4000TC3',1,32,'',0,0,0,0,0,NULL),(568,'SP-7000 WT-300T',1,32,'',0,0,0,0,0,NULL),(569,'SP-4000X1',1,32,'',0,0,0,0,0,NULL),(570,'728ULT TC3',1,32,'',0,0,0,0,0,NULL),(571,'SP-6000+TC35',1,32,'',0,0,0,0,0,NULL),(572,'SP-4000  TC-35',1,32,'',0,0,0,0,0,NULL),(573,'728ULD',1,32,'',0,0,0,0,0,NULL),(574,'枫叶6160',1,32,'',0,0,0,0,0,NULL),(575,'SP-4000+TC',1,32,'',0,0,0,0,0,NULL),(576,'SP-4000  TC35',1,32,'',0,0,0,0,0,NULL),(577,'SP6000TC35',1,32,'',0,0,0,0,0,NULL),(578,'728ULTTC-3',1,32,'',0,0,0,0,0,NULL),(579,'728ULT  SP6000',1,32,'',0,0,0,0,0,NULL),(580,'SP-7000 817',1,32,'',0,0,0,0,0,NULL),(581,'OMIN',1,32,'',0,0,0,0,0,NULL),(582,'SP4000XLTC',1,32,'',0,0,0,0,0,NULL),(583,'SP-4000   TC35',1,32,'',0,0,0,0,0,NULL),(584,'DM2000D',1,32,'',0,0,0,0,0,NULL),(585,'SP4000-TC35-供电模块',1,32,'',0,0,0,0,0,NULL),(586,'SP-4000TC-',1,32,'',0,0,0,0,0,NULL),(587,'PM4000',1,32,'',0,0,0,0,0,NULL),(588,'SP6000   TC35',1,32,'',0,0,0,0,0,NULL),(589,'SP4000带PM',1,32,'',0,0,0,0,0,NULL),(590,'SP-4000+TC35',1,32,'',0,0,0,0,0,NULL),(591,'SP-6000TC3',1,32,'',0,0,0,0,0,NULL),(592,'SP-6000  TC35',1,32,'',0,0,0,0,0,NULL),(593,'SP-7000 TC35',1,32,'',0,0,0,0,0,NULL),(594,'SP-4000  PM-2000',1,32,'',0,0,0,0,0,NULL),(595,'SP-6000-XL',1,32,'',0,0,0,0,0,NULL),(596,'SP-7000 TC-35',1,32,'',0,0,0,0,0,NULL),(597,'SP4000,TC3',1,32,'',0,0,0,0,0,NULL),(598,'SP4000+TC3',1,32,'',0,0,0,0,0,NULL),(599,'SP-4000 TC-35',1,32,'',0,0,0,0,0,NULL),(600,'SP-6000 TC-35',1,32,'',0,0,0,0,0,NULL),(601,'SP4000-SL',1,32,'',0,0,0,0,0,NULL),(602,'SP-6000 TC35',1,32,'',0,0,0,0,0,NULL),(603,'SP6000—XL',1,32,'',0,0,0,0,0,NULL),(604,'SP4000-X1',1,32,'',0,0,0,0,0,NULL),(605,'SP-7000 TC',1,32,'',0,0,0,0,0,NULL),(606,'SP-7000XL TC',1,32,'',0,0,0,0,0,NULL),(607,'SP-7000 TC35 817',1,32,'',0,0,0,0,0,NULL),(608,'SP-7000-XL',1,32,'',0,0,0,0,0,NULL),(609,'SP-7000 XL',1,32,'',0,0,0,0,0,NULL),(610,'SP-7000 817 WT-300',1,32,'',0,0,0,0,0,NULL),(611,'SP-7000TC-35',1,32,'',0,0,0,0,0,NULL),(612,'SP-6000   TC35',1,32,'',0,0,0,0,0,NULL),(613,'SP6000.TC3',1,32,'',0,0,0,0,0,NULL),(614,'SP-6000+7035',1,32,'',0,0,0,0,0,NULL),(615,'SP4000 WT3007',1,32,'',0,0,0,0,0,NULL),(616,'SP-4000 XL',1,32,'',0,0,0,0,0,NULL),(617,'0MIN-400',1,32,'',0,0,0,0,0,NULL),(618,'SP4000   TC35',1,32,'',0,0,0,0,0,NULL),(619,'SP-4000     817   TC',1,32,'',0,0,0,0,0,NULL),(620,'SP-4000 TC35',1,32,'',0,0,0,0,0,NULL),(621,'SP-4000XL TC-35',1,32,'',0,0,0,0,0,NULL),(622,'SP-4000+WT-3007',1,32,'',0,0,0,0,0,NULL),(623,'SP-6000TC35',1,32,'',0,0,0,0,0,NULL),(624,'SP-6000TC-35',1,32,'',0,0,0,0,0,NULL),(625,'SP-6000 XL',1,32,'',0,0,0,0,0,NULL),(626,'SP-6000 WT-300T',1,32,'',0,0,0,0,0,NULL),(627,'SP-6000 WT3007',1,32,'',0,0,0,0,0,NULL),(628,'SP-400XL',1,32,'',0,0,0,0,0,NULL),(629,'SP-7000 TC-T300',1,32,'',0,0,0,0,0,NULL),(630,'SP-7000  TC-35',1,32,'',0,0,0,0,0,NULL),(631,'SP4000.TC3',1,32,'',0,0,0,0,0,NULL),(632,'SP4000 TC35',1,32,'',0,0,0,0,0,NULL),(633,'PM-2000',1,32,'',0,0,0,0,0,NULL),(634,'SP2000',1,32,'',0,0,0,0,0,NULL),(635,'SP-4000 PM-2000D',1,32,'',0,0,0,0,0,NULL),(636,'SP4000/PM2',1,32,'',0,0,0,0,0,NULL),(637,'PM2000D+SP',1,32,'',0,0,0,0,0,NULL),(639,'E-55',1,32,'',0,0,0,0,0,NULL),(640,'728ULT-1',1,32,'',0,0,0,0,0,NULL),(641,'SK239C',1,32,'',0,0,0,0,0,NULL),(642,'SK-239C',1,32,'',0,0,0,0,0,NULL),(643,'SK239C1',1,32,'',0,0,0,0,0,NULL),(644,'SK-239BC-1',1,32,'DEFAULT',0,0,0,0,0,NULL),(645,'SK—239C',1,32,'',0,0,0,0,0,NULL),(647,'SP-4000(611)',1,32,'',0,0,0,0,0,NULL),(648,'SK-216',1,32,'',0,0,0,0,0,NULL),(649,'SP-4000V5.0（625）',1,32,'',0,0,0,0,0,NULL),(650,'SK—239G',1,32,'',0,0,0,0,0,NULL),(651,'SP-4000（395）',1,32,'',0,0,0,0,0,NULL),(652,'SP-4000(626)',1,32,'',0,0,0,0,0,NULL),(653,'SP-4000（630）',1,32,'',0,0,0,0,0,NULL),(654,'SP-4000V5.0(670）',1,32,'',0,0,0,0,0,NULL),(655,'SP-4000（402+）',1,32,'',0,0,0,0,0,NULL),(656,'SP-4000V5.0(641）',1,32,'',0,0,0,0,0,NULL),(657,'SP-4000（421）',1,32,'',0,0,0,0,0,NULL),(658,'SP-4000（406）',1,32,'',0,0,0,0,0,NULL),(659,'HONEYWELL-236',1,32,'',0,0,0,0,0,NULL),(660,'霍尼韦尔-236',1,32,'',0,0,0,0,0,NULL),(661,'霍尼韦尔-2',1,32,'',0,0,0,0,0,NULL),(662,'SP-6000(490)有模块',1,32,'',0,0,0,0,0,NULL),(663,'SK-978',1,32,'',0,0,0,0,0,NULL),(664,'SK3110C',1,32,'',0,0,0,0,0,NULL),(665,'SP-4000(V5.0)',1,32,'',0,0,0,0,0,NULL),(666,'SK-3110C',1,32,'',0,0,0,0,0,NULL),(667,'SP-6000（515）',1,32,'',0,0,0,0,0,NULL),(668,'SP-6000-V5.0',1,32,'',0,0,0,0,0,NULL),(669,'SP6000（441）',1,32,'',0,0,0,0,0,NULL),(670,'SP-6000V5.0(489)',1,32,'',0,0,0,0,0,NULL),(671,'SP-6000(504)',1,32,'',0,0,0,0,0,NULL),(672,'SP-4000V5.0(388)',1,32,'',0,0,0,0,0,NULL),(673,'SP-4000（420）',1,32,'',0,0,0,0,0,NULL),(674,'SP-6000V5.0(487)',1,32,'',0,0,0,0,0,NULL),(675,'SP-6000（372）',1,32,'',0,0,0,0,0,NULL),(676,'SP-4000（336）',1,32,'',0,0,0,0,0,NULL),(677,'SP-6000（484）',1,32,'',0,0,0,0,0,NULL),(678,'SP-6000V5.0(488)',1,32,'',0,0,0,0,0,NULL),(679,'SP-6000（495）',1,32,'',0,0,0,0,0,NULL),(680,'SP-6000（479）',1,32,'',0,0,0,0,0,NULL),(681,'SP-6000（453）',1,32,'',0,0,0,0,0,NULL),(682,'SK968B',1,32,'',0,0,0,0,0,NULL),(683,'SP-6000(501)',1,32,'',0,0,0,0,0,NULL),(684,'SK-968B',1,32,'',0,0,0,0,0,NULL),(685,'SP-6000(493)',1,32,'',0,0,0,0,0,NULL),(686,'SP-6000(460)',1,32,'',0,0,0,0,0,NULL),(687,'SP-6000(461)',1,32,'',0,0,0,0,0,NULL),(688,'SP-6000 V5.0',1,32,'',0,0,0,0,0,NULL),(689,'SP-6000 V5.0(446)',1,32,'',0,0,0,0,0,NULL),(690,'SP-6000 V5.0(445)',1,32,'',0,0,0,0,0,NULL),(691,'SP-6000 V5.0（448）',1,32,'',0,0,0,0,0,NULL),(692,'SP-6000 V5.0（508）',1,32,'',0,0,0,0,0,NULL),(693,'SP-6000（464）',1,32,'',0,0,0,0,0,NULL),(694,'SP-4000.V5.0',1,32,'',0,0,0,0,0,NULL),(695,'SP-4000（628）',1,32,'',0,0,0,0,0,NULL),(696,'SP-4000（423）',1,32,'',0,0,0,0,0,NULL),(697,'SP-4000（422）',1,32,'',0,0,0,0,0,NULL),(698,'SP-4000（621）',1,32,'',0,0,0,0,0,NULL),(699,'SP-4000(656)',1,32,'',0,0,0,0,0,NULL),(700,'SP-4000（425）',1,32,'',0,0,0,0,0,NULL),(701,'霍尼韦尔236',1,32,'',0,0,0,0,0,NULL),(702,'HONEYWELL-',1,32,'',0,0,0,0,0,NULL),(703,'PC585',1,32,'',0,0,0,0,0,NULL),(704,'霍尼236',1,32,'',0,0,0,0,0,NULL),(705,'SP-6000（470）',1,32,'',0,0,0,0,0,NULL),(706,'SP-6000-V5.0（508）',1,32,'',0,0,0,0,0,NULL),(707,'SP-6000.(525)',1,32,'',0,0,0,0,0,NULL),(708,'SP-4000（632）',1,32,'',0,0,0,0,0,NULL),(709,'SP6000(529)',1,32,'',0,0,0,0,0,NULL),(710,'SP-6000（524）',1,32,'',0,0,0,0,0,NULL),(711,'SP-6000V5.0（522）',1,32,'',0,0,0,0,0,NULL),(712,'SP-6000V5.0（520）',1,32,'',0,0,0,0,0,NULL),(713,'SP-6000（518）',1,32,'',0,0,0,0,0,NULL),(714,'SP-6000（521）',1,32,'',0,0,0,0,0,NULL),(715,'SP-6000（514）',1,32,'',0,0,0,0,0,NULL),(716,'SP-6000（459）',1,32,'',0,0,0,0,0,NULL),(717,'SP-6000（4991）',1,32,'',0,0,0,0,0,NULL),(718,'SP-4000V5.0（411）',1,32,'',0,0,0,0,0,NULL),(719,'SP-4000（644）',1,32,'',0,0,0,0,0,NULL),(720,'SP-4000（654）',1,32,'',0,0,0,0,0,NULL),(721,'SP-6000（483）',1,32,'',0,0,0,0,0,NULL),(722,'SP-6000V5.0(519)',1,32,'',0,0,0,0,0,NULL),(723,'SP-4000(V5.0385)',1,32,'',0,0,0,0,0,NULL),(724,'SP-6000(526)',1,32,'',0,0,0,0,0,NULL),(725,'SP-6000V5.0',1,32,'',0,0,0,0,0,NULL),(726,'SP-4000(399)',1,32,'',0,0,0,0,0,NULL),(727,'SP-4000(410)',1,32,'',0,0,0,0,0,NULL),(728,'SP-4000(V5.0)409',1,32,'',0,0,0,0,0,NULL),(729,'SP-4000.V5.0-402',1,32,'',0,0,0,0,0,NULL),(730,'SP-4000.V5.0-401',1,32,'',0,0,0,0,0,NULL),(731,'SP-4000.V5.0-403',1,32,'',0,0,0,0,0,NULL),(732,'SK-239BC',1,32,'',0,0,0,0,0,NULL),(733,'SP-4000(658)',1,32,'',0,0,0,0,0,NULL),(734,'SP6000(469)',1,32,'',0,0,0,0,0,NULL),(735,'SP-4000（629）',1,32,'',0,0,0,0,0,NULL),(736,'SP-4000V5.0（397)',1,32,'',0,0,0,0,0,NULL),(737,'SP-4000（636）',1,32,'',0,0,0,0,0,NULL),(738,'SP-4000V5.0(395)',1,32,'',0,0,0,0,0,NULL),(739,'SP4000(V5.0)405',1,32,'',0,0,0,0,0,NULL),(740,'SP-4000（400)',1,32,'',0,0,0,0,0,NULL),(741,'SP-4000(415)',1,32,'',0,0,0,0,0,NULL),(742,'SP-4000（419）',1,32,'',0,0,0,0,0,NULL),(743,'SP-4000（381）',1,32,'',0,0,0,0,0,NULL),(744,'SP-4000(634)',1,32,'',0,0,0,0,0,NULL),(745,'SP-4000（407）',1,32,'',0,0,0,0,0,NULL),(746,'SP-4000（657）',1,32,'',0,0,0,0,0,NULL),(747,'SP-4000 649',1,32,'',0,0,0,0,0,NULL),(748,'SP-6000.(476)',1,32,'',0,0,0,0,0,NULL),(749,'SP-6000（498）',1,32,'',0,0,0,0,0,NULL),(750,'SP6000(471)',1,32,'',0,0,0,0,0,NULL),(751,'SK239',1,32,'',0,0,0,0,0,NULL),(752,'SP-4000-V5.0（398）',1,32,'',0,0,0,0,0,NULL),(753,'SP6000(470)',1,32,'',0,0,0,0,0,NULL),(754,'SP-4000-V5.0（+PCM20',1,32,'',0,0,0,0,0,NULL),(755,'SP-4000（V5.0394）',1,32,'',0,0,0,0,0,NULL),(756,'SP-4000（380）',1,32,'',0,0,0,0,0,NULL),(757,'SP-4000-V5.0（H361）',1,32,'',0,0,0,0,0,NULL),(758,'SP-4000-V5.0（377）',1,32,'',0,0,0,0,0,NULL),(759,'SP-4000（390）',1,32,'',0,0,0,0,0,NULL),(760,'SP-4000V5.0(387)',1,32,'',0,0,0,0,0,NULL),(761,'SP-4000(607)',1,32,'',0,0,0,0,0,NULL),(762,'SP-4000(613)',1,32,'',0,0,0,0,0,NULL),(763,'SP-4000（625）',1,32,'',0,0,0,0,0,NULL),(764,'SP-4000（416）',1,32,'',0,0,0,0,0,NULL),(765,'SP-4000（608）',1,32,'',0,0,0,0,0,NULL),(766,'SP-4000V5.0（614）',1,32,'',0,0,0,0,0,NULL),(767,'SP-4000V5.0（624）',1,32,'',0,0,0,0,0,NULL),(768,'SP-4000V5.0（601）',1,32,'',0,0,0,0,0,NULL),(769,'神舟太讯',1,32,'',0,0,0,0,0,NULL),(770,'SP-4000V5.0（622）',1,32,'',0,0,0,0,0,NULL),(771,'SP-4000V5.0（602）',1,32,'',0,0,0,0,0,NULL),(772,'SP-4000-V5.0（650）',1,32,'',0,0,0,0,0,NULL),(773,'SP-4000V5.0（617)',1,32,'',0,0,0,0,0,NULL),(774,'SP-4000(605）',1,32,'',0,0,0,0,0,NULL),(775,'SP4000(623)',1,32,'',0,0,0,0,0,NULL),(776,'SP4000(609)',1,32,'',0,0,0,0,0,NULL),(777,'SP-6000（468）',1,32,'',0,0,0,0,0,NULL),(778,'SP-6000-V5.0(426)',1,32,'',0,0,0,0,0,NULL),(779,'SK3110',1,32,'',0,0,0,0,0,NULL),(780,'SP-6000(517)',1,32,'',0,0,0,0,0,NULL),(781,'SP-6000(433)',1,32,'',0,0,0,0,0,NULL),(782,'SP-6000（471）',1,32,'',0,0,0,0,0,NULL),(783,'SP-7000主板编号：431',1,32,'',0,0,0,0,0,NULL),(784,'SP-4000（386）',1,32,'',0,0,0,0,0,NULL),(785,'SP-6000(512)',1,32,'',0,0,0,0,0,NULL),(786,'SP-6000V5.0（455）',1,32,'',0,0,0,0,0,NULL),(787,'SP-6000 V5.0（439）',1,32,'',0,0,0,0,0,NULL),(788,'SP6000(539）',1,32,'',0,0,0,0,0,NULL),(789,'SP-6000（V5.0）',1,32,'',0,0,0,0,0,NULL),(790,'SP-4000（467）',1,32,'',0,0,0,0,0,NULL),(791,'SK-239',1,32,'',0,0,0,0,0,NULL),(792,'SP-4000（369）',1,32,'',0,0,0,0,0,NULL),(793,'SP-4000-V5.0（370）',1,32,'',0,0,0,0,0,NULL),(794,'SP-6000（435）',1,32,'',0,0,0,0,0,NULL),(795,'SP-6000（537）',1,32,'',0,0,0,0,0,NULL),(796,'SP-4000（659）',1,32,'',0,0,0,0,0,NULL),(797,'SP-4000（660）',1,32,'',0,0,0,0,0,NULL),(798,'SP-4000（651）',1,32,'',0,0,0,0,0,NULL),(799,'SP-4000(639)',1,32,'',0,0,0,0,0,NULL),(800,'SP-4000-637',1,32,'',0,0,0,0,0,NULL),(801,'SP-4000(638)',1,32,'',0,0,0,0,0,NULL),(802,'SP-4000-652',1,32,'',0,0,0,0,0,NULL),(803,'SP-6000（511）',1,32,'',0,0,0,0,0,NULL),(804,'SP-6000(513)',1,32,'',0,0,0,0,0,NULL),(805,'SP-4000(648)',1,32,'',0,0,0,0,0,NULL),(806,'SP-4000(647)',1,32,'',0,0,0,0,0,NULL),(807,'SP-4000-640',1,32,'',0,0,0,0,0,NULL),(808,'SP-4000(642)',1,32,'',0,0,0,0,0,NULL),(809,'SP-4000（643）',1,32,'',0,0,0,0,0,NULL),(810,'SP-4000（646）',1,32,'',0,0,0,0,0,NULL),(811,'SP-4000（645）',1,32,'',0,0,0,0,0,NULL),(812,'SP4000(408)',1,32,'',0,0,0,0,0,NULL),(813,'SP6000（524）',1,32,'',0,0,0,0,0,NULL),(814,'英飞尼特',1,32,'',0,0,0,0,0,NULL),(815,'枫叶—728',1,32,'',0,0,0,0,0,NULL),(816,'SP6000(V5.0 532)',1,32,'',0,0,0,0,0,NULL),(817,'英安特（无线）',1,32,'',0,0,0,0,0,NULL),(818,'SP-4000V5.0(382)',1,32,'',0,0,0,0,0,NULL),(819,'SP-6000（477）',1,32,'',0,0,0,0,0,NULL),(820,'SP-6000V5.0(436）',1,32,'',0,0,0,0,0,NULL),(821,'SP-6000(437)',1,32,'',0,0,0,0,0,NULL),(822,'SP-6000（457）',1,32,'',0,0,0,0,0,NULL),(823,'SP-6000（458）',1,32,'',0,0,0,0,0,NULL),(824,'SP6000(474)',1,32,'',0,0,0,0,0,NULL),(825,'SP-6000（432）',1,32,'',0,0,0,0,0,NULL),(826,'SP-6000(444)',1,32,'',0,0,0,0,0,NULL),(827,'SP-6000(474)',1,32,'',0,0,0,0,0,NULL),(828,'SP-6000 V5.0(454+)',1,32,'',0,0,0,0,0,NULL),(829,'SP-6000-V5.0（492）',1,32,'',0,0,0,0,0,NULL),(830,'SP-6000(503)',1,32,'',0,0,0,0,0,NULL),(831,'SP-6000.(485)',1,32,'',0,0,0,0,0,NULL),(832,'SP-4000（424）',1,32,'',0,0,0,0,0,NULL),(833,'SP-4000（612）',1,32,'',0,0,0,0,0,NULL),(834,'SP-6000（490）',1,32,'',0,0,0,0,0,NULL),(835,'SP-6000V5.00(465)',1,32,'',0,0,0,0,0,NULL),(836,'SP-4000V5.0（618）',1,32,'',0,0,0,0,0,NULL),(837,'SP-4000V5.0（619）',1,32,'',0,0,0,0,0,NULL),(838,'SP-4000(620)',1,32,'',0,0,0,0,0,NULL),(839,'SP-4000-V5.0（606）',1,32,'',0,0,0,0,0,NULL),(840,'SP-4000V5.0',1,32,'',0,0,0,0,0,NULL),(841,'SP-6000V5.00(438)',1,32,'',0,0,0,0,0,NULL),(842,'SP-4000V5.0（600）',1,32,'',0,0,0,0,0,NULL),(843,'CP428 用户自己主机',1,32,'',0,0,0,0,0,NULL),(844,'SP-6000（431）',1,32,'',0,0,0,0,0,NULL),(845,'SP6000(481)',1,32,'',0,0,0,0,0,NULL),(846,'SP-6000.V5.0(482)',1,32,'',0,0,0,0,0,NULL),(847,'精华隆',1,32,'',0,0,0,0,0,NULL),(848,'HONEYWELL236',1,32,'',0,0,0,0,0,NULL),(849,'SK-238',1,32,'',0,0,0,0,0,NULL),(850,'霍尼韦尔-2316',1,32,'',0,0,0,0,0,NULL),(852,'738EX',1,16,'DEFAULT',0,0,0,0,0,NULL),(854,'CP816+TC35',1,32,'Contact_ID',0,0,0,0,0,NULL),(856,'E55+PCS200',1,16,'Contact_ID',0,0,0,0,0,NULL),(857,'EVO192-XL',1,64,'Contact_ID',0,0,0,0,0,NULL),(858,'MG5000+PCS250',1,16,'Contact_ID',0,0,0,0,0,NULL),(859,'SP4000+PCS-200',1,16,'Contact_ID',0,0,0,0,0,NULL),(860,'SP4000+PCS250',1,16,'Contact_ID',0,0,0,0,0,NULL),(861,'SP4000+PCS-250',1,16,'Contact_ID',0,0,0,0,0,NULL),(862,'SP6000+PCS-200',1,16,'Contact_ID',0,0,0,0,0,NULL),(863,'SP6000+PCS250',1,16,'Contact_ID',0,0,0,0,0,NULL),(864,'SP6000+PCS-250',1,16,'Contact_ID',0,0,0,0,0,NULL),(865,'SP7000+PCS-200',1,16,'Contact_ID',0,0,0,0,0,NULL),(866,'SP7000+PCS250',1,16,'Contact_ID',0,0,0,0,0,NULL),(868,'英安特8A',1,32,'Contact_ID',0,0,0,0,0,NULL),(869,'SP6000 WT3000T',1,0,'',0,0,0,0,0,NULL),(870,'SP-4000 TC-300T',1,0,'',0,0,0,0,0,NULL),(871,'SP4000 WT-300',1,0,'',0,0,0,0,0,NULL),(872,'SP4000 WT300T',1,0,'',0,0,0,0,0,NULL),(875,'新安宝（2816）',1,10,'DEFAULT',0,5,1,2,0,NULL),(876,'AW-BM1600-6ANT2',1,32,'P_2316',0,0,0,0,0,NULL),(877,'A',1,0,'',0,0,0,0,0,NULL),(879,'SP-6000(529)',1,0,'',0,0,0,0,0,NULL),(880,'SP-6000（499）',1,0,'',0,0,0,0,0,NULL),(881,'SP-6000(530)',1,0,'',0,0,0,0,0,NULL),(882,'SP6000(515)',1,0,'',0,0,0,0,0,NULL),(883,'SP-4000(631)',1,0,'',0,0,0,0,0,NULL),(884,'SP-6000(476)',1,0,'',0,0,0,0,0,NULL),(886,'SP-6000(531)',1,0,'',0,0,0,0,0,NULL),(889,'SP6000CZ',1,32,'DEFAULT',0,32,0,0,0,NULL),(890,'SP7000',1,32,'DEFAULT',0,32,0,0,0,NULL),(892,'AW-1600-6A',1,32,'DEFAULT',0,32,0,0,0,NULL),(893,'AM-1600-8A',1,32,'DEFAULT',0,32,0,0,0,NULL),(895,'728XM',1,32,'DEFAULT',0,0,0,0,0,NULL),(1985,'DS-PEA-JY/GLE',15,0,NULL,NULL,0,NULL,NULL,NULL,NULL),(1788,'DSC-3301',1,32,'DEFAULT',0,32,0,0,0,NULL),(1789,'DS-19A16-BN-1',1,16,'DEFAULT',0,0,0,0,0,NULL),(1790,'SP5500/PCS250G',1,36,'DEFAULT',0,0,1,0,0,NULL),(1791,'SP6000/PCS250G',1,64,'DEFAULT',0,0,0,0,0,NULL),(1792,'SP7000/PCS250G',1,36,'DEFAULT',0,0,0,0,0,NULL),(1793,'SP4000+氯气',1,8,'DEFAULT',0,0,0,0,0,NULL),(1794,'VS120',1,200,'DEFAULT',0,0,0,0,0,NULL),(1795,'EVO192/PCS250G',1,192,'DEFAULT',0,0,0,0,0,NULL),(1796,'EVO192/PGS250G',1,192,'DEFAULT',0,0,0,0,0,NULL),(1797,'DS-7916N-E4',1,0,'DEFAULT',0,0,0,0,0,NULL),(1973,'SP5500+氯气',1,10,'DEFAULT',0,0,0,0,0,NULL),(1974,'infinite/mc-55',1,0,'DEFAULT',0,0,0,0,0,NULL),(1975,'EVOHD',1,8,'DEFAULT',0,192,0,0,0,NULL),(1976,'DS-7804HGH-E1/M',1,8,'DEFAULT',0,8,0,0,0,NULL),(1977,'DS-7808N-K2',1,8,'DEFAULT',0,8,0,0,0,NULL),(1978,'理想SY6303',1,8,'DEFAULT',0,90,0,0,0,NULL),(1979,'SP4000/PCS250G',1,64,'DEFAULT',0,64,0,0,0,NULL),(1980,'NT-206',1,16,'DEFAULT',0,0,0,0,0,NULL),(1982,'sp6000+pcs260',1,0,'DEFAULT',0,0,0,0,0,NULL),(100000000,'SP5500/丛文',1,32,'DEFAULT',0,32,1,0,0,NULL),(100008126,'英菲尼特中文/CWS1104',1,0,'DEFAULT',0,0,0,0,0,NULL),(100008127,'DS-7208HV-ST',1,0,'DEFAULT',0,0,1,2,0,NULL),(100008128,'EV0192/丛文无线',1,200,'DEFAULT',0,200,0,0,0,NULL),(100008129,'吸顶探头',1,200,'DEFAULT',0,0,0,0,0,NULL),(100008130,'DS9370',1,0,'DEFAULT',0,0,0,0,0,NULL),(100008131,'728ULT/CWS1104',1,0,'DEFAULT',0,32,0,0,0,NULL),(100008132,'738+',1,8,'DEFAULT',0,8,0,0,0,NULL),(100008133,'748EX',1,32,'DEFAULT',0,0,0,0,0,NULL),(100008134,'EVO192/PC250G',1,64,'DEFAULT',0,0,0,0,0,NULL),(100008135,'SP4000+19M04网络版',1,8,'DEFAULT',0,0,0,0,0,NULL),(100008136,'SP6000+19M04网络版',1,16,'DEFAULT',0,0,0,0,0,NULL),(100008137,'SP7000+19M04网络版',1,32,'DEFAULT',0,0,0,0,0,NULL),(100008138,'科力信KB-A1188',1,8,'DEFAULT',0,0,0,0,0,NULL),(100008139,'科力信KB-A1189',1,16,'DEFAULT',0,0,0,0,0,NULL),(1984,'DS-PEA-JY/GLE',15,0,NULL,NULL,0,NULL,NULL,NULL,NULL),(800001112,'理想报警主机LX6221',1,6,'DEFAULT',0,90,0,0,0,NULL),(800001113,'理想SY-9214G-XM',7,8,'DEFAULT',4,32,0,0,0,NULL),(800001114,'SP7000+PCS260',1,0,'DEFAULT',0,0,0,0,0,NULL),(800001115,'E55/PCS250G',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000010,'NT1-EGW-V20',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000011,'SP7000/139G',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000012,'EVO192/139G',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000013,'E55/PM2000',1,0,'DEFAULT',0,0,0,0,0,NULL),(-1,' ',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000015,'SP4000/PM2000',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000017,'SP6000/PM2000',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000018,'SP7000/PM2000',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000019,'E55/CWS1104',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000020,'EVO192/PM2000',1,0,'DEFAULT',0,0,0,0,0,NULL),(900000021,'EVO192/CWS1104',1,0,'DEFAULT',0,0,0,0,0,NULL),(1983,'未知',9,0,'DEFAULT',4,0,0,0,0,NULL),(900000023,'一键式报警器类型',15,0,NULL,NULL,0,NULL,NULL,NULL,NULL),(2000,'139',1,0,'DEFAULT',0,0,0,0,0,''),(2001,'16路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2002,'19A08-BNG',1,0,'DEFAULT',0,0,0,0,0,''),(2003,'239G',1,0,'DEFAULT',0,0,0,0,0,''),(2004,'4110',1,0,'DEFAULT',0,0,0,0,0,''),(2005,'4K路',1,0,'DEFAULT',0,0,0,0,0,''),(2006,'4路',1,0,'DEFAULT',0,0,0,0,0,''),(2007,'4路硬盘',1,0,'DEFAULT',0,0,0,0,0,''),(2008,'4路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2009,'7208海康',1,0,'DEFAULT',0,0,0,0,0,''),(2010,'728',1,0,'DEFAULT',0,0,0,0,0,''),(2011,'728+',1,0,'DEFAULT',0,0,0,0,0,''),(2012,'728ULT',1,0,'DEFAULT',0,0,0,0,0,''),(2013,'728ULT,139',1,0,'DEFAULT',0,0,0,0,0,''),(2014,'728ULT/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2015,'728UTL',1,0,'DEFAULT',0,0,0,0,0,''),(2016,'8路',1,0,'DEFAULT',0,0,0,0,0,''),(2017,'8路大华主',1,0,'DEFAULT',0,0,0,0,0,''),(2018,'8路大华主?',1,0,'DEFAULT',0,0,0,0,0,''),(2019,'8路硬盘录像机',1,0,'DEFAULT',0,0,0,0,0,''),(2020,'8路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2021,'8路主机一套',1,0,'DEFAULT',0,0,0,0,0,''),(2022,'AWBM16008A',1,0,'DEFAULT',0,0,0,0,0,''),(2023,'DA1604、DH5032',1,0,'DEFAULT',0,0,0,0,0,''),(2024,'DH-04047L',1,0,'DEFAULT',0,0,0,0,0,''),(2025,'DH-1604LE-',1,0,'DEFAULT',0,0,0,0,0,''),(2026,'DH-DVR0404',1,0,'DEFAULT',0,0,0,0,0,''),(2027,'DS-19A08-BNG-1',1,0,'DEFAULT',0,0,0,0,0,''),(2028,'DS-19A08-BUG-1',1,0,'DEFAULT',0,0,0,0,0,''),(2029,'DS-19A08网络主机',1,0,'DEFAULT',0,0,0,0,0,''),(2030,'DS-19A16-BNG',1,0,'DEFAULT',0,0,0,0,0,''),(2031,'DS-19K00-B',1,0,'DEFAULT',0,0,0,0,0,''),(2032,'DS--7208HV',1,0,'DEFAULT',0,0,0,0,0,''),(2033,'DS7208HV-SN',1,0,'DEFAULT',0,0,0,0,0,''),(2034,'DS-7808N-E2',1,0,'DEFAULT',0,0,0,0,0,''),(2035,'DS-7832N-K2',1,0,'DEFAULT',0,0,0,0,0,''),(2036,'DS-8116HS-',1,0,'DEFAULT',0,0,0,0,0,''),(2037,'DS-DVR7208',1,0,'DEFAULT',0,0,0,0,0,''),(2038,'E55 139G',1,0,'DEFAULT',0,0,0,0,0,''),(2039,'E55 NAT-2G',1,0,'DEFAULT',0,0,0,0,0,''),(2040,'E55,',1,0,'DEFAULT',0,0,0,0,0,''),(2041,'E55，139G',1,0,'DEFAULT',0,0,0,0,0,''),(2042,'E55，2GM',1,0,'DEFAULT',0,0,0,0,0,''),(2043,'E55，2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2044,'E55，丛文主机',1,0,'DEFAULT',0,0,0,0,0,''),(2045,'E55,广拓',1,0,'DEFAULT',0,0,0,0,0,''),(2046,'E55、139G',1,0,'DEFAULT',0,0,0,0,0,''),(2047,'E55/2GM',1,0,'DEFAULT',0,0,0,0,0,''),(2048,'E55/2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2049,'E55/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2050,'E55/MAT-2G',1,0,'DEFAULT',0,0,0,0,0,''),(2051,'E55/NAT-2G',1,0,'DEFAULT',0,0,0,0,0,''),(2052,'E55/NAT-2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2053,'E55/丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2054,'E552GM',1,0,'DEFAULT',0,0,0,0,0,''),(2055,'E55NAT-2GS',1,0,'DEFAULT',0,0,0,0,0,''),(2056,'EV0192',1,0,'DEFAULT',0,0,0,0,0,''),(2057,'EV0-192',1,0,'DEFAULT',0,0,0,0,0,''),(2058,'EV0192/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2059,'EV0192/丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2060,'EV048',1,0,'DEFAULT',0,0,0,0,0,''),(2061,'EV192',1,0,'DEFAULT',0,0,0,0,0,''),(2062,'EVO192',1,0,'DEFAULT',0,0,0,0,0,''),(2063,'EVO-192',1,0,'DEFAULT',0,0,0,0,0,''),(2064,'EVO192/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2065,'HD-DVR0404',1,0,'DEFAULT',0,0,0,0,0,''),(2066,'HY-171VC/4',1,0,'DEFAULT',0,0,0,0,0,''),(2067,'IFINITE',1,0,'DEFAULT',0,0,0,0,0,''),(2068,'IMFINITE',1,0,'DEFAULT',0,0,0,0,0,''),(2069,'INFINET',1,0,'DEFAULT',0,0,0,0,0,''),(2070,'INFINIT',1,0,'DEFAULT',0,0,0,0,0,''),(2071,'INFINIT/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2072,'INFINIT/无线主机模块',1,0,'DEFAULT',0,0,0,0,0,''),(2073,'INFINITE',1,0,'DEFAULT',0,0,0,0,0,''),(2074,'INFINITE/2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2075,'INFINITE/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2076,'INFINITE加丛文无线模',1,0,'DEFAULT',0,0,0,0,0,''),(2077,'INFINITY',1,0,'DEFAULT',0,0,0,0,0,''),(2078,'INFINIT中文/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2079,'INFNITE',1,0,'DEFAULT',0,0,0,0,0,''),(2080,'IP150',1,0,'DEFAULT',0,0,0,0,0,''),(2081,'IP250G',1,0,'DEFAULT',0,0,0,0,0,''),(2082,'KLG-X50',1,0,'DEFAULT',0,0,0,0,0,''),(2083,'KS398DY',1,0,'DEFAULT',0,0,0,0,0,''),(2084,'MG6250',1,0,'DEFAULT',0,0,0,0,0,''),(2085,'NT1-EG-V20',1,0,'DEFAULT',0,0,0,0,0,''),(2086,'NT1-EGW-V20',1,0,'DEFAULT',0,0,0,0,0,''),(2087,'NT1-TEGW',1,0,'DEFAULT',0,0,0,0,0,''),(2088,'NT1-TEGW-V20',1,0,'DEFAULT',0,0,0,0,0,''),(2089,'NTI-EG-V20',1,0,'DEFAULT',0,0,0,0,0,''),(2090,'NTI-TEGW-V20',1,0,'DEFAULT',0,0,0,0,0,''),(2091,'OMNI400',1,0,'DEFAULT',0,0,0,0,0,''),(2092,'P6000',1,0,'DEFAULT',0,0,0,0,0,''),(2093,'PC1616',1,0,'DEFAULT',0,0,0,0,0,''),(2094,'PC1616/2GS',1,0,'DEFAULT',0,0,0,0,0,''),(2095,'PC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2096,'PCS205G',1,0,'DEFAULT',0,0,0,0,0,''),(2097,'PCS250',1,0,'DEFAULT',0,0,0,0,0,''),(2098,'PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2099,'PM2000',1,0,'DEFAULT',0,0,0,0,0,''),(2100,'PM2000G',1,0,'DEFAULT',0,0,0,0,0,''),(2101,'PMG2000',1,0,'DEFAULT',0,0,0,0,0,''),(2102,'PSC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2103,'SK-139G',1,0,'DEFAULT',0,0,0,0,0,''),(2104,'SP4000',1,0,'DEFAULT',0,0,0,0,0,''),(2105,'SP-4000',1,0,'DEFAULT',0,0,0,0,0,''),(2106,'SP4000 GPRS/GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2107,'SP4000,2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2108,'SP4000/1104无线',1,0,'DEFAULT',0,0,0,0,0,''),(2109,'SP4000/139G',1,0,'DEFAULT',0,0,0,0,0,''),(2110,'SP4000/2G',1,0,'DEFAULT',0,0,0,0,0,''),(2111,'SP4000/2GM',1,0,'DEFAULT',0,0,0,0,0,''),(2112,'SP4000/2GS',1,0,'DEFAULT',0,0,0,0,0,''),(2113,'SP4000/2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2114,'SP4000/CW1104',1,0,'DEFAULT',0,0,0,0,0,''),(2115,'SP4000/CWS',1,0,'DEFAULT',0,0,0,0,0,''),(2116,'SP4000/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2117,'SP4000/IP150',1,0,'DEFAULT',0,0,0,0,0,''),(2118,'SP4000/NAT',1,0,'DEFAULT',0,0,0,0,0,''),(2119,'SP4000/NAT-2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2120,'SP4000/OWS1104无线',1,0,'DEFAULT',0,0,0,0,0,''),(2121,'SP4000/PC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2122,'SP4000/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2123,'SP4000/丛文',1,0,'DEFAULT',0,0,0,0,0,''),(2124,'SP4000/丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2125,'SP40002GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2126,'SP4000-CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2127,'SP4000PCS250',1,0,'DEFAULT',0,0,0,0,0,''),(2128,'SP400O/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2129,'SP5500',1,0,'DEFAULT',0,0,0,0,0,''),(2130,'SP5500/CW1104',1,0,'DEFAULT',0,0,0,0,0,''),(2131,'SP5500/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2132,'SP5500/PC250',1,0,'DEFAULT',0,0,0,0,0,''),(2133,'SP5500/PC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2134,'SP5500/PCS250',1,0,'DEFAULT',0,0,0,0,0,''),(2135,'SP5500/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2136,'SP5500/PCS250G无线主',1,0,'DEFAULT',0,0,0,0,0,''),(2137,'SP5500/SPC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2138,'SP5500/从文',1,0,'DEFAULT',0,0,0,0,0,''),(2139,'SP5500/丛文',1,0,'DEFAULT',0,0,0,0,0,''),(2140,'SP5500/丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2141,'SP55000',1,0,'DEFAULT',0,0,0,0,0,''),(2142,'SP5500CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2143,'SP550O',1,0,'DEFAULT',0,0,0,0,0,''),(2144,'SP550O/丛文无线主机',1,0,'DEFAULT',0,0,0,0,0,''),(2145,'SP550O/无线主机',1,0,'DEFAULT',0,0,0,0,0,''),(2146,'SP6000',1,0,'DEFAULT',0,0,0,0,0,''),(2147,'SP-6000',1,0,'DEFAULT',0,0,0,0,0,''),(2148,'SP6000 丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2149,'SP6000，139G',1,0,'DEFAULT',0,0,0,0,0,''),(2150,'SP6000/1104无线',1,0,'DEFAULT',0,0,0,0,0,''),(2151,'SP6000/139',1,0,'DEFAULT',0,0,0,0,0,''),(2152,'SP6000/139G',1,0,'DEFAULT',0,0,0,0,0,''),(2153,'SP6000/2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2154,'SP6000/CW1104',1,0,'DEFAULT',0,0,0,0,0,''),(2155,'SP6000/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2156,'SP6000/IP150',1,0,'DEFAULT',0,0,0,0,0,''),(2157,'SP6000/NAT',1,0,'DEFAULT',0,0,0,0,0,''),(2158,'SP6000/PC250',1,0,'DEFAULT',0,0,0,0,0,''),(2159,'SP6000/PC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2160,'SP6000/PC5250G',1,0,'DEFAULT',0,0,0,0,0,''),(2161,'SP6000/PCS250',1,0,'DEFAULT',0,0,0,0,0,''),(2162,'SP6000/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2163,'SP6000/SW1104',1,0,'DEFAULT',0,0,0,0,0,''),(2164,'SP6000/从文',1,0,'DEFAULT',0,0,0,0,0,''),(2165,'SP6000/丛文',1,0,'DEFAULT',0,0,0,0,0,''),(2166,'SP6000/丛文模块',1,0,'DEFAULT',0,0,0,0,0,''),(2167,'SP6000/丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2168,'SP6000CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2169,'SP6000-CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2170,'SP6000PC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2171,'SP6000W1104',1,0,'DEFAULT',0,0,0,0,0,''),(2172,'SP6000从文',1,0,'DEFAULT',0,0,0,0,0,''),(2173,'SP6000丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2174,'SP7000',1,0,'DEFAULT',0,0,0,0,0,''),(2175,'SP-7000',1,0,'DEFAULT',0,0,0,0,0,''),(2176,'SP7000,2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2177,'SP7000/2GSM',1,0,'DEFAULT',0,0,0,0,0,''),(2178,'SP7000/CW1104',1,0,'DEFAULT',0,0,0,0,0,''),(2179,'SP7000/CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2180,'SP7000/CWS114',1,0,'DEFAULT',0,0,0,0,0,''),(2181,'SP7000/PC250',1,0,'DEFAULT',0,0,0,0,0,''),(2182,'SP7000/PC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2183,'SP7000/PCS250',1,0,'DEFAULT',0,0,0,0,0,''),(2184,'SP7000/PCS2506',1,0,'DEFAULT',0,0,0,0,0,''),(2185,'SP7000/PCS250G',1,0,'DEFAULT',0,0,0,0,0,''),(2186,'SP7000/丛文',1,0,'DEFAULT',0,0,0,0,0,''),(2187,'SP7000/丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2188,'SP7000CWS1104',1,0,'DEFAULT',0,0,0,0,0,''),(2189,'SP7000丛文无线',1,0,'DEFAULT',0,0,0,0,0,''),(2190,'SP74000',1,0,'DEFAULT',0,0,0,0,0,''),(2191,'SPC250G',1,0,'DEFAULT',0,0,0,0,0,''),(2192,'TN1-TEGW-V20-1',1,0,'DEFAULT',0,0,0,0,0,''),(2193,'VS120',1,0,'DEFAULT',0,0,0,0,0,''),(2194,'八路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2195,'成都理想科技无线',1,0,'DEFAULT',0,0,0,0,0,''),(2196,'大华',1,0,'DEFAULT',0,0,0,0,0,''),(2197,'大华16路',1,0,'DEFAULT',0,0,0,0,0,''),(2198,'大华16路DV',1,0,'DEFAULT',0,0,0,0,0,''),(2199,'大华8路',1,0,'DEFAULT',0,0,0,0,0,''),(2200,'大华八路',1,0,'DEFAULT',0,0,0,0,0,''),(2201,'大华八路易',1,0,'DEFAULT',0,0,0,0,0,''),(2202,'大华四路',1,0,'DEFAULT',0,0,0,0,0,''),(2203,'大华四路主',1,0,'DEFAULT',0,0,0,0,0,''),(2204,'电视监控',1,0,'DEFAULT',0,0,0,0,0,''),(2205,'海康',1,0,'DEFAULT',0,0,0,0,0,''),(2206,'海康16路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2207,'海康4路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2208,'海康8路',1,0,'DEFAULT',0,0,0,0,0,''),(2209,'海康8路硬盘录像机',1,0,'DEFAULT',0,0,0,0,0,''),(2210,'海康8路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2211,'海康DS-19A08-BN',1,0,'DEFAULT',0,0,0,0,0,''),(2212,'海康DS-720',1,0,'DEFAULT',0,0,0,0,0,''),(2213,'海康DS-7932H-SN',1,0,'DEFAULT',0,0,0,0,0,''),(2214,'海康IVMS-8200',1,0,'DEFAULT',0,0,0,0,0,''),(2215,'海康八路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2216,'海康录像机',1,0,'DEFAULT',0,0,0,0,0,''),(2217,'海康三网',1,0,'DEFAULT',0,0,0,0,0,''),(2218,'海康三网主机',1,0,'DEFAULT',0,0,0,0,0,''),(2219,'海康网络',1,0,'DEFAULT',0,0,0,0,0,''),(2220,'海康网络主机',1,0,'DEFAULT',0,0,0,0,0,''),(2221,'海康威视',1,0,'DEFAULT',0,0,0,0,0,''),(2222,'海康无线',1,0,'DEFAULT',0,0,0,0,0,''),(2223,'海康无线模',1,0,'DEFAULT',0,0,0,0,0,''),(2224,'海康硬盘录',1,0,'DEFAULT',0,0,0,0,0,''),(2225,'海康硬盘主',1,0,'DEFAULT',0,0,0,0,0,''),(2226,'海康主机',1,0,'DEFAULT',0,0,0,0,0,''),(2227,'华百安',1,0,'DEFAULT',0,0,0,0,0,''),(2228,'迈PM2000G',1,0,'DEFAULT',0,0,0,0,0,''),(2229,'三网',1,0,'DEFAULT',0,0,0,0,0,''),(2230,'三网主机',1,0,'DEFAULT',0,0,0,0,0,''),(2231,'四路硬盘主',1,0,'DEFAULT',0,0,0,0,0,''),(2232,'四路主机',1,0,'DEFAULT',0,0,0,0,0,''),(2233,'天地伟业',1,0,'DEFAULT',0,0,0,0,0,''),(2234,'天地伟业硬',1,0,'DEFAULT',0,0,0,0,0,''),(2235,'网络机柜',1,0,'DEFAULT',0,0,0,0,0,''),(2236,'网络主机',1,0,'DEFAULT',0,0,0,0,0,''),(2237,'星网锐捷',1,0,'DEFAULT',0,0,0,0,0,''),(2238,'英安特',1,0,'DEFAULT',0,0,0,0,0,''),(2239,'英安特16A',1,0,'DEFAULT',0,0,0,0,0,''),(2240,'英飞尼特',1,0,'DEFAULT',0,0,0,0,0,''),(2241,'英菲尼特',1,0,'DEFAULT',0,0,0,0,0,''),(2242,'英菲尼特中文版',1,0,'DEFAULT',0,0,0,0,0,''),(2243,'英特安防',1,0,'DEFAULT',0,0,0,0,0,''),(2244,'英特安防双网主机',1,0,'DEFAULT',0,0,0,0,0,''),(2245,'英特中文版',1,0,'DEFAULT',0,0,0,0,0,''),(2246,'用户自已的主机',1,0,'DEFAULT',0,0,0,0,0,''),(900000024,'成都理想互联网NVR',10,0,NULL,4,0,0,0,0,NULL),(900000025,'LX9202',15,0,NULL,4,0,0,0,0,NULL),(900000026,'LX9214G-XM',1,0,NULL,4,0,0,0,0,NULL),(900000027,'LX9214G',1,0,NULL,4,0,0,0,0,NULL),(900000028,'LX9201',15,0,NULL,4,0,0,0,0,NULL),(900000029,'SY9511-G',1,0,NULL,4,0,0,0,0,NULL),(900000030,'SY9511-W',1,0,NULL,4,0,0,0,0,NULL),(900000031,'SY9214G',1,0,NULL,4,0,0,0,0,NULL),(900000032,'SY9214G-N',1,0,NULL,4,0,0,0,0,NULL),(900000033,'LX6205T',1,0,NULL,4,0,0,0,0,NULL),(900000034,'H2',1,0,NULL,4,0,0,0,0,NULL)@

DROP TABLE IF EXISTS `imm_devtype`@

CREATE TABLE `imm_devtype` (
  `devType` int(11) NOT NULL COMMENT '设备类型编号',
  `devTypeName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '设备类型名称',
  `icon` varchar(255) DEFAULT NULL COMMENT '图标',
  PRIMARY KEY (`devType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_devtype`(`devType`,`devTypeName`,`icon`) values (1,'报警主机','alarmHost'),(2,'人脸卡口','face'),(3,'车辆卡口','vehicle'),(4,'wifi探针','wifi'),(5,'DVR/DVS',NULL),(6,'IPC',NULL),(7,'视频报警主机',NULL),(8,'摄像机','camera'),(9,'有线NVR','wirenvr'),(10,'互联网NVR','internetnvr'),(11,'摄像机（有线NVR）','camera'),(12,'摄像机（互联网NVR）','camera'),(13,'车载','tgpscar'),(14,'摄像机（车载）','camera'),(15,'一键式报警器',NULL)@

DROP TABLE IF EXISTS `imm_devzone`@

CREATE TABLE `imm_devzone` (
  `devId` varchar(12) CHARACTER SET gbk NOT NULL COMMENT '设备编号',
  `devZoneId` varchar(4) CHARACTER SET gbk NOT NULL COMMENT '设备防区编号',
  `snModeId` int(11) DEFAULT '-1' COMMENT '探头型号',
  `atPos` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '防区位置',
  `wantDo` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '反应类型',
  `almType` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '警情类型',
  `snNum` int(11) DEFAULT NULL COMMENT '探头数量',
  `snType` varchar(40) CHARACTER SET gbk DEFAULT NULL COMMENT '探头类型',
  `instDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '安装时间',
  `liveDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '入网日期',
  `x` double DEFAULT NULL COMMENT 'x方向相对位置',
  `y` double DEFAULT NULL COMMENT 'y方向相对位置',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `syncTime` varchar(19) DEFAULT NULL COMMENT '同步时间',
  `define1` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define2` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define3` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define4` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`devId`,`devZoneId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_eventclass`@

CREATE TABLE `imm_eventclass` (
  `evtWat` int(11) NOT NULL COMMENT '事件归类编号',
  `evtWatName` varchar(32) DEFAULT NULL COMMENT '事件归类名称',
  `impotWat` varchar(32) DEFAULT NULL COMMENT '重要归类',
  PRIMARY KEY (`evtWat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_eventclass`(`evtWat`,`evtWatName`,`impotWat`) values (0,'gdfgd','-1'),(1,'报警','1'),(2,'撤布防','0'),(3,'超测','1'),(4,'故障','1'),(5,'其他','0'),(6,'fdsfds','-1'),(7,'fdsfdsf','-1'),(8,'dfsaf','-1'),(9,'fafda','-1'),(10,'feaf','-1'),(11,'aafea','-1')@

DROP TABLE IF EXISTS `imm_evtway`@

CREATE TABLE `imm_evtway` (
  `evtWay` int(11) NOT NULL AUTO_INCREMENT COMMENT '事件归类编号',
  `evtWayName` varchar(10) DEFAULT NULL COMMENT '事件归类名称',
  PRIMARY KEY (`evtWay`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_forward_history`@

CREATE TABLE `imm_forward_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stationNums` text NOT NULL COMMENT '工作站编号列表，逗号分隔',
  `alarmEvent` text NOT NULL COMMENT '事件信息（json格式）',
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56952 DEFAULT CHARSET=utf8 COMMENT='事件转发的历史记录，仅保持最近三个月的数据'@

DROP TABLE IF EXISTS `imm_frequently_alarm`@

CREATE TABLE `imm_frequently_alarm` (
  `devId` varchar(20) NOT NULL,
  `last_count` int(11) NOT NULL DEFAULT '0',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新事件'
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_generaluser`@

CREATE TABLE `imm_generaluser` (
  `roleId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '角色编号',
  `userAccount` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '用户账号',
  `userPwd` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '用户密码',
  `createDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '创建日期',
  `userId` varchar(9) CHARACTER SET gbk NOT NULL COMMENT '用户编号',
  `userName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '用户名称',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型',
  `userAddr` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '用户地址',
  `userProperty` int(11) DEFAULT NULL COMMENT '用户属性',
  `businessId` varchar(24) CHARACTER SET gbk DEFAULT NULL COMMENT '用户行业',
  `businessName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '用户行业名称',
  `centerId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '所属分中心编号',
  `centerName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '分中心名称',
  `payNO` varchar(64) CHARACTER SET gbk DEFAULT NULL COMMENT '口令',
  `userServerType` int(11) DEFAULT NULL COMMENT '用户服务类型（A100中的用户类型，报警主机、视频报警主机、DVR等等）',
  `userServerTypeName` varchar(32) DEFAULT NULL COMMENT '用户服务类型名称',
  `contact` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '单位负责人',
  `contactPayNO` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人口令',
  `cHmPhone` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人家庭电话',
  `cPhone` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人电话',
  `cMobile` varchar(100) CHARACTER SET gbk DEFAULT NULL COMMENT '负责人手机',
  `areaId` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '区域编号',
  `areaName` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '区域名称',
  `isVideoCheck` int(11) DEFAULT NULL COMMENT '短信转发',
  `isPay` int(11) DEFAULT NULL COMMENT '缴费状态'
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_loginlog`@

CREATE TABLE `imm_loginlog` (
  `id` varchar(100) NOT NULL COMMENT 'ticketId',
  `username` varchar(15) NOT NULL COMMENT '用户名',
  `clientIp` varchar(16) DEFAULT NULL COMMENT '客户端ip',
  `loginTime` varchar(20) NOT NULL COMMENT '登录时间',
  `status` varchar(10) NOT NULL COMMENT '在线状态',
  `logoutTime` varchar(20) DEFAULT NULL COMMENT '退出时间',
  `logoutWay` varchar(10) DEFAULT NULL COMMENT '退出方式，有正常退出、被挤下线、超时退出，异常退出',
  `logoutCode` varchar(10) DEFAULT NULL COMMENT '退出方式代码',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

/*Data for the table `imm_loginlog` */

/*Table structure for table `imm_mappic` */

DROP TABLE IF EXISTS `imm_mappic`@

CREATE TABLE `imm_mappic` (
  `mapId` varchar(120) DEFAULT NULL,
  `ownerId` varchar(30) DEFAULT NULL COMMENT '机主编号',
  `mapName` varchar(120) DEFAULT NULL,
  `mapPath` varchar(765) DEFAULT NULL,
  `fMemo` varchar(765) DEFAULT NULL,
  `updatetime` varchar(57) DEFAULT NULL,
  `define1` varchar(96) DEFAULT NULL,
  `define2` varchar(96) DEFAULT NULL,
  `define3` varchar(96) DEFAULT NULL,
  `define4` varchar(96) DEFAULT NULL,
  `define5` varchar(96) DEFAULT NULL,
  `define6` varchar(96) DEFAULT NULL,
  `dataFrom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_module`@

CREATE TABLE `imm_module` (
  `moduleId` int(11) NOT NULL COMMENT '模块编号',
  `modelName` varchar(50) NOT NULL COMMENT '模块名称',
  `applicationId` varchar(50) NOT NULL COMMENT '所属应用',
  `fmemo` varchar(100) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`moduleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_module`(`moduleId`,`modelName`,`applicationId`,`fmemo`) values (1,'用户管理','IntegratedMM',''),(2,'机主管理','IntegratedMM',''),(3,'设备管理','IntegratedMM',''),(4,'权限管理','IntegratedMM',''),(5,'系统配置','IntegratedMM',''),(6,'统计查询','IntegratedMM',''),(7,'处警','RDAcenter',''),(8,'实时/录像视频','RDAcenter',''),(9,'状态监控','RDAcenter',''),(10,'远程控制','RDAcenter',''),(11,'综合查询','RDAcenter','')@

DROP TABLE IF EXISTS `imm_netnvrattr`@

CREATE TABLE `imm_netnvrattr` (
  `devId` varchar(12) NOT NULL COMMENT '设备编号',
  `devTUTKID` varchar(255) NOT NULL COMMENT 'tutkID',
  `devLoginName` varchar(32) DEFAULT NULL COMMENT '设备登录用户名',
  `devLoginPwd` varchar(32) DEFAULT NULL COMMENT '设备登录密码',
  `videoServer` varchar(15) DEFAULT NULL COMMENT '流转服务（IP(15)）',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`devId`,`devTUTKID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_one_click_dev_attr`@

CREATE TABLE `imm_one_click_dev_attr` (
  `devId` varchar(12) NOT NULL COMMENT '设备编号，与设备基本信息表的设备编号一致',
  `devSn` varchar(50) NOT NULL COMMENT '一键式语音设备厂家提供的设备序列号',
  `IP` varchar(20) DEFAULT NULL COMMENT '设备IP',
  `PORT` varchar(20) DEFAULT NULL COMMENT '设备端口',
  `tunnelId` varchar(20) DEFAULT NULL COMMENT '通道号',
  `playCode` varchar(20) DEFAULT NULL COMMENT '播放码流',
  `loginName` varchar(32) DEFAULT NULL COMMENT '设备登录用户名',
  `loginPwd` varchar(32) DEFAULT NULL COMMENT '设备登录密码',
  `communicateLine` varchar(32) DEFAULT NULL COMMENT '通信线路',
  `communicateProtocol` varchar(32) DEFAULT NULL COMMENT '通信协议',
  `updatetime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `dataFrom` varchar(255) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`devId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_operateright`@

CREATE TABLE `imm_operateright` (
  `operateRightId` int(11) NOT NULL COMMENT '操作权限编号',
  `operateRightName` varchar(80) CHARACTER SET gbk NOT NULL COMMENT '操作权限名称',
  `applicationId` varchar(40) NOT NULL COMMENT '模块编号',
  PRIMARY KEY (`operateRightId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_operatorattr`@

CREATE TABLE `imm_operatorattr` (
  `userId` varchar(9) CHARACTER SET gbk NOT NULL COMMENT '用户编号（操作员编号）',
  `acctType` int(11) DEFAULT NULL COMMENT '操作员类型',
  `acctIP` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员IP',
  `overDateTime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '过期时间',
  `telephone` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员电话',
  `email` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '邮箱',
  `sex` int(11) DEFAULT NULL COMMENT '操作员性别',
  `education` varchar(8) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员学历',
  `office` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员职务',
  `acctDY` int(11) DEFAULT '0' COMMENT '订阅（0表示不启动订阅）',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `operName` varchar(100) DEFAULT NULL COMMENT '录入人',
  `operTime` varchar(19) DEFAULT NULL COMMENT '录入时间',
  `define3` int(11) DEFAULT NULL COMMENT '预留字段',
  `define4` int(11) DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define7` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define8` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define9` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define10` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_operatoruser`@

CREATE TABLE `imm_operatoruser` (
  `roleId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '角色编号',
  `userAccount` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '用户账号',
  `userPwd` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '用户密码',
  `createDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '创建日期',
  `userId` varchar(9) CHARACTER SET gbk NOT NULL COMMENT '用户编号',
  `userName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '用户名称',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型',
  `areaId` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '区域编号',
  `areaName` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '区域名称',
  `overDateTime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '过期时间',
  `acctIP` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员IP',
  `sex` int(11) DEFAULT NULL COMMENT '操作员性别',
  `telephone` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员电话',
  `email` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '邮箱',
  `education` varchar(8) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员学历',
  `office` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员职务',
  `userPWDhint` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '密码提示',
  `centerId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '所属分中心编号',
  `centerName` varchar(80) CHARACTER SET gbk DEFAULT NULL COMMENT '分中心名称',
  `acctDY` int(11) DEFAULT NULL COMMENT '订阅（0表示不启动订阅）',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `operName` varchar(100) DEFAULT NULL COMMENT '录入人',
  `operTime` varchar(19) DEFAULT NULL COMMENT '录入时间'
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_owner_dev_bcf_plan`@

CREATE TABLE `imm_owner_dev_bcf_plan` (
  `ownerId` varchar(9) NOT NULL,
  `starDateTime` varchar(19) DEFAULT NULL,
  `overDateTime` varchar(19) DEFAULT NULL,
  `bFdevId` varchar(9) DEFAULT NULL,
  `bFsymbol1` int(11) DEFAULT NULL,
  `bFStartime1` varchar(8) DEFAULT NULL,
  `bFOvertime1` varchar(8) DEFAULT NULL,
  `bFLastCheckDate1` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFsymbol2` int(11) DEFAULT NULL,
  `bFStartime2` varchar(8) DEFAULT NULL,
  `bFOvertime2` varchar(8) DEFAULT NULL,
  `bFLastCheckDate2` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFsymbol3` int(11) DEFAULT NULL,
  `bFStartime3` varchar(8) DEFAULT NULL,
  `bFOvertime3` varchar(8) DEFAULT NULL,
  `bFLastCheckDate3` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFsymbol4` int(11) DEFAULT NULL,
  `bFStartime4` varchar(8) DEFAULT NULL,
  `bFOvertime4` varchar(8) DEFAULT NULL,
  `bFLastCheckDate4` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFsymbol5` int(11) DEFAULT NULL,
  `bFStartime5` varchar(8) DEFAULT NULL,
  `bFOvertime5` varchar(8) DEFAULT NULL,
  `bFLastCheckDate5` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFsymbol6` int(11) DEFAULT NULL,
  `bFStartime6` varchar(8) DEFAULT NULL,
  `bFOvertime6` varchar(8) DEFAULT NULL,
  `bFLastCheckDate6` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFsymbol7` int(11) DEFAULT NULL,
  `bFStartime7` varchar(8) DEFAULT NULL,
  `bFOvertime7` varchar(8) DEFAULT NULL,
  `bFLastCheckDate7` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `bFfMemo` varchar(255) DEFAULT NULL,
  `cFdevId` varchar(9) DEFAULT NULL,
  `cFsymbol1` int(11) DEFAULT NULL,
  `cFStartime1` varchar(8) DEFAULT NULL,
  `cFOvertime1` varchar(8) DEFAULT NULL,
  `cFLastCheckDate1` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFsymbol2` int(11) DEFAULT NULL,
  `cFStartime2` varchar(8) DEFAULT NULL,
  `cFOvertime2` varchar(8) DEFAULT NULL,
  `cFLastCheckDate2` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFsymbol3` int(11) DEFAULT NULL,
  `cFStartime3` varchar(8) DEFAULT NULL,
  `cFOvertime3` varchar(8) DEFAULT NULL,
  `cFLastCheckDate3` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFsymbol4` int(11) DEFAULT NULL,
  `cFStartime4` varchar(8) DEFAULT NULL,
  `cFOvertime4` varchar(8) DEFAULT NULL,
  `cFLastCheckDate4` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFsymbol5` int(11) DEFAULT NULL,
  `cFStartime5` varchar(8) DEFAULT NULL,
  `cFOvertime5` varchar(8) DEFAULT NULL,
  `cFLastCheckDate5` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFsymbol6` int(11) DEFAULT NULL,
  `cFStartime6` varchar(8) DEFAULT NULL,
  `cFOvertime6` varchar(8) DEFAULT NULL,
  `cFLastCheckDate6` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFsymbol7` int(11) DEFAULT NULL,
  `cFStartime7` varchar(8) DEFAULT NULL,
  `cFOvertime7` varchar(8) DEFAULT NULL,
  `cFLastCheckDate7` varchar(19) DEFAULT '1970-01-01 00:00:00',
  `cFfMemo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ownerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_ownerevtrecord`@

CREATE TABLE `imm_ownerevtrecord` (
  `UserEvtId` varchar(21) NOT NULL COMMENT '用户事件编号',
  `ownerId` varchar(10) DEFAULT NULL COMMENT '机主编号',
  `ZoneCHFlag` int(11) DEFAULT NULL COMMENT '0表示为防区，1表示监控点（配置类型）',
  `ZoneCHValue` varchar(4) DEFAULT NULL COMMENT '防区编号或者是监控编号',
  `UserEvt` varchar(10) DEFAULT NULL COMMENT '事件类型编号',
  `isVideo` int(11) DEFAULT NULL COMMENT '0表示不看视频，1表示看视频（是否启用联动）',
  `cameraIdList` varchar(256) DEFAULT NULL COMMENT '摄像机编号（摄像机属性表中的设备编号）',
  `fMemo` varchar(256) DEFAULT NULL COMMENT '备注',
  `contList` varchar(256) DEFAULT NULL COMMENT '联系人列表',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`UserEvtId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_ownermonitor`@

CREATE TABLE `imm_ownermonitor` (
  `ownerId` varchar(10) NOT NULL DEFAULT '' COMMENT '机主编号',
  `devId` varchar(12) NOT NULL COMMENT '设备编号',
  `devMonitorId` varchar(32) NOT NULL COMMENT '设备监控点编号',
  `ownerMonitorId` varchar(10) DEFAULT NULL COMMENT '机主监控点编号',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ownerId`,`devId`,`devMonitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_ownerzone`@

CREATE TABLE `imm_ownerzone` (
  `ownerId` varchar(10) NOT NULL DEFAULT '' COMMENT '用户编号',
  `devId` varchar(12) CHARACTER SET gbk NOT NULL COMMENT '设备编号',
  `devZoneId` varchar(4) CHARACTER SET gbk NOT NULL COMMENT '设备防区编号',
  `ownerZoneName` varchar(10) DEFAULT NULL,
  `mapId` varchar(40) CHARACTER SET gbk DEFAULT NULL COMMENT '防区图编号',
  `snModelId` int(11) DEFAULT NULL COMMENT '探测器型号编号',
  `x` double DEFAULT NULL COMMENT 'x方向相对位置',
  `y` double DEFAULT NULL COMMENT 'y方向相对位置',
  `syncTime` varchar(19) DEFAULT NULL COMMENT '同步时间',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `fMemo` varchar(128) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `define1` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define2` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define3` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define4` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ownerId`,`devId`,`devZoneId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_platecolor`@

CREATE TABLE `imm_platecolor` (
  `plateColorId` varchar(10) NOT NULL COMMENT '车牌颜色Id',
  `plateColorName` varchar(10) DEFAULT NULL COMMENT '车牌颜色名称',
  PRIMARY KEY (`plateColorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_platecolor`(`plateColorId`,`plateColorName`) values ('0','白色'),('1','黄色'),('2','蓝色'),('3','黑色'),('4','其他颜色')@

DROP TABLE IF EXISTS `imm_roleapp`@

CREATE TABLE `imm_roleapp` (
  `roleId` varchar(32) DEFAULT NULL COMMENT '角色编号',
  `applicationId` varchar(40) DEFAULT NULL COMMENT '应用编号',
  `operateRightId` int(11) DEFAULT NULL COMMENT '操作权限编号',
  `isAvailable` int(11) DEFAULT NULL COMMENT '是否启用',
  `updatetime` varchar(19) DEFAULT NULL COMMENT '更新时间',
  `dataFrom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_rolearea`@

CREATE TABLE `imm_rolearea` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增主键',
  `roleId` varchar(35) NOT NULL COMMENT '角色编号',
  `areaId` varchar(35) NOT NULL COMMENT '区域编号',
  `is_data_node` tinyint(1) DEFAULT NULL COMMENT '是否数据节点',
  `is_handle_node` tinyint(1) DEFAULT NULL COMMENT '是否处置区域的节点',
  `real_time_handel` tinyint(1) DEFAULT NULL COMMENT '实时处置权限',
  `real_time_browse` tinyint(1) DEFAULT NULL COMMENT '实时浏览权限',
  `browse_handle_data_only` tinyint(1) DEFAULT NULL,
  `MEMO` varchar(200) DEFAULT NULL COMMENT '备注',
  `dataFrom` varchar(255) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=68982 DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_roledev`@

CREATE TABLE `imm_roledev` (
  `roleId` varchar(32) CHARACTER SET gbk NOT NULL COMMENT '角色编号',
  `devId` varchar(12) CHARACTER SET gbk NOT NULL COMMENT '设备编号',
  PRIMARY KEY (`roleId`,`devId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_roleinfo`@

CREATE TABLE `imm_roleinfo` (
  `roleId` varchar(32) CHARACTER SET gbk NOT NULL COMMENT '角色编号',
  `roleType` int(11) DEFAULT NULL COMMENT '角色类型',
  `roleName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '角色名称',
  `isNeedPay` int(11) DEFAULT NULL COMMENT '是否需要缴费',
  `isPay` int(11) DEFAULT NULL COMMENT '是缴费',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `fMemo` varchar(128) CHARACTER SET gbk DEFAULT NULL COMMENT '备注（描述）',
  `define1` int(11) DEFAULT NULL COMMENT '预留字段',
  `define2` int(11) DEFAULT NULL COMMENT '预留字段',
  `define3` int(11) DEFAULT NULL COMMENT '预留字段',
  `define4` int(11) DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define7` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define8` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define9` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define10` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  `platformId` varchar(20) DEFAULT NULL COMMENT '所属平台ID',
  `default_accept_syscodes` text COMMENT '默认接收的事件系统码',
  PRIMARY KEY (`roleId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_rolemodule`@

CREATE TABLE `imm_rolemodule` (
  `roleId` varchar(10) NOT NULL COMMENT '角色编号',
  `moduleId` varchar(30) NOT NULL COMMENT '可见模块',
  `fmemo` varchar(100) DEFAULT NULL,
  `dataFrom` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_roletype`@

CREATE TABLE `imm_roletype` (
  `roleTypeId` int(11) NOT NULL COMMENT '角色类型编号',
  `roleTypeName` varchar(10) NOT NULL COMMENT '角色类型名称',
  PRIMARY KEY (`roleTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_server`@

CREATE TABLE `imm_server` (
  `serverId` varchar(32) CHARACTER SET gbk NOT NULL COMMENT '服务器编号',
  `serverName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '服务器名称',
  `serverType` int(11) DEFAULT NULL COMMENT '服务器类型编号',
  `serverIP1` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '服务器IP1',
  `serverIP2` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '服务器IP2',
  `serverIP3` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '服务器IP3',
  `serverPort1` int(11) DEFAULT NULL COMMENT '服务器端口1',
  `serverPort2` int(11) DEFAULT NULL COMMENT '服务器端口2',
  `serverPort3` int(11) DEFAULT NULL COMMENT '服务器端口3',
  `logName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '登录名称',
  `logPWD` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '登录密码',
  `dataPort` int(11) DEFAULT NULL,
  `cmdPort` int(11) DEFAULT NULL,
  `createDateTime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '创建时间',
  `updateDateTime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `define1` int(11) DEFAULT NULL COMMENT '预留字段',
  `define2` int(11) DEFAULT NULL COMMENT '预留字段',
  `define3` int(11) DEFAULT NULL COMMENT '预留字段',
  `define4` int(11) DEFAULT NULL COMMENT '预留字段',
  `define5` int(11) DEFAULT NULL COMMENT '预留字段',
  `define6` int(11) DEFAULT NULL COMMENT '预留字段',
  `define7` int(11) DEFAULT NULL COMMENT '预留字段',
  `define8` int(11) DEFAULT NULL COMMENT '预留字段',
  `define9` int(11) DEFAULT NULL COMMENT '预留字段',
  `define10` int(11) DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  PRIMARY KEY (`serverId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_snmodel`@

CREATE TABLE `imm_snmodel` (
  `snModelId` int(11) NOT NULL COMMENT '探测器型号编号',
  `snModelName` varchar(50) CHARACTER SET gbk DEFAULT NULL COMMENT '探测器型号名称',
  `snMemo` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '探测器用途',
  `snKind` varchar(20) CHARACTER SET gbk DEFAULT NULL,
  `buyPrice` float DEFAULT NULL COMMENT '探测器价格',
  `servicePrice` float DEFAULT NULL COMMENT '服务费用',
  `wantDo` varchar(20) CHARACTER SET gbk DEFAULT NULL COMMENT '反应类型',
  `almType` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '警情类型',
  PRIMARY KEY (`snModelId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@

insert  into `imm_snmodel`(`snModelId`,`snModelName`,`snMemo`,`snKind`,`buyPrice`,`servicePrice`,`wantDo`,`almType`) values (132,'525DM','','13',0,0,'3','4'),(133,'1481','','13',0,0,'3','4'),(134,'DT-725','','13',0,0,'3','4'),(135,'福克斯DS820','','13',0,0,'3','4'),(136,'525D.','','13',0,0,'3','4'),(137,'PX-40QZ','','13',0,0,'3','4'),(138,'RX--40QZ','','13',0,0,'3','4'),(139,'N55','','13',0,0,'3','4'),(14,'943','','4',0,0,'3','4'),(140,'SS-102/','','19',0,0,'3','4'),(141,'西楼四层南侧微机','','13',0,0,'3','4'),(142,'DF-7225','','13',0,0,'3','4'),(143,'7255','','13',0,0,'3','4'),(144,'对射200米','','13',0,0,'3','4'),(145,'对射150米','','13',0,0,'3','4'),(146,'对射100米','','13',0,0,'3','4'),(147,'725，525','','13',0,0,'3','4'),(148,'主机防拆','','13',0,0,'3','4'),(149,'防拆开关','','13',0,0,'3','4'),(15,'9450WH','','13',0,0,'3','4'),(150,'1484与DT725','','13',0,0,'3','4'),(151,'烟感','','13',0,0,'3','4'),(152,'LX-40','','13',0,0,'3','4'),(153,'光栅','','13',0,0,'3','4'),(154,'200米对射','','3',0,0,'3','4'),(155,'RX-402','','13',0,0,'3','4'),(156,'1100','','13',0,0,'3','4'),(157,'报警卡','','13',0,0,'3','4'),(158,'RQ-40QZ','','13',0,0,'3','4'),(159,'525D 1484','','13',0,0,'3','4'),(16,'9450WH','','13',0,0,'3','4'),(160,'461','','13',0,0,'3','4'),(161,'CED98','','12',0,0,'3','4'),(162,'振动','','13',0,0,'3','4'),(163,'DT-725A','','13',0,0,'3','4'),(164,'EL-7000','','13',0,0,'3','4'),(165,'振动器','','13',0,0,'3','4'),(166,'525D,DF7225','','13',0,0,'3','4'),(167,'5525D','','13',0,0,'3','4'),(168,'灯箱防拆','','13',0,0,'3','4'),(169,'255','','13',0,0,'3','4'),(17,'983','','19',0,0,'3','4'),(170,'SW1000','','13',0,0,'3','4'),(171,'MS-40QZ','','15',0,0,'3','4'),(172,'灯箱','','13',0,0,'3','4'),(173,'470','','13',0,0,'3','4'),(174,'SWAN1000','','21',0,0,'3','4'),(175,'525D,SWAN1000','','其他',0,0,'3','4'),(176,'E型,525D','','13',0,0,'3','4'),(177,'玻璃破碎器','','13',0,0,'3','4'),(178,'460幕帘','','13',0,0,'3','4'),(179,'DT-7225,','','13',0,0,'3','4'),(18,'983','','19',0,0,'3','4'),(180,'DT-7435','','13',0,0,'3','4'),(181,'门磁','','13',0,0,'3','4'),(182,'RX--40','','13',0,0,'3','4'),(183,'DT725','','13',0,0,'3','4'),(184,'2650','','13',0,0,'3','4'),(185,'RX-40,DT-7225','','13',0,0,'3','4'),(186,'VE-9935','','18',0,0,'3','4'),(187,'EB27','','13',0,0,'3','4'),(188,'EL-1100','','13',0,0,'3','4'),(189,'SWAN-1000','','13',0,0,'3','4'),(19,'996EX','','2',0,0,'3','4'),(190,'30米光栅','','5',0,0,'3','4'),(191,'10米光栅','','5',0,0,'3','4'),(192,'SP6000主机防拆','','13',0,0,'3','4'),(193,'835T','','13',0,0,'3','4'),(194,'535D','','13',0,0,'3','4'),(195,'脚踏开关','','13',0,0,'3','4'),(196,'5米对射','','13',0,0,'3','4'),(197,'100米对射','','13',0,0,'3','4'),(198,'艾利安100米对射','','13',0,0,'3','4'),(199,'WX-40QZ','','13',0,0,'3','4'),(2,'1412','','18',0,0,'3','4'),(20,'997(SZ)','','2',0,0,'3','4'),(201,'防折','','13',0,0,'3','4'),(202,'博士','','13',0,0,'3','4'),(203,'X-40QZ','','13',0,0,'3','4'),(206,'RXQZ-40','','13',0,0,'3','4'),(207,'DT-235T','','13',0,0,'3','4'),(208,'KX15DT','','21',0,0,'3','4'),(209,'1486','','13',0,0,'3','4'),(21,'998EX','','2',0,0,'3','4'),(210,'光栅60米','','13',0,0,'3','4'),(211,'EL-2600','','13',0,0,'3','4'),(212,'RK2000DPC','','13',0,0,'3','4'),(213,'PB-1','','13',0,0,'3','4'),(214,'100米太阳能对射','','13',0,0,'3','4'),(215,'K10V','','13',0,0,'3','4'),(227,'1484，','','13',0,0,'3','4'),(228,'820 525','','13',0,0,'3','4'),(229,'DS835I','','21',0,0,'3','4'),(23,'ABT-80','','6',0,0,'3','4'),(230,' N55','','13',0,0,'3','4'),(231,'RX-40QZ,','','15',0,0,'3','4'),(232,'室外探头','','13',0,0,'3','4'),(233,'DS820,525','','13',0,0,'3','4'),(234,'PB-60TM','','13',0,0,'3','4'),(235,'主机箱内','','13',0,0,'3','4'),(236,'ISCBDL2WO12GCHI','','13',0,0,'3','4'),(237,'DT-906','','13',0,0,'3','4'),(238,'无线紧急','','13',0,0,'3','4'),(239,'无线按键紧急','','13',0,0,'3','4'),(24,'ARROW','','6',0,0,'3','4'),(240,'PB-60TK对射','','13',0,0,'3','4'),(241,'PB-60TK对射/','','13',0,0,'3','4'),(242,'SS-102振动','','19',0,0,'3','4'),(243,'RX-40，7225','','13',0,0,'3','4'),(244,'-7225','','13',0,0,'3','4'),(245,'RX-40，725A','','13',0,0,'3','4'),(246,'ABT-60','','3',0,0,'3','4'),(247,'ABH-100L','','3',0,0,'3','4'),(248,'60米对射','','13',0,0,'3','4'),(249,'DF7225','','13',0,0,'3','4'),(25,'ARROW','','6',0,0,'3','4'),(250,'LX-402','','14',0,0,'3','4'),(251,'DT-7225,DS820','','13',0,0,'3','4'),(252,'60米对射探头','','3',0,0,'3','4'),(253,'7235','','13',0,0,'3','4'),(254,'7435','','13',0,0,'3','4'),(255,'7225、RS-40','','13',0,0,'3','4'),(256,'20米光栅','','13',0,0,'3','4'),(257,'无线按键','','13',0,0,'3','4'),(258,'N1000','','13',0,0,'3','4'),(259,'主机开关','','13',0,0,'3','4'),(26,'AX100ALPHA','','6',0,0,'3','4'),(260,'525D，','','13',0,0,'3','4'),(261,'VE9935(烟感','','13',0,0,'3','4'),(262,'EB27（按键）','','13',0,0,'3','4'),(263,'KF-85','','13',0,0,'3','4'),(264,'灯箱警号','','13',0,0,'3','4'),(265,'防拆灯箱','','13',0,0,'3','4'),(266,'100米','','13',0,0,'3','4'),(267,'60米','','13',0,0,'3','4'),(268,'DF-725','','13',0,0,'3','4'),(269,'MX-25QZ','','15',0,0,'3','4'),(27,'AX100PLUS','','6',0,0,'3','4'),(270,'950','','13',0,0,'3','4'),(271,'PA950','','19',0,0,'3','4'),(272,'VE-9935O','','18',0,0,'3','4'),(273,'AX-350DH','','13',0,0,'3','4'),(274,'DS426','','13',0,0,'3','4'),(275,'DS820，DS660','','13',0,0,'3','4'),(276,'150米对射','','13',0,0,'3','4'),(277,'RX-40，525D','','13',0,0,'3','4'),(278,'RX-40QZ,525','','13',0,0,'3','4'),(279,'VE-60HD','','13',0,0,'3','4'),(28,'AX100S','','6',0,0,'3','4'),(280,'60米和100米对射','','13',0,0,'3','4'),(281,'906','','13',0,0,'3','4'),(282,'60米对敌射','','13',0,0,'3','4'),(283,'SWAN','','13',0,0,'3','4'),(284,'主机防拆开关','','13',0,0,'3','4'),(285,'BEL-HZ06L30M','','13',0,0,'3','4'),(286,'ABT-30','','13',0,0,'3','4'),(287,'电子围栏','','13',0,0,'3','4'),(288,'SVAN-1000','','13',0,0,'3','4'),(289,'保险柜','','13',0,0,'3','4'),(29,'AX100SR','','6',0,0,'3','4'),(290,'金库西墙','','13',0,0,'3','4'),(291,'金库南墙','','13',0,0,'3','4'),(292,'金库东墙','','13',0,0,'3','4'),(293,'防盗锁','','13',0,0,'3','4'),(294,'CH-938AF','','13',0,0,'3','4'),(295,'H-938AF（111）','','13',0,0,'3','4'),(296,'无线探头LH-938AF','','21',0,0,'3','4'),(297,'938AF','','13',0,0,'3','4'),(298,'LH-938AF','','13',0,0,'3','4'),(299,'探头','','13',0,0,'3','4'),(3,'2100EX','','1',0,0,'3','4'),(30,'AX130T','','6',0,0,'3','4'),(300,'530','','13',0,0,'3','4'),(301,'XA-200D','','13',0,0,'3','4'),(302,'XA-060D','','13',0,0,'3','4'),(303,'SP-200D','','13',0,0,'3','4'),(304,'EL-2614','','13',0,0,'3','4'),(311,'无线2645','','13',0,0,'3','4'),(312,'EL2645','','13',0,0,'3','4'),(313,'525 461','','13',0,0,'3','4'),(315,'2600','','13',0,0,'3','4'),(317,'LXSENES室外','','13',0,0,'3','4'),(318,'机箱开关','','13',0,0,'3','4'),(319,'无线探头','','13',0,0,'3','4'),(32,'AX200PLUS','','6',0,0,'3','4'),(320,'EL-2601门磁加光','','13',0,0,'3','4'),(321,'EL2645/','','13',0,0,'3','4'),(322,'EL2601','','13',0,0,'3','4'),(323,'EL-2645-6','','13',0,0,'3','4'),(325,'EC-2645','','13',0,0,'3','4'),(3256,'7100','','15',0,0,'3','4'),(326,'幕帘','','13',0,0,'3','4'),(327,'6米光栅','','13',0,0,'3','4'),(328,'幕帘探头','','13',0,0,'3','4'),(329,'10米对射','','13',0,0,'3','4'),(33,'AX250PLUS','','6',0,0,'3','4'),(330,'EL-2601-1','','13',0,0,'3','4'),(331,'RX-40Q','','13',0,0,'3','4'),(332,'红外','','13',0,0,'3','4'),(334,'HC-301-B','','13',0,0,'3','4'),(347,'盛波尔200米对射','','3',0,0,'3','4'),(348,'盛波尔60米对射','','3',0,0,'3','4'),(349,'盛波尔100米对射','','3',0,0,'3','4'),(35,'AX500PLUS','','6',0,0,'3','4'),(350,'窄道封锁器','','21',0,0,'3','4'),(351,'DST-7225','','13',0,0,'3','4'),(352,'无线按建','','13',0,0,'3','4'),(353,'SW-1000','','13',0,0,'3','4'),(354,'ATB-30','','13',0,0,'3','4'),(355,'ATB-100','','13',0,0,'3','4'),(356,'100对射','','3',0,0,'3','4'),(357,'200对射','','3',0,0,'3','4'),(358,'DT-7235','','13',0,0,'3','4'),(359,'机箱防拆','','13',0,0,'3','4'),(36,'AX650MKII','','6',0,0,'3','4'),(360,'HO-01','','8',0,0,'3','4'),(361,'200米对射手','','13',0,0,'3','4'),(362,'异形','','13',0,0,'3','4'),(363,'950振动报警器','','19',0,0,'3','4'),(367,'蓝色系列G2','','13',0,0,'3','4'),(368,'ISC-BDL2-WP12G-C','','13',0,0,'3','4'),(369,'250米对射','','3',0,0,'3','4'),(37,'AX70T','','6',0,0,'3','4'),(370,'40O米对射','','3',0,0,'3','4'),(371,'紧急EB27','','13',0,0,'3','4'),(372,'150','','13',0,0,'3','4'),(373,'对射60米','','3',0,0,'3','4'),(374,'8光束.30米光栅','','5',0,0,'3','4'),(375,'8光束.60米光栅','','5',0,0,'3','4'),(376,'525D无线','','21',0,0,'3','4'),(377,'KF85','','13',0,0,'3','4'),(378,'幕帘探测器','','21',0,0,'3','4'),(379,'外警号防拆','','13',0,0,'3','4'),(380,'AP-20ND吸顶探头','','17',0,0,'3','4'),(381,'VE-9935','','18',0,0,'3','4'),(392,'BL-19','','13',0,0,'3','4'),(393,'EC-57','','13',0,0,'3','4'),(394,'PG467吸顶探头','','17',0,0,'3','4'),(395,'100光栅','','5',0,0,'3','4'),(396,'100米光栅','','5',0,0,'3','4'),(397,'KF-85-1','','13',0,0,'3','4'),(398,'525D,DT-7225','','13',0,0,'3','4'),(399,'525D，RX-40QZ,','','其他',0,0,'3','4'),(4,'2110ES','','1',0,0,'3','4'),(40,'BP-110','','6',0,0,'3','4'),(400,'ABH200','','13',0,0,'3','4'),(401,'ABH-100','','3',0,0,'3','4'),(402,'8341','','13',0,0,'3','4'),(403,'1484、WX-40','','13',0,0,'3','4'),(404,'FOX-107','','13',0,0,'3','4'),(405,'XA-101Q','','13',0,0,'3','4'),(406,'门磁振动','','13',0,0,'3','4'),(407,'吸顶','','13',0,0,'3','4'),(408,'紧急防拆','','13',0,0,'3','4'),(409,'破碎','','13',0,0,'3','4'),(41,'BP-110','','6',0,0,'3','4'),(410,'氯气探头','','13',0,0,'3','4'),(411,'紧急（板载1）','','13',0,0,'3','4'),(412,'紧急（板载2）','','13',0,0,'3','4'),(413,'无线模块','','13',0,0,'3','4'),(414,'氯气探测器','','23',0,0,'3','4'),(415,'红外振动','','13',0,0,'3','4'),(416,'红外、门磁','','13',0,0,'3','4'),(417,'主机箱防拆','','13',0,0,'3','4'),(418,'振动、探头','','13',0,0,'3','4'),(419,'烟感/防拆','','13',0,0,'3','4'),(42,'BX100PLUS','','6',0,0,'3','4'),(420,'红外/门磁','','13',0,0,'3','4'),(421,'振动按键','','13',0,0,'3','4'),(422,'探头/烟感','','13',0,0,'3','4'),(423,'栅栏','','13',0,0,'3','4'),(424,'紧急、防拆','','13',0,0,'3','4'),(425,'温感','','13',0,0,'3','4'),(427,'红外栅栏','','13',0,0,'3','4'),(428,'烟感、振动','','13',0,0,'3','4'),(429,'加钞间西墙','','13',0,0,'3','4'),(43,'BX80N','','2',0,0,'3','4'),(430,'CM-701(6)','','13',0,0,'3','4'),(431,'CM-701(3.6)','','13',0,0,'3','4'),(432,'其它','','13',0,0,'3','4'),(433,'SP4000','','13',0,0,'3','4'),(434,'ES626','','13',0,0,'3','4'),(435,'电源','','13',0,0,'3','4'),(436,'PM2000D','','13',0,0,'3','4'),(437,'震动','','13',0,0,'3','4'),(438,'一只','','13',0,0,'3','4'),(439,'警号','','13',0,0,'3','4'),(440,'声光警号','','13',0,0,'3','4'),(441,'警号（声光','','13',0,0,'3','4'),(442,'无声按钮','','13',0,0,'3','4'),(443,'防爆射灯','','13',0,0,'3','4'),(444,'警号（电子','','13',0,0,'3','4'),(445,'电子警号','','13',0,0,'3','4'),(446,'射灯','','13',0,0,'3','4'),(447,'AlmType','','13',0,0,'3','4'),(448,'振动和探头','','13',0,0,'3','4'),(449,'拆动','','13',0,0,'3','4'),(45,'CC602','','2',0,0,'3','4'),(450,'振动器，门磁','','13',0,0,'3','4'),(451,'振动、门磁','','13',0,0,'3','4'),(452,'探头防拆','','13',0,0,'3','4'),(453,'防撬','','13',0,0,'3','4'),(454,'磁控','','13',0,0,'3','4'),(456,'柜台开关（里外）','','13',0,0,'3','4'),(457,'不详','','13',0,0,'3','4'),(458,'磁控开关','','13',0,0,'3','4'),(459,'振动，门磁','','13',0,0,'3','4'),(460,'振动磁控','ccc','13',1,66,'3','4'),(461,'防砸，防撬','','13',0,0,'3','4'),(462,'震动门磁','','13',0,0,'3','4'),(463,'开关','','13',0,0,'3','4'),(464,'紧急，防拆','','13',0,0,'3','4'),(465,'主机防拆，紧急','','13',0,0,'3','4'),(466,'厅外烟感、防拆','','13',0,0,'3','4'),(467,'一楼红外','','13',0,0,'3','4'),(468,'二楼烟感','','13',0,0,'3','4'),(469,'一楼对射','','13',0,0,'3','4'),(470,'二楼红外','','13',1,1,'3','4'),(471,'二楼对射','','13',0,0,'3','4'),(472,'三楼烟感','','13',0,0,'3','4'),(473,'三楼对射','','13',0,0,'3','4'),(474,'门磁、振动器','','13',0,0,'3','4'),(475,'烟感,红外','','13',0,0,'3','4'),(476,'探头，烟感','','13',0,0,'3','4'),(477,'紧急(防拆)','','13',0,0,'3','4'),(478,'红外、烟感','','13',0,0,'3','4'),(479,'遥控器','','13',0,0,'3','4'),(48,'CX502','','2',0,0,'3','4'),(480,'红外,烟感','','13',0,0,'3','4'),(481,'红外，振动','','13',0,0,'3','4'),(482,'防拆新','','13',0,0,'3','4'),(483,'中心拆动','','13',0,0,'3','4'),(485,'紧急.防拆','','13',0,0,'3','4'),(486,'震动，主机防拆','','13',0,0,'3','4'),(487,'按键，防拆','','13',0,0,'3','4'),(488,'键盘,防拆','','13',0,0,'3','4'),(489,'手报','','13',0,0,'3','4'),(49,'CX502AM','','2',0,0,'3','4'),(490,'振动，防拆','','13',0,0,'3','4'),(491,'墙体震动','','13',0,0,'3','4'),(492,'震动,门磁','','13',0,0,'3','4'),(493,'防火','','13',0,0,'3','4'),(494,'主机里','','13',0,0,'3','4'),(495,'南北水浸','','13',0,0,'3','4'),(496,'地上面振动','','13',0,0,'3','4'),(497,'地北面振动','','13',0,0,'3','4'),(498,'金库外库探头','','13',0,0,'3','4'),(499,'南振动','','13',0,0,'3','4'),(5,'2110ES','','1',0,0,'3','4'),(50,'CX702','','2',0,0,'3','4'),(500,'西南探头','','13',0,0,'3','4'),(502,'北墙西探头','','13',0,0,'3','4'),(503,'西振动','','13',0,0,'3','4'),(504,'西北振动','','13',0,0,'3','4'),(505,'东振动','','13',0,0,'3','4'),(506,'北东振动','','13',0,0,'3','4'),(507,'北东探头','','13',0,0,'3','4'),(508,'未知','','13',0,0,'3','4'),(509,'开关,破碎,防拆','','13',0,0,'3','4'),(51,'DT420','','13',0,0,'3','4'),(510,'破碎，防拆','','13',0,0,'3','4'),(511,'开关阀','','13',0,0,'3','4'),(512,'41','','13',0,0,'3','4'),(513,'42','','13',0,0,'3','4'),(514,'43','','13',0,0,'3','4'),(518,'950墙体震动','','13',0,0,'3','4'),(519,'主机','','13',0,0,'3','4'),(520,'防砸','','13',0,0,'3','4'),(521,'红外1，震动2','','13',0,0,'3','4'),(522,'红外，震动','','13',0,0,'3','4'),(523,'红外2,震动2','','13',0,0,'3','4'),(524,'双鉴探测器','','13',0,0,'3','4'),(525,'防砸振动探测器','','13',0,0,'3','4'),(526,'红外双鉴探测器','','13',0,0,'3','4'),(527,'摄像机','','13',0,0,'3','4'),(528,'KF85灯箱','','13',0,0,'3','4'),(529,'AP-20ND吸顶幕帘','','17',0,0,'3','4'),(53,'DT6360STC','','4',0,0,'3','4'),(530,'DG457玻璃破碎','','1',0,0,'3','4'),(531,'EC56门磁','','11',0,0,'3','4'),(532,'遥控模块','','13',0,0,'3','4'),(533,'紧急','','13',0,0,'3','4'),(534,'键盘','','13',0,0,'3','4'),(55,'DT706','','4',0,0,'3','4'),(56,'DT7225','','4',0,0,'3','4'),(58,'DT7435','','4',0,0,'3','4'),(59,'DT7450','','4',0,0,'3','4'),(6,'2412','','18',0,0,'3','4'),(60,'DT7450C','','4',0,0,'3','4'),(600,'646','','13',0,0,'3','4'),(601,'VE-817','','18',0,0,'3','4'),(602,'bbb','','13',0,0,'3','4'),(604,'DT7235T','bbbb','4',1,1,'3','4'),(605,'fff','','13',0,0,'3','4'),(606,'防拆（灯箱）','fff','13',4,4,'3','4'),(607,'灯箱(防拆)','','13',0,0,'3','4'),(608,'振动、防拆','','13',0,0,'3','4'),(609,'烟感、幕帘','','13',0,0,'3','4'),(61,'DT7550C','','4',0,0,'3','4'),(610,'烟感，按钮','','13',0,0,'3','4'),(611,'防拆、紧急','','13',0,0,'3','4'),(612,'门磁、','','13',0,0,'3','4'),(613,'红外,防撬','','13',0,0,'3','4'),(614,'防盗','','13',0,0,'3','4'),(615,'周界报警','','13',0,0,'3','4'),(616,'入侵报警','','13',0,0,'3','4'),(617,'手动报警','','13',0,0,'3','4'),(618,'ED800','','18',0,0,'3','4'),(619,'H0-01有声','','8',0,0,'3','4'),(62,'DT900','','4',0,0,'3','4'),(620,'EB27','','8',0,0,'3','4'),(621,'SWAN1000','','21',0,0,'3','4'),(622,'9370','','17',0,0,'3','4'),(623,'EC57','','11',0,0,'3','4'),(624,'SS-102','','19',0,0,'3','4'),(626,'EB27（无声）','','13',0,0,'3','4'),(627,'键盘','','13',0,0,'3','4'),(628,'ABT-250','','3',0,0,'3','4'),(629,'ABE-150','','3',0,0,'3','4'),(63,'DT906','','4',0,0,'3','4'),(630,'ABT-60','','3',0,0,'3','4'),(631,'ABT-250','','3',0,0,'3','4'),(632,'730','','19',0,0,'3','4'),(633,'PB68（无声）','','8',0,0,'3','4'),(634,'K32','','13',0,0,'3','4'),(635,'PB68（有声）','','8',0,0,'3','4'),(636,'HO-03','','11',0,0,'3','4'),(638,'VE871','','18',0,0,'3','4'),(639,'PA467','','17',0,0,'3','4'),(640,'PMD2P','','21',0,0,'3','4'),(642,'HO-01无声','','8',0,0,'3','4'),(643,'ABE-100','','3',0,0,'3','4'),(644,'EVO192','','20',0,0,'3','4'),(65,'FG1025Z','','1',0,0,'3','4'),(66,'FG1608','','1',0,0,'3','4'),(67,'FG1615T','','1',0,0,'3','4'),(68,'FG1625RT','','1',0,0,'3','4'),(69,'FG1625T','','1',0,0,'3','4'),(7,'2412THB','','18',0,0,'3','4'),(70,'FG701','','1',0,0,'3','4'),(700,'YS-85','','11',0,0,'3','4'),(701,'KF85','','13',0,0,'3','4'),(702,'DS9370探头','','17',0,0,'3','4'),(703,'SE-315','','13',0,0,'3','4'),(704,'DZ-85','','13',0,0,'3','4'),(705,'pa-525D','','21',0,0,'3','4'),(706,'GM530','','19',0,0,'3','4'),(707,'门磁模块','','11',0,0,'3','4'),(708,'DSC-3301','','21',0,0,'3','4'),(71,'FX360','','2',0,0,'3','4'),(710,'4888l','','23',0,0,'3','4'),(711,'DT-8035','','21',0,0,'3','4'),(712,'DG467','','21',0,0,'3','4'),(713,'EL1418','','21',0,0,'3','4'),(714,'PA465','','12',0,0,'3','4'),(715,'DS936','','17',0,0,'3','4'),(716,'GM730','','19',0,0,'3','4'),(717,'SRX360','','17',0,0,'3','4'),(718,'ABH100','','3',0,0,'3','4'),(719,'艾礼富三光束','','3',0,0,'3','4'),(72,'IS150T','','2',0,0,'3','4'),(720,'ABT60','','3',0,0,'3','4'),(721,'ABE250','','3',0,0,'3','4'),(722,'HS250','','3',0,0,'3','4'),(723,'MG-DZT10','','11',0,0,'3','4'),(724,'MG-DZTZ','','18',0,0,'3','4'),(725,'60米光栅','','3',0,0,'3','4'),(726,'100米光栅','','3',0,0,'3','4'),(727,'200米光栅','','3',0,0,'3','4'),(728,'DS1101I','','1',0,0,'3','4'),(73,'IS215T','','2',0,0,'3','4'),(730,'PA-TM50','','22',0,0,'3','4'),(731,'DS-19K00','','22',0,0,'3','4'),(733,'VE918','','16',0,0,'3','4'),(734,'DG85-4','','21',0,0,'3','4'),(735,'ABT-40','','3',0,0,'3','4'),(736,'DS-9370','','17',0,0,'3','4'),(737,'SWAN2000','','21',0,0,'3','4'),(738,'NS-100V','','19',0,0,'3','4'),(739,'AD-360','','21',0,0,'3','4'),(74,'IS220T','','2',0,0,'3','4'),(740,'PB-2','','8',0,0,'3','4'),(742,'ABI30-1408','','5',0,0,'3','4'),(743,'PMD85','','21',0,0,'3','4'),(744,'PMD1P','','21',0,0,'3','4'),(745,'DCT10','','11',0,0,'3','4'),(746,'DCT2','','11',0,0,'3','4'),(747,'PA-476','','21',0,0,'3','4'),(748,'CLIP-4','','12',0,0,'3','4'),(75,'IS2260T','','2',0,0,'3','4'),(750,'BEL光栅10米','','5',0,0,'3','4'),(752,'燃气探测器','','10',0,0,'3','4'),(753,'无线幕帘','','12',0,0,'3','4'),(754,'无线红外','','21',0,0,'3','4'),(755,'无线门磁','','11',0,0,'3','4'),(756,'ABP-150','','6',0,0,'3','4'),(757,'ABP-200','','6',0,0,'3','4'),(759,'GBDSH100','','3',0,0,'3','4'),(76,'LX402','','2',0,0,'3','4'),(760,'BOSCH','','21',0,0,'3','4'),(761,'理想LX8305','','21',0,0,'3','4'),(762,'SY8846 ','','27',0,0,'3','4'),(77,'LX802N','','2',0,0,'3','4'),(777,'理想SX8315','','21',0,0,'3','4'),(778,'SY8383S','','11',0,0,'3','4'),(779,'理想LX8511','','13',0,0,'3','4'),(78,'MC760T','','2',0,0,'3','4'),(780,'理想LX8801','','22',0,0,'3','4'),(79,'MX40','','4',0,0,'3','4'),(8,'2520','','1',0,0,'3','4'),(80,'MX50','','4',0,0,'3','4'),(801,'40米光栅','','5',0,0,'3','4'),(802,'15米光栅','','5',0,0,'3','4'),(81,'OD850-CHI','','4',0,0,'3','4'),(82,'RX40','','2',0,0,'3','4'),(83,'SD3','','19',0,0,'3','4'),(84,'SMB10','','13',0,0,'3','4'),(85,'SMB10C','','13',0,0,'3','4'),(86,'SMB10L','','13',0,0,'3','4'),(87,'SX360Z','','2',0,0,'3','4'),(88,'TS300','','2',0,0,'3','4'),(89,'TS300R','','2',0,0,'3','4'),(9,'470-12','','2',0,0,'3','4'),(90,'UN3','','19',0,0,'3','4'),(91,'UN3-ATM','','19',0,0,'3','4'),(92,'VH-380','','2',0,0,'3','4'),(93,'VX402','','2',0,0,'3','4'),(94,'VX402REC','','2',0,0,'3','4'),(95,'835I','','21',0,0,'3','4'),(963,'REM101','','22',0,0,'3','4'),(964,'PMD2P ','','21',0,0,'3','4'),(965,'DT467','','15',0,0,'3','4'),(966,'AL-01D有声','','22',0,0,'3','4'),(967,'AL-01D无声','','22',0,0,'3','4'),(97,'SS-102','','19',0,0,'3','4'),(977,'NV35','','21',0,0,'3','4'),(978,'SWAN2000','','21',0,0,'3','4'),(979,'C2MINI','','24',0,0,'3','4'),(980,'ED-502','','26',0,0,'3','4'),(981,'w15G','','15',0,0,'3','4'),(982,'15DT','','15',0,0,'3','4'),(983,'EC55','','11',0,0,'3','4'),(984,'DS-9370','','17',0,0,'3','4'),(985,'7228 ','','21',0,0,'3','4'),(986,'DS-1101','','1',0,0,'3','4'),(987,'Aw102zd','','25',0,0,'3','4'),(988,'ABL60','','3',0,0,'3','4'),(989,'TM-50','','22',0,0,'3','4'),(11,'7940WH','','11',0,0,'3','4'),(110,'其他','','13',0,0,'3','4'),(111,'525D','','21',0,0,'3','4'),(112,'DS820','','13',0,0,'3','4'),(113,'DS835','','13',0,0,'3','4'),(114,'DS860','','21',0,0,'3','4'),(115,'460','','13',0,0,'3','4'),(116,'477','','13',0,0,'3','4'),(117,'820','','13',0,0,'3','4'),(118,'DT-7225','','13',0,0,'3','4'),(119,'7225','','13',0,0,'3','4'),(12,'7940WH','','11',0,0,'3','4'),(120,'525','','13',0,0,'3','4'),(121,'SS102','','13',0,0,'3','4'),(122,'MX40QZ','','13',0,0,'3','4'),(123,'MX-40QZ','','15',0,0,'3','4'),(124,'865I','','13',0,0,'3','4'),(125,'防拆','','4',0,0,'3','4'),(126,'MX-40','','13',0,0,'3','4'),(127,'SS-102振荡器','','19',0,0,'3','4'),(1,'11WH','','19',0,0,'3','4'),(10,'470PB','','4',0,0,'3','4'),(100,'1484','','13',0,0,'3','4'),(101,'MICX','','13',0,0,'3','4'),(102,'860','','13',0,0,'3','4'),(103,'826 7225','','13',0,0,'3','4'),(104,'RX-40','','15',0,0,'3','4'),(105,'7225  860','','13',0,0,'3','4'),(106,'725','','13',0,0,'3','4'),(107,'DT-500','','13',0,0,'3','4'),(108,'对射','','13',0,0,'3','4'),(109,'30米对射','','3',0,0,'3','4'),(128,'MX-40','','13',0,0,'3','4'),(129,'835I,DS835I','','其他',0,0,'3','4'),(13,'943','','4',0,0,'3','4'),(130,'RX-40QZ','','15',0,0,'3','4'),(131,'835','','13',0,0,'3','4'),(200,'SWAM-1000','','13',0,0,'3','4'),(205,'1484，525D','','13',0,0,'3','4'),(216,'XR-40','','13',0,0,'3','4'),(217,'SS-102振动报警器','','19',0,0,'3','4'),(218,'525D，RX-40','','13',0,0,'3','4'),(219,'1484，7225','','13',0,0,'3','4'),(22,'ABT-80','','6',0,0,'3','4'),(220,'148，7225','','13',0,0,'3','4'),(221,'525D,1484','','13',0,0,'3','4'),(222,'RX40QZ','','13',0,0,'3','4'),(223,'DS820，461','','13',0,0,'3','4'),(224,'SD820','','13',0,0,'3','4'),(225,'WX-40','','13',0,0,'3','4'),(226,'DT-7225，RX-40','','13',0,0,'3','4'),(305,'EL-2601','','13',0,0,'3','4'),(306,'EL-2645','','21',0,0,'3','4'),(307,'按键','','13',0,0,'3','4'),(308,'EL2600','','13',0,0,'3','4'),(309,'窗磁','','13',0,0,'3','4'),(31,'AX200ALPHA','','6',0,0,'3','4'),(310,'2645','','13',0,0,'3','4'),(314,'402','','13',0,0,'3','4'),(316,'5米光栅','','13',0,0,'3','4'),(324,'EL-2650','','13',0,0,'3','4'),(333,'RQ-40','','13',0,0,'3','4'),(335,'BELIEF光栅60米','','13',0,0,'3','4'),(336,'BELIEF光栅100米','','13',0,0,'3','4'),(337,'BELIEF光栅30米','','13',0,0,'3','4'),(338,'EL-260','','13',0,0,'3','4'),(339,'E2600','','13',0,0,'3','4'),(34,'AX350MKII','','6',0,0,'3','4'),(340,'2601','','13',0,0,'3','4'),(341,'456','','13',0,0,'3','4'),(342,'SY1000','','13',0,0,'3','4'),(343,'SK-102','','13',0,0,'3','4'),(344,'DS-860','','21',0,0,'3','4'),(345,'E55','','13',0,0,'3','4'),(346,'RS-40','','13',0,0,'3','4'),(364,'40米对射','','3',0,0,'3','4'),(365,'CY1000','','13',0,0,'3','4'),(366,'834I','','13',0,0,'3','4'),(382,'DG457玻璃破碎器','','1',0,0,'3','4'),(383,'EC-57门磁','','11',0,0,'3','4'),(384,'DG475','','13',0,0,'3','4'),(385,'VF9935','','13',0,0,'3','4'),(386,'AO-20ND','','13',0,0,'3','4'),(387,'EC57','','11',0,0,'3','4'),(388,'DG457','','13',0,0,'3','4'),(389,'AP-20ND','','17',0,0,'3','4'),(390,'用户自备','','13',0,0,'3','4'),(391,'AP2-20N幕帘探头','','12',0,0,'3','4'),(426,'玻璃破碎','','13',0,0,'3','4'),(44,'CC601','','2',0,0,'3','4'),(455,'柜台开关','','13',0,0,'3','4'),(47,'CK','','6',0,0,'3','4'),(484,'紧急，主机防拆','','13',0,0,'3','4'),(501,'棚顶水浸','','13',0,0,'3','4'),(52,'DT500','','4',0,0,'3','4'),(54,'DT700','','4',0,0,'3','4'),(57,'DT7235T','','4',0,0,'3','4'),(603,'bbbbbbb','bbbb','13',1,1,'3','4'),(625,'EB27（有声）','','13',0,0,'3','4'),(641,'ABT-100','fff','3',4,4,'3','4'),(709,'VE-100HD','','21',0,0,'3','4'),(732,'EDS2000','','21',0,0,'3','4'),(749,'ABI10光栅','','5',0,0,'3','4'),(751,'BEL光栅5米','','5',0,0,'3','4'),(758,'KL8832C1','','28',0,0,'3','4'),(990,'AW102','','19',0,0,'3','4'),(0,'NVX80','','14',0,0,'3','4'),(38,'NVX80','','14',0,0,'3','4'),(-1,'未知(默认)','','-1',0,0,'-1','-1'),(1000,'紧急按键（无声）','','13',0,0,'-1','-1'),(1001,'紧急按键（有声）','','13',0,0,'-1','-1'),(1002,'红外探头 周边','','13',0,0,'-1','-1'),(1003,'无线烟感','','13',0,0,'-1','-1'),(1004,'红外（内部）','','13',0,0,'-1','-1'),(1005,'红外探头 出入','','13',0,0,'-1','-1'),(1006,'卷闸门磁','','13',0,0,'-1','-1'),(1007,'报警主机','','13',0,0,'-1','-1'),(1008,'红外探头','','13',0,0,'-1','-1'),(1009,'一键报警主机','','13',0,0,'-1','-1'),(1010,'燃气','','13',0,0,'-1','-1'),(1011,'有线烟感','','13',0,0,'-1','-1'),(1012,'50米对射','','13',0,0,'-1','-1')@

DROP TABLE IF EXISTS `imm_sntype`@

CREATE TABLE `imm_sntype` (
  `snType` int(11) NOT NULL COMMENT '探测器类型编号',
  `snTypeName` varchar(40) CHARACTER SET gbk DEFAULT NULL COMMENT '探测器类型名称',
  PRIMARY KEY (`snType`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@

insert  into `imm_sntype`(`snType`,`snTypeName`) values (1,'玻璃破碎'),(2,'单技术'),(3,'对射'),(4,'多技术'),(5,'光栅'),(6,'红外对射'),(7,'脚挑'),(8,'紧急按钮'),(9,'卷帘门磁'),(10,'煤气'),(11,'门磁'),(12,'幕帘'),(13,'其它'),(14,'室外探测器'),(15,'双鉴'),(16,'水浸'),(17,'吸顶'),(18,'烟感'),(19,'振动'),(20,'防拆'),(21,'红外'),(22,'键盘'),(23,'氯气'),(24,'摄像头'),(25,'位移'),(26,'温感'),(27,'遥控器'),(28,'语音提示器'),(-1,'未知(默认)')@

DROP TABLE IF EXISTS `imm_sub_sys_of_alarm_host`@

CREATE TABLE `imm_sub_sys_of_alarm_host` (
  `devId` varchar(20) NOT NULL COMMENT '报警主机编号',
  `subSysId` varchar(20) NOT NULL COMMENT '子系统编号',
  `subRange` varchar(255) NOT NULL COMMENT '子系统范围',
  `fMemo` varchar(255) NOT NULL COMMENT '备注',
  `dataFrom` varchar(255) DEFAULT NULL COMMENT '数据来源',
  PRIMARY KEY (`devId`,`subSysId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_syscode`@

CREATE TABLE `imm_syscode` (
  `codeId` varchar(3) NOT NULL COMMENT '系统码编号',
  `codeTypeId` int(11) DEFAULT NULL COMMENT '事件类型编号',
  `codeMemo` varchar(30) DEFAULT NULL COMMENT '系统码事件描述',
  `er_Color` varchar(100) DEFAULT NULL COMMENT '颜色',
  `er_Wave` varchar(255) DEFAULT NULL COMMENT '声音',
  `e_tail` varchar(10) DEFAULT NULL COMMENT '报警描述',
  `r_tail` varchar(10) DEFAULT NULL COMMENT '恢复描述',
  `userZone` varchar(4) DEFAULT NULL COMMENT '用户/防区（用户、防区、通道、无）',
  `deaLWay` varchar(1) DEFAULT NULL,
  `evtWay` int(11) DEFAULT NULL COMMENT '事件归类',
  `codeLevel` int(11) DEFAULT NULL COMMENT '事件级别',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`codeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_syscode`(`codeId`,`codeTypeId`,`codeMemo`,`er_Color`,`er_Wave`,`e_tail`,`r_tail`,`userZone`,`deaLWay`,`evtWay`,`codeLevel`,`dataFrom`) values ('000',0,'接收到未定义的代码','800000,1FFFFFFF,F0FBFF,F0CAA6,800000,1FFFFFFF,FFFFFF,FFFF00,',',2;,0','','恢复','无','',5,6,NULL),('100',1,'个人救护警报','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','','恢复','无','E',1,2,NULL),('101',1,'个人救护警报','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','','恢复','用户','E',1,1,NULL),('102',1,'报到失败','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\Program Files\\iVMS-A100Platform\\iVMS-A100Client\\wave\\ALARM4.WAV,0;c:\\\\\\\\mon2006\\\\\\\\wave\\\\\\\\disArm.WAV,2','','恢复','防区','',1,1,NULL),('103',1,'报警','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,FFFFFF,004080','d:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','','E',1,1,NULL),('104',1,'医疗救助报警',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('110',3,'火警警报','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','防区','E',1,1,NULL),('111',3,'烟感探头','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('112',3,'燃烧','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\Program Files\\iVMS-A100Platform\\iVMS-A100Client\\wave\\ALARM1.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('113',3,'消防水流','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('114',3,'热感探头','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('115',3,'火警手动报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','','恢复','防区','',1,1,NULL),('116',3,'空调槽烟感','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('117',3,'火焰探头','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\SIREN3.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('118',3,'接近警报','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','','恢复','防区','',1,1,NULL),('120',4,'劫盗','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('121',4,'挟持','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('122',4,'无声劫盗','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,408000,FFFFFF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('123',4,'有声劫盗','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','防区','E',1,1,NULL),('124',4,'进入允许挟持',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('125',4,'外出允许挟持',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('129',2,'一键式设备呼叫报警',NULL,NULL,'连接/断开','','无',NULL,1,1,NULL),('130',4,'窃盗','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('131',4,'周边防区','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','防区','E',1,1,NULL),('132',4,'内部防区','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('133',4,'24小时防区','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('134',4,'出/入防区','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','','恢复','防区','E',1,1,NULL),('135',4,'日/夜防区','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('136',4,'室外','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('137',4,'拆动','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\\\\\\\\\Program Files\\\\\\\\\\\\\\\\iVMS-A100Platform\\\\\\\\\\\\\\\\iVMS-A100Client\\\\\\\\\\\\\\\\wave\\\\\\\\\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','无','E',1,1,NULL),('138',4,'接近警报','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,008000,FFFFFF','C:\\Program Files\\iVMS-A100Platform\\iVMS-A100Client\\wave\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('140',2,'一般报警','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','无','E',1,1,NULL),('141',2,'总线开路','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\Program Files\\iVMS-A100Platform\\iVMS-A100Client\\wave\\ALARM1.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('142',2,'总线短路','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('143',2,'扩充器故障','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','防区','E',1,1,NULL),('144',2,'探头被拆动','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('145',2,'扩充器被拆','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\Program Files\\iVMS-A100Platform\\iVMS-A100Client\\wave\\SIREN.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('146',4,'无声窃盗',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('150',2,'24小时非窃盗报警','800000,1FFFFFFF,80FFFF,0000FF,800000,1FFFFFFF,008000,FFFFFF','c:\\\\mon2006\\\\wave\\\\SIREN.WAV,0;,0','报警','恢复','防区','',1,1,NULL),('151',2,'气体','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\\\mon2006\\\\wave\\\\disArm.WAV,0;,0','报警','恢复','无','',1,1,NULL),('152',2,'冷藏器','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('153',2,'加热系统','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('154',2,'漏水','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('155',2,'箔片破损','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('156',2,'日间防区','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('157',2,'气体水平过低','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('158',2,'温度过高','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('159',2,'温度过低','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('160',13,'子系统修正','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080',',0;,0','','','用户','E',5,1,NULL),('161',2,'空气流动','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',1,1,NULL),('162',2,'一氧化碳',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('163',6,'油箱液面',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('171',2,'紧急按钮报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','恢复','无','E',5,1,NULL),('1F0',2,'视频设备输入端报警',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('200',5,'火警监视','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','报警','恢复','防区','',5,2,NULL),('201',5,'水压过低','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,2,NULL),('202',5,'二氧化碳过低','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,2,NULL),('203',5,'阀门感应','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,2,NULL),('204',5,'水压过低','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,2,NULL),('205',5,'水泵开动','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,2,NULL),('206',5,'水泵故障','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,2,NULL),('300',6,'系统故障','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','',5,3,NULL),('301',6,'无交流','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,008000',',0;,0','','故障恢复','无','',4,3,NULL),('302',6,'系统电池电压过低','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,008000',',0;,0','','故障恢复','无','',4,3,NULL),('303',6,'RAM校验和故障','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',5,3,NULL),('304',6,'ROM校验和故障','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',5,3,NULL),('305',6,'系统重新设定','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','无','',5,3,NULL),('306',6,'主机编程被改动','800000,1FFFFFFF,FFFFFF,C080FF,800000,1FFFFFFF,FFFFFF,C080FF',',0;,0','','','无','',5,3,NULL),('307',6,'自检故障','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','无','',5,3,NULL),('308',6,'主机停机使用','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','无','',5,3,NULL),('309',6,'电池测试故障','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,008000',',0;,0','','故障恢复','无','',4,3,NULL),('30A',6,'主机复位','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','无','',5,3,NULL),('310',6,'接地故障','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',5,3,NULL),('311',6,'失去电池',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('312',6,'电源电流过大','800000,1FFFFFFF,669933,000000,800000,1FFFFFFF,669933,000000',',0;,0','','','用户','',5,0,NULL),('313',6,'工程师复位',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('320',6,'警号/继电器','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,808000',',0;,0','故障','故障恢复','无','',5,3,NULL),('321',6,'警铃 #1','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,0066FF','C:\\\\\\\\Program Files\\\\\\\\iVMS-A100Platform\\\\\\\\iVMS-A100Client\\\\\\\\wave\\\\\\\\ALARM1.WAV,0;,0','','','无','E',1,3,NULL),('322',6,'警铃 #2','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,0066FF','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','','','无','E',5,3,NULL),('323',6,'警报继电器','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','','无','',5,3,NULL),('324',6,'故障继电器','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','','无','',5,3,NULL),('325',6,'逆转继电器','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','','无','',5,3,NULL),('326',6,'报告设备#3',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('327',6,'报告设备#4',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('32A',6,'警铃保险管烧坏','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000','c:\\\\mon2006\\\\wave\\\\Get.WAV,0;,0','','恢复','无','',5,3,NULL),('330',6,'系统周边','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','','无','',5,3,NULL),('331',6,'总线开路','800000,1FFFFFFF,80000014,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','故障','恢复','防区','',5,3,NULL),('332',6,'总线短路','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','','无','',5,3,NULL),('333',6,'扩充器故障','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','无','',5,3,NULL),('334',6,'重复器故障','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','无','',5,3,NULL),('335',6,'打印机无纸','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','','无','',5,3,NULL),('336',6,'打印机故障','800000,1FFFFFFF,8000000F,0000,800000,1FFFFFFF,8000000F,0000,',',0;,0','','恢复','无','',5,3,NULL),('337',6,'扩展模块无直流',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('338',6,'扩展模块低电池',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('339',6,'扩展模块复位',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('341',6,'扩展模块防拆',NULL,NULL,'','恢复','无',NULL,5,3,NULL),('342',6,'扩展模块无交流',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('343',6,'扩展模块自测失败',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('344',6,'RF接收器阻塞',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('350',6,'通讯故障','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','D',5,3,NULL),('351',6,'电话线1故障','800000,1FFFFFFF,FFFFFF,C080FF,800000,1FFFFFFF,FFFFFF,C080FF',',0;,0','','恢复','无','',5,3,NULL),('352',6,'电话线2故障','800000,1FFFFFFF,FFFFFF,C080FF,800000,1FFFFFFF,FFFFFF,C080FF',',0;,0','','恢复','无','',5,3,NULL),('353',6,'长距离无线发射器故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('354',6,'通讯失败','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',5,3,NULL),('355',6,'失去长距无线监控','800000,FFFFFF,8000000F,0000,800000,FFFFFF,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('356',6,'失去长距无线中央监控','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('357',6,'无线发射器VSWR',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('360',6,'英特GSM信号弱',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('361',6,'英特SIM卡故障',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('362',6,'英特GSM通信失败',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('363',6,'英特GSM模块故障',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('364',6,'英特GPRS网络连接失败',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('365',6,'英特GPRS传输失败',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('366',6,'英特GPRS模块故障',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('367',6,'TCP/IP网络连接失败',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('368',6,'TCP/IP网络传输失败',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('369',6,'英特网络模块故障',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('370',6,'保护回路','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('371',6,'保护回路开路','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('372',6,'保护回路短路','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('373',6,'火警回路故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('374',2,'退出错误',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('375',1,'电话线被剪断',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('376',6,'保持防区',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('37A',6,'回路故障','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','','恢复','防区','4',5,3,NULL),('380',6,'感应器故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('381',6,'无线监控故障','800000,1FFFFFFF,FFFFFF,0066FF,800000,1FFFFFFF,FFFFFF,00CCFF',',0;,0','','恢复','防区','',5,3,NULL),('382',6,'总线监控故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','4',5,3,NULL),('383',6,'感应器被拆','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','报警','恢复','防区','4',5,3,NULL),('384',6,'无线感应器电池过低','800000,1FFFFFFF,FFFFFF,669933,800000,1FFFFFFF,FFFFFF,669933',',0;,0','','恢复','防区','',5,3,NULL),('385',6,'高度烟感','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,008000','c:\\mon2006\\wave\\Get.WAV,0;,0','','恢复','用户','',5,3,NULL),('386',6,'低毒烟感',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('387',6,'高度干扰',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('388',6,'低度干扰',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('389',6,'探头自检失败',NULL,NULL,'','','无',NULL,5,3,NULL),('391',6,'探头查看失败',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('392',6,'Drift Comp.错误',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('393',6,'维护报警',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3A0',6,'请求服务','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3A1',6,'设置时间','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3A2',6,'5(12)伏电源故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3A3',6,'电话故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','无','4',5,3,NULL),('3A4',6,'卡故障','800000,FFFFFF,8000000F,0000,800000,FFFFFF,8000000F,0000',',0;,0','','恢复','无','4',5,3,NULL),('3A5',6,'失去电池','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3A6',6,'进入编程模式','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3A7',6,'未知故障','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3A8',6,'无效报告','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','4',5,3,NULL),('3B0',6,'网络连接建立','800000,1FFFFFFF,,,800000,1FFFFFFF,FFFFFF,FFFF00',',0;,0','','恢复','用户','',5,0,NULL),('3B1',6,'网络连接正常断开','800000,1FFFFFFF,FFFFFF,CCFFCC,800000,1FFFFFFF,,',',0;,0','','','用户','',5,0,NULL),('3B2',6,'网络连接异常断开','800000,1FFFFFFF,FFFFFF,99CCFF,800000,1FFFFFFF,,',',0;,0','','','用户','',5,0,NULL),('3B3',6,'主机与网络模块连接断','800000,1FFFFFFF,FFFFFF,99CCFF,800000,1FFFFFFF,,',',0;,0','','','用户','',5,0,NULL),('3B4',6,'网络模块使用主机安装',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3B5',6,'GPRS网络故障',NULL,NULL,' ','恢复','',NULL,4,0,NULL),('3B6',6,'有线网络故障',NULL,NULL,' ','恢复','',NULL,4,0,NULL),('3C0',13,'看门狗复位',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C1',13,'主机关闭',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C2',13,'主机开启',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C3',13,'探头正常',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C4',13,'探头短路',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C5',13,'探头断路',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C6',13,'网络模块复位',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C7',13,'网络模块故障',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('3C8',13,'网络模块测试',NULL,NULL,NULL,NULL,NULL,NULL,5,3,NULL),('400',7,'撤布防','800000,1FFFFFFF,FFFFFF,C08000,800000,1FFFFFFF,FFFFFF,4080FF',',0;,0','撤防','恢复','用户','',2,4,NULL),('401',7,'用户','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','撤防','布防','用户','',2,4,NULL),('402',7,'集体','800000,1FFFFFFF,FFFFFF,FF8000,800000,1FFFFFFF,FFFFFF,4080FF',',0;,0','撤防','恢复','用户','',2,4,NULL),('403',7,'自动','800000,1FFFFFFF,FFFFFF,FF0000,800000,1FFFFFFF,FFFFFF,FF00,',',0;,0','撤防','恢复','用户','',2,4,NULL),('404',7,'过迟','800000,1FFFFFFF,00000F,000000,800000,1FFFFFFF,00000F,000000',',0;,0','撤防','恢复','用户','',2,4,NULL),('405',7,'不适用','800000,1FFFFFFF,00000F,000000,800000,1FFFFFFF,00000F,000000',',0;,0','撤防','恢复','用户','',2,4,NULL),('406',7,'取消','800000,1FFFFFFF,FFFFFF,00CC99,800000,1FFFFFFF,FFFFFF,00CCFF',',0;,0','撤防','恢复','用户','',2,4,NULL),('407',7,'遥控','800000,1FFFFFFF,FFFFFF,FF8000,800000,1FFFFFFF,FFFFFF,80FF,',',0;,0','撤防','恢复','用户','',2,4,NULL),('408',7,'快速','800000,1FFFFFFF,FFFFFF,FF8000,800000,1FFFFFFF,FFFFFF,80FF,',',0;,0','撤防','布防','用户','',2,4,NULL),('409',7,'开关锁','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','撤防','恢复','用户','',2,4,NULL),('40A',7,'部分','800000,1FFFFFFF,FFFFFF,FF8000,800000,1FFFFFFF,FFFFFF,80FF,',',0;,0','撤防','恢复','用户','',2,4,NULL),('40B',7,'周边','800000,1FFFFFFF,FFFFFF,FF8000,800000,1FFFFFFF,FFFFFF,4080FF,',',0;,0','撤防','恢复','用户','',2,4,NULL),('411',8,'要求回电','800000,1FFFFFFF,8000000F,0000,800000,1FFFFFFF,8000000F,0000,',',0;,0','','','无','',5,4,NULL),('412',8,'遥控编程成功','800000,1FFFFFFF,FFFFFF,669933,800000,1FFFFFFF,FF0000,FFFFFF',',0;,0','','','无','',5,4,NULL),('413',8,'遥控不成功','FF0000,FFFFFF,8000000F,0000,FF0000,FFFFFF,8000000F,0000',',0;,0','','','无','',5,4,NULL),('414',8,'关闭系统','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,4,NULL),('415',8,'关闭通讯','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,4,NULL),('416',13,'成功上载',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('421',9,'拒绝出入-用户','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,4,NULL),('422',9,'成功出入-用户','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,4,NULL),('423',9,'强迫出入',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('424',9,'拒绝外出',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('425',9,'允许外出',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('426',9,'门保持打开',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('427',9,'出入点DSM故障',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('428',9,'出入点RTE故障',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('429',9,'进入门禁编程模式',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('430',9,'退出门禁编程模式',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('431',9,'门禁处理级别改变',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('432',9,'门禁继电器开关故障','5',NULL,NULL,NULL,NULL,NULL,5,4,NULL),('433',9,'门禁RTE关闭',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('434',9,'门禁DSM关闭',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('441',7,'留守','800000,1FFFFFFF,FFFFFF,808000,800000,1FFFFFFF,FFFFFF,0066FF',',0;,0','留守布防','恢复','用户','',2,4,NULL),('442',7,'钥匙开关留守',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('450',9,'非正常时段撤/布防','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,00000F,000000',',0;,0','','','无','E',1,4,NULL),('451',9,'过早撤/布防','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,4,NULL),('452',9,'过迟撤/布防','800000,1FFFFFFF,FFFFFF,FFFF00,800000,1FFFFFFF,FFFFFF,00FF00',',0;,0','','','无','',5,4,NULL),('453',9,'撤防失败','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','用户','',5,4,NULL),('454',9,'布防失败','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','用户','',5,4,NULL),('455',9,'自动布防失败','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','用户','',5,4,NULL),('456',7,'部分布防','800000,1FFFFFFF,FFFFFF,669933,800000,1FFFFFFF,FFFFFF,00CC99',',0;,0','','恢复','用户','',2,4,NULL),('457',7,'外出错误','800000,1FFFFFFF,C0C0C0,808000,800000,1FFFFFFF,C0C0C0,808000',',0;,0','','恢复','用户','',2,4,NULL),('458',7,'操作员在现场','800000,1FFFFFFF,FFFFFF,808000,800000,1FFFFFFF,FFFFFF,808000',',0;,0','','恢复','用户','',2,4,NULL),('459',7,'最近布防','800000,1FFFFFFF,FFFFFF,FF8000,800000,1FFFFFFF,FFFFFF,0080FF',',0;,0','','恢复','用户','',2,4,NULL),('461',9,'错误密码进入',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('462',9,'正确密码进入',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('463',13,'报警后重布防',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('464',13,'防区未准备好1',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('465',13,'紧急报警复位',NULL,NULL,NULL,NULL,NULL,NULL,5,4,NULL),('501',10,'门禁读卡器停用',NULL,NULL,'','','无',NULL,5,5,NULL),('520',10,'停用警号/继电器','800000,1FFFFFFF,8000000F,0000,800000,1FFFFFFF,8000000F,0000,',',0;,0','','','无','',5,5,NULL),('521',10,'警铃 1 停用','800000,1FFFFFFF,FFFFFF,00CCFF,800000,1FFFFFFF,FFFFFF,99CCFF',',0;,0','','','无','',5,5,NULL),('522',10,'警铃 2 停用','800000,1FFFFFFF,FFFFFF,99CCFF,800000,1FFFFFFF,FFFFFF,99CCFF',',0;,0','','','无','',5,5,NULL),('523',10,'停用警报继电器','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,5,NULL),('524',10,'停用故障继电器','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,5,NULL),('525',10,'逆反继电器','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,5,NULL),('526',10,'报告设备#3',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('527',10,'报告设备#4',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('530',10,'停用系统周边','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,5,NULL),('531',5,'增加模块',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('532',5,'删除模块',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('540',10,'停用系统周边','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','',5,5,NULL),('551',10,'通讯器停用','800000,1FFFFFFF,FFFFFF,00000F,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',5,5,NULL),('552',6,'无线发射器停用','800000,1FFFFFFF,FFFFFF,00000F,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',4,5,NULL),('553',10,'禁用遥控编程',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('570',11,'防区旁路','800000,1FFFFFFF,0000FF,000000,800000,1FFFFFFF,FFFFFF,FF00FF',',0;,0','','','防区','E',1,5,NULL),('571',11,'火警旁路','800000,1FFFFFFF,0000FF,000000,800000,1FFFFFFF,00000F,000000',',0;,0','','恢复','防区','E',2,5,NULL),('572',11,'24小时防区旁路','800000,1FFFFFFF,0000FF,000000,800000,1FFFFFFF,FF0000,000000',',0;,0','','','防区','E',2,5,NULL),('573',11,'窃盗旁路','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,FF00FF,',',0;,0','','恢复','防区','',2,5,NULL),('574',11,'集体旁路','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','恢复','防区','',2,5,NULL),('575',11,'交换旁路','800000,1FFFFFFF,0000FF,000000,800000,1FFFFFFF,00000F,000000',',0;,0','','恢复','防区','E',1,0,NULL),('576',9,'门禁防区关闭',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('577',9,'门禁点旁路',NULL,NULL,NULL,NULL,NULL,NULL,5,5,NULL),('600',12,'错误代码',NULL,NULL,NULL,NULL,NULL,NULL,5,1,NULL),('601',12,'手动测试','800000,1FFFFFFF,FFFFFF,808000,800000,1FFFFFFF,FFFFFF,808000,',',0;,0','','恢复','无','',5,6,NULL),('602',12,'定期测试','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','无','',5,6,NULL),('603',12,'定期无线发射器测试','800000,1FFFFFFF,FFFFFF,808000,800000,1FFFFFFF,00000F,000000',',0;,0','','恢复','无','',5,6,NULL),('604',12,'火警测试','800000,FFFFFF,FFFFFF,0000,800000,FFFFFF,FFFFFF,0000',',0;,0','','','无','3',5,6,NULL),('605',12,'状态报告','800000,1FFFFFFF,FFFFFF,FFFFFF,800000,1FFFFFFF,800000,FFFFFF',',0;,0','','','无','',5,6,NULL),('606',12,'监听','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','3',5,6,NULL),('607',12,'步行测试模式','800000,1FFFFFFF,000000,00000F,800000,1FFFFFFF,00000F,000000',',0;,0','','','无','',5,6,NULL),('608',12,'系统故障保持',NULL,NULL,'','恢复','无',NULL,5,6,NULL),('609',12,'图象传输','800000,1FFFFFFF,000000,00000F,800000,1FFFFFFF,00000F,000000',',0;,0','','','无','',5,6,NULL),('611',12,'点测试正常','颜色','声音','','','无',NULL,5,0,NULL),('612',12,'点未测试',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('613',12,'侵入防区步行测试',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('614',12,'火警防区步行测试',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('615',12,'紧急防区步行测试',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('616',6,'请求系统维护',NULL,NULL,NULL,NULL,NULL,NULL,5,6,NULL),('621',6,'事件日志复位','800000,1FFFFFFF,FFFFFF,CC99FF,800000,1FFFFFFF,FFFFFF,00FF00',',0;,0','','恢复','无','',5,0,NULL),('622',6,'事件日志满50%','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,00FF00',',0;,0','','恢复','无','',5,0,NULL),('623',6,'事件日志满90%','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,00FF00',',0;,0','','恢复','无','',5,0,NULL),('624',6,'事件日志溢出','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,00FF00',',0;,0','','恢复','无','',5,0,NULL),('625',6,'时间/日期复位','800000,1FFFFFFF,FFFFFF,404080,800000,1FFFFFFF,FFFFFF,404080,',',0;,0','','恢复','无','0',5,0,NULL),('626',6,'时间/日期错误','800000,1FFFFFFF,FFFFFF,4080FF,800000,1FFFFFFF,FFFFFF,4080FF,',',0;,0','','恢复','无','4',5,0,NULL),('627',12,'进入编程','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000080','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','','','用户','E',1,0,NULL),('628',12,'退出编程','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000080','C:\\\\Program Files\\\\iVMS-A100Platform\\\\iVMS-A100Client\\\\wave\\\\ALARM1.WAV,0;,0','','','用户','E',1,0,NULL),('630',12,'改动时间表','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','3',5,6,NULL),('631',12,'改动例外时间表','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','3',5,6,NULL),('632',12,'改动出入时间表','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','无','3',5,6,NULL),('633',14,'取消','800000,FFFFFF,8000000A,0000,800000,FFFFFF,FF00000F,0000',',0;,0','','','用户','',5,0,NULL),('641',13,'24小时内防区无触发','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,FFFFFF,400080,',',0;,0','','恢复','无','3',5,6,NULL),('687',14,'频繁通信报警',NULL,NULL,'','','无',NULL,4,0,NULL),('688',14,'遗漏布防',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('689',14,'遗漏撤防',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('690',14,'主机报告电话号码改变',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('691',14,'多次通信失败',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('692',14,'传输错误',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('693',14,'推迟布防',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('694',14,'推迟撤防',NULL,NULL,NULL,NULL,NULL,NULL,5,0,NULL),('695',14,'提早布防','800000,1FFFFFFF,000000,FFFFFF,800000,1FFFFFFF,FFFFFF,400080','C:\\\\Program Files\\\\iVMS-A100ClientSetup\\\\iVMS-A100Client\\\\wave\\\\2.WAV,0;,0','','恢复','用户','E',5,0,NULL),('696',14,'未及时布防','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,FFFFFF,400080,',',0;,0','','恢复','无','',5,0,NULL),('697',14,'提早撤防','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,FFFFFF,400080,',',0;,0','布防','恢复','无','',5,0,NULL),('698',14,'未及时撤防','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,FFFFFF,400080,',',0;,0','撤防','恢复','无','',5,0,NULL),('699',14,'超过测试间隔信号','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,FFFFFF,400080,',',0;,0','','恢复','无','5',3,0,NULL),('69A',15,'未按时','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,C0C0C0,400040,',',0;,0','巡检','','无','',5,0,NULL),('69B',15,'欠费提醒','800000,1FFFFFFF,FFFFFF,400080,800000,1FFFFFFF,8000000F,0000,',',0;,0','缴费','','无','',5,0,NULL),('69C',15,'超时完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','','用户','',5,0,NULL),('69D',2,'手动处警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,0066FF','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,6,NULL),('69E',15,'未按时','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','','用户','',5,6,NULL),('69F',15,'布防提前完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,,008080',',0;,0','','','用户','',5,6,NULL),('6A0',15,'按时完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','','用户','',5,6,NULL),('6A1',15,'布防超时完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','','用户','',5,6,NULL),('6A2',15,'未按时','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','','用户','',5,6,NULL),('6A3',15,'撤防提前完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','','用户','',5,6,NULL),('6A4',15,'按时完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','接收','用户','',5,6,NULL),('6A5',15,'撤防超时完成','800000,1FFFFFFF,FFFFFF,008080,800000,1FFFFFFF,FFFFFF,008080',',0;,0','','接收','用户','',5,6,NULL),('6B1',15,'新增用户','800000,FF000000,FFFFFF,8080,800000,FF000000,FFFFFF,A00000',',0;,0','发送','接收','无','6',5,0,NULL),('6B2',15,'更新用户','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FFFFFF,A00000,',',0;,0','发送','接收','无','6',5,0,NULL),('6B3',15,'删除用户','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FFFFFF,A00000,',',0;,0','发送','接收','无','6',5,0,NULL),('6B4',15,'下载用户','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FF00000F,0000,',',0;,0','发送','接收','无','6',5,0,NULL),('6B5',15,'巡检停机','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FF00000F,0000,',',0;,0','发送','接收','无','6',5,0,NULL),('6B6',15,'巡检完毕','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FF00000F,0000,',',0;,0','发送','接收','无','6',5,0,NULL),('6BA',15,'防区图','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FFFFFF,A00000,',',0;,0','发送','不同意','无','6',5,0,NULL),('6C1',15,'处警转发','800000,1FFFFFFF,FFFFFF,8080,800000,1FFFFFFF,FFFFFF,FF0080,',',0;,0','发送','接收','无','6',5,0,NULL),('6C2',15,'处警批复','800000,1FFFFFFF,FF00000F,40FF00,800000,1FFFFFFF,FF00000F,8000FF,',',0;,0','同意','接收','无','6',5,0,NULL),('6D1',15,'维修转发','800000,1FFFFFFF,FFFFFF,8080,800000,1FFFFFFF,FFFFFF,FF0080,',',0;,0','发送','完成','无','6',5,0,NULL),('6E1',15,'缴费提醒','800000,1FFFFFFF,FF00000F,0000,800000,1FFFFFFF,FF00000F,0000,',',0;,0','发送','完成','无','6',5,0,NULL),('6E2',15,'用户转发','800000,1FFFFFFF,FFFFFF,80FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\SIREN3.WAV,0;,0','失败','完成','无','6',5,0,NULL),('6E3',15,'处警转发','800000,1FFFFFFF,FFFFFF,80FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\SIREN.WAV,0;,0','失败','完成','无','6',5,0,NULL),('6E4',15,'维修转发','800000,1FFFFFFF,FFFFFF,80FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\SERVER.WAV,0;,0','失败','完成','无','6',5,0,NULL),('6E5',15,'事件转发','800000,1FFFFFFF,FFFFFF,80FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\SERVER.WAV,0;,0','失败','恢复','无','6',5,0,NULL),('6E6',15,'地图转发','800000,1FFFFFFF,FFFFFF,80FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\SERVER.WAV,0;,0','失败','','无','6',5,0,NULL),('701',6,'无线模块防区报警','800000,1FFFFFFF,0000FF,FFFFFF,800000,1FFFFFFF,008000,FFFFFF','C:\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\Program Files\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\iVMS-A100Platform\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\iVMS-A100Client\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\wave\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ALARM1.WAV,0;,0','报警','恢复','防区','E',5,1,NULL),('702',0,'无线模块复位','800000,1FFFFFFF,FFFFFF,8080FF,800000,1FFFFFFF,FFFFFF,FF00,',',0;,0','','充值成功','无','D',5,0,NULL),('703',6,'无线模块测试','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\disArm.WAV,0;,0','','恢复','无','',5,0,NULL),('704',2,'充值卡','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\disArm.WAV,0;,0','欠费报警','恢复','无','D',5,0,NULL),('705',13,'充值卡欠费预警报告','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,0000,','c:\\mon2006\\wave\\SIREN.WAV,0;,0','','恢复','无','D',5,0,NULL),('706',0,'无线交流电断电','800000,1FFFFFFF,FFFFFF,808000,800000,1FFFFFFF,FFFFFF,808000',',0;,0','断电','恢复','无','D',5,0,NULL),('707',6,'无线模块电池电压低','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000000',',0;,0','低','恢复','无','D',5,0,NULL),('708',0,'有线电话线断开','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\SIREN.WAV,0;,0','断线','恢复','无','D',5,0,NULL),('710',6,'无线模块交流电断电','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,008000',',0;,0','','','无','D',5,0,NULL),('711',6,'无线模块交流电恢复','800000,1FFFFFFF,FFFFFF,008000,800000,1FFFFFFF,FFFFFF,008000',',0;,0','','恢复','无','D',5,0,NULL),('712',6,'无线模块电池电压低','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,008000',',0;,0','','','无','D',5,0,NULL),('713',6,'有线电话断线','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,8000,','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','无','',5,0,NULL),('714',6,'有线电话线恢复','800000,1FFFFFFF,FFFFFF,8000,800000,1FFFFFFF,FFFFFF,8000,',',0;,0','','','无','',5,0,NULL),('715',6,'数据线断线','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,8000,',',0;,0','','','无','R',5,0,NULL),('716',6,'数据线恢复','800000,1FFFFFFF,FFFFFF,8000,800000,1FFFFFFF,FFFFFF,8000,',',0;,0','','','无','',5,0,NULL),('717',2,'双线断线报警','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,8000,',',0;,0','','','无','',5,0,NULL),('718',6,'报警主机通讯失败','800000,1FFFFFFF,FFFFFF,00FF,800000,1FFFFFFF,FFFFFF,8000,',',0;,0','','','无','',5,0,NULL),('719',6,'报警主机通讯失败恢复','800000,1FFFFFFF,FFFFFF,8000,800000,1FFFFFFF,FFFFFF,8000,',',0;,0','','','无','',5,0,NULL),('720',2,'开关量报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399',',0;,0','','','防区','E',5,7,NULL),('723',2,'信号量报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399',',0;,0','','','防区','E',5,7,NULL),('724',6,'信号丢失','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','E',5,7,NULL),('725',6,'硬盘未格式化','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','防区','E',5,7,NULL),('726',6,'读写硬盘出错','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','E',5,7,NULL),('727',2,'非法访问','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,7,NULL),('728',6,'视频信号异常','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','E',5,7,NULL),('729',6,'录像异常','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','E',5,7,NULL),('730',13,'智能场景变化','800000,1FFFFFFF,FFFFFF,00FF00,800000,1FFFFFFF,FFFFFF,00FF00',',0;,0','','','防区','',5,7,NULL),('731',6,'阵列异常','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','E',5,7,NULL),('732',6,'前端/录像分辨率不匹配','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','E',5,7,NULL),('733',2,'报警输入','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('734',2,'红外人体检测','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('735',2,'门禁报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('736',2,'呼救','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('737',0,'超速报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('738',2,' 声音分贝超标','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,000080','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('800',13,'报警取消','800000,1FFFFFFF,C0C0C0,0000,800000,1FFFFFFF,C0C0C0,0000,',',0;,0','','','无','',5,0,NULL),('801',13,'防区还原','800000,1FFFFFFF,FFFFFF,0080,800000,1FFFFFFF,FFFFFF,0080,',',0;,0','','','防区','',1,0,NULL),('802',16,'进入编程','800000,1FFFFFFF,FF0000,0000,800000,1FFFFFFF,FF0000,0000,',',0;,0','','恢复','无','',5,0,NULL),('803',16,'结束编程','800000,1FFFFFFF,FF0000,0000,800000,1FFFFFFF,FF0000,0000,',',0;,0','','','无','',5,0,NULL),('804',6,'网络模块数据线断线','800000,1FFFFFFF,C0C0C0,0000,800000,1FFFFFFF,C0C0C0,0000,',',0;,0','','','无','',5,0,NULL),('805',13,'网络通讯失败','800000,1FFFFFFF,C0C0C0,0000,800000,1FFFFFFF,C0C0C0,0000,',',0;,0','','恢复','无','',5,0,NULL),('806',6,'网络模块测试','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('807',6,'有线电话线通讯失败','800000,1FFFFFFF,C0C0C0,0000,800000,1FFFFFFF,C0C0C0,0000,',',0;,0','','','无','',5,0,NULL),('808',6,'看门狗复位','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('809',6,'防区开路','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('810',2,'软防区A报警','800000,1FFFFFFF,00FF,0000,800000,1FFFFFFF,00FF,0000,',',0;,0','','','无','',1,0,NULL),('811',2,'软防区B报警','800000,1FFFFFFF,00FF,0000,800000,1FFFFFFF,00FF,0000,',',0;,0','','','无','',5,0,NULL),('812',2,'软防区C报警','800000,1FFFFFFF,00FF,0000,800000,1FFFFFFF,00FF,0000,',',0;,0','','','无','',5,0,NULL),('813',13,'主机关闭','800000,1FFFFFFF,FF0000,0000,800000,1FFFFFFF,FF0000,0000,',',0;,0','','','无','',5,0,NULL),('814',13,'主机开启','800000,1FFFFFFF,FF0000,0000,800000,1FFFFFFF,FF0000,0000,',',0;,0','','','无','',5,0,NULL),('815',6,'网络模块复位','800000,1FFFFFFF,C0C0C0,0000,800000,1FFFFFFF,C0C0C0,0000,',',0;,0','','','无','',5,0,NULL),('816',13,'通讯模块电话线','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('817',13,'通讯模块交流','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('818',13,'通讯模块电池电压低','800000,1FFFFFFF,408000,000000,800000,1FFFFFFF,408000,000000',',0;,0','','','无','',5,0,NULL),('819',13,'通讯模块充值提示','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('81A',13,'通讯模块测试报告','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('81B',13,'通讯模块防区报警','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('820',13,'自动','800000,1FFFFFFF,008000,000000,800000,1FFFFFFF,008000,000000',',0;,0','','','无','',5,8,NULL),('821',13,'部分','800000,1FFFFFFF,008000,000000,800000,1FFFFFFF,008000,000000',',0;,0','','','无','',5,0,NULL),('822',9,'用户布防失败','8000000F,0000,8000000F,0000,8000000F,0000,8000000F,0000',',0;,0','','','用户','',5,4,NULL),('823',13,'无线按钮','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','防区','',5,0,NULL),('825',13,'系统关闭','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('826',13,'测试模式','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('828',13,'系统恢复','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('829',16,'事件记录清除','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('830',16,'编程模式','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('831',16,'编程改变','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('832',16,'时钟设定','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('833',0,'时钟错误','800000,1FFFFFFF,000080,FF00FF,800000,1FFFFFFF,000080,008000',',0;,0','','','用户','',5,0,NULL),('835',13,'未测试','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('837',16,'用户密码添加','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('838',16,'用户密码删除','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('839',16,'用户密码改变','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','用户','',5,0,NULL),('840',13,'通信','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('842',13,'限制使用','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('843',0,'堆栈崩溃','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','布防','无','',5,0,NULL),('845',2,'辅助防区报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','恢复','防区','E',5,0,NULL),('850',7,'MX设备','800000,1FFFFFFF,FF0000,0000,800000,1FFFFFFF,FF0000,0000,',',0;,0','撤防','恢复','无','',5,4,NULL),('851',2,'MX设备1防区报警','800000,1FFFFFFF,00FF,0000,800000,1FFFFFFF,00FF,0000,',',0;,0','','恢复','无','D',5,1,NULL),('852',2,'MX设备2防区报警','800000,1FFFFFFF,00FF,0000,800000,1FFFFFFF,00FF,0000,',',0;,0','','','无','D',5,1,NULL),('853',2,'MX设备3防区报警','800000,1FFFFFFF,00FF,0000,800000,1FFFFFFF,00FF,0000,',',0;,0','','','无','D',5,1,NULL),('854',13,'火警故障','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('855',6,'火警防区故障','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','防区','E',5,0,NULL),('856',6,'盗警防区故障','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','防区','E',5,0,NULL),('857',3,'键盘火警报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('858',2,'键盘紧急报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('859',2,'键盘求助报警','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('860',2,'胁持码操作','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','恢复','用户','E',5,0,NULL),('861',2,'未授权进入','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','恢复','防区','E',5,0,NULL),('870',13,'数据写入主程序工作异常','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','恢复','无','',5,0,NULL),('880',13,'前置机主程序工作异常','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','恢复','无','',5,0,NULL),('881',13,'前置机输入端口一工作异常','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','恢复','无','',5,0,NULL),('882',13,'前置机输入端口二工作异常','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','恢复','无','',5,0,NULL),('883',13,'前置机输入端口三工作异常','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('884',13,'前置机输入端口工作异常','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('888',13,'短信报告','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('889',13,'短信发送','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','连接','无','',5,0,NULL),('899',13,'查询黑名单','800000,1FFFFFFF,C0C0C0,0000,800000,1FFFFFFF,C0C0C0,0000,',',0;,0','','连接','无','',5,0,NULL),('901',13,'前置机程序模块','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','断开','连接','无','',5,0,NULL),('902',13,'数据库写入程序模块','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','断开','','无','',5,0,NULL),('903',13,'管理终端程序模块','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','断开','','无','',5,0,NULL),('910',6,'键盘掉线','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','','无','',5,0,NULL),('920',6,'无线网络故障','800000,1FFFFFFF,FFFFFF,FF00FF,800000,1FFFFFFF,FFFFFF,669933',',0;,0','','','无','',5,0,NULL),('921',6,'SIM卡故障','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','无','',5,0,NULL),('930',6,'IP冲突','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,333333',',0;,0','','','无','',5,0,NULL),('931',6,'网线断开','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','恢复','无','',5,0,NULL),('932',6,'上传方式组间中心通讯失败','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','防区','',5,0,NULL),('933',6,'上传方式通道中心通讯失败','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','无','',5,0,NULL),('940',2,'移动侦测开始/结束','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;disArm.wav,0','','','防区','E',5,0,NULL),('941',2,'遮挡报警开始/结束','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;,0','','','防区','E',5,0,NULL),('942',2,'视频丢失开始/结束','800000,1FFFFFFF,FFFFFF,0000FF,800000,1FFFFFFF,FFFFFF,003399','c:\\mon2006\\wave\\disArm.WAV,0;disArm.wav,0','','','防区','E',5,0,NULL),('943',6,'输入/输出视频制式不匹配','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000','disArm.wav,0;disArm.wav,0','','','防区','E',5,0,NULL),('944',6,'视频输入异常/恢复正常','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','防区','E',5,0,NULL),('945',13,'硬盘满/恢复正常','800000,1FFFFFFF,FFFFFF,003399,800000,1FFFFFFF,FFFFFF,003399',',0;,0','硬盘满','','防区','',5,0,NULL),('946',6,'硬盘错/恢复正常','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','防区','E',5,0,NULL),('947',13,'图片上传失败','800000,1FFFFFFF,FFFFFF,8080FF,800000,1FFFFFFF,FFFFFF,FF00,',',0;,0','','','无','D',5,0,NULL),('960',13,'值守查岗','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('961',13,'值守应答','800000,1FFFFFFF,408000,0000,800000,1FFFFFFF,408000,0000,',',0;,0','','','无','',5,0,NULL),('970',13,'总线搜索','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('971',13,'总线注册','800000,1FFFFFFF,003399,000000,800000,1FFFFFFF,003399,000000',',0;,0','','','无','',5,0,NULL),('972',13,'自动布撤防延时操作','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','','无','',5,0,NULL),('995',6,'视频连接断开',NULL,NULL,'设备离线','','',NULL,4,1,NULL),('996',13,'视频连接成功',NULL,NULL,'设备上线','','',NULL,4,1,NULL),('997',6,'网络模块掉线','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','恢复','用户','',5,0,NULL),('998',6,'网络模块用户上线','800000,1FFFFFFF,C0C0C0,000000,800000,1FFFFFFF,C0C0C0,000000',',0;,0','','恢复','无','',5,0,NULL),('999',1,'电话通知未布防','800000,1FFFFFFF,FFFFFF,000000,800000,1FFFFFFF,FFFFFF,000000',',0;,0','','恢复','无','',5,0,NULL),('9FF',0,'异常提醒','800000,1FFFFFFF,FFFFFF,0000,800000,1FFFFFFF,FFFFFF,0000,',',0;,0','系统保留','恢复','无','',5,0,NULL),('F22',2,'人工报警',NULL,NULL,'','恢复','无',NULL,1,0,NULL),('F23',6,'人工故障',NULL,NULL,'','恢复','无',NULL,4,0,NULL),('FFF',0,'事件描述','颜色','声音','报警描述','恢复描述','通道',NULL,1,0,NULL)@

DROP TABLE IF EXISTS `imm_syscode_copy`@

DROP TABLE IF EXISTS `imm_syscodesy`@

CREATE TABLE `imm_syscodesy` (
  `codeId` varchar(3) NOT NULL COMMENT '系统码编号',
  `codeLevel` int(11) DEFAULT NULL COMMENT '事件级别',
  PRIMARY KEY (`codeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_syscodesy`(`codeId`,`codeLevel`) values ('000',6),('100',1),('101',1),('102',1),('103',1),('104',1),('110',1),('111',1),('112',1),('113',1),('114',1),('115',1),('116',1),('117',1),('118',1),('120',1),('121',1),('122',1),('123',1),('124',1),('125',1),('130',1),('131',1),('132',1),('133',1),('134',1),('135',1),('136',1),('137',1),('138',1),('140',1),('141',1),('142',1),('143',1),('144',1),('145',1),('146',1),('150',1),('151',1),('152',1),('153',1),('154',1),('155',1),('156',1),('157',1),('158',1),('159',1),('161',1),('162',1),('163',3),('1F0',1),('200',2),('201',2),('202',2),('203',2),('204',2),('205',2),('206',2),('300',3),('301',3),('302',3),('303',3),('304',3),('305',3),('306',3),('307',3),('308',3),('309',3),('30A',3),('310',3),('311',3),('312',3),('313',3),('320',3),('321',3),('322',3),('323',3),('324',3),('325',3),('326',3),('327',3),('32A',3),('330',3),('331',3),('332',3),('333',3),('334',3),('335',3),('336',3),('337',3),('338',3),('339',3),('341',3),('342',3),('343',3),('344',3),('350',3),('351',3),('352',3),('353',3),('354',3),('355',3),('356',3),('357',3),('360',6),('361',6),('362',6),('363',6),('364',6),('365',6),('366',6),('367',6),('368',6),('369',6),('370',3),('371',3),('372',3),('373',3),('374',1),('375',1),('376',3),('37A',3),('380',3),('381',3),('382',3),('383',3),('384',3),('385',3),('386',3),('387',3),('388',3),('389',3),('391',3),('392',3),('393',3),('3A0',3),('3A1',3),('3A2',3),('3A3',3),('3A4',3),('3A5',3),('3A6',3),('3A7',3),('3A8',3),('3B0',3),('3B1',3),('3B2',3),('3B3',3),('3B4',3),('3B5',6),('3B6',6),('3C0',3),('3C1',3),('3C2',3),('3C3',3),('3C4',3),('3C5',3),('3C6',3),('3C7',3),('3C8',3),('400',4),('401',4),('402',4),('403',4),('404',4),('405',4),('406',4),('407',4),('408',4),('409',4),('40A',4),('40B',4),('411',4),('412',4),('413',4),('414',4),('415',4),('416',4),('421',4),('422',4),('423',4),('424',4),('425',4),('426',4),('427',4),('428',4),('429',4),('430',4),('431',4),('432',4),('433',4),('434',4),('441',4),('442',4),('450',4),('451',4),('452',4),('453',4),('454',4),('455',4),('456',4),('457',4),('458',4),('459',4),('461',4),('462',4),('463',4),('464',4),('465',4),('501',5),('520',5),('521',5),('522',5),('523',5),('524',5),('525',5),('526',5),('527',5),('530',5),('531',5),('532',5),('540',5),('551',5),('552',5),('553',5),('570',5),('571',5),('572',5),('573',5),('574',5),('575',5),('576',5),('577',5),('600',1),('601',6),('602',6),('603',6),('604',6),('605',6),('606',6),('607',6),('608',6),('609',6),('611',6),('612',6),('613',6),('614',6),('615',6),('616',6),('621',6),('622',6),('623',6),('624',6),('625',6),('626',6),('627',4),('628',4),('630',6),('631',6),('632',6),('641',6),('687',0),('688',0),('689',0),('690',0),('691',0),('692',0),('693',0),('694',0),('695',0),('696',0),('697',0),('698',0),('699',0),('701',6),('702',6),('703',6),('706',6),('707',6),('708',6),('710',0),('810',1),('815',6),('931',6),('997',6),('998',1),('999',1)@

DROP TABLE IF EXISTS `imm_syslog`@

CREATE TABLE `imm_syslog` (
  `logId` varchar(28) CHARACTER SET gbk NOT NULL COMMENT '日志编号',
  `evtDatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '记录发生时间',
  `logMemo` varchar(4000) CHARACTER SET gbk DEFAULT NULL COMMENT '日志描述',
  `userName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员名称',
  `userId` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '操作员编号',
  PRIMARY KEY (`logId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_systemconfig`@

CREATE TABLE `imm_systemconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dataName` varchar(50) DEFAULT NULL,
  `dataValue` varchar(50) DEFAULT NULL,
  `isUse` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_tergroup`@

CREATE TABLE `imm_tergroup` (
  `terGroupId` int(11) NOT NULL COMMENT '车载设备分组ID',
  `terGroupName` varchar(50) DEFAULT NULL COMMENT '车载设备分组名称',
  PRIMARY KEY (`terGroupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_tergroup`(`terGroupId`,`terGroupName`) values (1,'车队1')@

DROP TABLE IF EXISTS `imm_tertype`@

CREATE TABLE `imm_tertype` (
  `terTypeId` int(11) NOT NULL COMMENT '终端类型id',
  `terTypeName` varchar(16) DEFAULT NULL COMMENT '终端类型名称',
  PRIMARY KEY (`terTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_tertype`(`terTypeId`,`terTypeName`) values (61023,'LH-20'),(61025,'LD-OBD'),(61027,'部标JT808'),(61028,'LD-802'),(61029,'通用')@

DROP TABLE IF EXISTS `imm_tgpscarattr`@

CREATE TABLE `imm_tgpscarattr` (
  `devId` varchar(12) NOT NULL COMMENT '设备编号',
  `ter_id` int(11) DEFAULT NULL COMMENT '终端类型',
  `sim` varchar(16) DEFAULT NULL COMMENT 'SIM卡号',
  `channelNum` int(11) DEFAULT NULL COMMENT '通道个数（4、8、16下拉选择）',
  `terGroupId` int(11) DEFAULT NULL COMMENT '车辆分组（下拉选择）',
  `plateColorId` int(11) DEFAULT NULL COMMENT '车牌颜色（下拉选择字典）',
  `carno` varchar(100) DEFAULT NULL COMMENT '车牌号码',
  `pinpai` varchar(64) DEFAULT NULL COMMENT '车辆品牌',
  `color` varchar(10) DEFAULT NULL COMMENT '车辆颜色',
  `carType` varchar(64) DEFAULT NULL COMMENT '车辆类型',
  `stime` varchar(19) DEFAULT NULL COMMENT '服务开始日',
  `etime` varchar(19) DEFAULT NULL COMMENT '服务结束日',
  `loadNum` int(11) DEFAULT NULL COMMENT '核定载人数',
  `czxm` varchar(32) DEFAULT NULL COMMENT '司机名称',
  `tel` varchar(32) DEFAULT NULL COMMENT '司机电话',
  `updatetime` varchar(19) DEFAULT NULL COMMENT '更新时间',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`devId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_usercont`@

CREATE TABLE `imm_usercont` (
  `userId` varchar(9) CHARACTER SET gbk NOT NULL COMMENT '用户编号',
  `contId` varchar(4) CHARACTER SET gbk NOT NULL COMMENT '联系人编号',
  `cName` varchar(28) CHARACTER SET gbk DEFAULT NULL COMMENT '联系人姓名',
  `cphone1` varchar(78) CHARACTER SET gbk DEFAULT NULL COMMENT '联系人电话1',
  `cphone2` varchar(28) CHARACTER SET gbk DEFAULT NULL COMMENT '联系人电话2',
  `hmPhone` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '联系人家庭电话',
  `hdPhone` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '联系人手机电话',
  `contPwd` varchar(30) CHARACTER SET gbk DEFAULT NULL COMMENT '口令',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`,`contId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_userinfo`@

CREATE TABLE `imm_userinfo` (
  `userId` varchar(9) CHARACTER SET gbk NOT NULL COMMENT '用户编号',
  `userAccount` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '用户账号',
  `userPwd` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '用户密码',
  `userPWDhint` varchar(16) CHARACTER SET gbk DEFAULT NULL COMMENT '密码提示',
  `areaId` varchar(18) CHARACTER SET gbk DEFAULT NULL COMMENT '区域编号',
  `roleId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '角色编号',
  `userName` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '用户名称',
  `userType` int(11) DEFAULT NULL COMMENT '用户类型',
  `centerId` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '所属分中心编号',
  `createDate` varchar(10) CHARACTER SET gbk DEFAULT NULL COMMENT '创建日期',
  `fMemo` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '备注',
  `syncTime` varchar(19) DEFAULT NULL COMMENT '同步时间',
  `updatetime` varchar(19) CHARACTER SET gbk DEFAULT NULL COMMENT '更新时间',
  `define1` int(11) DEFAULT NULL COMMENT '预留字段',
  `define2` int(11) DEFAULT NULL COMMENT '预留字段',
  `define3` int(11) DEFAULT NULL COMMENT '预留字段',
  `define4` int(11) DEFAULT NULL COMMENT '预留字段',
  `define5` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define6` varchar(255) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define7` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define8` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define9` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define10` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define11` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define12` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define13` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define14` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `define15` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '预留字段',
  `dataFrom` varchar(255) DEFAULT NULL,
  `platformId` varchar(20) DEFAULT NULL COMMENT '所属平台ID',
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_userplanevent`@

CREATE TABLE `imm_userplanevent` (
  `userId` varchar(9) NOT NULL COMMENT '用户编号',
  `starDateTime` varchar(19) DEFAULT NULL COMMENT '任务开始时间',
  `overDateTime` varchar(19) DEFAULT NULL COMMENT '任务结束时间',
  `noRptChecksymbol` int(11) DEFAULT NULL COMMENT '是否无报告检查启用（0：否；1：是）',
  `noRptCheckHour` int(11) DEFAULT NULL COMMENT '检查小时数',
  `lastNoRptCheckDateTime` varchar(19) DEFAULT NULL COMMENT '上次执行时间（无报警检查）',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_userservertype`@

CREATE TABLE `imm_userservertype` (
  `userServerType` int(11) NOT NULL COMMENT '用户服务类型（A100中的用户类型，报警主机、视频报警主机、DVR等等）',
  `userServerTypeName` varchar(32) DEFAULT NULL COMMENT '用户服务类型名称',
  PRIMARY KEY (`userServerType`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_wantdo`@

CREATE TABLE `imm_wantdo` (
  `wantDo` int(11) NOT NULL COMMENT '反应类型编号',
  `wantDoName` varchar(32) CHARACTER SET gbk DEFAULT NULL COMMENT '反应类型名称',
  PRIMARY KEY (`wantDo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

insert  into `imm_wantdo`(`wantDo`,`wantDoName`) values (-1,' 未知(默认)'),(1,'24小时报警'),(2,'电话线防剪'),(3,'即时'),(4,'瞬时报警'),(5,'延时报'),(6,'延时报警'),(7,'延时报警10秒'),(8,'延时报警15秒'),(9,'延时报警20秒'),(10,'延时报警25秒'),(11,'延时报警30秒'),(12,'延时报警60秒'),(13,'反应类型')@

DROP TABLE IF EXISTS `imm_wirenvrattr`@

CREATE TABLE `imm_wirenvrattr` (
  `devId` varchar(12) NOT NULL COMMENT '设备编号',
  `devIp` varchar(15) DEFAULT NULL COMMENT '设备IP',
  `devPort` int(11) DEFAULT NULL COMMENT '设备端口',
  `devLoginName` varchar(32) DEFAULT NULL COMMENT '设备登录用户名',
  `devLoginPwd` varchar(32) DEFAULT NULL COMMENT '设备登录密码',
  `videoServer` varchar(15) DEFAULT NULL COMMENT '流转服务（IP(15)）',
  `dataFrom` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`devId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `imm_workstation_info`@

CREATE TABLE `imm_workstation_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stationNum` varchar(50) NOT NULL COMMENT '工作站编号',
  `stationName` varchar(50) NOT NULL COMMENT '工作站名称',
  `stationHost` varchar(20) NOT NULL COMMENT '工作站IP',
  `stationPort` int(11) NOT NULL COMMENT '工作站端口',
  `sysCode` text COMMENT '事件订阅系统码',
  `fMemo` varchar(255) DEFAULT NULL COMMENT '备注',
  `updateAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=848395844 DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `mcs_bypass_status`@

CREATE TABLE `mcs_bypass_status` (
  `userId` varchar(9) NOT NULL COMMENT '用户编号',
  `userZoneId` varchar(4) NOT NULL COMMENT '用户防区编号',
  `bypassSyscode` varchar(4) DEFAULT NULL COMMENT '布撤防系统码',
  `bypassTime` varchar(19) DEFAULT NULL COMMENT '旁路时间',
  `updateTime` varchar(19) DEFAULT NULL COMMENT '记录更新时间',
  PRIMARY KEY (`userId`,`userZoneId`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk@

DROP TABLE IF EXISTS `mcs_customer_status`@

CREATE TABLE `mcs_customer_status` (
  `devId` varchar(9) NOT NULL COMMENT '??id',
  `userId` varchar(9) DEFAULT NULL COMMENT '??id',
  `isAlarm` int(1) DEFAULT NULL COMMENT '????',
  `alarmSyscode` varchar(4) DEFAULT NULL COMMENT '????',
  `alarmTime` varchar(19) DEFAULT NULL COMMENT '??????',
  `isBF` int(1) DEFAULT NULL COMMENT '????',
  `bcfSyscode` varchar(4) DEFAULT NULL COMMENT '?????',
  `bcfTime` varchar(19) DEFAULT NULL COMMENT '?????',
  `isBYpass` int(4) DEFAULT NULL COMMENT '??',
  `isTimeout` int(1) DEFAULT NULL COMMENT '????',
  `timeoutTime` varchar(19) DEFAULT NULL COMMENT '????',
  `isActivation` int(1) DEFAULT NULL COMMENT '????',
  `updateTime` varchar(19) DEFAULT NULL COMMENT '????',
  PRIMARY KEY (`devId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `mcs_devstatus`@

CREATE TABLE `mcs_devstatus` (
  `devId` varchar(9) NOT NULL COMMENT '???id',
  `subSysId` varchar(9) NOT NULL COMMENT '????Id',
  `ownId` varchar(9) DEFAULT NULL COMMENT '??????',
  `isBF` int(1) DEFAULT NULL COMMENT '????',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '????',
  UNIQUE KEY `idx_mcs_devstatus` (`devId`,`subSysId`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `mcs_group`@

CREATE TABLE `mcs_group` (
  `groupId` varchar(32) NOT NULL COMMENT '分组编号',
  `groupName` varchar(32) DEFAULT NULL COMMENT '分组名称',
  `areaId` varchar(18) DEFAULT NULL COMMENT '区域编号',
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

DROP TABLE IF EXISTS `mcs_group_user`@

CREATE TABLE `mcs_group_user` (
  `groupId` varchar(32) NOT NULL COMMENT '分组编号',
  `userId` varchar(32) NOT NULL COMMENT '用户编号',
  PRIMARY KEY (`groupId`,`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8@

