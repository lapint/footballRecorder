<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add player page</title>
	<link href="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/css/bootstrap-combined.min.css" rel="stylesheet"/>
	<script src="//netdna.bootstrapcdn.com/twitter-bootstrap/2.3.2/js/bootstrap.min.js"></script>
	
</head>
<body>
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
			<li class="active"><a href="add.html">Record Play</a></li>
			<li><a href="../playbook/add.html">Add Play to Playbook</a></li>
			<li><a href="../players/add.html">Add Player</a></li>
		</ul>
      </div>
 
    </div>
  </div>
</div>

		
<div class="btn-group">
  	<button class="btn" id="offenseInputs" onClick="offenseInsert()">Offense</button>
  	<button class="btn" id="defenseInputs" onClick="defenseInsert()">Defense</button>
  	<button class="btn" id="fieldGoalInputs" onClick="fieldGoalInsert()">Field Goal</button>
  	<button class="btn" id="returnInputs" onClick="returnInsert()">Return</button>
  	<button class="btn" id="kickOffInputs" onClick="kickoffInsert()">Kickoff</button>
</div>
<form id="offenseInsertTable" style="display:none;">
			<table style="color:white;">
				<tr>
				<td><input path="YTG" /></td>
				<td><input path="Down"/></td>
				<td><form:select path="plays">
					    <form:options items="${plays}" itemValue="Name" itemLabel="Name"/>

				</form:select></td>
				<td><form:select path="players">
					    <form:options items="${players}" itemValue="Name" itemLabel="Name"/>

				</form:select></td>
				<td><input type="submit" value="Add"/></td>
				</tr>	
				</table>
		</form>
		
		<form id="defenseInsertTable" style="display:none;">
			<input type="hidden" name="football" value="football"/>
			<table id="FBinput" style="color:white;">
				<tr>
				<td><input type="text" name="YTG" placeholder="Yards to Go" rel="13"/></td>
				<td><input type="text" name="Down" placeholder="Down" rel="17"/></td>
				<td><input type="text" name="Tackler" placeholder="Tackler" rel="18"/></td>
				</tr>	
			</table>
		</form>
		
		<form id="kickoffReturnInsertTable" style="display:none;">
			<input type="hidden" name="football" value="football"/>
			<table id="FBinput" style="color:white;">
				<tr>
				<td><input type="text" name="return" placeholder="Yards on Return" rel="13"/></td>
				<td><input type="text" name="Receiver" placeholder="Receiver" rel="17"/></td>
				</tr>	
			</table>
		</form>
		
		<form id="fieldGoalInsertTable" style="display:none;">
			<input type="hidden" name="football" value="football"/>
			<table id="FBinput" style="color:white;">
				<tr>
				<td><input type="text" name="Distance" placeholder="Distance" rel="13"/></td>
				<td><input type="text" name="Kicker" id="Kicker" placeholder="Kicker" rel="18"/></td>
				<td><input type="text" name="Scored" id="Scored" placeholder="Scored" rel="19"/></td>
				</tr>	
			</table>
		</form>
		
		<form id="kickOffInsertTable" style="display:none;">
			<input type="hidden" name="football" value="football"/>
			<table id="FBinput" style="color:white;">
				<tr>
				<td><input type="text" name="Distance" placeholder="Distance" rel="13"/></td>
				<td><input type="text" name="Scored" placeholder="Scored" rel="17"/></td>
				<td><input type="text" name="Tackler" id="Tackler" placeholder="Tackler" rel="18"/></td>
				<td><input class="Date" type="text" name="Date" id="FBDate" placeholder="Date" rel="19"/></td>
				</tr>	
			</table>
		</form>
<script>
	function offenseInsert() {
		document.getElementById("offenseInsertTable").style.display = "";
		document.getElementById("defenseInsertTable").style.display = "none";
		document.getElementById("kickoffReturnInsertTable").style.display = "none";
		document.getElementById("fieldGoalInsertTable").style.display = "none";
		document.getElementById("kickOffInsertTable").style.display = "none";
	}
	function defenseInsert() {
		document.getElementById("offenseInsertTable").style.display = "none";
		document.getElementById("defenseInsertTable").style.display = "";
		document.getElementById("kickoffReturnInsertTable").style.display = "none";
		document.getElementById("fieldGoalInsertTable").style.display = "none";
		document.getElementById("kickOffInsertTable").style.display = "none";
	}
	function fieldGoalInsert() {
		document.getElementById("offenseInsertTable").style.display = "none";
		document.getElementById("defenseInsertTable").style.display = "none";
		document.getElementById("kickoffReturnInsertTable").style.display = "none";
		document.getElementById("fieldGoalInsertTable").style.display = "";
		document.getElementById("kickOffInsertTable").style.display = "none";
	}
	function returnInsert() {
		document.getElementById("offenseInsertTable").style.display = "none";
		document.getElementById("defenseInsertTable").style.display = "none";
		document.getElementById("kickoffReturnInsertTable").style.display = "";
		document.getElementById("fieldGoalInsertTable").style.display = "none";
		document.getElementById("kickOffInsertTable").style.display = "none";
	}
	function kickoffInsert() {
		document.getElementById("offenseInsertTable").style.display = "none";
		document.getElementById("defenseInsertTable").style.display = "none";
		document.getElementById("kickoffReturnInsertTable").style.display = "none";
		document.getElementById("fieldGoalInsertTable").style.display = "none";
		document.getElementById("kickOffInsertTable").style.display = "";
	}
	
		
	</script>
</body>
</html>