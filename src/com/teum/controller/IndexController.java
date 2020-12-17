package com.teum.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.teum.dao.entity.EventListView;
import com.teum.service.EventService;

@WebServlet("/index")
public class IndexController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String email = (String) session.getAttribute("email");
		
		System.out.println(email);
		
		EventService eventService = new EventService();
		List<EventListView> eventList = new ArrayList<>();
		
		eventList = eventService.getViewList();
		int count = eventService.getCount();
		
		request.setAttribute("email", email);
		request.setAttribute("eventList", eventList);
		request.setAttribute("count", count);
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
	
}
