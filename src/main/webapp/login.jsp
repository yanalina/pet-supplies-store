<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="loginStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    	
    	<input type = "hidden" id = "status" value = "<%=request.getAttribute("status") %>">
    	
    	<a class="nav-link" href="index.jsp"><img src= "etc-imgs/home icon.png" height="80"></a>
    	
        <div class="container">
            <div class="regbox box">
                <img class="avatar" src="login-img/cat.png">
                <h1>Login</h1>
				
				<form action="LoginServlet" method="post">
                    <p>Email</p>
					<input type="text" placeholder="email" name="email" required>
                    
                    <p>Password</p>
					<input type="password" placeholder="password" name="password" required>
					
                    <input type="submit" value="Login">
                    
                    <a href="#">Forget Password?</a><br>
                    <a href="registration.jsp">Create New Account?</a>
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
			if(status == "failed"){
				swal("Sorry", "Wrong Email or Password", "error");
			}
			if (status == "resetSuccess"){
				swal("Success", "Password reset successfully", "success");
			}
			if (status == "regSuccess"){
				swal("Success", "Account created successfully", "success");
			}
			if(status == "resetFailed"){
				swal("Sorry", "Unable to reset password. Account not found.", "error");
			}
		
		</script>
		<!-- END Javascript Code -->
	
	</body>
</html>
