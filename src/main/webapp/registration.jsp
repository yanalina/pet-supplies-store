<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account Page</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="registrationStyle.css" rel="stylesheet" type="text/css"/>
	</head>
	
    <body>
        <div class="container">
            <div class="regbox box">
                <img class = "avatar" src="login-img/cat.png">
                <h1>Create an Account</h1>
				<form action="RegisterServlet" method="post">
				
                    <p>Name</p>
					<input type="text" placeholder="name" name="name" required>
					
					<p>Address</p>
					<input type = "text" placeholder = "address" name = "address" required>
					
					<p>City</p>
					<input type = "text" placeholder = "city" name = "city" required>
					
					<p>ZipCode</p>
					<input type = "text" placeholder = "zip" name = "zip" required>
					
                   	<p>Email</p>
					<input type="text" placeholder="email" name="email" required>
					
					<p>Phone</p>
					<input type = "text" placeholder = "phone" name = "phone" required>
					
                   	<p>Password</p>
					<input type="password" placeholder="password" name="password" required>
					
                   	<input type="submit" value="Register">
                   
                  	<a href="login.jsp">Already have Account?</a>
                   
                </form>
			</div>
		</div>
	</body>
	
</html>
