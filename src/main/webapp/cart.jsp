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
<link href="CartStyle.css" rel="stylesheet">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css">
	
	
		<!-- Links for Navbar -->	
		
	
	 <link rel="stylesheet" href=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src=
"https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
    </script>
    <script src=
"https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">
    </script>
    <script src=
"https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
    </script>
    
    
    
    
    
</head>
<body>

	
	
					<!-- Navbar -->
	
	 <nav class="navbar navbar-expand-sm bg-light">
	    
	   	<a class="navbar-brand" href="#"> <img
			src="/docs/4.0/assets/brand/bootstrap-solid.svg" width="30"
			height="30" alt="">
		</a>
	    
  
        <ul class="navbar-nav ml-auto">
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                  Home
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="cart.jsp">
                  Cart<span class="badge badge-danger"> ${cart_list.size()}</span>
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="">
                  Login
                </a>
            </li>
            
             <li class="nav-item">
                <a class="nav-link" href="">
                  Account
                </a>
            </li>
        </ul>
    </nav>


		<!-- Displays all added products -->
	<div class="wrapper">
		<h1>Shopping Cart</h1>
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

						<form action="#" method="post" class="form-inline">


							<p class="unit">
								Quantity: <input type="hidden" name="id" value="1"
									class="form-input"> <a class="btn bnt-sm btn-decre"
									href="quantity-inc-dec?action=dec&product_id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a> <input size="1" type="text"
									name="quantity" class="form-control"
									value="<%=c.getQuantity()%>" readonly> <a
									class="btn btn-sm btn-incre"
									href="quantity-inc-dec?action=inc&product_id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a>

							</p>
						</form>
						<p class="btn-area">
							<i aria-hidden="true" class="fa fa-trash"></i> <a class="btn2"
								href="remove-from-cart?product_id=<%=c.getId()%>">Remove</a>
						</p>
					</div>
				</div>
				<%
				}
				}
				%>


			</div>


              <!-- Right bar of cart -->  
			<div class="right-bar">

				<p>
					<span>Total:</span> <span>$${ (total > 0) ?
						decFormat.format(total) : 0}</span>
				</p>
				<a href="Checkout.jsp"><i class="fa fa-shopping-cart"></i>Checkout</a>
			</div>
		</div>
	</div>


</body>
</html>
