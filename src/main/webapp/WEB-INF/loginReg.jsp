<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<title>HealthKeep</title>
<meta charset="UTF-8">
<meta name="msapplication-TileColor" content="#da532c">
<meta name="theme-color" content="#ffffff">
<link rel="apple-touch-icon" sizes="180x180"
	href="/images/apple-touch-icon.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/images/favicon-32x32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon-16x16.png">
<link rel="manifest" href="/images/site.webmanifest">
<link rel="mask-icon" href="/images/safari-pinned-tab.svg"
	color="#5bbad5">
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/bootstrap_overrides.css">
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark shadow">
			<a class="navbar-brand" href="/">Health<em>Keep</em></a>
		</nav>
	</header>

	<main>
		<div class="jumbotron text-white shadow-lg">
			<h1 class="display-3 textShadow mt-5">Welcome to Health<em>Keep</em></h1>
			<h2>Update and secure your medical records online</h2>
		</div>

		<div class="container my-5">
			<div class="row mb-5">
				<div class="col">
					<div class="card-deck">
						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card1">
										<i class="fas fa-pen-alt fa-7x" style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card1">
										<h4 class="card-title">Write</h4>
									</div>
								</div>
							</div>
						</div>

						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card2">
										<i class="fas fa-edit fa-7x" style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card2">
										<h4 class="card-title">Edit</h4>
									</div>
								</div>
							</div>
						</div>

						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card3">
										<i class="fas fa-trash-alt fa-7x" style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card3">
										<h4 class="card-title">Delete</h4>
									</div>
								</div>
							</div>
						</div>

						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card4">
										<i class="fas fa-laptop-medical fa-7x" style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card4">
										<h4 class="card-title">Records!</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="container-fluid mb-5">
			<div class="row m-5 d-flex justify-content-center">
				<div class="col-12 col-lg-6 mb-5">
					<div class="card shadow">
						<div class="card-header bg-dark text-light">Register</div>
						<div class="card-body">
							<form:form action="/register" method="post"
								modelAttribute="registerringUser">
								<div class="row">
									<div class="form-group col-sm-6">
										<label>First name</label>
										<form:input path="firstName" class="form-control" />
										<form:errors path="firstName" class="text-danger" />
									</div>
								</div>
								<div class="row">
									<div class="form-group col-sm-6">
										<label>Last name</label>
										<form:input path="lastName" class="form-control" />
										<form:errors path="lastName" class="text-danger" />
									</div>
								</div>
								<div class="form-group">
									<label>Email</label>
									<form:input path="email" class="form-control" />
									<form:errors path="email" class="text-danger" />
								</div>
								<div class="row">
									<div class="form-group col-sm-6">
										<label>Password</label>
										<form:input type="password" path="password"
											class="form-control" />
										<form:errors path="password" class="text-danger" />
									</div>
									<div class="form-group col-sm-6">
										<label>Confirm Password</label>
										<form:input type="password" path="confirm"
											class="form-control" />
										<form:errors path="confirm" class="text-danger" />
									</div>
								</div>
								<input type="submit" value="Register" class="btn btn-primary" />
							</form:form>
						</div>
					</div>
				</div>

				<div class="col-12 col-lg-4 mb-5">
					<div class="card shadow">
						<div class="card-header bg-dark text-light">Log In</div>
						<div class="card-body">
							<form:form action="/login" method="post"
								modelAttribute="loginUser">
								<div class="row">
									<div class="form-group col">
										<label>Email</label>
										<form:input path="email" class="form-control" />
										<form:errors path="email" class="text-danger" />
									</div>
								</div>
								<div class="row">
									<div class="form-group col">
										<label>Password</label>
										<form:input type="password" path="password"
											class="form-control" />
										<form:errors path="password" class="text-danger" />
									</div>
								</div>
								<input type="submit" value="Login" class="btn btn-primary" />
							</form:form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<nav class="navbar footer navbar-dark bg-dark">
			<a class="copyright"
				href="https://github.com/jonathankohen" target="_blank">&copy;
				2020 Jonathan Kohen</a>
		</nav>
	</footer>
</body>
</html>