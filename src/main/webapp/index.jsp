<% 
	if(session.getAttribute("name")==null){
		response.sendRedirect("login.jsp");
	}
%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Airline Reservation System</title>

<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
<!-- Font Awesome icons (free version)-->
<script src="https://use.fontawesome.com/releases/v5.15.4/js/all.js"
	crossorigin="anonymous"></script>
<!-- Google fonts-->
<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700"
	rel="stylesheet" type="text/css" />
<link
	href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic"
	rel="stylesheet" type="text/css" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="css/index-styles.css" rel="stylesheet" />

<link rel="stylesheet" href="alert/dist/sweetalert.css">
</head>
<body id="page-top">

	<!-- Navigation-->
	<nav
		class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand" href="#page-top">Flight Reservation</a>
			<button
				class="navbar-toggler text-uppercase font-weight-bold bg-primary text-white rounded"
				type="button" data-bs-toggle="collapse"
				data-bs-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				Menu <i class="fas fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ms-auto">
						
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="#contact">Contact</a></li>
					<li class="nav-item mx-0 mx-lg-1"><a
						class="nav-link py-3 px-0 px-lg-3 rounded" href="logout">Logout</a></li>
						<img class="masthead-avatar mb-5 " src="assets/img/avataaars.svg" width=50 height=50
				alt="..." />
					<li class="nav-item mx-0 mx-lg-1 "><a
						class="nav-link py-13px-0 px-lg-3 rounded" href="logout"><%= session.getAttribute("name") %></a></li>
					
				</ul>
			</div>
		</div>
	</nav>
	<!-- Masthead-->
	<header class="masthead bg-primary text-white text-center">
		<div class="container d-flex align-items-center flex-column">
			<!-- Masthead Avatar Image-->
			
			<!-- Masthead Heading-->
			<h1 class="masthead-heading text-uppercase mb-0">Let's Travel</h1>
			<!-- Icon Divider-->
			<div class="divider-custom divider-light">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			<!-- Masthead Subheading-->
			<p class="masthead-subheading font-weight-light mb-0">Book Your Tickets Now</p>
		</div>
	</header>
	<input type="hidden" id="status" value="<%= request.getAttribute("status") %>;">
	<!-- Portfolio Section-->
	<section class="page-section portfolio" id="portfolio">
		<div class="container">
			<!-- Portfolio Section Heading-->
			<h2
				class="page-section-heading text-center text-uppercase text-secondary mb-0">Flight Booking</h2>
			<!-- Icon Divider-->
			<div class="divider-custom">
				<div class="divider-custom-line"></div>
				<div class="divider-custom-icon">
					<i class="fas fa-star"></i>
				</div>
				<div class="divider-custom-line"></div>
			</div>
			

        <form method="post" action="flight"  >

            <!-- Flight Booking Section -->
            <h2>Flight Booking</h2>
            <label for="departure">Departure City:</label>
            <input type="text" id="departure" name="departure" required>
<br><br>
            <label for="destination">Destination City:</label>
            <input type="text" id="destination" name="destination" required>
<br><br>
            <label for="date">Departure Date:</label>
            <input type="date" id="date" name="date" required>
<br><br>
            <div class="form-group form-button">
				<input type="submit" name="book" id="book"
						class="form-submit" value="submit" />
			</div>
            <br><br>
            
        </form>
        <input type="hidden" id="status" value="<%= request.getAttribute("status") %>;">
        
			</div>

	</section>
	
	<!-- Footer-->
	<footer class="footer text-center">
		<div class="container">
			<div class="row">
				<!-- Footer Location-->
				<div class="col-lg-4 col-md-6 mb-5 mb-md-0">
				</div>
				<!-- Footer Social Icons-->
				<div class="col-lg-4 mb-5 mb-lg-0">
					<h4 class="text-uppercase mb-4">Around the Web</h4>
					<a class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-facebook-f"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-twitter"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-linkedin-in"></i></a> <a
						class="btn btn-outline-light btn-social mx-1" href="#!"><i
						class="fab fa-fw fa-dribbble"></i></a>
				</div>
				<!-- Footer About Text-->
				<div class="col-lg-4">
				</div>
			</div>
		</div>
	</footer>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

    <%
        String status = (String) session.getAttribute("status");
        session.removeAttribute("status"); // Remove the status attribute after retrieving it

        if (status != null) {
            // Display SweetAlert message based on the status
            if (status.equals("failed")) {
                %>
                <script type="text/javascript">
                    document.addEventListener('DOMContentLoaded', function () {
                        swal("Failed", "No flights available.", "error");
                    });
                </script>
                <%
            } else if (status.equals("success")) {
                %>
                <script type="text/javascript">
                    document.addEventListener('DOMContentLoaded', function () {
                        swal("Success", "Your booking was successful!", "success");
                    });
                </script>
                <%
            }
        }
    %>


</body>
</html>


