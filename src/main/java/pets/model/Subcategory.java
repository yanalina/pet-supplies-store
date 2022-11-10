package pets.model;

public class Subcategory {

	private int subcategoryId;
	private String subcategoryTitle;
	private String subcategoryBanner;
	
	public Subcategory() {
	}

	public Subcategory(int subcategoryId, String subcategoryTitle, String subcategoryBanner) {
		super();
		this.subcategoryId = subcategoryId;
		this.subcategoryTitle = subcategoryTitle;
		this.subcategoryBanner = subcategoryBanner;
	}

	public int getSubcategoryId() {
		return subcategoryId;
	}

	public void setSubcategoryId(int subcategoryId) {
		this.subcategoryId = subcategoryId;
	}

	public String getSubcategoryTitle() {
		return subcategoryTitle;
	}

	public void setSubcategoryTitle(String subcategoryTitle) {
		this.subcategoryTitle = subcategoryTitle;
	}

	public String getSubcategoryBanner() {
		return subcategoryBanner;
	}

	public void setSubcategoryBanner(String subcategoryBanner) {
		this.subcategoryBanner = subcategoryBanner;
	}
	
}
