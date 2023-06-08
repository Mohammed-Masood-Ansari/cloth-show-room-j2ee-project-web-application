package com.jsp.cloth_show_room.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jsp.cloth_show_room.dto.Admin;
import com.jsp.cloth_show_room.service.AdminService;

@WebServlet(value = "/loginAdmin")
public class AdminController extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		HttpSession httpSession = req.getSession();
		
		AdminService adminService = new AdminService();
		
		String adminEmail = req.getParameter("adminEmail");
		String adminPassword = req.getParameter("adminPassword");
		
		Admin admin=adminService.loginAdmin(adminEmail);
		
		if(admin!=null) {
			
			if(admin.getAdminEmail().equalsIgnoreCase(adminEmail)) {
				httpSession.setAttribute("adminName",adminEmail);
				RequestDispatcher dispatcher = req.getRequestDispatcher("admin-home.jsp");
				dispatcher.forward(req, resp);
			}else {
				req.setAttribute("message","email is incorrect");
				RequestDispatcher dispatcher = req.getRequestDispatcher("admin-login.jsp");
				dispatcher.forward(req, resp);
			}
		}else {
			req.setAttribute("message","username is incorrect");
			RequestDispatcher dispatcher = req.getRequestDispatcher("admin-login.jsp");
			dispatcher.forward(req, resp);
		}
		
	}
	
}
