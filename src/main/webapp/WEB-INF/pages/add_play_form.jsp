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
    <link href="<c:url value="/resources/css/smoothness/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
</head>
<body>
    <jsp:include page="header.jsp" />
    <div class="wrapper">

        <div class="add">
            <h1>Add Play</h1>
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
        </div>
        <div class="playsTable">
            <div class="table-results">
                <table class="table table-hover" id="example" cellpadding="0" cellspacing="0">
                    <thead>
                    <tr>
                        <th>id</th>
                        <th>Play</th>
                        <th>Carrier</th>
                        <th>Platoon</th>
                        <th>Actions</th>
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
                    <tfoot>
                    <tr>
                        <td>
                            <input class="input-small search_init" type="text" name="id" value="ID"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="name" value="Name"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="type" value="Type"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="platoon" value="Platoon"/>
                        </td>
                        <td>
                            <input class="input-small search_init" type="text" name="Action" value="Action"/>
                        </td>
                    </tr>
                    </tfoot>
                </table>
                <p><a href="${pageContext.request.contextPath}/index.html">Home page</a></p>
            </div>
        </div>
    </div>
</body>
<script type="text/javascript">
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