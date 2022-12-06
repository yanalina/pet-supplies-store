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
	
	public List<Product> getAllProductsById (int categoryId) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "Select * from products where category_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, categoryId);
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
	
	public List<Product> getAllProductsByIdSub (int subcategoryId) {
		List<Product> products = new ArrayList<Product>();
		
		try {
			query = "Select * from products where subcategory_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, subcategoryId);
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
	
	public List<Cart> getCartProducts(ArrayList<Cart> cartList){
		List<Cart> products = new ArrayList<Cart>();
	
		try {
			if(cartList.size() > 0)  {
				for(Cart item:cartList) {
					query = "select * from products where product_id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					while(rs.next()) {
						Cart row = new Cart();
						row.setId(rs.getInt("product_id"));
						row.setTitle(rs.getString("product_title"));
						row.setPrice(rs.getDouble("product_price"));
						row.setQuantity(item.getQuantity());
						products.add(row);
					}
				}
			}
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		return products;
	
	}
	
	
	public double getTotalPrice(ArrayList<Cart> cartList) {
		double sum = 0;
		
		try {
			if(cartList.size() > 0) {
				for(Cart item:cartList) {
					query = "select product_price from products where product_id=?";
					pst = this.con.prepareStatement(query);
					pst.setInt(1, item.getId());
					rs = pst.executeQuery();
					
					while(rs.next()) {
						sum = sum + (rs.getDouble("product_price") * item.getQuantity());
					}
				}
			}
			
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return sum;
	}
		public Product getSingleProduct(int id) {
		Product row = null;
		try {
			query = "select * from products where product_id=?";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
			while(rs.next()) {
				row = new Product();
				row.setId(rs.getInt("product_id"));
				row.setTitle(rs.getString("product_title"));
				//row.setImage(rs.getString("product_image"));
				row.setPrice(rs.getDouble("product_price"));
				row.setCategory(rs.getString("product_category"));
				
				
			}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		return row;
	}
}


