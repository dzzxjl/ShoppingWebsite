package com.ps.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ps.model.Order;
import com.ps.model.Product;
import com.ps.util.JDBCUtil;

public class ProductDao {
	public Connection conn = null;
	public PreparedStatement psmt = null;
	public Statement stmt = null;
	public ResultSet rs = null;

	public Product getProduct(int pid){
		Product product = new Product();
		try{
		conn = JDBCUtil.getConnection();
		String sql="select * from products where id = ?";
		psmt = conn.prepareStatement(sql);
		psmt.setInt(1,pid);		
		rs = psmt.executeQuery();
			while (rs.next()){
				int id = rs.getInt("id");//商品id
				String name = rs.getString("name");//商品名称型号
				String description = rs.getString("description"); //商品描述
				int num =rs.getInt("num");//商品数量
				int category=rs.getInt("category");//商品种类
				int price = rs.getInt("price"); //商品价格
				product.setId(id);
				product.setCategory(category);
				product.setPrice(price);
				product.setDescription(description);
				product.setNum(num);
				product.setName(name);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return product;
	}
	
	
	public List<Product> getProducts(){
		List<Product> products =new ArrayList<Product>();
		try{
		conn = JDBCUtil.getConnection();
		String sql="select * from products where num>0";
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs=stmt.executeQuery(sql);
			while (rs.next()){
				Product product = new Product();
				int id = rs.getInt("id");//商品id
				String name = rs.getString("name");//商品名称型号
				String description = rs.getString("description"); //商品描述
				int num =rs.getInt("num");//商品数量
				int category=rs.getInt("category");//商品种类
				int price = rs.getInt("price"); //商品价格
				product.setId(id);
				product.setCategory(category);
				product.setPrice(price);
				product.setDescription(description);
				product.setNum(num);
				product.setName(name);
				products.add(product);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return products;
	}
	
	public void savePriduct(Product product){
			String sql = "insert into products values(default,?,?,?,?,?)";
			conn = JDBCUtil.getConnection();
			try {
				psmt = conn.prepareStatement(sql);
				psmt.setString(1,product.getName());
				System.out.print("****" + product.getName());
				psmt.setString(	2,product.getDescription());
				psmt.setInt(3, product.getPrice());
				psmt.setInt(4, product.getCategory());
				psmt.setInt(5, product.getNum());			
				psmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				JDBCUtil.close(conn, stmt, psmt, rs);
			}
			
		
	}
}
