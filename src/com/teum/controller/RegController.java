package com.teum.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teum.entity.Member;
import com.teum.entity.Users;
import com.teum.service.MemberService;
import com.teum.service.UsersService;

@WebServlet("/reg")
public class RegController extends HttpServlet{

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getMethod().equals("GET"))
			request.getRequestDispatcher("reg.jsp").forward(request, response);
		else if(request.getMethod().equals("POST")) {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String pwd = request.getParameter("password");
			String birthday = request.getParameter("birthday");
			String phone = request.getParameter("phone");
			String type = request.getParameter("member-type");
			System.out.println(phone);
			if(!phone.contains("-")) {
				String sub1 = phone.substring(0,3);
				String sub2 = phone.substring(3,7);
				String sub3 = phone.substring(7,11);
				phone = sub1 + "-" + sub2 + "-" + sub3;
			}
			
			Users u = new Users();
			u.setName(name);
			u.setEmail(email);
			u.setPassword(pwd);
			u.setBirthday(birthday);
			u.setPhone(phone);
			
			if(type.equals("회원")) {
				
				UsersService service = new UsersService();
				int result = service.insert(u);
				
				response.sendRedirect("/admin/userInfo/usersList");
			}
			
		}
	}
	
}