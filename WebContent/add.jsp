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
<jsp:useBean id="Wservice2" class="com.shopcart.service.WishlistService" />
<jsp:useBean id="Wservice3" class="com.shopcart.service.WishlistService" />
<jsp:useBean id="Wservice4" class="com.shopcart.service.WishlistService" />


<%
	String uname = (String) session.getAttribute("customer");
	if (uname != null) {
		@SuppressWarnings("unchecked")
		Map<String, Integer> items = (HashMap<String, Integer>) session.getAttribute("items");
		String item = request.getParameter("addItem");
		
		Map<String, Integer> wmap = Wservice.select(uname);
		if (!wmap.containsKey(item)) {
			Wservice2.insert(uname, item, items.get(item));
		} else {
			Wservice3.delete(uname, item);
			Wservice4.insert(uname, item, items.get(item) + wmap.get(item));
		}
		items.remove(item);
		session.setAttribute("items", items);
		response.sendRedirect("cart.jsp");
	
		
	} else {
		response.sendRedirect("login.html");
	}
%>

</body>
</html>