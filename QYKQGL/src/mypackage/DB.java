package mypackage;

import java.sql.*;

public class DB {

	private String driverStr = "com.mysql.jdbc.Driver";

	private String connStr = "jdbc:mysql://localhost:3306/kaoqin";
	
	private String dbusername="root";
	
	private String dbpassword="123456";
	
	private Connection conn = null;

	private Statement stmt = null;

	public DB() 
	{
		try {
			Class.forName(driverStr);
			conn = DriverManager.getConnection(connStr, dbusername, dbpassword);
			stmt = conn.createStatement();
		} 
		catch (Exception ex) {System.out.println("�޷�ͬ���ݿ⽨�����ӣ� ");}
	}

	// ִ��SQL��ѯ���
	public ResultSet executeQuery(String s) 
	{
		ResultSet rs = null;
		try {rs = stmt.executeQuery(s);} 
		catch (Exception ex) {System.out.println("ִ�в�ѯ���� ");}
		return rs;
	}

	// ִ��SQL�������
	public int executeUpdate(String s) 
	{
		int result = 0;
		try {result = stmt.executeUpdate(s);} 
		catch (Exception ex) {System.out.println("ִ�и��´���");}
		return result;
	}

	// �ر����ݿ�����
	public void close() {
		try {
			if (stmt != null) {
				stmt.close();
				stmt = null;
			}
			if (conn != null) {
				conn.close();
			}
		}
		catch (Exception ex) {System.out.println("ִ�йر����ݿ����ʧ�ܣ�");}
	}
}
