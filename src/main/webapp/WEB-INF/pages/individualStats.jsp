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
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1; initial-scale = 1; user-scalable = no" />
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
                        <th>Date</th>
                        <th>Opponent</th>
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
                        <tr class="stats" name="${playerStat.opponent}">
                            <td>${playerStat.date}</td>
                            <td>${playerStat.opponent}</td>
                            <td>${playerStat.sacks}</td>
                            <td value="carries">${playerStat.carries}</td>
                            <td>${playerStat.comps}</td>
                            <%--<td>${playerStat.dataTables}</td>--%>
                            <td>${playerStat.FGs}</td>
                            <td>${playerStat.forcedFumbles}</td>
                            <td>${playerStat.fumbles}</td>
                            <td>${playerStat.ints}</td>
                            <%--<td>${playerStat.opponent}</td>--%>
                            <td>${playerStat.passYds}</td>
                            <td value="recs">${playerStat.recs}</td>
                            <td value="recYds">${playerStat.recYds}</td>
                            <td>${playerStat.rushYds}</td>
                            <td>${playerStat.tackles}</td>
                            <td value="tds">${playerStat.TDs}</td>
                            <td>${playerStat.XPs}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                    <tfoot>
                    <tr>
                        <td>
                            <input class="input-small search_init" type="text" name="Date" value="Date"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="opponent" value="Opponent"/>
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
            <h3>Carries</h3>
            <canvas id="carriesChart" value="carries" width="400" height="400"></canvas>
        </div>
        <div class="chart">
            <h3>Receptions</h3>
            <canvas id="recChart" value="recs" width="400" height="400"></canvas>
        </div>
        <div class="chart">
            <h3>Reception Yards</h3>
            <canvas id="recYdsChart" value="recYds" width="400" height="400"></canvas>
        </div>
        <div class="chart">
            <h3>Touchdowns</h3>
            <canvas id="tdChart" value="tds" width="400" height="400"></canvas>
        </div>

    </div>
</body>
<script type="text/javascript">

    function buildChart(chartName, column){
        //All tr rows
        var stats = document.getElementsByClassName("stats");
        var labels = [];
        var data = [];
        for(var i=0;i<stats.length;i++){
            labels[i] = stats[i].getAttribute("name");

            //Get a specific
            var rowStat = stats[i].children;
            data[i]=rowStat[column].innerHTML;
        }
        var chartData = {
            labels : labels,
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
//        var scaleOverride = {
//            scaleOverride : true,
//            scaleSteps : 10,
//            scaleStepWidth : 1,
//            scaleStartValue : 0
//        }

        var canvas = document.getElementById(chartName);
        var ctx = canvas.getContext("2d");

        var defaults = {

            //Boolean - If we show the scale above the chart data
            scaleOverlay : false,

            //Boolean - If we want to override with a hard coded scale
            scaleOverride : false,

            //** Required if scaleOverride is true **
            //Number - The number of steps in a hard coded scale
            scaleSteps : null,
            //Number - The value jump in the hard coded scale
            scaleStepWidth : null,
            //Number - The scale starting value
            scaleStartValue : null,

            //String - Colour of the scale line
            scaleLineColor : "rgba(0,0,0,.1)",

            //Number - Pixel width of the scale line
            scaleLineWidth : 1,

            //Boolean - Whether to show labels on the scale
            scaleShowLabels : true,

            <%--//Interpolated JS string - can access value--%>
            <%--scaleLabel : "<%=value%>",--%>

            //String - Scale label font declaration for the scale label
            scaleFontFamily : "'Arial'",

            //Number - Scale label font size in pixels
            scaleFontSize : 12,

            //String - Scale label font weight style
            scaleFontStyle : "normal",

            //String - Scale label font colour
            scaleFontColor : "#666",

            ///Boolean - Whether grid lines are shown across the chart
            scaleShowGridLines : true,

            //String - Colour of the grid lines
            scaleGridLineColor : "rgba(0,0,0,.05)",

            //Number - Width of the grid lines
            scaleGridLineWidth : 1,

            //Boolean - Whether the line is curved between points
            bezierCurve : true,

            //Boolean - Whether to show a dot for each point
            pointDot : true,

            //Number - Radius of each point dot in pixels
            pointDotRadius : 3,

            //Number - Pixel width of point dot stroke
            pointDotStrokeWidth : 1,

            //Boolean - Whether to show a stroke for datasets
            datasetStroke : true,

            //Number - Pixel width of dataset stroke
            datasetStrokeWidth : 2,

            //Boolean - Whether to fill the dataset with a colour
            datasetFill : true,

            //Boolean - Whether to animate the chart
            animation : true,

            //Number - Number of animation steps
            animationSteps : 60,

            //String - Animation easing effect
            animationEasing : "easeOutQuart",

            //Function - Fires when the animation is complete
            onAnimationComplete : null

        }
        new Chart(ctx).Line(chartData);
    }

    function getCharts(){
        var charts = document.getElementsByClassName("chart");
        for(i = 0; i<charts.length; i++){
            var chart = charts[i];
            var canvas = chart.children[1];
            var chartName = canvas.getAttribute("id");
            var chartValue = canvas.getAttribute("value");
            var stats = document.getElementsByClassName("stats");
            var row = stats[0];
            var rowStats = row.children;
            for(j = 0; j<rowStats.length; j++){
                if(rowStats[j].getAttribute("value")==chartValue){
                    buildChart(chartName,j);
                }
            }
        }
    }

    var asInitVals = new Array();

    $(document).ready(function() {



        //BUILD DATATABLES
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


        //BUILD GRAPHS
        getCharts();
    } );
</script>
</html>
