package pets.model;

public class User {
	int id;
	String name;
	String address;
	String city;
	String zip;
	String email;
	String password;
	String phone;
	
	 public User() {
	    }

	    public User(int id, String name, String address, String city, String zip, String email, String phone, String password) {
	        this.id = id;
	        this.name = name;
	        this.address = address;
	        this.city = city;
	        this.zip = zip;
	        this.email = email;
	        this.phone = phone;
	        this.password = password;
	    }

	    public User(String name, String address, String city, String zip, String email, String phone, String password) {
	        this.name = name;
	        this.address = address;
	        this.city = city;
	        this.zip = zip;
	        this.email = email;
	        this.phone = phone;
	        this.password = password;
	    }

	    public User(String email, String password) {
	        this.email = email;
	        this.password = password;
	    }

	    public int getId() {
	        return id;
	    }

	    public void setId(int id) {
	        this.id = id;
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
	    
	    public String getCity() {
	    	return city;
	    }
	    
	    public void setCity(String city) {
	    	this.city = city;
	    }
	    
	    public String getZip() {
	    	return zip;
	    }
	    
	    public void setZip(String zip) {
	    	this.zip = zip;
	    }

	    public String getEmail() {
	        return email;
	    }

	    public void setEmail(String email) {
	        this.email = email;
	    }
	    
	    public String getPhone() {
	    	return phone;
	    }
	    
	    public void setPhone(String phone) {
	    	this.phone = phone;
	    }

	    public String getPassword() {
	        return password;
	    }

	    public void setPassword(String password) {
	        this.password = password;
	    }
	    
}
