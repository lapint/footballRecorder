<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
<link href="<c:url value="/resources/css/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">
<link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
</head>

<body>
<jsp:include page="header.jsp" />

    <div class="wrapper">
        <div class="add">
            <div class="btn-group">
                <button class="btn" id="offenseInputs" onClick="offenseInsert()">Offense</button>
                <button class="btn" id="defenseInputs" onClick="defenseInsert()">Defense</button>
                <button class="btn" id="fieldGoalInputs" onClick="fieldGoalInsert()">Field Goal</button>
                <button class="btn" id="returnInputs" onClick="returnInsert()">Return</button>
                <button class="btn" id="kickOffInputs" onClick="kickoffInsert()">Kickoff</button>
            </div>

            <form:form method="POST" commandName="playresult" id="offenseInsertTable" style="display:none;">
                <div class="control-group">
                    <label class="control-label" for="inputPlay">Play</label>
                    <div class="controls">
                        <form:select path="Play" id="inputPlay">
                            <form:options items="${plays}" itemValue="Name" itemLabel="Name"/>
                        </form:select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputPlayer">Carrier</label>
                    <div class="controls">
                        <form:select path="Carrier" id="inputPlayer">
                            <form:options items="${players}" itemValue="Name" itemLabel="Name"/>
                        </form:select>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputYards">Yards</label>
                    <div class="controls">
                        <form:input type="text" id="inputYards" placeholder="Yards" path="Yards"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputYTG">YTG</label>
                    <div class="controls">
                        <form:input type="text" id="inputYTG" placeholder="YTG" path="YTG"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputDown">Down</label>
                    <div class="controls">
                        <form:input type="text" id="inputDown" placeholder="Down" path="Down"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputTackler">Tackler</label>
                    <div class="controls">
                        <form:input type="text" id="inputTackler" placeholder="Tackler" path="Tackler"/>
                    </div>
                </div>

                <div class="control-group">
                    <label class="control-label" for="inputYTG">Result</label>
                    <div class="controls">
                        <form:input type="text" id="inputResult" placeholder="Result" path="Result"/>
                    </div>
                </div>

                <div class="control-group">
                    <div class="controls">
                        <form:button type="submit" class="btn">Add Play Result</form:button>
                    </div>
                </div>

            </form:form>

            <form id="offenseInsertTable" style="display:none;">
                <table style="color:white;">
                    <tr>
                        <td><input path="YTG" /></td>
                        <td><input path="Down"/></td>
                        <td></td>
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
        </div>
        <div class="table-results">
            <h1>List of Plays</h1>
            <p>Here you can see the list of the teams, edit them, remove or update.</p>
            <table class="table table-hover dataTable" id="example" cellpadding="0" cellspacing="0" style="width:1000px;">
                <thead>
                <tr>
                    <th>id</th>
                    <th>Play</th>
                    <th>Carrier</th>
                    <th>Result</th>
                    <th>Tackler</th>
                    <th>Down</th>
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
                            <td>${play.yards}</td>
                            <td>${play.YTG}</td>
                            <td>
                                <a href="${pageContext.request.contextPath}/play/edit/${play.id}.html">Edit</a><br>
                                <a href="${pageContext.request.contextPath}/play/delete/${play.id}.html">Delete</a><br>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>

            </table>
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

    document.getElementById("recordPlayNav").setAttribute("class","active");

    jQuery.fn.dataTableExt.oSort['string-case-asc']  = function(x,y) {
        return ((x < y) ? -1 : ((x > y) ?  1 : 0));
    };

    jQuery.fn.dataTableExt.oSort['string-case-desc'] = function(x,y) {
        return ((x < y) ?  1 : ((x > y) ? -1 : 0));
    };

    $(document).ready(function() {
    var oTable = $('#example').dataTable( {
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