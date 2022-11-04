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


public class LoginServlet extends HttpServlet {
	
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
           
            
            String logemail = request.getParameter("email");
            String logpass = request.getParameter("password");
            
            UserDao db = null;
			try {
				db = new UserDao(DbCon.getConnection());
			} catch (ClassNotFoundException e) {
				
				e.printStackTrace();
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
            
            User user = db.loguser(logemail, logpass);
            
            if(user!=null){
                HttpSession session = request.getSession();
                session.setAttribute("logUser", user);
                response.sendRedirect("account.jsp");
            }else{
            	
            	request.setAttribute("status", "failed");
            	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            	rd.include(request,response);
                
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
