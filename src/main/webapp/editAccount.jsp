<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="pets.model.*"%>
    
<% User user = (User) request.getSession().getAttribute("logUser");
	if(user != null){
		request.setAttribute("logUser", user);
	}

%>

<!DOCTYPE html>
<html>
<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Account Details</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="registrationStyle.css" rel="stylesheet" type="text/css"/>
	</head>
	
    <body>
        <div class="container">
            <div class="regbox box">
                <img class = "avatar" src="login-img/cat.png">
                <h1>Edit Account Details</h1>
				<form action="UpdateServlet" method="post">
				
                    <p>Name</p>
					<input type="text" value= "<%=user.getName() %>" name="name" required>
					
					<p>Address</p>
					<input type = "text" value = "<%=user.getAddress() %>" name = "address" required>
					
					<p>City</p>
					<input type = "text" value = "<%=user.getCity() %>" name = "city" required>
					
					<p>ZipCode</p>
					<input type = "text" value = "<%=user.getZip() %>" name = "zip" required>
					
                   	<p>Email</p>
					<input type="text" value = "<%=user.getEmail() %>" name="email" required>
					
					<p>Phone</p>
					<input type = "text" value = "<%=user.getPhone() %>" name = "phone" required>
					
                   	<p>Password</p>
					<input type="password" value = "<%=user.getPassword() %>" name="password" required>
					
                   	<input type="submit" value="Save">
                   
                  	<a href="account.jsp">Back to Account</a>
                   
                </form>
			</div>
		</div>
		
	</body>
</html>
