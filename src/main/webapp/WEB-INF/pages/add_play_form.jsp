<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add player page</title>
    <script src="/js/bootstrap.min.js"></script>
    <link href="/css/bootstrap.css" rel="stylesheet"/>
    <link href="/css/site.css" rel="stylesheet"/>
</head>
<body>
<div class="wrapper">
	<div class="navbar">
		<div class="navbar-inner">
			<div class="container">

				<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
				</a>

				<!-- Be sure to leave the brand out there if you want it shown -->
				<a class="brand" href="#">Project name</a>

				<!-- Everything you want hidden at 940px or less, place within here -->
				<div class="nav-collapse collapse">
					<!-- .nav, .navbar-search, .navbar-form, etc -->
					<ul class="nav nav-tabs">
						<li><a href="home.php">Home</a></li>
						<li><a href="../playresult/add.html">Record Play</a></li>
						<li class="active"><a href="add.html">Add Play to
								Playbook</a></li>
						<li><a href="../players/add.html">Add Player</a></li>
					</ul>
				</div>

			</div>
		</div>
	</div>


	<h1>Add play to the play page</h1>
	<p>Here you can add a new play to the play book.</p>
	<form:form method="POST" commandName="play"
		action="${pageContext.request.contextPath}/playbook/add.html">
		<div class="control-group">
			<label class="control-label" for="inputName">Name</label>
			<div class="controls">
				<form:input type="text" id="inputName" path="Name" placeholder="Name"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputType">Type</label>
			<div class="controls">
				<form:input type="text" id="inputType" placeholder="Type" path="Type"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="Platoon">Platoon</label>
			<div class="controls">
				<form:input type="text" id="inputPlatoon" placeholder="Platoon"
					path="Platoon"/>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<button type="submit" class="btn">Add Play</button>
			</div>
		</div>
	</form:form>
</div>
</body>
</html>