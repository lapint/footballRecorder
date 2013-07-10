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
    <title>Add User page</title>
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

        <form:form method="POST" commandName="user"
                   action="${pageContext.request.contextPath}/user/register.html">
            <div class="control-group">
                <label class="control-label" for="inputUserName">User Name</label>
                <div class="controls">
                    <form:input type="text" id="inputUserName" path="username" placeholder="User Name"/>
                </div>
            </div>
            <div class="control-group">
                <label class="control-label" for="inputPassword">Password</label>
                <div class="controls">
                    <form:input type="password" id="inputPassword" placeholder="Password" path="password"/>
                </div>
            </div>
            <div class="control-group">
                <div class="controls">
                    <button type="submit" class="btn">Create Account</button>
                </div>
            </div>
        </form:form>
    </div>

    </div>
</div>
</body>
<script type="text/javascript">
//    document.getElementById("playersNav").setAttribute("class","active");
</script>
</html>