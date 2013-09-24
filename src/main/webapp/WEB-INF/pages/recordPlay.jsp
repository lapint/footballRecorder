<%@taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<?xml version="1.0" encoding="ISO-8859-1" ?>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Record Plays</title>
<script src="<c:url value="/resources/js/jquery.js" />" type="text/javascript"></script>
<script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
<script src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.min.js" />" type="text/javascript" ></script>
<script src="<c:url value="/resources/js/jquery.dataTables.min.js" />" type="text/javascript"></script>
<link href="<c:url value="/resources/css/jquery.dataTables.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/jquery.dataTables_themeroller.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/smoothness/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
</head>

<body>
<jsp:include page="header.jsp" />

    <div class="wrapper">
        <div class="add">

            <form:form method="POST" action="${pageContext.request.contextPath}/game/playresult/add.html" commandName="playresult" id="offenseInsertTable">
                <div class="control-group">
                    <label class="control-label" for="inputDown">Down</label>
                    <div class="controls">
                        <form:select id="inputDown" placeholder="Down" path="Down">
                            <form:option type="text" value="1"></form:option>
                            <form:option type="text" value="2"></form:option>
                            <form:option type="text" value="3"></form:option>
                            <form:option type="text" value="4"></form:option>
                        </form:select>
                    </div>
                </div>
                <div class="control-group">
                    <label class="control-label" for="inputYTG">Yards To Go</label>
                    <div class="controls">
                        <form:select id="inputYTG" placeholder="Yards To Go" path="YTG"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputDistance">Distance to the Goal</label>
                    <div class="controls">
                        <form:select id="inputDistance" placeholder="Yards" path="YardLine"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputPlay">Play</label>
                    <div class="controls">
                        <form:select path="Play_Id" id="inputPlay">
                            <c:forEach var="play" items="${plays}">
                                <option value="${play.id}" label="${play.name}  -  ${play.type}"/>
                            </c:forEach>
                        </form:select>

                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputPlayer">Carrier</label>
                    <div class="controls">
                        <form:select path="Carrier_Id" id="inputPlayer">
                            <c:forEach var="player" items="${players}" >
                                <option value="${player.id}" label="${player.number}  -  ${player.name}  -  ${player.position}"/>
                            </c:forEach>
                        </form:select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputYards">Yards on Carry</label>
                    <div class="controls">
                        <form:input type="text" id="inputYards" placeholder="Yards" path="Yards"/>
                    </div>
                </div>


                <div class="control-group">
                    <label class="control-label" for="inputTackler">Tackled By</label>
                    <div class="controls">
                        <form:input type="text" id="inputTackler" placeholder="Tackled By" path="Tackler"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputYTG">Play Result</label>
                    <div class="controls">
                        <form:input type="text" id="inputResult" placeholder="Play Result" path="Result"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="controls">
                        <button name="action" type="submit" class="btn">Add Play Result</button>
                    </div>
                </div>

            </form:form>

            <%--<form id="defenseInsertTable" style="display:none;">--%>
                <%--<input type="hidden" name="football" value="football"/>--%>
                <%--<table id="FBinput" style="color:white;">--%>
                    <%--<tr>--%>
                        <%--<td><input type="text" name="YTG" placeholder="Yards to Go" rel="13"/></td>--%>
                        <%--<td><input type="text" name="Down" placeholder="Down" rel="17"/></td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>

            <%--<form id="kickoffReturnInsertTable" style="display:none;">--%>
                <%--<input type="hidden" name="football" value="football"/>--%>
                <%--<table id="FBinput" style="color:white;">--%>
                    <%--<tr>--%>
                        <%--<td><input type="text" name="return" placeholder="Yards on Return" rel="13"/></td>--%>
                        <%--<td><input type="text" name="Receiver" placeholder="Receiver" rel="17"/></td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>

            <%--<form id="fieldGoalInsertTable" style="display:none;">--%>
                <%--<input type="hidden" name="football" value="football"/>--%>
                <%--<table id="FBinput" style="color:white;">--%>
                    <%--<tr>--%>
                        <%--<td><input type="text" name="Distance" placeholder="Distance" rel="13"/></td>--%>
                        <%--<td><input type="text" name="Kicker" id="Kicker" placeholder="Kicker" rel="18"/></td>--%>
                        <%--<td><input type="text" name="Scored" id="Scored" placeholder="Scored" rel="19"/></td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>

            <%--<form id="kickOffInsertTable" style="display:none;">--%>
                <%--<input type="hidden" name="football" value="football"/>--%>
                <%--<table id="FBinput" style="color:white;">--%>
                    <%--<tr>--%>
                        <%--<td><input type="text" name="Distance" placeholder="Distance" rel="13"/></td>--%>
                        <%--<td><input type="text" name="Scored" placeholder="Scored" rel="17"/></td>--%>
                        <%--<td><input type="text" name="Tackler" id="Tackler" placeholder="Tackler" rel="18"/></td>--%>
                        <%--<td><input class="Date" type="text" name="Date" id="FBDate" placeholder="Date" rel="19"/></td>--%>
                    <%--</tr>--%>
                <%--</table>--%>
            <%--</form>--%>
        </div>
        <div class="playResultsTable">
        <div class="table-results">
            <table class="table table-hover dataTable" id="example" cellpadding="0" cellspacing="0">
                <thead>
                <tr>
                    <th>id</th>
                    <th>Play</th>
                    <th>Carrier</th>
                    <th>Result</th>
                    <th>Tackler</th>
                    <th>Down</th>
                    <th>Yard Line</th>
                    <th>Yards</th>
                    <th>YTG</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td>
                            <input class="input-small search_init" type="text" name="id" value="Id"/>
                        </td>

                        <td>
                            <input class="input-small search_init" type="text" name="play" value="Play"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="carrier" value="Carrier"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="result" value="Result"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="tackler" value="Tackler"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="down" value="Down"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="yardLine" value="YardLine"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="yards" value="Yards"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="YTG" value="YTG"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="action" value="Action"/>
                        </td>
                    </tr>
                </tfoot>
                <tbody>
                    <c:forEach var="play" items="${playresults}">
                        <tr>
                            <td>${play.id}</td>
                            <td>${play.play}</td>
                            <td>${play.carrier}</td>
                            <td>${play.result}</td>
                            <td>${play.tackler}</td>
                            <td>${play.down}</td>
                            <td>${play.yardLine}</td>
                            <td>${play.yards}</td>
                            <td>${play.YTG}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/play/edit/${play.id}">Edit</a><br>
                                <a href="${pageContext.request.contextPath}/game/playresult/delete/${play.id}">Delete</a><br>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
        </div>
        </div>
    </div>
</body>
<script type="text/javascript">
    var asInitVals = new Array();


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

    function selectedNav(id){
        document.getElementById(id).className="selected";
    }

//    document.getElementById("recordPlayNav").setAttribute("class","active");

    jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
        return ((x < y) ? -1 : ((x > y) ?  1 : 0));
    };

    jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
        return ((x < y) ?  1 : ((x > y) ? -1 : 0));
    };

    $(document).ready(function() {
        var oTable = $('#example').dataTable( {
            "bJQueryUI": true,
            "bAutoWidth" : false,
            "oLanguage": {
                "sSearch": ['Search all columns:']
    //
    //        "aoColumns": [
    //            { sWidth: '50px' },
    //            { sWidth: '10px' },
    //            { sWidth: '10px' },
    //            { sWidth: '30px' },
    //            { sWidth: '10px' },
    //            { sWidth: '10px' },
    //            { sWidth: '30px' },
    //            { sWidth: '10px' },
    //            { sWidth: '20px' }
    //        ]
            }
        } );


        $(function(){
            var $selectYTG = $("#inputYTG");
            var $selectDistance = $("#inputDistance");
            for(i=1;i<100;i++){
                $selectYTG.append($('<option></option>').val(i).html(i));
                $selectDistance.append($('<option></option>').val(i).html(i));
            }
        });


        $("tfoot input").keyup( function () {
            /* Filter on the column (the index) of this element */
            oTable.fnFilter( this.value, $("tfoot input").index(this) );
        } );

        oTable.fnAdjustColumnSizing();

        /*
         * Support functions to provide a little bit of 'user friendliness' to the textboxes in
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