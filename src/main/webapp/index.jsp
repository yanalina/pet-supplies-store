<%@page import="pets.connection.DbCon"%>
<%@page import="pets.dao.*"%>
<%@page import="pets.model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%
	String cat = request.getParameter("category");
	String subcat = request.getParameter("subcategory");
	
	ProductDao pd = new ProductDao(DbCon.getConnection());
	List<Product> products = null;
	
	if (cat != null && !cat.trim().equals("all")) {
		int categoryId = Integer.parseInt(cat.trim());
		products = pd.getAllProductsById(categoryId);
	} else if (subcat != null) {
		int subcategoryId = Integer.parseInt(subcat.trim());
		products = pd.getAllProductsByIdSub(subcategoryId);
	} else {
		products = pd.getAllProducts();
	}
	
	CategoryDao cd = new CategoryDao(DbCon.getConnection());
	SubcategoryDao sd = new SubcategoryDao(DbCon.getConnection());
	List<Category> categories = cd.getAllCategories();
	List<Subcategory> subcategories = sd.getAllSubcategories();
	
	@SuppressWarnings("unchecked")
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
%>

<% User user = (User) request.getSession().getAttribute("logUser");
	if(user != null){
		request.setAttribute("logUser", user);
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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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

		<a class="navbar-brand" href="index.jsp"> <img src="etc-imgs/pngcatdog.png" height="80" alt="cat and dog">
		</a>
		
		<div class="search-container">
			<form action="viewSearch.jsp">
				<input type="text" placeholder="Search..." name="search"/>
				<button type="submit"><i class="fa fa-search"></i></button>
			</form>
		</div>
		
		<ul class="navbar-nav ml-auto">
			<li class="nav-item"><a class="nav-link" href="index.jsp"><img src= "etc-imgs/home icon.png" height="40"></a></li>
			<% if(cart_list != null){%>
			
			<li class="nav-item"><a class="nav-link" href="cart.jsp"><img src="etc-imgs/car icon.png"  style="
    width: 40px;
    height: 40px;
">
				<span class="badge badge-danger"> ${cart_list.size()}</span>
				
			</a></li>
			<%}else{
				%>
				
			<li class="nav-item"><a class="nav-link" href="cart.jsp"><img src="etc-imgs/car icon.png"  style="
    width: 40px;
    height: 40px;
">
			<span class="badge badge-danger"></span></a></li> 
			    <%} %>

			</a></li>
			<%if (user != null){%>
				
				<li class = "nav-item"><a class = "nav-link" href = "LogoutServlet"><img src= "etc-imgs/logout.png" height="40"></a></li>

				<li class="nav-item"><a class="nav-link" href="account.jsp"> <img src= "etc-imgs/login icon.png" height ="40"></a></li>

			<% }else{ %>
				<li class="nav-item"><a class="nav-link" href="login.jsp"><img src= "etc-imgs/login icon.png" height ="40">  </a></li>
			<%} %>
		</ul>
	</nav>
	
	<!-- Text at the Top of the Page -->
	
	<div class="jumbotron p-0 jumbotron-fluid ">
	<img class="img-responsive img-fluid d-none d-lg-block" src="etc-imgs/Background for banner1.jpg">
	<img class="img-responsive img-fluid d-md-none" src="etc-imgs/bck4.jpg">
	<img class="img-responsive img-fluid d-none d-md-block d-lg-none" src="etc-imgs/bck3.jpg">
	<img class="img-responsive img-fluid d-none d-xs-block d-md-none" src="etc-imgs/bck4.jpg">
	</div>
	
	<hr>
	
	
	<!-- ============== Main Page Content ============== -->
	
	<section class="padding-y">
		<div class="container-fluid">

		<div class="row">
		<aside class="col-lg-3">

	<!-- ===== Card for the Sidebar Filter ===== -->
	
	<div class="card d-lg-block mb-5">

  		
  		
    		<header class="card-header">
      			<h5>CATEGORIES</h5>
    		</header>
    			
	      			<div class="card-body">
	        			<ul class="list-unstyled text-center">
	        		
	          				<li><a href="index.jsp?category=all"><img src="banner-imgs/All products.jpg" class="img-fluid"></a></li>
	          			
	          				<%
							for (Category c : categories) {
							%>
	          		
	          				<li><a href="index.jsp?category=<%= c.getCategoryId() %>"><img src="banner-imgs/<%= c.getCategoryBanner() %>" class="img-fluid"></a></li>
	          			
	          				<%
							}
							%>
	          			
	        			</ul>
	      			</div>
	      
    
    
	    	<header class="card-header d-none d-lg-block d-xl-block">
	      		<h5>SUBCATEGORIES</h5>
	    	</header>
	    	
	      		<div class="card-body d-none d-lg-block d-xl-block">
	        	<ul class="list-unstyled d-none d-lg-block d-xl-block text-center">
	          		
	          		<%
						for (Subcategory s : subcategories) {
					%>
	          		
	          		<li><a href="index.jsp?subcategory=<%= s.getSubcategoryId() %>"><img src="banner-imgs/<%= s.getSubcategoryBanner() %>" class="img-fluid"></a></li>
	          			
	          		<%
						}
					%>
	          		
	        	</ul>
	      		
	    	    </div>
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
				out.println("No items were found.");
				}
			%>
        
    </div>
        
    <!-- ========= END List of Products ========= -->
        
    <hr>
			
	<footer class="d-flex mt-4">
	      <div>
		<a href="javascript: history.back()" class="btn btn-light"> &laquo; Go back</a>
	      </div>
	</footer>

    

		</main>
	</div>
	</div>
	</section>
	
</body>
</html>
