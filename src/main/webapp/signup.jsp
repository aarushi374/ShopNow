<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=780px" />
<title>SignUp</title>
<link rel="stylesheet" href="style.css">
<script src="https://kit.fontawesome.com/1a87f1ecb3.js"
	crossorigin="anonymous"></script>
<script src="func.js"></script>
</head>
<body>
	<nav>
		<p class="title">ShopNow</p>
		<button class="btn_home" onclick="myfunction()">Shop More</button>
		<button class="btn_home" onclick="location.href = './Cart.jsp';">
			<i class="fas fa-shopping-cart"></i>Cart
		</button>
	</nav>
	<div class="login_form">
		<p class="login_heading">SignUp</p>
		<form action="MyServlet" method="post" autocomplete="off">
			<label class="login_text">First Name:</label><br> <input
				type="text" name="signup_firstname" class="input_login" required><br>
			<label class="login_text">Last Name:</label><br> <input
				type="text" name="signup_lastname" class="input_login" required><br>
			<label class="login_text">Phone</label><br> <input type="text"
				name="phone" class="input_login" required><br> <label
				class="login_text">Email ID:</label><br> <input type="email"
				name="signup_ID" class="input_login" required><br> <label
				class="login_text">Address:</label><br> <input type="text"
				name="address" class="input_login" required><br> <label
				class="login_text">Create Password</label><br> <input
				type="password" name="signup_password" class="input_login" required>
			<label class="login_text">Confirm Password</label><br> <input
				type="password" name="signup_confirm_password" class="input_login"
				required>
			<p class=login_text>${message}</p>
			<input type="submit" name="signup" class="btn_login" value="Submit">
		</form>
	</div>
	<div class="footer">
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