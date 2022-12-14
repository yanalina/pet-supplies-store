package pets.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import pets.model.Cart;


@SuppressWarnings("unused")//for one of the imports
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;chartset=UTF-8");
		
		try(PrintWriter out = response.getWriter()){
			ArrayList<Cart> cartList = new ArrayList<>();
		
			int id = Integer.parseInt(request.getParameter("product_id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			
			HttpSession session = request.getSession();
			@SuppressWarnings("unchecked")//for (ArrayList<Cart>) session.getAttribute("cart-list");
			ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
				session.setAttribute("cart-list", cartList);
				response.sendRedirect("index.jsp");
			}
			else {
				cartList = cart_list;
				boolean exist = false;
				
				for(Cart c:cart_list) {
					if(c.getId() == id) {
						exist = true;
						response.sendRedirect("cart.jsp");
					}
				}
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("index.jsp");
				}
			}
		}
	}

}
