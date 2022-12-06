package pets.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pets.connection.DbCon;
import pets.dao.OrderDao;
import pets.model.*;


import java.io.IOException;
import java.io.PrintWriter;

import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;


public class CheckoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		HttpSession mySession = request.getSession();
		
		try(PrintWriter out = response.getWriter()){
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date date = new Date();
			//order.setDate(formatter.format(date));
			
			@SuppressWarnings("unchecked")
			ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
			User user = (User) request.getSession().getAttribute("logUser");
			
			if(cart_list != null && user != null) {
				
				for(Cart c : cart_list) {
					Order order = new Order();
					order.setId(c.getId());
					order.setUserId(user.getId());
					order.setProductQuantity(c.getQuantity());
					order.setDate(formatter.format(date));
					order.setCreditCard(request.getParameter("creditCard"));
					order.setName(request.getParameter("uname"));
					order.setAddress(request.getParameter("uaddress"));
					order.setNumber(request.getParameter("uphone"));
					order.setEmail(request.getParameter("uemail"));
					//id = c.getId();
					//prodDate = formatter.format(date);
					//prodQuantity = c.getQuantity();
					
					OrderDao orderDao = new OrderDao(DbCon.getConnection());
					boolean result = orderDao.createOrder(order);
					if(!result) {
						break;
					}
				}
				String email = user.getEmail();
				String name = user.getName();
				String orderDate = formatter.format(date);
				dispatcher = request.getRequestDispatcher("OrderConfirmationServlet");
				mySession.setAttribute("email", email);
				mySession.setAttribute("order-date", orderDate);
				mySession.setAttribute("name", name);
				cart_list.clear();
				dispatcher.forward(request, response);
			}
			else {
				if(user == null) {
					response.sendRedirect("login.jsp");
				}
				else {
					response.sendRedirect("cart.jsp");
				}
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}


}
