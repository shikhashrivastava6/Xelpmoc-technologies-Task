package com.tech.xelpcom.dao;
import java.sql.*;

import com.tech.xelpcom.entities.User;

public class UserDao {

	private Connection con;
	
	 public UserDao(Connection con) {
	     this.con=con;
	     
	}
	 public boolean saveUser(User user) {
		 boolean f=false;
		 try {
			
			 //User-->DataBase
			 String query = "insert into signup(Fname,Lname,Email,Gender,Password) values(?,?,?,?,?)";
			 PreparedStatement pstm = this.con.prepareStatement(query);
			pstm.setString(1, user.getFname());
			pstm.setString(2, user.getLname());
			pstm.setString(3, user.getEmail());
			pstm.setString(4, user.getGender());
			pstm.setString(5, user.getPassword());
		
			
			pstm.executeUpdate();
			 f=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
     }
	 
	 
	 //---------------------------------------------
	 // get UserEmail and UserPassword by User
	 
	 public User getUserByEmailAndPassword(String Email,String Password) {
		 
		 User user=null;
		 try {
			
			 String query = "select * from signup where Email =? and Password=?";
			 PreparedStatement pstmt = con.prepareStatement(query);
			 pstmt.setString(1, Email);
			 pstmt.setString(2, Password);
			 
			 ResultSet set=pstmt.executeQuery();
			 if(set.next()) {
				 user = new User();
				 //data from db
				 String Fname = set.getString("Fname");
				 //set to user object
				 user.setFname(Fname);
				 
				 user.setId(set.getInt("Id"));
				 user.setLname(set.getString("Lname"));
				 user.setEmail(set.getString("Email"));
				 user.setGender(set.getString("Gender"));
				 user.setDateTime(set.getTimestamp("rdate"));
				 
			 }
			 
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
		 return user;
	 }
	 
	 
	 public boolean updateUser(User user) {
		
		   boolean f=false;
		 
		 try {
			
			 String query = "update signup set Fname=?, Lname=?, Email=?, Gender=? where  Id=?";
			 PreparedStatement p = con.prepareStatement(query);
			 p.setString(1, user.getFname());
			 p.setString(2, user.getLname());
			 p.setString(3, user.getEmail());
			 p.setString(4, user.getGender());
			 p.setInt(6, user.getId());
			 
			 p.executeUpdate();
			 
			 f=true;
			 
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		 return f;
	 }
}
