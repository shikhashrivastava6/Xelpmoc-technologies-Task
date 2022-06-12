package com.tech.xelpcom.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.tech.xelpcom.dao.UserDao;
import com.tech.xelpcom.entities.User;
import com.tech.xelpcom.helper.ConnectionProvider;

@MultipartConfig
public class RegisterServlet extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			processRequest(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			try {
				processRequest(request, response);
			} catch (ServletException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	
	}
	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
		
		response.setContentType("text/html");
		try(PrintWriter out = response.getWriter()){
			
			 out.println("<!DOCTYPE html>");
		   	   out.println("<html>");
		   	   out.println("<head>");
		   	   out.println("<tittle>s1 servlet </title>");
		   	   out.println("</head>");
		   	   out.println("<body>");
		   
		   	      String check = request.getParameter("check");
		   	      if(check==null) {
		   	    	  out.println("Box not checked");
		   	      }else {
		   	    	  //another data taking here....
		   	    	  String Fname = request.getParameter("user_Fname");
		   	    	  String	Lname = request.getParameter("user_Lname");
		   	    	String	Email = request.getParameter("user_Email");
		   	    	String	Gender = request.getParameter("user_Gender");
		   	    	String	Password = request.getParameter("user_Password");
		   	    	
		   	    	//create user object and set all data to that object
		   	    	User user = new User(Fname,Lname,Email,Gender,Password);
		   	    	
		   	    	//create a user dao object
		   	    	UserDao dao = new UserDao(ConnectionProvider.getConnection());
		   	    			if(dao.saveUser(user)) {
		   	    				out.println("Done");
		   	    				
		   	    			}else {
		   	    				out.println("Error");
		   	    			}
		   	      }
		   	   
		   	  out.println("</body>");
		   	   out.println("</html>");
		}
		
	}

}

