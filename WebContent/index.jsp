<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Page</title>

<style>

* {
	box-sizing: border-box;
}

body {
	height: 100%;
	margin: 0;
	padding: 0;
	border: black 1px solid;
}

div {
	margin: 0;
	background-color: #c6bfbf;
	width: 100%;
	height: 80px;
}

ul {
width: 100%;
}
li {
list-style: none;
float: left;
margin: 5px;
padding: 20px;
}

table {
clear: both;
}

</style>
</head>
<body>
<jsp:useBean id="Pservice" class="com.shopcart.service.ProductService" />

<div>
	<ul>
	<li><a href="cart.jsp">Cart</a></li>
	<li><a href="list.jsp">List</a></li>
<% 
	String cus = (String) session.getAttribute("customer");
	if (cus == null) {
%>

	<li><a href="login.html">Login</a></li>

<%} else {%>

	<li>Hello, <%=cus%>. <a href="exit.jsp">Logout</a></li>

<% } %>
	</ul>

</div>

<table>
		<tr>
			<td>Product Name</td>
			<td>Product Unit Price</td>
			<td>Quantity</td>
		</tr>
		
<%
	Map<String, Integer> pmap = Pservice.select();
	for (String pname: pmap.keySet()) {
%>
		
		<tr>
			<td><%=pname %></td>
			<td><%=pmap.get(pname) %></td>
			<td>
			<form method="post" action="cart.jsp?product=<%=pname%>">
				<input type="number" name="number" value=0 min=0 />
				<input type="submit" value="Add to Cart" />
			</form>
			</td>
		
		</tr>
		
<% }%>		
		

<!-- form method="post" action="cart.jsp">
<select name="laptops" multiple>
	<option value="Lenovo">Thinkpad</option>
	<option value="DELL">Inspiron</option>
	<option value="SONY">Viao</option>
	<option value="Macbook Pro">Mac Sierra</option>
	<option value="Macbook">Mac</option>
</select>
<input type="submit" value="Add to Cart" />
</form -->
</table>



</body>
</html>