
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;

import jakarta.servlet.annotation.WebServlet;

import jakarta.servlet.http.HttpServlet;

import jakarta.servlet.http.HttpServletRequest;

import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class MyServlet
 */
@WebServlet("/MyServlet")
public class MyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public MyServlet() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		DAO register = new DAO();
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		if (request.getParameter("cart") != null) {
			String productName = request.getParameter("name");
			String productPrice = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			String image = request.getParameter("image");
			myProducts product = new myProducts(productName, productPrice, image, quantity);
			String result = register.insertProduct(product);
			if (result.equals("product added sucessfully")) {
				response.sendRedirect("./Cart.jsp");
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert(" + "'" + result + "'" + ");</script>");
			}
		}
		if (request.getParameter("remove") != null) {
			String productRemoveName = request.getParameter("remove");
			myProducts product = new myProducts(productRemoveName);
			String result = register.ProductRemove(product);
			out.println("<script type='text/javascript'>");
			out.println("alert(" + "'" + productRemoveName + "'" + ");</script>");
			if (result.equals("product deleted")) {
				response.sendRedirect("./Cart.jsp");
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert(" + "'" + result + "'" + ");</script>");
			}
		}
		if (request.getParameter("signup") != null) {
			String firstName = request.getParameter("signup_firstname");
			String lastName = request.getParameter("signup_lastname");
			String phone = request.getParameter("phone");
			String email = request.getParameter("signup_ID");
			String address = request.getParameter("address");
			String password = request.getParameter("signup_password");
			String password_confirm = request.getParameter("signup_confirm_password");
			if (!password.equals(password_confirm)) {
				String message = "Password does not match";
				request.setAttribute("message", message);
				request.getRequestDispatcher("./signup.jsp").forward(request, response);
			}
			myProducts product = new myProducts(firstName, lastName, phone, email, address, password);
			String result = register.signup(product);
			if (result.equals("account created")) {
				out.println("<script type='text/javascript'>");
				out.println("alert('Account is created Successfully');window.location='./login.jsp';</script>");
			} else {
				String message = "Account has already been created from this Email Address";
				request.setAttribute("message", message);
				request.getRequestDispatcher("./signup.jsp").forward(request, response);
			}
		}
		if (request.getParameter("login") != null) {
			String email_login = request.getParameter("login_ID");
			String password_login = request.getParameter("login_password");
			myProducts product = new myProducts(email_login, password_login);
			String result = register.login(product);
			if (result.equals("authentication successful")) {
				response.sendRedirect("Payment.jsp?email=" + email_login);
			} else if (result.equals("authentication unsuccessful")) {
				String message = "Email or Password Incorrect";
				request.setAttribute("message", message);
				request.getRequestDispatcher("./login.jsp").forward(request, response);
			}
		}
		if (request.getParameter("back_to_home") != null) {
			String result = register.deleteCart();
			if (result.equals("cart is now empty")) {
				response.sendRedirect("index.html");
			} else {
				out.println("<script type='text/javascript'>");
				out.println("alert(" + "'" + result + "'" + ");</script>");
			}
		}
		if(request.getParameter("change_address")!=null)
		{
			String new_address=request.getParameter("new_address");
			String email=request.getParameter("change_address");
			String result=register.changeAddress(new_address,email);
			if(result=="Address update successful")
			{
				response.sendRedirect("Payment.jsp?email=" + email);
			}else {
				out.println("<script type='text/javascript'>");
				out.println("alert(" + "'" + result + "'" + ");</script>");
			}
		}
	}

}
