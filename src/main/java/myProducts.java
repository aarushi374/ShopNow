
public class myProducts {
	private String productName, productPrice, productImage, productQuantity, productRemove;
	private String firstName, lastName, Email, Phone, Address, Password, email_login, password_login;

	public myProducts() {
		super();
	}

	public myProducts(String productName, String productPrice, String productImage, String productQuantity) {
		this.productImage = productImage;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productQuantity = productQuantity;
	}

	public myProducts(String firstName, String lastName, String Phone, String Email, String Address, String Password) {
		this.firstName = firstName;
		this.lastName = lastName;
		this.Password = Password;
		this.Email = Email;
		this.Address = Address;
		this.Phone = Phone;
	}

	public myProducts(String email_login, String password_login) {
		this.email_login = email_login;
		this.password_login = password_login;
	}

	public myProducts(String productRemove) {
		this.productRemove = productRemove;
	}

	public String getEmailLogin() {
		return email_login;
	}

	public String getPassowrdLogin() {
		return password_login;
	}

	public String getFirstName() {
		return firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public String getAddress() {
		return Address;
	}

	public String getPhone() {
		return Phone;
	}

	public String getEmail() {
		return Email;
	}

	public String getPassword() {
		return Password;
	}

	public String getProductRemoveName() {
		return productRemove;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getProductPrice() {
		return productPrice;
	}

	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;

	}

	public String getProductQuantity() {
		return productQuantity;
	}

	public void setProductQuantity(String productQuantity) {
		this.productQuantity = productQuantity;

	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;

	}
}
