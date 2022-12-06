package pets.servlet;

import java.io.IOException;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Properties;


import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


/**
 * 
 */
public class OrderConfirmationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession mySession = request.getSession();
		String email = (String)mySession.getAttribute("email");
		String orderDate = (String)mySession.getAttribute("order-date");
		String name  = (String)mySession.getAttribute("name");
		//DecimalFormat decFormat = new DecimalFormat("#.##");
		double totalPrice = (double)mySession.getAttribute("total-price");
		
		//(totalPrice > 0) ? decFormat.format(totalPrice) : 0;
		//if(totalPrice > 0) {                   //if formatting fails
			//decFormat.format(totalPrice);
		//}
		RequestDispatcher dispatcher = null;
		
		

		
		if(email!=null || !email.equals("")) {


			String to = email;// change accordingly
			// Get the session object
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("email here", "app password here");// Put your email
																									// id and
																									// password here
				}
			});
			// compose message
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));// change accordingly
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Order confirmation");
				message.setText("Thank you for placing an order at Paws and Whiskers, " + name + ", on " + orderDate + "\nYour Total Price: " +totalPrice);
				//message.setText("Total Price: " + totalPrice);
				System.out.println(totalPrice);
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			dispatcher = request.getRequestDispatcher("index.jsp");
 
			dispatcher.forward(request, response);
	
		}
		
	}

}
