package com.tech.xelpcom.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.tech.xelpcom.dao.UserDao;
import com.tech.xelpcom.entities.Message;
import com.tech.xelpcom.entities.User;
import com.tech.xelpcom.helper.ConnectionProvider;


public class LoginServlet extends HttpServlet {

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
		   	   
		   	   //fetch username and password from request
		   	   
		   	   String userEmail = request.getParameter("user_Email");
		   	   String userPassword = request.getParameter("user_Password");
		   	   
		   	   UserDao dao = new UserDao(ConnectionProvider.getConnection());
		   	   
		   	   User u = dao.getUserByEmailAndPassword(userEmail, userPassword);
		   	   
		   	   if(u==null) {
		   		   //login
		   		   //error
		   		  // out.println("Invalid details ... try again");
		   		   Message msg = new Message("Inavlid Input...Try Again !!","Error","danger");
		   		   HttpSession s = request.getSession();
		   		   s.setAttribute("msg", msg);
		   		   
		   		   response.sendRedirect("SignInPage.jsp");
		   	   }else {
		   		   //......login success
		   		   HttpSession s = request.getSession();
		   		   s.setAttribute("currentUser", u);
		   		   response.sendRedirect("Profile.jsp");
		   	   }
		   	   
		   	  out.println("</body>");
		   	   out.println("</html>");
		}
		
	}

}