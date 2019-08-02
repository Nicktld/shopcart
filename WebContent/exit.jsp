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

<jsp:useBean id="Cservice" class="com.shopcart.service.CartService" />

<%  
	String cus = (String) session.getAttribute("customer");
	@SuppressWarnings("unchecked")
	Map<String, Integer> cmap = (HashMap<String, Integer>) session.getAttribute("items");
	
	if (cmap != null && !cmap.isEmpty()) {
		Cservice.insert(cus, cmap);
	}
	session.invalidate();
	response.sendRedirect("index.jsp");
%>

</body>
</html>