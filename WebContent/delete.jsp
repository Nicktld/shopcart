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

<%
	@SuppressWarnings("unchecked")
	Map<String, Integer> items = (HashMap<String, Integer>) session.getAttribute("items"); 
	String pname = request.getParameter("delItem");
	items.remove(pname);
	session.setAttribute("items", items);
	response.sendRedirect("cart.jsp");
%>

</body>
</html>