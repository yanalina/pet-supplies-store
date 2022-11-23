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
	<input type = "hidden" id = "status" value = "<%=request.getAttribute("status") %>">
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
	    	
	    	<script src="vendor/jquery/jquery.min.js"></script>
		<script src="js/main.js"></script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		<link rel="stylesheet" href="alert/dist/sweetalert.css">
		
		<!-- Javascript Code for Error Message -->
		<script type = "text/javascript">
			var status = document.getElementById("status").value;
			if(status == "regFailed"){
				swal("Unable to Create Account", "Email entered is already registered", "error");
			}
		
		</script>
		<!-- END Javascript Code -->
	    
	</body>
	
</html>
