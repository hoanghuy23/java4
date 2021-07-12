<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!doctype html>
<html lang="en">
<head>
<title>${page.title }</title>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<base href="/WebVideo/" />
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
	<main style="background: url('images/backround.jpg'); background-size: cover;"> 
	
	<nav class="row" style="margin-left: 1px;">
		<nav class="col navbar navbar-expand-sm navbar-light bg-light">
			<a class="navbar-brand" href="HomepageServlet">ONLINE ENTERTAIMENT</a>
			<button class="navbar-toggler d-lg-none" type="button"
				data-toggle="collapse" data-target="#collapsibleNavId"
				aria-controls="collapsibleNavId" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavId">
				<ul class="navbar-nav mr-auto mt-2 mt-lg-0">
					<li class="nav-item active"><a class="nav-link" href="MyFavoriteServlet"><i
							class="fa fa-comments" aria-hidden="true"></i><span
							class="sr-only">(current)</span> MY FAVORITES</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdownId"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i
							class="fa fa-user" aria-hidden="true"></i> MY ACCOUNT</a>
						<div class="dropdown-menu" aria-labelledby="dropdownId">
						<c:if test="${not isLogin }">
							<a class="dropdown-item" href="LoginServlet">Login</a> 
							<a class="dropdown-item" href="ForgotPasswordServlet">Forgot Password</a> 
							<a class="dropdown-item" href="RegistrationServlet">Registration</a>
						</c:if> 
						<c:if test="${isLogin }">
							<a class="dropdown-item" href="LogoffServlet">Logoff</a> 
							<a class="dropdown-item" href="ChangePasswordServlet">Change Password</a>
							<a class="dropdown-item" href="EditProfileServlet">Edit Profile</a>
						</c:if> 
						</div></li>
				</ul>
			</div>
		</nav>
		
	</nav>
	<header class="row">
		<!-- <div class="col-9">
			<h1>Online Entertaiment</h1>
		</div>
		<div class="col-3 text-right">
			<img src="img/logo.png" alt="" class="mr-4">
		</div> -->
		<img alt="" src="images/kimetsu.jpg" class="img-fluid" width="100%">
	</header>
	<section class="row">
		<jsp:include page="${page.contentUrl }"></jsp:include>
	</section>
	<footer class="row">
		<div class="col text-center border-top mt-4 pt-2" style="height: 100px; line-height: 100px; background-color: aqua;">
			<strong>Fpt Polytechnic &copy;2021. All rights reserved.</strong>
		</div>
	</footer> </main>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>

	<c:if test="${not empty page.scriptUrl }">
		<jsp:include page="${page.scriptUrl }"></jsp:include>
	</c:if>

</body>
</html>
