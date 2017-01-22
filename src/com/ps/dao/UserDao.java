package com.ps.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.ps.model.User;
import com.ps.util.JDBCUtil;



public class UserDao {

	public Connection conn = null;
	public PreparedStatement psmt = null;
	public Statement stmt = null;
	public ResultSet rs = null;

//	public static void main(String arg[]){
//		Connection conn = JDBCUtil.getConnection(); 
//		if(conn != null){
//			System.out.println("已连接");
//		}else {
//			System.out.println("连接失败");
//		}
//	}
	public User login(User user) {
		User users = null;
		//定义sql
		String sql = "select * from users where u_name=? and u_password=?";
		//获取数据库连接
		conn = JDBCUtil.getConnection();
		try {
			//编译sql
			psmt = conn.prepareStatement(sql);
			//设置参数
			psmt.setString(1, user.getUname());
			psmt.setString(2, user.getUpassword());
			//执行sql
			rs = psmt.executeQuery();
			//获取结果集
			while (rs.next()) {
				users = new User();
				int uid = rs.getInt("u_id");
				//System.out.println("*******" + uid);
				String uname = rs.getString("u_name");
				String upassword = rs.getString("u_password");
				String uemail = rs.getString("u_email");
				String uintroduction = rs.getString("u_introduction");
				users.setUid(uid);
				users.setUname(uname);
				users.setUpassword(upassword);
				users.setUemail(uemail);
				users.setUintroduction(uintroduction);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			//最后要关闭连接
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return users;
	}
	public int save(User user) {
		String sql = "insert into users values(default,?,?,?,?)";
		conn = JDBCUtil.getConnection();
		int count = 0;
		try {
			psmt = conn.prepareStatement(sql);
			psmt.setString(	1, user.getUname());
			psmt.setString(2, user.getUpassword());
			psmt.setString(3, user.getUemail());			
			psmt.setString(4, user.getUintroduction());
			count = psmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return count;
	}
	
	public int delete(User user){
		String sql="delete from users where u_id=?";
		conn=JDBCUtil.getConnection();
		int count = 0;
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, user.getUid());
			count = psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return count;
	}

	public int update(User user) {
		// TODO Auto-generated method stub
		String sql="update users set u_name=?, u_password=? where u_id=?";
		conn=JDBCUtil.getConnection();
		int count = 0;
		try{
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, user.getUname());
			psmt.setString(2, user.getUpassword());
			psmt.setInt(3, user.getUid());
			count = psmt.executeUpdate();
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return count;
	}

	public User selectByUname(String uname){
		// TODO Auto-generated method stub
		User user = new User();
		String sql="select * from users where u_name=?";
		conn=JDBCUtil.getConnection();
		try{
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, uname);
			rs=psmt.executeQuery();
			while (rs.next()) {
				user.setUid(rs.getInt("u_id"));
				user.setUemail(rs.getString("u_name"));
				user.setUintroduction(rs.getString("u_introduction"));
				user.setUpassword(rs.getString("u_password"));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}finally{
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return user;
	}

	public int count() {
		// TODO Auto-generated method stub
		String sql = "select count(*) count from users";
		conn = JDBCUtil.getConnection();
		int count = 0;
		try {
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			rs.next();
			count = rs.getInt("count");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, stmt, psmt, rs);
		}
		return count;
	}

}
