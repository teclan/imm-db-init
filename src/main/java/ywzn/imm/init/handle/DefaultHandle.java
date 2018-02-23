package ywzn.imm.init.handle;

import java.io.File;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.typesafe.config.Config;
import com.typesafe.config.ConfigFactory;

import ywzn.imm.init.mysql.MysqlDatabase;
import ywzn.imm.init.utils.FileUtils;

/**
 * 初始化数据库
 * 
 * @author dev
 *
 */
public class DefaultHandle implements handle {
	private static final Logger LOGGER = LoggerFactory.getLogger(DefaultHandle.class);

	private static String PLATFORMID;
	private static String HOST;
	private static String AREANAME;
	private static String ROLEID;
	private static String USERID;
	private static String USERACCOUNT;

	static {
		// 加载配置文件
		File file = new File("config/application.conf");
		Config root = ConfigFactory.parseFile(file).getConfig("config");

		PLATFORMID = root.getString("platformId");
		HOST = root.getString("host");
		AREANAME = root.getString("areaName");
		ROLEID = root.getString("roleId");
		USERID = root.getString("userId");
		USERACCOUNT = root.getString("userAccount");
	}

	public void handle() {

		MysqlDatabase.openDatabase();

		File file = new File("sql/imm_init.sql");

		String[] querys = FileUtils.getContent(file, "UTF-8").split("@");

		try {

			for (String query : querys) {
				LOGGER.info("正在执行:{}", query);
				MysqlDatabase.getDb().exec(query);
			}
			LOGGER.info("{} 执行完毕", "imm_init.sql");

			file = new File("sql/view.sql");

			querys = FileUtils.getContent(file, "UTF-8").split(";");

			for (String query : querys) {
				LOGGER.info("正在执行:{}", query);
				MysqlDatabase.getDb().exec(query);

			}
			LOGGER.info("{} 执行完毕", "view.sql");

			file = new File("sql/trigger.sql");
			querys = FileUtils.getContent(file, "UTF-8").split("#");

			for (String query : querys) {
				LOGGER.info("正在执行:{}", query);
				MysqlDatabase.getDb().exec(query);

			}
			LOGGER.info("{} 执行完毕", "trigger.sql");

			LOGGER.info("正在配置平台ID...");
			String query = "insert into `imm_assemble_cfg` (`id`, `platform_id`, `platform_name`, `platform_host`, `platform_type`, `memo`, `dataFrom`) values(?,?,'本平台',?,'本平台','本平台',?)";
			MysqlDatabase.getDb().exec(query, PLATFORMID, PLATFORMID, HOST, PLATFORMID);

			LOGGER.info("正在创建区域根节点...");
			query = "insert into `imm_area` (`areaId`, `areaName`, `parentAreaId`, `fMemo`, `areaType`, `parents`, `dataFrom`, `platformId`) values(?,?,'',?,NULL,?,?,?)";
			MysqlDatabase.getDb().exec(query, PLATFORMID, AREANAME, PLATFORMID, PLATFORMID, PLATFORMID, PLATFORMID);

			LOGGER.info("正在默认角色...");
			query = "insert into `imm_roleinfo` (`roleId`, `roleType`, `roleName`,`updatetime`, `dataFrom`, `platformId`, `default_accept_syscodes`) values(?,'1','默认角色','2018-01-19',?,?,'100,101,102,103,110,111,112,113,114,115,116,117,118,120,121,122,123,130,131,132,133,134,135,136,137,138,140,141,142,143,144,145,147,150,151,152,153,155,156,157,158,159,161,450,570,575,627,628,995,F22,400,401,402,403,404,405,406,407,408,409,40A,40B,441,456,457,458,459,571,572,573,574,F21,699,301,302,309,321,3B5,3B6,552,F23,000,104,124,125,146,160,162,163,171,1F0,200,201,202,203,204,205,206,300,303,304,305,306,307,308,30A,310,311,312,313,320,322,323,324,325,326,327,32A,330,331,332,333,334,335,336,337,338,339,341,342,343,344,350,351,352,353,354,355,356,357,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,37A,380,381,382,383,384,385,386,387,388,389,391,392,393,3A0,3A1,3A2,3A3,3A4,3A5,3A6,3A7,3A8,3B0,3B1,3B2,3B3,3B4,3C0,3C1,3C2,3C3,3C4,3C5,3C6,3C7,3C8,411,412,413,414,415,416,421,422,423,424,425,426,427,428,429,430,431,432,433,434,442,451,452,453,454,455,461,462,463,464,465,501,520,521,522,523,524,525,526,527,530,531,532,540,551,553,576,577,600,601,602,603,604,605,606,607,608,609,612,613,614,615,616,621,622,623,624,625,626,630,631,632,633,641,687,688,689,690,691,692,693,694,695,696,697,698,69A,69B,69C,69D,69E,69F,6A0,6A1,6A2,6A3,6A4,6A5,6B1,6B2,6B3,6B4,6B5,6B6,6BA,6C1,6C2,6D1,6E1,6E2,6E3,6E4,6E5,6E6,701,702,703,704,705,706,707,708,710,711,712,713,714,715,716,717,718,719,720,723,724,725,726,727,728,729,730,731,732,733,734,735,736,737,738,800,801,802,803,804,805,806,807,808,809,810,811,812,813,814,815,816,817,818,819,81A,81B,820,821,822,823,825,826,828,829,830,831,832,833,835,837,838,839,840,842,843,845,850,851,852,853,854,855,856,857,858,859,860,861,870,880,881,882,883,884,888,889,899,901,902,903,910,920,921,930,931,932,933,940,941,942,943,944,945,946,947,960,961,970,971,972,997,998')";
			MysqlDatabase.getDb().exec(query, ROLEID, PLATFORMID, PLATFORMID);

			LOGGER.info("正在默认应用权限...");
			String[] apps = new String[] { "RDAcenter", "IntegratedMM", "PublicSafetyManagement",
					"PublicSafetyManagement", "compositeOperation", "commandPlatform_shared", "commandPlatform_shared",
					"scityvehiclegate", "snowBrightWJ", "Sys_GPSMonitor" };
			query = "insert into `imm_roleapp` (`roleId`, `applicationId`, `dataFrom`) values(?,?,?)";
			for (String app : apps) {
				MysqlDatabase.getDb().exec(query, ROLEID, app, PLATFORMID);
			}

			LOGGER.info("正在默认默认模块权限...");
			String[] moduleIds = new String[] { "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "RDAall",
					"RDAall" };
			query = "insert into `imm_rolemodule` (`roleId`, `moduleId`, `dataFrom`) values(?,?,?)";
			for (String moduleId : moduleIds) {
				MysqlDatabase.getDb().exec(query, ROLEID, moduleId, PLATFORMID);
			}

			LOGGER.info("正在创建数据区域权限...");
			query = "insert into `imm_rolearea` (`roleId`, `areaId`, `is_data_node`, `is_handle_node`, `real_time_handel`, `real_time_browse`, `browse_handle_data_only`, `MEMO`, `dataFrom`) values(?,?,'1','0','0','0','0',NULL,?)";
			MysqlDatabase.getDb().exec(query, ROLEID, PLATFORMID, PLATFORMID);

			LOGGER.info("正在创建默认登录用户({})...", USERACCOUNT);
			query = "INSERT INTO imm_userinfo (userId,userAccount,userPwd,roleId,dataFrom,platformId) VALUES(?,?,'123456',?,?,?)";
			MysqlDatabase.getDb().exec(query, USERID, USERACCOUNT, ROLEID, PLATFORMID, PLATFORMID);
			query = "INSERT INTO imm_operatorattr (userId,acctType,overDateTime,sex,office,operName,operTime,dataFrom) VALUES (?,2,'2037-12-28',0,'组员',?,'2018-01-19',?);";
			MysqlDatabase.getDb().exec(query, USERID, USERID, PLATFORMID);

			LOGGER.info("\n\n数据库初始化完成...\n\n");

		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);

		} finally {
			MysqlDatabase.closeDatabase();
		}
	}
}
