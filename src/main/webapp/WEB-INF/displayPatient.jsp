<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
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
	href="/webjars/bootstrap/4.5.0/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/bootstrap_overrides.css">
<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
<title>HealthKeep</title>
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

					<li class="nav-item"><a class="nav-link" href="/patients/new">Add
							a Patient</a></li>

				</ul>
				<a class="nav-link form-inline my-2 my-lg-0" href="/logout">Logout
					<span class="sr-only">(current)</span>
				</a>
			</div>
		</nav>
	</header>

	<main class="container">
		<div class="row">
			<div class="col">
				<h1 class="display-1 textShadowSm mt-5 text-center">${singlePatient.name}</h1>
			</div>
		</div>

		<hr class="my-5 curly" />

		<div class="row my-5">
			<div class="col">
				<ul class="list-group shadow">
					<li class="list-group-item bg-dark text-light">Patient Info:</li>
					<li class="list-group-item"><strong>DOB:</strong>
						${singlePatient.dob}</li>
					<li class="list-group-item"><strong>Sex:</strong>
						${singlePatient.sex}</li>
					<li class="list-group-item"><strong>Phone:</strong>
						${singlePatient.phone}</li>
					<li class="list-group-item"><strong>Address:</strong>
						${singlePatient.address}</li>
					<li class="list-group-item"><strong>Ethnicity:</strong>
						${singlePatient.ethnicity}</li>
					<li class="list-group-item"><strong>Blood:</strong>
						${singlePatient.blood}</li>
					<li class="list-group-item"><strong>Allergies:</strong>
						${singlePatient.allergies}</li>
					<li class="list-group-item"><strong>Progress notes:</strong>
						${singlePatient.progress}</li>
					<li class="list-group-item"><strong>History:</strong>
						${singlePatient.history}</li>
					<li class="list-group-item"><strong>Diagnoses:</strong>
						${singlePatient.diagnoses}</li>
					<li class="list-group-item"><strong>Medications:</strong>
						${singlePatient.meds}</li>
					<li class="list-group-item"><strong>Immunization
							dates:</strong> ${singlePatient.immDates}</li>
				</ul>

				<div class="row justify-content-end my-2 mr-1">
					<a href="/patients/${singlePatient.id}/edit"
						class="btn btn-primary my-3 mx-3 shadow">Edit Patient</a>

					<form:form action="/patients/${singlePatient.id}/delete"
						method="post" class="my-3 shadow">
						<button type="submit" class="btn btn-outline-danger">Delete
							Patient</button>
					</form:form>
				</div>
			</div>

			<div class="col">
				<ul class="list-group mb-5 shadow">
					<li class="list-group-item bg-dark text-light">Referrals:</li>
					<c:forEach items="${singlePatient.referrals}" var="referral">
						<li class="list-group-item">Referred by<strong> Dr.
								${referral.user.lastName} </strong> to <strong> Dr.
								${referral.refName} </strong> <br /> Reason: ${referral.reason}
						</li>
					</c:forEach>
				</ul>

				<div class="card shadow">
					<div class="card-body">
						<h3 class="card-title mb-3">Make a Referral</h3>
						<hr class="mb-3" />
						<p class="card-text">
							<form:form action="/patients/${singlePatient.id}/referral">
								<div class="form-group row">
									<label class="col-sm-4 col-form-label">Dr.'s Last Name:</label>
									<div class="col-sm-8">
										<input type="text" name="refName" class="form-control"
											placeholder="ex/ Smith">
									</div>
								</div>

								<div class="form-group row">
									<label class="col-sm-4 col-form-label">Reason:</label>
									<div class="col-sm-8">
										<input type="text" name="reason" class="form-control"
											placeholder="ex/ suspected fracture">
									</div>
								</div>

								<button type="submit" class="btn btn-secondary shadow">Send</button>
								<form:errors />
							</form:form>
						</p>
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