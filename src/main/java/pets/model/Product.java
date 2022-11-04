package pets.model;

public class Product {
	private int id;
	private String title;
	private String description;
	private String image;
	private double price;
	private String category;
	private String subcategory;
	
	public Product() {
	}

	public Product(int id, String title, String description, String image, double price, String category, String subcategory) {
		this.id = id;
		this.title = title;
		this.description = description;
		this.image = image;
		this.price = price;
		this.category = category;
		this.subcategory = subcategory;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSubcategory() {
		return subcategory;
	}

	public void setSubcategory(String subcategory) {
		this.subcategory = subcategory;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", title=" + title + ", description=" + description + ", image=" + image
				+ ", price=" + price + ", category=" + category + ", subcategory=" + subcategory + "]";
	}

}
