package pets.servlet;

import java.io.IOException;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class WelcomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession mySession = request.getSession();
		String email = (String)mySession.getAttribute("email");
		String name = (String)mySession.getAttribute("name");
		RequestDispatcher dispatcher = null;
		
		
		
		if(email!=null || !email.equals("")) {
			

			String to = email;
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication("your_email", "your_password");
																							
				}
			});
			
			try {
				MimeMessage message = new MimeMessage(session);
				message.setFrom(new InternetAddress(email));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject("Welcome to Paws and Whiskers!");
				
				BodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setText(name + ", Thank you for creating an account!");
				
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);
				
				messageBodyPart = new MimeBodyPart();
				String filename = "C:\\Users\\Jacqueline\\eclipse-workspace\\Test Project 7 with edit information\\src\\main\\webapp\\welcome-img\\cat_and_dog.png";
				DataSource source = new FileDataSource(filename);
				messageBodyPart.setDataHandler(new DataHandler(source));
				messageBodyPart.setFileName(filename);
				multipart.addBodyPart(messageBodyPart);
				
				message.setContent(multipart);
				
				
				//message.setText("Thank you for creating an account " + name + "! Paws and whiskers strives to become your #1 online shop for all your pet needs.");
				
				Transport.send(message);
				System.out.println("message sent successfully");
			}

			catch (MessagingException e) {
				throw new RuntimeException(e);
			}
			
			request.setAttribute("status", "regSuccess");
			dispatcher = request.getRequestDispatcher("login.jsp");
			 
			dispatcher.forward(request, response);
			
		}
		
	}

}
