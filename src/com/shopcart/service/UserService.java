package com.shopcart.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.shopcart.model.User;

public class UserService {
	private final String url = "jdbc:mysql://localhost:3306/shopcart?serverTimezone=UTC";
	private final String username = "leon";
	private final String password = "leon";
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public UserService() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public String login(User user) {
		try {
			ps = con.prepareStatement("select * from users where uname=? and password=?");
			ps.setString(1, user.getUname());
			ps.setString(2, user.getPassword());
			rs = ps.executeQuery();
			if (rs.next()) {
				return user.getUname();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null) {
					con.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
				// System.err.println(e2.getMessage());
			}
		}
		return null;
	}

}
