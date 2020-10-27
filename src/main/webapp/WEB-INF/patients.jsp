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
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
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
					<li class="nav-item"><a class="nav-link" href="/patients/new">New
							Patient</a></li>
				</ul>
				<a class="nav-link form-inline my-2 my-lg-0" href="/logout">Logout
					<span class="sr-only">(current)</span>
				</a>
			</div>
		</nav>
	</header>

	<main>
		<div class="container-fluid">
			<div class="row">
				<div class="col">
					<h1 class="display-1 mt-5 textShadowSm text-center">Welcome,
						Dr. ${user.lastName}!</h1>
					<h3 class="text-center">
						<em>Thank you for doing what you do.</em>
					</h3>
				</div>
			</div>

			<div class="row">
				<hr class="my-5 curly col-4" id="chartCurl" />
			</div>

			<div class="row">
				<div class="col">
					<h1 class="display-4 textShadowSm text-center">Company
						Data</h1>
				</div>
			</div>

			<div class="row">
				<div class="col-12 col-lg-10 mx-auto">
					<canvas class="my-5" id="myChart"></canvas>
				</div>
			</div>

			<div class="row mt-5">
				<div class="col mt-5">
					<table class="table table-bordered table-hover shadow mb-5"
						id="refTable">
						<thead class="thead-dark">
							<tr>
								<th colspan="2"><h5>Patients on Record:</h5></th>
							</tr>
						</thead>
						<tr>
							<th>Name</th>
							<th># of Referrals</th>
						</tr>
						<c:forEach items="${allPatients}" var="patient">
							<tr>
								<td><a href="/patients/${patient.id}">${patient.name}</a></td>
								<td>${patient.getReferrals().size()}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>

			<div class="row mb-5">
				<div class="col d-flex justify-content-center mb-5">
					<a href="/patients/new" class="btn btn-lg btn-secondary shadow">New
						Patient</a>
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

	<script src="/webjars/jquery/3.5.1/jquery.min.js"></script>
	<script src="/webjars/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<script src='https://kit.fontawesome.com/a076d05399.js'></script>
	<script>
		function newDate(num) {
			let today = new Date();
			today.setDate(today.getDate() - num);
			let result = today.toLocaleDateString();
			return result;
		}
	
		var ctx = document.getElementById('myChart').getContext('2d');
		var chart = new Chart(ctx, {
		    type: 'line',
	
		    data: {
		        labels: [newDate(6), newDate(5), newDate(4), newDate(3), newDate(2), newDate(1), newDate(0)],
		        datasets: [
			    {
		            label: 'Total Patients',
		            backgroundColor: '#2890B7',
		            borderColor: '#2890B7',
		            fill : false,
					lineTension : 0.1,
		            data: [0, 0, 0, 0, 0, 0, 0]
		        }, {
		        	label: 'Total Doctors',
		            backgroundColor: '#28b796',
		            borderColor: '#28b796',
		            fill : false,
					lineTension : 0.1,
		            data: [0, 0, 0, 0, 0, 0, 0]
			    }, {
			    	label: 'Total Referrals',
		            backgroundColor: '#ee6735',
		            borderColor: '#ee6735',
		            fill : false,
					lineTension : 0.1,
		            data: [0, 0, 0, 0, 0, 0, 0 ]
				    }
		        ]
		    },
	
		    options: {}
		});
	
		var counter = 0
		
		var table = document.getElementById('refTable');
	
	    for (var r = 0, n = table.rows.length; r < n; r++) {
	        for (var c = 0, m = table.rows[r].cells.length; c < m; c++) {
	            let results = table.rows[r].cells[c].innerHTML;
	            if (results > 0) {
	                counter += parseInt(results);
	            }
	        }
	    }
	
	    chart.data.datasets[0].data.push(${allPatients.size()})
	    chart.data.datasets[0].data.shift()
	    chart.update()
	    
	    chart.data.datasets[1].data.push(${allUserCount})
	    chart.data.datasets[1].data.shift()
	    chart.update()
	    
	    chart.data.datasets[2].data.push(counter)
	    chart.data.datasets[2].data.shift()
	    chart.update()
	</script>
</body>
</html>