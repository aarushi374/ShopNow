import java.sql.*;

public class DAO {
	public String insertProduct(myProducts product) {
		Connection con = DBconnection.initializeDatabase();
		String sql = "insert into product values(?,?,?,?)";
		PreparedStatement ps;
		String result = "product added sucessfully";
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, product.getProductName());
			ps.setString(2, product.getProductPrice());
			ps.setString(3, product.getProductQuantity());
			ps.setString(4, product.getProductImage());
			ps.executeUpdate();
		} catch (Exception e) {
			result = "sql error";
		}
		return result;
	}

	public String ProductRemove(myProducts product) {
		String sql2 = "delete from product where name=?";
		String result = "product deleted";
		PreparedStatement ps;
		Connection con = DBconnection.initializeDatabase();
		try {

			ps = con.prepareStatement(sql2);
			ps.setString(1, product.getProductRemoveName());
			ps.executeUpdate();
		} catch (Exception e) {
			result = "sql error";
		}
		return result;
	}

	public String signup(myProducts product) {
		Connection con = DBconnection.initializeDatabase();
		String sql = "insert into signup values(?,?,?,?,?,?)";
		String result = "account created";
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.setString(1, product.getFirstName());
			ps.setString(2, product.getLastName());
			ps.setString(3, product.getPhone());
			ps.setString(4, product.getEmail());
			ps.setString(5, product.getAddress());
			ps.setString(6, product.getPassword());
			ps.executeUpdate();
		} catch (Exception e) {
			result = "sql error";
		}
		return result;
	}

	public String login(myProducts product) {
		Connection con = DBconnection.initializeDatabase();
		String sql = "select email,password from signup";
		String result = "authentication unsuccessful";
		try {
			Statement statement = con.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while (resultSet.next()) {
				if (resultSet.getString("email").equals(product.getEmailLogin())
						&& resultSet.getString("password").equals(product.getPassowrdLogin())) {
					result = "authentication successful";
				}
			}
		} catch (Exception e) {
			result = "sql exception";
		}
		return result;
	}

	public String deleteCart() {
		String sql = "delete from product";
		String result = "cart is now empty";
		Connection con = DBconnection.initializeDatabase();
		PreparedStatement ps;
		try {
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			result = "sql error";
		}
		return result;
	}
}