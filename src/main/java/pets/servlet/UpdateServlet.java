package pets.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import pets.connection.DbCon;
import pets.dao.UserDao;
import pets.model.User;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet RegisterServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            
            
            
            String name = request.getParameter("name");
            String address = request.getParameter("address");
            String city = request.getParameter("city");
            String zip = request.getParameter("zip");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String password = request.getParameter("password");
           
            HttpSession mySession = request.getSession();
            User user = (User)mySession.getAttribute("logUser");
            user.setName(name);
            user.setAddress(address);
            user.setCity(city);
            user.setZip(zip);
            user.setEmail(email);
            user.setPhone(phone);
            user.setPassword(password);
            
            UserDao upUser = null;
            
            try {
				upUser = new UserDao(DbCon.getConnection());
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
            
            if(upUser.updateUser(user)) {
            	request.setAttribute("status", "upSuccess");
                RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
                rd.forward(request,response);
                out.println("Updated to DB");
            }
            else {
            	request.setAttribute("status", "upFailed");
            	RequestDispatcher rd = request.getRequestDispatcher("account.jsp");
            	rd.forward(request, response);
            	out.println("Not Updated");
            	
            }
           
            
            out.println("</body>");
            out.println("</html>");
        }
    }

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }


}
