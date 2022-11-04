<%@page import="pets.connection.DbCon"%>
<%@page import="pets.dao.ProductDao"%>
<%@page import="pets.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

@SuppressWarnings("unchecked")
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pet Supplies Store</title>
<link rel="stylesheet" href="style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="css/ui.css?v=2.0" rel="stylesheet" type="text/css" />
<link href="css/responsive.css?v=2.0" rel="stylesheet" type="text/css" />
<link href="fonts/fontawesome/css/all.min.css" type="text/css" rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
	
<!-- Links for Navbar -->

<link rel="stylesheet" href="NavStyle.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js">
</script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js">	
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js">
</script>
</head>
<body>
	
	<!-- Nav bar -->
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
			</a></li>
			<li class="nav-item"><a class="nav-link" href=""> Login </a></li>

			<li class="nav-item"><a class="nav-link" href=""> Account </a></li>
		</ul>
	</nav>
	
	<!-- Text at the Top of the Page -->
	
	<div class="jumbotron jumbotron-fluid">
	  <div class="container text-center">
	    <h1 class="display-4">Paws and Whiskers</h1>
	    <p class="lead">Everything for your pet's needs. Browse and shop our latest products.</p>
	  </div>
	</div>
	
	<hr>
	
	
	<!-- ============== Main Page Content ============== -->
	
	<section class="padding-y">
		<div class="container">

		<div class="row">
		<aside class="col-lg-3">

		<button class="btn btn-outline-secondary mb-3 w-100  d-lg-none" data-bs-toggle="collapse" data-bs-target="#aside_filter">Show filter</button>

	<!-- ===== Card for the Sidebar Filter ===== -->
	
	<div id="aside_filter" class="collapse card d-lg-block mb-5">

  		<article class="filter-group">
    		<header class="card-header">
      			<a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside1">
        		All Categories <span class="material-symbols-outlined">expand_more</span>
      			</a>
    		</header>
    	<div class="collapse show" id="collapse_aside1">
      		<div class="card-body">
        		<ul class="list-unstyled">
          			<li><a href="#">Food</a></li>
          			<li><a href="#">Toys</a></li>
          			<li><a href="#">Grooming</a></li>
          			<li><a href="#">Treatment</a></li>
        		</ul>
      		</div>
    	</div> 
    
    
    	<header class="card-header">
      		<a href="#" class="title" data-bs-toggle="collapse" data-bs-target="#collapse_aside2">
        		All Sub Categories
      		</a>
    	</header>
    	<div class="collapse show" id="collapse_aside1">
      		<div class="card-body">
        	<ul class="list-unstyled">
          		<li><a href="#">Cat Food</a></li>
          		<li><a href="#">Cat Toys</a></li>
          		<li><a href="#">Cat Grooming</a></li>
          		<li><a href="#">Cat Treatment</a></li>
        	</ul>
      		</div>
    	</div>
  		</article>
 	</div>
 	</aside>
 
 	<!-- ===== END Card for the Sidebar Filter ===== -->



	<!-- ========= List of Products ========= -->
	
	<main class="col-lg-9">
    <div class="row ">
    
    		<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
    
        <div class="col-lg-4 col-md-6 col-sm-6 d-flex align-items-stretch">
        	
          <figure class="card w-100">
            <img class="img-wrap" src="product-images/<%=p.getImage() %>" alt="Product Image">
            <div class="card-body d-flex flex-column">
              <h5 class="card-title"><%=p.getTitle() %></h5>
							<div class="pt-2">
								<span class="tag"><%=p.getSubcategory() %></span>
							</div>
							<div class="pt-3">
								<p class="card-text"><%=p.getDescription() %></p>
							</div>
							<div class="pt-2">
								<h3 class="price">Price: $<%=p.getPrice() %></h3>
							</div>
							<div class="mt-auto d-flex justify-content-between">
								<a class="btn btn-dark" href="add-to-cart?product_id=<%=p.getId()%>">Add to Cart</a>
							</div>
							
            </div>
          </figure>
        </div>
        
        	<%
			}
			} else {
			out.println("There is no products");
			}
			%>
        
    </div>
        
    <!-- ========= END List of Products ========= -->
        
    <hr>


	<!-- ========= Pagination ========= -->

    <footer class="d-flex mt-4">
      <div>
        <a href="javascript: history.back()" class="btn btn-light"> &laquo; Go back</a>
      </div>
      <div class="ms-3">
        <ul class="pagination">
          <li class="page-item"><a class="page-link" href="#">1</a></li>
          <li class="page-item active" aria-current="page">
            <span class="page-link">2</span>
          </li>
          <li class="page-item"><a class="page-link" href="#">3</a></li>
          <li class="page-item">
            <a class="page-link" href="#">Next</a>
          </li>
        </ul>
      </div>
    </footer>
    
    <!-- ========= END Pagination ========= -->

    

		</main>
	</div>
	</div>
	</section>
	
</body>
</html>
