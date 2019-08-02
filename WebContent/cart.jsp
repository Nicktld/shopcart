<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.InstanceOfExpression"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cart Page</title>
</head>
<body>
<%
	@SuppressWarnings("unchecked")
	Map<String, Integer> cartItems = (HashMap<String, Integer>) session.getAttribute("items");
	if(cartItems == null) {
		cartItems = new HashMap<String, Integer>();
	}

	String product = request.getParameter("product");
	String num = request.getParameter("number"); // Differ Get and Post
	
	
	if (num != null) {
		Integer number = Integer.parseInt(num);
		if (number > 0 && product != null) {
			cartItems.put(product, cartItems.getOrDefault(product, 0) + number);
			session.setAttribute("items", cartItems);
		}
		response.sendRedirect("index.jsp");
	}
%>

	<h3>You have the following items in the Cart:</h3>
	<ul>
	
<% 
	if (!cartItems.isEmpty()) {
		for(String key: cartItems.keySet()) {
%>

			<li> <%=key%> ===> Quantity:<%=cartItems.get(key) %>
				<a href="delete.jsp?delItem=<%=key%>"><img src="delete2.png"></a>
				<a href="add.jsp?addItem=<%=key%>">Add to List</a>
			</li>
			
<%
		}
	} else { 
%>

		<li>Nothing in the cart. Please Add Something.</li>
		
<%}%>

	</ul>
	<h3><a href="index.jsp">Back to Products</a ></h3>
	<h3><a href="list.jsp">Go to List</a></h3>


</body>
</html>