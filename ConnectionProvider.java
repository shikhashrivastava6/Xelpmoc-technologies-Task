package com.tech.xelpcom.helper;
import java.sql.*;

	public class ConnectionProvider {
	 
		 private static Connection con;
		 public static Connection getConnection() {
			 try {
				if(con==null) {
				 //Driver class loaded
				 Class.forName("com.mysql.jdbc.Driver");
				 System.out.println("Driver laoded");
				 //Create a Connection
				 con = DriverManager.getConnection("jdbc:mysql://localhost:33066/techblogt","root","shikha2036");
				 System.out.println("Connection Created");
				}
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
			 
			return con;
			 
		 }

}
