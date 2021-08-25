<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/1a87f1ecb3.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav>
		<p class="title">ShopNow</p>
		<button class="btn_home" onclick="location.href = './index.html';">Shop
			More</button>
	</nav>
	<div class="cart_box">
		<p class="cart_box_heading">MyCart</p>
		<%
		try {
			Connection con = null;
			String dbDriver = "com.mysql.jdbc.Driver";
			String dbURL = "jdbc:mysql:// localhost:3306/";
			String dbName = "shopnow";
			String dbUsername = "root";
			String dbPassword = "root";
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
			Statement statement = con.createStatement();
			String sql = "select * from product";
			ResultSet resultSet = statement.executeQuery(sql);
			int sum = 0;
			if (!resultSet.isBeforeFirst()) {
		%>
		<p class="cart_empty">Your Cart is empty</p>
		<%
		} else {
		while (resultSet.next()) {
		%>
		<div class="cart_product">
			<img class="cart_img" src="<%=resultSet.getString("image")%>">
			<div class="product_info">
				<p class="cart_product_name"><%=resultSet.getString("name")%></p>
				<form action="MyServlet" method="post">
					<button class="btn_remove" value="<%=resultSet.getString("name")%>"
						name="remove">Remove</button>
				</form>
				<p class="cart_product_price">
					Price: Rs
					<%=resultSet.getString("price")%></p>
				<p class="cart_product_quatity">
					Quantity:
					<%=resultSet.getString("quantity")%></p>
			</div>
		</div>
		<%
		sum = sum + Integer.parseInt(resultSet.getString("price")) * Integer.parseInt(resultSet.getString("quantity"));
		}
		%>
		<p class="total_price">
			Total Amount: Rs
			<%=sum%>
		</p>
	</div>
	<div class="login_div">
		<p class="login_text">To confirm your order Login Now</p>
		<button class="btn_login" onclick="location.href = './login.jsp';">Login</button>

		<%
		con.close();
		}
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>

	<div class="footer-cart">
		<div class="foot">
			<p class="foot_heading">Mail Us</p>
			<p class="foot_txt">ShopNow@gmail.com</p>
		</div>
		<div class="foot">
			<p class="foot_heading">Social</p>
			<p class="foot_txt">
				<i class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i> <i
					class="fab fa-youtube"></i>
			</p>
		</div>
		<div class="foot">
			<p class="foot_heading">Contact</p>
			<p class="foot_txt">1800 254 73XX</p>
		</div>
		<div class="foot">
			<p class="foot_heading">Office Address</p>
			<p class="foot_txt">ShopNow Jaipur,Rajasthan</p>
		</div>
	</div>
</body>
</html>