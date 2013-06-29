<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Add player page</title>
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
			<label class="control-label" for="inputPlatoon">Platoon</label>
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
<h1>List of Plays</h1>
<p>Here you can see the list of the plays in the playbook, edit them, remove or update.</p>
<table class="table table-hover" id="example" cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th width="10%">id</th><th width="15%">Play</th><th width="10%">Carrier</th><th width="10%">Platoon</th><th width="10%">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="play" items="${plays}">
        <tr>
            <td>${play.id}</td>
            <td>${play.name}</td>
            <td>${play.type}</td>
            <td>${play.platoon}</td>
            <td>
                <a href="${pageContext.request.contextPath}/playbook/edit/${play.id}.html">Edit</a><br>
                <a href="${pageContext.request.contextPath}/playbook/delete/${play.id}.html">Delete</a><br>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
</div>

</body>
<script type="text/javascript">
    document.getElementById("playbookNav").setAttribute("class","active");

    $("#example").dataTable();
</script>
</html>