<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="Wservice" class="com.shopcart.service.WishlistService" />


<%
	String uname = (String) session.getAttribute("customer");
	String pname = request.getParameter("delItem");
	Wservice.delete(uname, pname);

	response.sendRedirect("list.jsp");
%>

</body>
</html>