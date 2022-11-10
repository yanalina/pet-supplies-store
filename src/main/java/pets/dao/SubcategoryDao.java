package pets.dao;

import java.sql.*;
import java.util.*;
import pets.model.*;

public class SubcategoryDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public SubcategoryDao(Connection con) {
		this.con = con;
	}
	
	public List<Subcategory> getAllSubcategories() {
		List<Subcategory> subcategories = new ArrayList<Subcategory>();
		
		try {
			query = "Select * from subcategories";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Subcategory row = new Subcategory();
				row.setSubcategoryId(rs.getInt("subcategory_id"));
				row.setSubcategoryTitle(rs.getString("subcategory_title"));
				row.setSubcategoryBanner(rs.getString("subcategory_banner"));
				
				subcategories.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return subcategories;
	}
}
