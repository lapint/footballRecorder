<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
 <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add player page</title>
<%--<link--%>
	<%--href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css"--%>
	<%--rel="stylesheet" />--%>
<%--<script--%>
	<%--src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>--%>
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
      <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </a>
 
      <!-- Be sure to leave the brand out there if you want it shown -->
      <a class="brand" href="#">Project name</a>
 
      <!-- Everything you want hidden at 940px or less, place within here -->
      <div class="nav-collapse collapse">
        <!-- .nav, .navbar-search, .navbar-form, etc -->
        <ul class="nav nav-tabs">
			<li><a href="home.php">Home</a></li>
			<li><a href="../playresult/add.html">Record Play</a></li>
			<li><a href="../playbook/add.html">Add Play to Playbook</a></li>
			<li class="active"><a href="add.html">Add Player</a></li>
		</ul>
      </div>
 
    </div>
  </div>
</div>

		
<h1>Add player page</h1>
<p>Here you can add a new player.</p>

<form:form method="POST" commandName="player"
		action="${pageContext.request.contextPath}/players/add.html">
		<div class="control-group">
			<label class="control-label" for="inputName">Name</label>
			<div class="controls">
				<form:input type="text" id="inputName" path="Name" placeholder="Name"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputNumber">Number</label>
			<div class="controls">
				<form:input type="text" id="inputNumber" placeholder="Number" path="Number"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputPosition">Position</label>
			<div class="controls">
				<form:input type="text" id="inputPosition" placeholder="Position" path="Position"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputYear">Year</label>
			<div class="controls">
				<form:input type="text" id="inputYear" placeholder="Year" path="Year"/>
			</div>
		</div>
		<div class="control-group">
			<label class="control-label" for="inputPlatoon">Platoon</label>
			<div class="controls">
				<form:input type="text" id="inputPlatoon" placeholder="Platoon"
					path="Platoon"/>
			</div>
		</div>
		<div class="control-group">
			<div class="controls">
				<button type="submit" class="btn">Add Player</button>
			</div>
		</div>
	</form:form>
</div>
</body>
</html>