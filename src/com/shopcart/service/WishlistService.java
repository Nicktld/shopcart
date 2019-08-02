package com.shopcart.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

public class WishlistService {
	private final String url = "jdbc:mysql://localhost:3306/shopcart?serverTimezone=UTC";
	private final String username = "leon";
	private final String password = "leon";
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	public WishlistService() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public boolean insert(String uname, String pname, Integer number) {
		try {
			ps = con.prepareStatement("insert into wishlist values(?, ?, ?)");
			ps.setString(1, uname);
			ps.setString(2, pname);
			ps.setInt(3, number);
			int i = ps.executeUpdate();
			if (i <= 0) {
				return false;
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
			} catch (SQLException e2) {
				// LOG.fatal(e2.getMessage());
			}
		}
		return true;
	}

	public Map<String, Integer> select(String uname) {
		Map<String, Integer> wmap = new HashMap<String, Integer>();
		try {
			ps = con.prepareStatement("select pname, number from wishlist where uname = ?");
			ps.setString(1, uname);
			rs = ps.executeQuery();
			while (rs.next()) {
				String pname = rs.getString(1);
				int number = rs.getInt(2);
				wmap.put(pname, number);
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
			} catch (SQLException e2) {
				// LOG.fatal(e2.getMessage());
			}
		}
		return wmap;
	}

	public boolean delete(String uname, String pname) {
		try {
			ps = con.prepareStatement("delete from wishlist where uname=? and pname=?");
			ps.setString(1, uname);
			ps.setString(2, pname);
			int i = ps.executeUpdate();
			if (i <= 0) {
				return false;
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
			} catch (SQLException e2) {
				// LOG.fatal(e2.getMessage());
			}
		}
		return true;
	}
}
