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
import com.ps.model.User;
import com.ps.util.JDBCUtil;

public class OrderDao {
	public Connection conn = null;
	public PreparedStatement psmt = null;
	public Statement stmt = null;
	public ResultSet rs = null;
	
	public int save(Order order) {
		String sql = "insert into orders values(default,?,?,?,?,?,?,?)";
		conn = JDBCUtil.getConnection();
		int count = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1,order.getUid());
			psmt.setString(2,order.getTime());
			psmt.setInt(3, order.getPrice());
			psmt.setInt(4, order.getPid());
			psmt.setInt(5, order.getNum());			
			psmt.setInt(6, order.getIsCancel());
			psmt.setInt(7, order.getIsDispatch());
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return count;
	}
	
	public List selectByUid(int uid) {
		// TODO Auto-generated method stub
		List<Order> orders = new ArrayList<Order>();
		//int uid = 0;
		String sql="select * from orders where isCancel=0 and uid = ?";
		conn=JDBCUtil.getConnection();
		try{
			psmt=conn.prepareStatement(sql);
			psmt.setInt(1, uid);
			rs=psmt.executeQuery();
			while (rs.next()) {
				Order order = new Order();
				order.setId(rs.getInt("id"));
				order.setTime(rs.getString("time"));
				order.setPrice(rs.getInt("id"));
				order.setNum(rs.getInt("num"));
				order.setIsCancel(rs.getInt("isCancel"));
				order.setIsDispatch(rs.getInt("isDispatch"));
				order.setUid(rs.getInt("uid"));
				orders.add(order);
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return orders;
	}

	public void tongbu(Order order) {
				String sql1="select num from products where id=?";
				String sql2="update products set num=? where id=?";
				conn=JDBCUtil.getConnection();
		//		System.out.println("我是小标记");
				int num = 0;
				int buynum =0;
				try{
					psmt=conn.prepareStatement(sql1);
					psmt.setInt(1,order.getPid());
					rs=psmt.executeQuery();
					while (rs.next()) {
						num = rs.getInt("num");
					}
				}catch(SQLException e){
					e.printStackTrace();
				}
				rs=null;
				try{
					buynum = order.getNum();
					num = num-buynum;
					psmt = conn.prepareStatement(sql2);
					psmt.setInt(1,num);
					psmt.setInt(2,order.getPid());
					psmt.executeUpdate();
				}catch(SQLException e){
					e.printStackTrace();
				}finally{
					JDBCUtil.close(conn, stmt, psmt, rs);
				}
	}
	
	
	public List<Order> getOrders(){
		List<Order> orders =new ArrayList<Order>();
		try{
		conn = JDBCUtil.getConnection();
		String sql="select * from orders";
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
		rs=stmt.executeQuery(sql);
			while (rs.next()){
				Order order =new Order();
				int id = rs.getInt("id");//商品id
				int uid = rs.getInt("uid");//用户ID
				int pid = rs.getInt("pid");//商品名称型号
				String time = rs.getString("time");//订单时间
				int num =rs.getInt("num");//商品数量
				int price = rs.getInt("price"); //商品价格
				int isCancel=rs.getInt("isCancel");//商品种类
				int isDispatch=rs.getInt("isDispatch");//商品种类
				order.setId(id);
				order.setUid(uid);
				order.setPid(pid);
				order.setTime(time);
				order.setNum(num);
				order.setPrice(price);
				order.setIsCancel(isCancel);
				order.setIsDispatch(isDispatch);
				orders.add(order);
				}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return orders;
	}
	
	public void update(int id) {
		String sql="update orders set isDispatch=1 where id=?";
		conn=JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
	}
	public void cancel(int id) {
		String sql="update orders set isCancel=1 where id=?";
		conn=JDBCUtil.getConnection();
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, id);
			psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
	}
	
}
