package pets.model;

public class Category {

	private int categoryId;
	private String categoryTitle;
	private String categoryBanner;
	
	public Category() {
	}

	public Category(int categoryId, String categoryTitle, String categoryBanner) {
		super();
		this.categoryId = categoryId;
		this.categoryTitle = categoryTitle;
		this.categoryBanner = categoryBanner;
	}

	public String getCategoryBanner() {
		return categoryBanner;
	}

	public void setCategoryBanner(String categoryBanner) {
		this.categoryBanner = categoryBanner;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}
	
}
