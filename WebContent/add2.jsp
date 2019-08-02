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
	if (uname != null) {
		@SuppressWarnings("unchecked")
		Map<String, Integer> items = (HashMap<String, Integer>) session.getAttribute("items");
		String pname = request.getParameter("addItem");
		Integer number = Integer.parseInt(request.getParameter("number"));
		
		Wservice.delete(uname, pname);
		
		items.put(pname, number);
		session.setAttribute("items", items);
		response.sendRedirect("list.jsp");
	
		
	} else {
		response.sendRedirect("login.html");
	}
%>

</body>
</html>