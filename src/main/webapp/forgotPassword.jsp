<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Forgot Password</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="passwordStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    	
        <div class="container">
            <div class="regbox box">
          
                <h1>Forgot your Password?</h1>
                <form action="ForgotPasswordServlet" method="post">
                   <p>Email</p>
		   <input type="text" placeholder="enter registered email" name="email" required>
       
					
                  <input type="submit" value="Send email">
                  <a href = "login.jsp">Go back to login</a><br>
                  <a href="registration.jsp">Create New Account?</a>
              	</form>
              	 
	     </div>
	</div>
		
		
		
		
	
	</body>
</html>
