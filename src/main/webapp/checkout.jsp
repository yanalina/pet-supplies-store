<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.util.*"%>
<%@page import="pets.model.*"%>
<%@page import="pets.connection.*"%>
<%@page import="pets.dao.*"%>
<%@page import="pets.servlet.*"%>
<%@page import="java.text.DecimalFormat"%>

<%
DecimalFormat decFormat = new DecimalFormat("#.##");
request.setAttribute("decFormat", decFormat);
@SuppressWarnings("unchecked") //for (ArrayList<Cart>) session.getAttribute("cart-list");
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalPrice(cart_list);
	request.setAttribute("total", total);
	request.setAttribute("cart_list", cart_list);
}
%>
<%
User user = (User) request.getSession().getAttribute("logUser");
if (user != null) {
	request.setAttribute("logUser", user);
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link href="NavStyle.css" rel="stylesheet" type="text/css" />
<title>CART</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" />
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="checkoutStyle.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">


<!-- Links for Navbar -->


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
	
</script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
	
</script>





</head>
<body>



	<!--------------------------- Navbar ---------------------->

	<nav class="navbar navbar-expand-sm bg-light">

		<a class="navbar-brand" href="#"> <img
			src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30"
			height="30" alt="">
		</a>


		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="index.jsp"><img src= "etc-imgs/home icon.png" height="40"></a></li>
			<li class="nav-item"><a class="nav-link" href="cart.jsp"><img src="etc-imgs/car icon.png"  style="
    width: 40px;
    height: 40px;
"></a></li>
			<%
			if (user != null) {
			%>

			<li class = "nav-item"><a class = "nav-link" href = "LogoutServlet"><img src= "etc-imgs/logout.png" height="40"></a></li>

			<li class="nav-item"><a class="nav-link" href="account.jsp"> <img src= "etc-imgs/login icon.png" height ="40"></a></li>

			<%
			} else {
			%>
			<li class="nav-item"><a class="nav-link" href="login.jsp"><img src= "etc-imgs/login icon.png" height ="40">  </a></li>
			<%
			}
			%>
		</ul>
	</nav>


	<!------------------- Displays all added products ------------------>
	<div class="wrapper">
		<h1>Checkout</h1>
		<div class="project">
			<div class="shop">


				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<div class="box">



					<div class="content">
						<h3><%=c.getTitle()%></h3>
						<h4>
							Price:
							<%=decFormat.format(c.getPrice())%></h4>



					</div>
				</div>
				<%
				}
				}
				%>


			</div>


			<!------------------ Right bar of cart -------------->
			<div class="right-bar">
				<p>
					<span>Total:</span> <span>$${ (total > 0) ?
						decFormat.format(total) : 0}</span>
				</p>

				<form action="CheckoutServlet" method="post" class="form-inline">


					<div class="col-12">
						<div class="d-flex flex-column">
							<p class="text mb-1">Name</p>
							<input class="form-control mb-3" type="text"
								value="<%=user.getName()%>" name="uname" placeholder="Name"
								required>
							<p class="text mb-1">Address</p>
							<input class="form-control mb-3" type="text"
								value="<%=user.getAddress()%> <%=user.getCity()%>"
								name="uaddress" placeholder="Address" required>
							<p class="text mb-1">Phone Number</p>
							<input class="form-control mb-3" type="text"
								value="<%=user.getPhone()%>" name="uphone"
								placeholder="Phone Number" required>
							<p class="text mb-1">Email</p>
							<input class="form-control mb-3" type="text"
								value="<%=user.getEmail()%>" name="uemail" placeholder="Email"
								required>
							<p class="text mb-1">Credit Card</p>
							<input class="form-control mb-3" type="text" name="creditCard"
								placeholder="Credit card " required>
						</div>
					</div>


					<div class="button">
						<button type="submit" class="btn btn-success">
							<i class="fa fa-shopping-cart"></i> Order Now
						</button>
					</div>
				</form>


			</div>
		</div>
	</div>


</body>
</html>
