package pets.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import pets.model.*;

public class OrderDao {
	private Connection con;
	private String query;
	private PreparedStatement pst;
	private ResultSet rs;
	
	public OrderDao(Connection con) {
		this.con = con;
	}
	
	public boolean createOrder(Order ord) {
		boolean result = false;
		try {
			query = "insert into orders (product_id, user_id, order_quantity, order_date, user_credit, user_name, user_address, user_number, user_email) values(?,?,?,?,?,?,?,?,?)";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, ord.getId());
			pst.setInt(2, ord.getUserId());
			pst.setInt(3, ord.getProductQuantity());
			pst.setString(4, ord.getDate());
			pst.setString(5, ord.getCreditCard());
			pst.setString(6, ord.getName());
			pst.setString(7, ord.getAddress());
			pst.setString(8, ord.getNumber());
			pst.setString(9, ord.getEmail());
			pst.executeUpdate();
			result = true;
		}
		catch(Exception e) {
			
			e.printStackTrace();
		}
		
		
		return result;
	}
	
	public List<Order> userHistory(int id){
		List<Order> list = new ArrayList<Order>();
		try {
			query = "select * from orders where user_id=? order by orders.order_id desc";
			pst = this.con.prepareStatement(query);
			pst.setInt(1, id);
			rs = pst.executeQuery();
		while(rs.next()) {
			Order order = new Order();
			ProductDao pDao = new ProductDao(this.con);
			int pID = rs.getInt("product_id");
			
			Product product = pDao.getSingleProduct(pID);
			order.setOrderId(rs.getInt("order_id"));
			order.setId(pID);
			order.setTitle(product.getTitle());
			order.setCategory(product.getCategory());
			order.setPrice(product.getPrice() * rs.getInt("order_quantity"));
			order.setProductQuantity(rs.getInt("order_quantity"));
			order.setDate(rs.getString("order_date"));
			order.setName(rs.getString("user_name"));
			//order.setCreditCard(rs.getString("user_credit"));
			list.add(order);
		}
		}
		catch(Exception e){
			e.printStackTrace();
		}
		
		return list;
		
	}
}
