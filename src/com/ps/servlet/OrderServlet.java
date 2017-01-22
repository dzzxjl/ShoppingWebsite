package com.ps.servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ps.dao.OrderDao;
import com.ps.model.Order;

/**
 * Servlet implementation class OrderServlet
 */
public class OrderServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		if(method.equals("submit")){
			int uid = Integer.parseInt(request.getParameter("uid"));
			int pid = Integer.parseInt(request.getParameter("pid"));
			int price = Integer.parseInt(request.getParameter("price"));
			int num = Integer.parseInt(request.getParameter("num"));
			int allPrice = price * num;  
			Date date = new Date();
			DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			String time = format.format(date);
			Order order = new Order();
			order.setUid(uid);
			order.setPid(pid);
			order.setTime(time);
			order.setNum(num);
			order.setPrice(allPrice);
			order.setIsCancel(0);
			order.setIsDispatch(0);
			OrderDao orderdao = new OrderDao();
			orderdao.save(order);
			orderdao.tongbu(order);   //删减库存
			request.getRequestDispatcher("success.jsp").forward(request,response);
		}else if((method.equals("update"))){
			int id = Integer.parseInt(request.getParameter("id"));
			OrderDao orderdao = new OrderDao();
			orderdao.update(id);
			request.getRequestDispatcher("orders.jsp").forward(request,response);
		}else{
			int id = Integer.parseInt(request.getParameter("id"));
			OrderDao orderdao = new OrderDao();
			orderdao.cancel(id);
			request.getRequestDispatcher("user.jsp").forward(request,response);
		}
		
	}

}
