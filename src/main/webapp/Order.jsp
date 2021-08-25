<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=780px" />

<meta charset="ISO-8859-1">
<title>Order</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/1a87f1ecb3.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<nav>
		<p class="title">ShopNow</p>
	</nav>
	<div class="cart_box">
		<p class="cart_box_heading">Shipping Address</p>
		<%
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("dd-MMM-yyyy");
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime expected = now.plusDays(5);
		try {
			Connection con = null;
			String dbDriver = "com.mysql.jdbc.Driver";
			String dbURL = "jdbc:mysql:// localhost:3306/";
			String dbName = "shopnow";
			String dbUsername = "root";
			String dbPassword = "root";
			Class.forName(dbDriver);
			con = DriverManager.getConnection(dbURL + dbName, dbUsername, dbPassword);
			String sql = "select * from signup where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, request.getParameter("email"));
			ResultSet resultSet = ps.executeQuery();
			if (resultSet.next()) {
		%>
		<div class="user_info">
			<p class="user_name">
				Name:
				<%=resultSet.getString("firstName")%>
				<%=resultSet.getString("lastName")%></p>
			<p class="user_email">
				Email ID:
				<%=resultSet.getString("email")%></p>
			<p class="user_address">
				Address:
				<%=resultSet.getString("address")%></p>
			<p class="user_time">
				Order Date:
				<%=dtf.format(now)%></p>
			<p class="user_time">
				Expected Delivery Date:
				<%=dtf.format(expected)%></p>
		</div>
		<p class="cart_box_heading">Order Summary</p>
		<%
		}
		int sum = 0;
		String sql2 = "select * from product";
		PreparedStatement statement = con.prepareStatement(sql2);
		ResultSet resultOrder = statement.executeQuery();
		while (resultOrder.next()) {
		%>
		<div class="cart_product">
			<img class="cart_img" src="<%=resultOrder.getString("image")%>">
			<div class="product_info">
				<p class="order_product_name"><%=resultOrder.getString("name")%></p>
				<p class="order_product_price">
					Price:
					<%=resultOrder.getString("price")%></p>
				<p class="order_product_quatity">
					Quantity:
					<%=resultOrder.getString("quantity")%></p>
			</div>
		</div>
		<%
		sum = sum + Integer.parseInt(resultOrder.getString("price")) * Integer.parseInt(resultOrder.getString("quantity"));
		}
		%>

		<p class="total_price">
			Order Total: Rs
			<%=sum%></p>
		<%
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
	</div>
	<div class="home_div">
		<form action="MyServlet" method="post">
			<button class="btn_login" name="back_to_home">Back To Home</button>
		</form>
	</div>
	<div class="footer-order">
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