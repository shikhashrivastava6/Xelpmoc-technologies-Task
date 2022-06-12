package com.tech.xelpcom.entities;
import java.sql.Timestamp;
public class User {
	
	           private int Id;
	           private String Fname;
	           private String Lname;
	           private String Email;
	           private String Gender;
	           private String Password;
		       private Timestamp DateTime;
		       
		       public User(int Id,String Fname,String Lname,String Email,String Gender,String Password,Timestamp DateTime) {
				
		    	   this.Id = Id;
		    	   this.Fname =Fname;
		    	   this.Lname=Lname;
		    	   this.Email=Email;
		    	   this.Gender=Gender;
		    	   this.Password=Password;
		    	   this.DateTime=DateTime;
			}
		       public User(String Fname,String Lname,String Email,String Gender,String Password) {
			
		    	   this.Fname =Fname;
		    	   this.Lname=Lname;
		    	   this.Email=Email;
		    	   this.Gender=Gender;
		    	   this.Password=Password;
			}
		   	public User() {
			
			}
		   	//getter and setter
		   
	        public int getId() {
				return Id;
			}	   	
		   	public void setId(int id) {
				Id = id;
			}
		      
		   	public String getFname() {
				return Fname;
			}
		   	public void setFname(String fname) {
				Fname = fname;
			}
		   	
		   	public String getLname() {
				return Lname;
			}
		   	public void setLname(String lname) {
				Lname = lname;
			}
		   	
		   	public String getEmail() {
				return Email;
			}
		   	public void setEmail(String email) {
				Email = email;
			}
		   	
		   	public String getGender() {
				return Gender;
			}
		   	public void setGender(String gender) {
				Gender = gender;
			}
		   	
		   	public String getPassword() {
				return Password;
			}
		   	public void setPassword(String password) {
				Password = password;
			}
		   	
		   	public Timestamp getDateTime() {
				return DateTime;
			}
		   	public void setDateTime(Timestamp dateTime) {
				DateTime = dateTime;
			}
		   	
	}
