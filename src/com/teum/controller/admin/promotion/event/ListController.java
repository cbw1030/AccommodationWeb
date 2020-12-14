package com.teum.controller.admin.promotion.event;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.teum.entity.Event;
import com.teum.service.EventService;

@WebServlet("/admin/promotion/event/list")
public class ListController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=utf-8");
	    
		String searchTitle = request.getParameter("search-title");
		
		EventService service = new EventService();
		List<Event> list = new ArrayList<Event>(); // null로 해야하나?
		
		if (searchTitle != null) 
			list = service.getList(1, 10, searchTitle);
		else
			list = service.getList();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("list.jsp").forward(request, response);
	}
	
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] openIds = request.getParameterValues("open-id");
		String[] delIds = request.getParameterValues("del-id");
		String cmd = request.getParameter("cmd");
		
		switch (cmd) {
		case "일괄공개":
			break;
		case "일괄삭제":
			EventService service = new EventService();
			int[] ids = new int[delIds.length];
			
			for (int i = 0; i < delIds.length; i++) {
				ids[i] = Integer.parseInt(delIds[i]);
			}
			
			int result = service.deleteAll(ids);
			break;
		}
		
		response.sendRedirect("list");
	}
	
}
