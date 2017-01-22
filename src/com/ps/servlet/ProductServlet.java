package com.ps.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ps.dao.ProductDao;
import com.ps.model.Product;


/**
 * Servlet implementation class ProductServlet
 */
public class ProductServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String method =request.getParameter("method");
		
		if(method.equals("save")){
		String name  = request.getParameter("name");
		String description = request.getParameter("description");
		int category = Integer.parseInt(request.getParameter("category"));
		int price=Integer.parseInt(request.getParameter("price"));
		int num=Integer.parseInt(request.getParameter("num"));
		Product product = new Product();
		product.setName(name);
		product.setDescription(description);
		product.setCategory(category);
		product.setPrice(price);
		product.setNum(num);
		
		ProductDao productdao = new ProductDao();
		productdao.savePriduct(product);
		request.getRequestDispatcher("admin.jsp").forward(request,
				response);
		}

	}

}
