<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=780px" />
<meta charset="ISO-8859-1">
<title>Payment</title>
<link rel="stylesheet" href="style.css">
  <script src="https://kit.fontawesome.com/1a87f1ecb3.js" crossorigin="anonymous"></script>
  <script src="func.js"></script>
  
</head>
<body>
  <nav>
    <p class="title">ShopNow</p>
    <button class="btn_home" onclick="myfunction()">Shop More</button>
    <button class="btn_home" onclick="myfunction()"><i class="fas fa-shopping-cart"></i>Cart</button>
  </nav>
 
    <div class="payment_form">
 <p class="payment_heading">Billing Details</p>
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
			String sql = "select * from signup where email=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, request.getParameter("email"));
			ResultSet resultSet = ps.executeQuery();
			if (resultSet.next()) {
		%>
<p class="payment_text">Current Address: <%=resultSet.getString("address")%></p>
<form action="MyServlet" method="post" autocomplete="off">
<p class="payment_text">Enter New Address</p>
<input type="text" class="input_payment" name="new_address">
<button class="btn_pay" name="change_address" value="<%=request.getParameter("email")%>" >Change Address</button>
</form>
<p class="payment_text">Phone Number: <%=resultSet.getString("phone")%></p>

  </div>
  <div class="payment_form">
    <p class="payment_heading">Select Payment Method</p>
    <div>
    <label class="container">Credit/Debit Card
      <input type="checkbox" id="check" name="check" onclick="onlyOne(this); ShowHideDiv(this);" value="1">
      <span class="checkmark"></span>
    </label><br>
    <div id="cpay" style="display:none">
    <form>
    <label class="payment_text" >Card Number</label><br>
    <input type='text' pattern="\d*" maxlength="16" name="" id="card_number"class="input_payment" required><br>
    <label class="payment_text">Name on Card</label><br>
    <input type="text" name="" id="name_payment" class="input_payment" required>
    <label class="payment_text">Expiry Date</label><br>
    <input type="date" name="" id="expiry_date"class="input_payment" required>
    <label class="payment_text">CVV</label><br>
    <input type="text" pattern="\d*" maxlength="3" name="" id="cvv" class="input_payment" required>
    </form>
    </div>
    <label class="container">Pay by Cash
      <input type="checkbox" name="check" onclick="onlyOne(this)">
      <span class="checkmark"></span>
    </label>
    </div>
    <%}
		int sum = 0;
		String sql2 = "select * from product";
		PreparedStatement statement = con.prepareStatement(sql2);
		ResultSet resultOrder = statement.executeQuery();
		while (resultOrder.next()) {		
			sum = sum + Integer.parseInt(resultOrder.getString("price")) * Integer.parseInt(resultOrder.getString("quantity"));
			}

		%>
    <p class="total">Pay Total: Rs.<%=sum%></p>
<button class="btn_pay" onclick="required()">Pay</button>
  </div>
  	<%
		con.close();
		} catch (Exception e) {
		e.printStackTrace();
		}
		%>
  
  <div class="footer-login">
    <div class="foot">
      <p class="foot_heading">Mail Us</p>
      <p class="foot_txt">ShopNow@gmail.com</p>
    </div>
    <div class="foot">
      <p class="foot_heading">Social</p>
      <p class="foot_txt"><i class="fab fa-facebook-f"></i>
        <i class="fab fa-twitter"></i>
        <i class="fab fa-youtube"></i>
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
  <script type="text/javascript">
 function ShowHideDiv(check) {
        var divpay = document.getElementById("cpay");
        divpay.style.display = check.checked ? "block" : "none";
    }
    function onlyOne(checkbox) {
    var checkboxes = document.getElementsByName('check')
    checkboxes.forEach((item) => {
        if (item !== checkbox) item.checked = false
    })
}
    function required()
    {
      var checkboxes = document.getElementsByName('check')

          if(checkboxes[0].checked){
          if(document.getElementById("card_number").value.length==0 || document.getElementById("cvv").value.length==0 ||
          document.getElementById("name_payment").value.length==0 || document.getElementById("expiry_date").value.length==0 )
          alert( 'Fill the card details!' );
          else {
            window.location.href="./Order.jsp?email="+"<%=request.getParameter("email")%>";
          }
        }
          else if ( checkboxes[1].checked ) {
              window.location.href="./Order.jsp?email="+"<%=request.getParameter("email")%>";

          } else {
                alert( 'Please, select the payment method!' );
            }
    }
  </script>
</body>
</html>