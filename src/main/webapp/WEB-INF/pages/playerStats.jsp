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
<title>Player Stats</title>
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


<div class="table-results">
<h1>Player Stats</h1>
<table class = "table table-hover" id="example"  cellpadding="0" cellspacing="0">
    <thead>
    <tr>
        <th>Name</th>
        <th>Sacks</th>
        <th>Carries</th>
        <th>Comps</th>
        <%--<th>Date</th>--%>
        <th>FGs</th>
        <th>Forced Fumbles</th>
        <th>Fumbles</th>
        <th>Ints</th>
        <%--<th>Opponent</th>--%>
        <th>Pass Yds</th>
        <th>Recs</th>
        <th>Rec Yds</th>
        <th>Rush Yds</th>
        <th>Tackles</th>
        <th>TDs</th>
        <th>XPs</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="playerStat" items="${playerStats}">
        <tr>
            <td>${playerStat.name}</td>
            <td>${playerStat.sacks}</td>
            <td>${playerStat.carries}</td>
            <td>${playerStat.comps}</td>
            <%--<td>${playerStat.dataTables}</td>--%>
            <td>${playerStat.FGs}</td>
            <td>${playerStat.forcedFumbles}</td>
            <td>${playerStat.fumbles}</td>
            <td>${playerStat.ints}</td>
            <%--<td>${playerStat.opponent}</td>--%>
            <td>${playerStat.passYds}</td>
            <td>${playerStat.recs}</td>
            <td>${playerStat.recYds}</td>
            <td>${playerStat.rushYds}</td>
            <td>${playerStat.tackles}</td>
            <td>${playerStat.TDs}</td>
            <td>${playerStat.XPs}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
</div>
</div>
</body>
<script type="text/javascript">
    document.getElementById("playerStatsNav").setAttribute("class","active");

    $("#example").dataTable();
</script>
</html>