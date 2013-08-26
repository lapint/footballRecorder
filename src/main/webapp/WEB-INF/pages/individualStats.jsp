<%@ page import="java.util.HashMap" %>
<%@ page import="com.springapp.mvc.footballStats.model.PlayResult" %>
<%@ page import="java.util.List" %>
<%@ page import="com.springapp.mvc.footballStats.model.PlayerStat" %>
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
    <script src="<c:url value="/resources/js/Chart.min.js" />" type="text/javascript"></script>
    <link href="<c:url value="/resources/css/jquery.dataTables.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery.dataTables_themeroller.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/smoothness/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="wrapper">

        <div class="playerStatsTable">
            <div class="playerStatResults">
                <%--<h1>Player Stats</h1>--%>
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
                    <%
                        List<PlayerStat>  statsByGame = (List<PlayerStat>) request.getAttribute("statsByGame");
                    %>
                    <c:forEach var="playerStat" items="${statsByGame}">
                        <tr id="${playerStat.player_Id}">
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
                    <tfoot>
                    <tr>
                        <td>
                            <input class="input-small search_init" type="text" name="name" value="Name"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="sacks" value="Sacks"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="carries" value="Carries"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="comps" value="Comps"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="FGs" value="FGs"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="forcedFumbles" value="forcedFumbles"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="fumbles" value="Fumbles"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="ints" value="Ints"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="passYds" value="Pass Yards"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="recs" value="Recs"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="recYds" value="Rec Yds"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="rushYds" value="Rush Yds"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="tackles" value="Tackles"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="TDs" value="TDs"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="XPs" value="XPs"/>
                        </td>
                    </tr>
                    </tfoot>
                </table>
                <p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
            </div>
        </div>
        <div class="chart">
            <canvas id="myChart" width="400" height="400"></canvas>
        </div>
    </div>
</body>
<script type="text/javascript">
    //Get the context of the canvas element we want to select
    function generateChart(row){
        var tds = document.getElementById(row).children;
        var data = [];

        for(i = 0; i<tds.length; i++){
            data.push(tds[i].innerHTML);
        }

        var recData = {
            labels : ["Game1","Game2","Game3","Game4","Game5","Game6","Game7"],
            datasets : [
                {
                    fillColor : "rgba(151,187,205,0.5)",
                    strokeColor : "rgba(151,187,205,1)",
                    pointColor : "rgba(151,187,205,1)",
                    pointStrokeColor : "#fff",
                    data : data
                }
            ]
        }

        var canvas = document.getElementById("myChart");
        var ctx = canvas.getContext("2d");
        canvas.width = 400;
        canvas.height = 400;
        new Chart(ctx).Line(recData);
    }


    var asInitVals = new Array();

    $(document).ready(function() {
        var oTable = $('#example').dataTable( {
            "bJQueryUI": true,
            "oLanguage": {
                "sSearch": ['Search all columns:']
            }
        });
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