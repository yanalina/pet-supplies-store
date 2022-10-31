package pets.dao;

import java.sql.*;
import java.util.*;
import pets.model.*;

public class ProductDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public ProductDao(Connection con) {
		this.con = con;
	}
	
	public List<Product> getAllProducts() {
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "Select * from products";
			pst = this.con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				Product row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setTitle(rs.getString("product_title"));
				row.setDescription(rs.getString("product_description"));
				row.setImage(rs.getString("product_image"));
				row.setPrice(rs.getDouble("product_price"));
				row.setCategory(rs.getString("product_category"));
				row.setSubcategory(rs.getString("product_subcategory"));
				
				products.add(row);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return products;
	}
}
