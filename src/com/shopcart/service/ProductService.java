package com.shopcart.service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

public class ProductService {
	private final String url = "jdbc:mysql://localhost:3306/shopcart?serverTimezone=UTC";
	private final String username = "leon";
	private final String password = "leon";
	Connection con;
	Statement st;
	ResultSet rs;

	public ProductService() {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, username, password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public Map<String, Integer> select() {
		Map<String, Integer> pmap = new HashMap<String, Integer>();
		try {
			st = con.createStatement();
			rs = st.executeQuery("select * from products");
			while (rs.next()) {
				String pname = rs.getString(1);
				int price = rs.getInt(2);
				pmap.put(pname, price);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pmap;
	}
}