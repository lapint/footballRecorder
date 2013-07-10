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
    <script src="<c:url value="/resources/js/jquery.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
   <script src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.min.js" />" type="text/javascript" ></script>
    <script src="<c:url value="/resources/js/jquery.dataTables.min.js" />" type="text/javascript"></script>
    <link href="<c:url value="/resources/css/jquery.dataTables.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery.dataTables_themeroller.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">

</head>
<body>
    <jsp:include page="header.jsp" />
<div class="wrapper">

<div class="add">
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
<div class="table-results">
<h1>Players</h1>
<table class = "table table-hover" id="example"  cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th width="10%">id</th>
        <th width="15%">Name</th>
        <th width="10%">Number</th>
        <th width="10%">Position</th>
        <th width="10%">Year</th>
        <th width="10%">Platoon</th>
        <th width="10%">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="player" items="${players}">
        <tr>
            <td>${player.id}</td>
            <td>${player.name}</td>
            <td>${player.number}</td>
            <td>${player.position}</td>
            <td>${player.year}</td>
            <td>${player.platoon}</td>
            <td>
                <a href="${pageContext.request.contextPath}/players/edit/${player.id}.html">Edit</a><br>
                <a href="${pageContext.request.contextPath}/players/delete/${player.id}.html">Delete</a><br>
            </td>
        </tr>
    </c:forEach>
    </tbody>
    <tfoot>
    <tr>
        <td>
            <input class="input-small search_init" type="text" name="id" value="Id"/>
        </td>

        <td>
            <input class="input-small search_init" type="text" name="name" value="Name"/>
        </td>
        <td>
            <input class="input-small search_init" type="text" name="number" value="Number"/>
        </td>
        <td>
            <input class="input-small search_init" type="text" name="position" value="Position"/>
        </td>
        <td>
            <input class="input-small search_init" type="text" name="year" value="Year"/>
        </td>
        <td>
            <input class="input-small search_init" type="text" name="platoon" value="Platoon"/>
        </td>
        <td>
            <input class="input-small search_init" type="text" name="action" value="Action"/>
        </td>
    </tr>
    </tfoot>
</table>
<p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
</div>
</div>
</body>
<script type="text/javascript">
    var asInitVals = new Array();

    $(document).ready(function() {
        var oTable = $('#example').dataTable( {
            "oLanguage": {
                "sSearch": ['Search all columns:']
            }
        });
        document.getElementById("playersNav").setAttribute("class","active");

    $("#example").dataTable();
    $("tfoot input").keyup( function () {
        /* Filter on the column (the index) of this element */
        oTable.fnFilter( this.value, $("tfoot input").index(this) );
    } );

    oTable.fnAdjustColumnSizing();

    /*
     * Support functions to provide a little bit of 'user friendlyness' to the textboxes in
     * the footer
     */
    $("tfoot input").each( function (i) {
        asInitVals[i] = this.value;
    } );

    $("tfoot input").focus( function () {
        if ( this.className == "input-small search_init" )
        {
            this.className = "";
            this.value = "";
        }
    } );

    $("tfoot input").blur( function (i) {
        if ( this.value == "" )
        {
            this.className = "input-small search_init";
            this.value = asInitVals[$("tfoot input").index(this)];
        }
    } );
    } );


</script>
</html>