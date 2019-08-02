<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List Page</title>
</head>
<body>
<jsp:useBean id="Wservice" class="com.shopcart.service.WishlistService" />

<% 
	String cus = (String) session.getAttribute("customer");
	if (cus == null) {
		response.sendRedirect("login.html");
	}
%>

	<h3>Hello, <%=cus %>. This is your Wishing List:</h3>
	<ul>

<%
	Map<String, Integer> wishitems = Wservice.select(cus);
	if (!wishitems.isEmpty()) {
		for(String key: wishitems.keySet()) {
%>

			<li> <%=key%> ===> Quantity:<%=wishitems.get(key) %>
			<a href="delete2.jsp?delItem=<%=key%>"><img src="delete2.png"></a>
			<a href="add2.jsp?addItem=<%=key%>&number=<%=wishitems.get(key)%>">Move to Cart</a>
			</li>

<%
		} 
	} else { 
%>

			<li>Nothing in the Wishing List. Please Add Something.</li>

<%	}%>

	</ul>

	<h3><a href="index.jsp">Back to Products</a ></h3>
	<h3><a href="cart.jsp">Go to Cart</a></h3>


</body>
</html>