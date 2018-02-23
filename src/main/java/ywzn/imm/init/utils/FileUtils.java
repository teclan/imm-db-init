package ywzn.imm.init.utils;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.RandomAccessFile;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.MessageDigest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FileUtils {
	private static final Logger LOGGER = LoggerFactory.getLogger(FileUtils.class);

	private static final int DEFAULT_READ_LENGTH = 100 * 1024 * 1024;




	/**
	 * @author Teclan
	 * 
	 *         获取文件编码
	 * @param filePath
	 * @return
	 * @throws Exception
	 */
	@SuppressWarnings("resource")
	public static String getCoding(String filePath) throws Exception {
		File file = new File(filePath);
		if (!file.isFile() || !file.exists()) {
			return "unkonw";
		}
		BufferedInputStream bis = new BufferedInputStream(new FileInputStream(filePath));
		int p = (bis.read() << 8) + bis.read();
		String code = null;
		switch (p) {
		case 0xefbb:
			code = "UTF-8";
			break;
		case 0xfffe:
			code = "Unicode";
			break;
		case 0xfeff:
			code = "UTF-16BE";
			break;
		default:
			code = "GBK";
		}
		return code;
	}

	/**
	 * @author Teclan 读取文件内容
	 * @param file
	 *            文件对象
	 * @return 二进制
	 */
	public static byte[] getContentByBytes(File file) {
		try {
			return Files.readAllBytes(Paths.get(file.getAbsolutePath()));
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * @author Teclan 读取文件内容
	 * @param path
	 *            文件路径
	 * @return 二进制
	 */
	public static byte[] getContentByBytes(String path) {
		try {
			return Files.readAllBytes(Paths.get(path));
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
		}
		return null;
	}

	/**
	 * @author Teclan 读取文本文件内容
	 * @param file
	 *            文件对象
	 * @return 文本内容(字符串形式)
	 */
	public static String getContent(File file) {
		StringBuilder content = new StringBuilder();
		try {
			String encoding = FileUtils.getCoding(file.getAbsolutePath()).toUpperCase();

			if (encoding.contains("GBK")) {
				encoding = "GBK";
			} else {
				encoding = "UTF-8";
			}

			if (file.isFile() && file.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String line = null;
				while ((line = bufferedReader.readLine()) != null) {
					content.append(line);
				}
				read.close();
			} else {
				LOGGER.error("找不到指定的文件:{}", file.getAbsolutePath());
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			return null;
		}
		return content.toString();
	}

	public static String getContent(File file, String encoding) {
		StringBuilder content = new StringBuilder();
		try {

			if (file.isFile() && file.exists()) { // 判断文件是否存在
				InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);// 考虑到编码格式
				BufferedReader bufferedReader = new BufferedReader(read);
				String line = null;
				while ((line = bufferedReader.readLine()) != null) {
					content.append(line);
				}
				read.close();
			} else {
				LOGGER.error("找不到指定的文件:{}", file.getAbsolutePath());
			}
		} catch (Exception e) {
			LOGGER.error(e.getMessage(), e);
			return null;
		}
		return content.toString();
	}

	/**
	 * @author Teclan 向文件追加内容，如果文件不存在，创建文件
	 * @param fileName
	 *            文件路径
	 * @param content
	 *            文件内容
	 * 
	 */
	public static void randomWrite2File(String fileName, String content) {
		RandomAccessFile randomFile = null;
		try {
			creatIfNeed(fileName);
			randomFile = new RandomAccessFile(fileName, "rw");
			long fileLength = randomFile.length();
			randomFile.seek(fileLength);
			randomFile.writeBytes(content);
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
		} finally {
			try {
				if (randomFile != null) {
					randomFile.close();
				}
			} catch (IOException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
	}

	/**
	 * @author Teclan 向文件追加内容，如果文件不存在，创建文件
	 * @param fileName
	 *            文件路径
	 * @param content
	 *            文件内容
	 */
	public static void randomWrite2File(String fileName, byte[] content) {
		RandomAccessFile randomFile = null;
		try {
			creatIfNeed(fileName);
			randomFile = new RandomAccessFile(fileName, "rw");
			long fileLength = randomFile.length();
			randomFile.seek(fileLength);
			randomFile.write(content, 0, content.length);
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
		} finally {
			try {
				if (randomFile != null) {
					randomFile.close();
				}
			} catch (IOException e) {
				LOGGER.error(e.getMessage(), e);
			}
		}
	}

	/**
	 * @author Teclan 向文件追加内容，如果文件不存在，创建文件
	 * @param fileName
	 *            文件路径
	 * @param content
	 *            文件内容
	 */
	public static void write2File(String fileName, String content) {
		FileWriter writer = null;
		try {
			creatIfNeed(fileName);
			writer = new FileWriter(fileName, true);
			writer.write(content);
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
		} finally {
			try {
				if (writer != null) {
					writer.close();
				}
			} catch (IOException e) {
				LOGGER.error(e.getMessage(), e);
			}

		}
	}


	public static void creatIfNeed(String fileName) {
		try {
			File parentFile = new File(fileName).getParentFile();
			if (parentFile != null) {
				parentFile.mkdirs();
			}
			new File(fileName).createNewFile();
		} catch (IOException e) {
			LOGGER.error(e.getMessage(), e);
		}
	}

	/**
	 * @author Teclan 删除文件，如果是目录，则删除整个目录
	 * @param file
	 */
	public static void deleteFiles(File file) {
		if (!file.exists()) {
			LOGGER.warn("\nthe file {} is not exists!", file.getAbsolutePath());
		}
		if (file.isDirectory()) {
			File[] files = file.listFiles();
			for (int i = 0; i < files.length; i++) {
				deleteFiles(files[i]);
			}
		}
		file.delete();
	}

	/**
	 * @author Teclan 删除文件，如果是目录，则删除整个目录
	 * @param filePath
	 */
	public static void deleteFiles(String filePath) {
		File file = new File(filePath);
		deleteFiles(file);
	}

	/**
	 * @author Teclan 获取文件后缀
	 * @param file
	 */
	public static String getExtension(File file) {
		String fileName = file.getName();
		int dotIndex = fileName.lastIndexOf(".");
		if (dotIndex == -1) {
			LOGGER.warn("this name of file({}) doesn't with a extension", file.getAbsolutePath());
			return "unknown file";
		}
		return fileName.substring(dotIndex + 1);
	}





	/**
	 * 获取文件摘要
	 * 
	 * @param file
	 * @param algorithm
	 *            MD5,SHA-1,SHA-256
	 * @return
	 */
	public static String getFileSummary(File file, String algorithm) {
		if (!file.isFile()) {
			return null;
		}
		MessageDigest digest = null;
		FileInputStream in = null;
		byte buffer[] = new byte[1024];
		int len;
		try {
			digest = MessageDigest.getInstance(algorithm);
			in = new FileInputStream(file);
			while ((len = in.read(buffer, 0, 1024)) != -1) {
				digest.update(buffer, 0, len);
			}
			in.close();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		BigInteger bigInt = new BigInteger(1, digest.digest());
		return bigInt.toString(16);
	}



	public static boolean copyFile(File src, File des) throws Exception {
		if (src.exists()) {
			try {
				new File(des.getParent()).mkdirs();

				FileInputStream fis = new FileInputStream(src);
				FileOutputStream fos = new FileOutputStream(des);

				int read = 0;
				int hasRead = 0;

				byte[] content = new byte[(int) (src.length() - hasRead > DEFAULT_READ_LENGTH ? DEFAULT_READ_LENGTH
						: (src.length() - hasRead))];

				while ((read = fis.read(content)) != -1) {
					fos.write(content);
					fos.flush();
					hasRead += read;

					if (hasRead == src.length()) {
						break;
					}
					content = new byte[(int) (src.length() - hasRead > DEFAULT_READ_LENGTH ? DEFAULT_READ_LENGTH
							: (src.length() - hasRead))];
				}
				fos.close();
				fis.close();
				return true;
			} catch (Exception e) {
				LOGGER.error(e.getMessage(), e);
				throw e;
			}
		} else {
			LOGGER.warn("File is not exists ! {}", src.getAbsolutePath());
		}
		return false;
	}

}
