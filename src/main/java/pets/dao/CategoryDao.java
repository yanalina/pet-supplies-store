package pets.dao;

import java.sql.*;
import java.util.*;
import pets.model.*;

public class CategoryDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public CategoryDao(Connection con) {
		this.con = con;
	}
	
	public List<Category> getAllCategories() {
		List<Category> categories = new ArrayList<Category>();
		
		try {
			query = "Select * from categories";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Category row = new Category();
				row.setCategoryId(rs.getInt("category_id"));
				row.setCategoryTitle(rs.getString("category_title"));
				row.setCategoryBanner(rs.getString("category_banner"));
				
				categories.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return categories;
	}
}
