<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="Uservice" class="com.shopcart.service.UserService" />
<jsp:useBean id="Cservice" class="com.shopcart.service.CartService" />
<jsp:useBean id="user" class="com.shopcart.model.User" />
<jsp:setProperty name="user" property= "*" />
<%
	//String uname = request.getParameter("username");
	//String pword = request.getParameter("password");
	// UserService service = new UserService();
	if(Uservice.login(user) != null) { // Business Layer should be placed in servlet
		session.setAttribute("customer", user.getUname());
		Map<String, Integer> cmap = Cservice.select(user.getUname());
		if (!cmap.isEmpty()) {
			session.setAttribute("items", cmap);
		}
		response.sendRedirect("index.jsp");
	} else {
		response.sendRedirect("error.html");
	}
%>
</body>
</html>