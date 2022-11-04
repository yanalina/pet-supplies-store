<%@page language = "java" contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="pets.model.*"%>

<% User user = (User) request.getSession().getAttribute("logUser");
	if(user != null){
		request.setAttribute("logUser", user);
	}

%>

<%
@SuppressWarnings("unchecked")
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--  <link href = "navstyle.css" rel = "stylesheet" type = "text/css">-->
        <link rel = "stylesheet" type = "text/css" href = "https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">
        <link rel = "stylesheet" href = "accountStyle.css">
        
        <!-- Links for Navbar -->

  		<link rel="stylesheet" href="NavStyle.css">

		<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
		</script>
		<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
	
		</script>
		<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
		</script>
        
        <title>Account Page</title>
    </head>
    <body>
    
		<nav class="navbar navbar-expand-sm bg-light">

			<a class="navbar-brand" href="#"> <img
			src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30"
			height="30" alt="">
			</a>


			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" href="index.jsp">
					Home </a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">
					Cart<span class="badge badge-danger"> ${cart_list.size()}</span>
					</a>
				</li>
				<%if (user != null){%>
				
				<li class = "nav-item"><a class = "nav-link" href = "LogoutServlet">Logout</a></li>

				<li class="nav-item"><a class="nav-link" href="account.jsp"> Account </a></li>

				<% }else{ %>
				<li class="nav-item"><a class="nav-link" href="login.jsp"> Login </a></li>
				<%} %>
			
			</ul>
		</nav>
  		
  		<div class = "container">
  			<div class = "main">
  			
  				<!--  ----------Side Bar----------------- -->
  				<div class = "row">
  					<div class = "col-md-4 mt-1">
  						<div class = "card text-center sidebar">
  							<div class = "card-body">
  								<img src = "login-img/cat.png" class = "rounded-circle" width = "150">
  								<div class = "mt-3">
  									<h3>Welcome, <%= user.getName() %></h3>
  									<h2><a href = "#">Edit Personal Info</a></h2>
  									<h2><a href="LogoutServlet">Log Out</a></h2>
  								</div>
  							</div>
  						</div>
  					</div>
  					
  					<!--  ---------- END of Side Bar----------------- -->
  					
  					
  					<!-- -----------Personal Information Card---------- -->
  					<div class = "col-md-8 mt-1">
  						<div class = "card mb-3 content">
  							<h1 class = "m-3 pt-3">Personal Information</h1>
  							<div class = "card-body">
  								<div class = "row">
  									<div class = "col-md-3">
  										<h5>Full Name</h5>
  									</div>
  									<div class = "col-md-9 text-secondary">
  										<%= user.getName() %>
  									</div>
  								</div>
  								<hr>
  								<div class = "row">
  									<div class = "col-md-3">
  										<h5>Email</h5>
  									</div>
  									<div class = "col-md-9 text-secondary">
  										<%= user.getEmail() %>
  									</div>
  								</div>
  								<hr>
  								<div class = "row">
  									<div class = "col-md-3">
  										<h5>Phone</h5>
  									</div>
  									<div class = "col-md-9 text-secondary">
  										<%=user.getPhone() %>
  									</div>
  								</div>
  								<div class = "row">
  									<div class = "col-md-3">
  										<h5>Address</h5>
  									</div>
  									<div class = "col-md-9 text-secondary">
  										<%=user.getAddress() %> <%out.print(" "); %> <%=user.getCity() %> <%out.print(" "); %> <%=user.getZip() %>
  									</div>
  								</div>
  							</div>
  						</div>
  						
  						<!-- -----------END of Personal Information Card---------- -->
  						
  						<!-- ----------------Order History Card----------------- -->
  						<div class = "card mb-3 content">
  							<h1 class = "m-3">Order History</h1>
  							<div class = "card-body">
  								<div class = "row">
  									<div class = "col-md-3">
  										<h5><a href = "#">Order Date</a></h5>
  									</div>
  									<div class = "col-md-9 text-secondary">
  										Order No.
  									</div>
  								</div>
  							</div>
  						</div>
  						
  						<!-- ---------------END of Order History Card------------ -->
  						
  					</div>
  				</div>
  			</div>
  		</div> 
        
    </body>
</html>
