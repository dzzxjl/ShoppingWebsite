package com.ps.servlet;

import java.awt.List;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ps.dao.OrderDao;
import com.ps.dao.UserDao;
import com.ps.model.User;
import com.ps.model.Order;

/**
 * Servlet implementation class UserServlet
 */
public class UserServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method = request.getParameter("method");
		if (method != null && method.equals("login")) {			
			String uname = request.getParameter("username");
			String upassword = request.getParameter("password");
			User user = new User();
			user.setUname(uname);
			user.setUpassword(upassword);
			UserDao userDao = new UserDao();
			User users = new User();
			users = userDao.login(user);
			if (users != null) {
				System.out.println("登陆成功");
				HttpSession session = request.getSession();
				session.setAttribute("user", users);
				session.setAttribute("uid", users.getUid());
			//	request.getRequestDispatcher("/admin.jsp").forward(request, response);
//				System.out.println(uname);
//				System.out.println(uname =="admin");
				
//				OrderDao orderdao = new OrderDao();
//				List orders = (List) orderdao.selectByUid(user.getUid());
				if(uname.equals("admin")){
					request.getRequestDispatcher("/admin.jsp").forward(request, response);
				}else{
					request.getRequestDispatcher("/user.jsp").forward(request, response);
				}

			}
		}if (method != null && method.equals("register")) {
			String uname = request.getParameter("name");
			String upassword = request.getParameter("pwd");
			String uemail = request.getParameter("email");
			String uintroduction = request.getParameter("introduction");
			User user = new User();
			user.setUname(uname);
			user.setUpassword(upassword);
			user.setUemail(uemail);
			user.setUintroduction(uintroduction);
			UserDao userDao = new UserDao();
			userDao.save(user);
			request.getRequestDispatcher("user.jsp").forward(request,
					response);
		} 
	}

}
