<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<% %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Password</title>
        <link href="https://fonts.googleapis.com/css?family=ZCOOL+XiaoWei" rel="stylesheet">
        <link href="passwordStyle.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
    	
    	
    	
    	
    	
        <div class="container">
            <div class="regbox box">
               
                <h1>Reset Password</h1>
				
		<form action="NewPasswordServlet" method="post">
                 
                    <p>Password</p>
		    <input type="text" placeholder="password" name="password" required>
                    
                    <p>Confirm Password</p>
		    <input type="password" placeholder="confirm password" name="confPassword" required>
					
                    <input type="submit" value="Reset">
                    
                    
              	 </form>
              	 
	     </div>
	</div>
		
		
	
	</body>
</html>
