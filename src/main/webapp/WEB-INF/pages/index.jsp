<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
		<script src="bootstrap/js/bootstrap.js" type="text/javascript"></script>
		<script type="text/javascript" src="/jquery-ui-1.8.23.custom/js/jquery-ui-1.8.23.custom.min.js"></script>		
		<link rel=Stylesheet href="bootstrap/css/bootstrap.css" type="text/css">
	</head>
	
	<body>
		<ul class="nav nav-tabs">
			<li><a href="home.php">Home</a></li>
			<li class="active"><a href="index.jsp">Record Play</a></li>
			<li><a href="#">Add Play to Playbook</a></li>
			<li><a href="players/add.html">Add Player</a></li>
		</ul>
		
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
				<td><input path="Play"/></td>
				<td><input path="Carrier"/></td>
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
		
		
	</body>
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
</html>

