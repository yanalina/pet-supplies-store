package pets.model;



public class Order extends Product{
	private int orderId;
	private int userId;
	private int productQuantity;
	private String date;
	private String creditCard;
	private String name;
	private String address;
	private String number;
	private String email;
	
	public Order() {
		
	}
	

	public Order(int orderId, int userId, int productQuantity, String date) {
		super();
		this.orderId = orderId;
		this.userId = userId;
		this.productQuantity = productQuantity;
		this.date = date;
	}
	

	public Order(int userId, int productQuantity, String date, String creditCard, String name, String address,
			String number, String email) {
		super();
		this.userId = userId;
		this.productQuantity = productQuantity;
		this.date = date;
		this.creditCard = creditCard;
		this.name = name;
		this.address = address;
		this.number = number;
		this.email = email;
	}


	public int getOrderId() {
		return orderId;
	}


	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}


	public int getUserId() {
		return userId;
	}


	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getProductQuantity() {
		return productQuantity;
	}


	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}


	public String getDate() {
		return date;
	}


	public void setDate(String date) {
		this.date = date;
	}
	

	public String getCreditCard() {
		return creditCard;
	}


	public void setCreditCard(String creditCard) {
		this.creditCard = creditCard;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}


	public String getNumber() {
		return number;
	}


	public void setNumber(String number) {
		this.number = number;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	@Override
	public String toString() {
		return "Order [orderId=" + orderId + ", userId=" + userId + ", productQuantity=" + productQuantity + ", date="
				+ date + ", creditCard=" + creditCard + ", name=" + name + ", address=" + address + ", number=" + number
				+ ", email=" + email + "]";
	}




}
