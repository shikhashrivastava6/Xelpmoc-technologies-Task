package com.tech.xelpcom.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import com.tech.xelpcom.entities.Message;

public class LogoutServlet extends HttpServlet {

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
		   	   
		   	   HttpSession s = request.getSession();
		   	   s.removeAttribute("currentUser");
		   	   
		   	   Message m = new Message("Logout Successfully !!","success","primary");
		   	   s.setAttribute("msg", m);
		   	   
		   	   response.sendRedirect("SignInPage.jsp");
		   	 
		   	  out.println("</body>");
		   	   out.println("</html>");
		}
		
	}

}