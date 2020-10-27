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
	href="/images/apple-touch-icon.png" />
<link rel="icon" type="image/png" sizes="32x32"
	href="/images/favicon-32x32.png" />
<link rel="icon" type="image/png" sizes="16x16"
	href="/images/favicon-16x16.png" />
<link rel="manifest" href="/images/site.webmanifest">
<link rel="mask-icon" href="/images/safari-pinned-tab.svg"
	color="#5bbad5" />
<link rel="stylesheet"
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/bootstrap_overrides.css">
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-expand-lg navbar-dark shadow">
			<a class="navbar-brand" href="/home">Health<em>Keep</em></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="true"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="navbar-collapse collapse show"
				id="navbarSupportedContent" style="">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a class="nav-link" href="/home">Home
							<span class="sr-only">(current)</span>
					</a></li>
				</ul>
				<a class="nav-link form-inline my-2 my-lg-0" href="/logout">Logout
					<span class="sr-only">(current)</span>
				</a>
			</div>
		</nav>
	</header>

	<main>
		<div class="container">
			<div class="row">
				<div class="col">
					<h1 class="display-1 textShadowSm text-center my-5">Add a
						Patient</h1>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<hr class="curly" />
				</div>
			</div>

			<div class="row">
				<div class="col">
					<div class="card-deck">
						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card1">
										<i class="fas fa-stethoscope fa-7x" style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card1">
										<h4 class="card-title">Examine</h4>
									</div>
								</div>
							</div>
						</div>

						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card2">
										<i class="fas fa-hand-holding-medical fa-7x"
											style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card2">
										<h4 class="card-title">Assess</h4>
									</div>
								</div>

							</div>
						</div>

						<div class="col-6 col-lg-3 mb-3">
							<div class="card flip-box mx-auto">
								<div class="flip-box-inner">
									<div
										class="card-body flip-box-front d-flex align-items-center justify-content-center card3">
										<i class="fas fa-briefcase-medical fa-7x" style="color: #fff;"></i>
									</div>

									<div
										class="card-body flip-box-back d-flex align-items-center justify-content-center card3">
										<h4 class="card-title">Treat</h4>
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
										<h4 class="card-title">Save!</h4>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col">
					<form:form action="/patients/create_new" method="post"
						modelAttribute="newPatient" class="my-5">
						<div class="form-group row">
							<label for="name" class="col-12 col-lg-1 col-form-label">Name:</label>
							<div class="col-12 col-lg-5">
								<form:input path="name" type="text" class="form-control"
									id="name" placeholder="ex/ John Smith" />
								<form:errors path="name" class="text-danger" />
							</div>

							<label for="dob" class="col-12 col-lg-1 col-form-label">DOB:</label>
							<div class="col-12 col-lg-5">
								<form:input path="dob" type="text" class="form-control" id="dob"
									placeholder="ex/ 10/23/88" />
								<form:errors path="dob" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="address" class="col-12 col-lg-1 col-form-label">Address:</label>
							<div class="col-12 col-lg-5">
								<form:input path="address" type="text" class="form-control"
									id="address"
									placeholder="ex/ 123 Linden Avenue, Springfield, IL 01234" />
								<form:errors path="address" class="text-danger" />
							</div>

							<label for="phone" class="col-12 col-lg-1 col-form-label">Phone:</label>
							<div class="col-12 col-lg-5">
								<form:input path="phone" type="text" class="form-control"
									id="phone" placeholder="ex/ 9783451672" />
								<form:errors path="phone" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="sex" class="col-12 col-lg-1 col-form-label">Sex:</label>
							<div class="col-12 col-lg-5">
								<form:input path="sex" type="text" class="form-control" id="sex"
									placeholder="ex/ Female" />
								<form:errors path="sex" class="text-danger" />
							</div>

							<label for="ethnicity" class="col-12 col-lg-1 col-form-label">Ethnicity:</label>
							<div class="col-12 col-lg-5">
								<form:input path="ethnicity" type="text" class="form-control"
									id="ethnicity" placeholder="ex/ Hispanic or Latino" />
								<form:errors path="ethnicity" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="blood" class="col-12 col-lg-1 col-form-label">Blood:</label>
							<div class="col-12 col-lg-5">
								<form:input path="blood" type="text" class="form-control"
									id="blood" placeholder="ex/ O-" />
								<form:errors path="blood" class="text-danger" />
							</div>


							<label for="allergies" class="col-12 col-lg-1 col-form-label">Allergies:</label>
							<div class="col-12 col-lg-5">
								<form:input path="allergies" type="text" class="form-control"
									id="allergies" placeholder="ex/ Penicillin" />
								<form:errors path="allergies" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="progress" class="col-12 col-lg-2 col-form-label">Progress
								Notes:</label>
							<div class="col-12 col-lg-10">
								<form:textarea path="progress" type="text" class="form-control"
									id="progress" placeholder="(optional)" />
								<form:errors path="progress" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="history" class="col-12 col-lg-2 col-form-label">Medical
								History:</label>
							<div class="col-12 col-lg-10">
								<form:textarea path="history" type="text" class="form-control"
									id="history" placeholder="(optional)" />
								<form:errors path="history" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="diagnoses" class="col-12 col-lg-2 col-form-label">Diagnoses:</label>
							<div class="col-12 col-lg-10">
								<form:textarea path="diagnoses" type="text" class="form-control"
									id="diagnoses" placeholder="(optional)" />
								<form:errors path="diagnoses" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="meds" class="col-12 col-lg-2 col-form-label">Medications:</label>
							<div class="col-12 col-lg-10">
								<form:textarea path="meds" type="text" class="form-control"
									id="meds" placeholder="(optional)" />
								<form:errors path="meds" class="text-danger" />
							</div>
						</div>

						<div class="form-group row">
							<label for="immDates" class="col-12 col-lg-2 col-form-label">Immunization
								Dates:</label>
							<div class="col-12 col-lg-10">
								<form:textarea path="immDates" type="text" class="form-control"
									id="immDates" placeholder="(optional)" />
								<form:errors path="immDates" class="text-danger" />
							</div>
						</div>

						<div class="row">
							<div class="col d-flex justify-content-center mb-5">
								<input type="submit" value="Add Patient"
									class="btn btn-lg btn-secondary shadow-sm" />
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</main>

	<footer>
		<nav class="navbar footer navbar-dark bg-dark">
			<a class="copyright" href="https://github.com/jonathankohen"
				target="_blank">&copy; 2020 Jonathan Kohen</a>
		</nav>
	</footer>
</body>
</html>