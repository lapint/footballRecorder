<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="navbar">
    <div class="navbar-inner">
        <div class="container">

            <!-- .btn-navbar is used as the toggle for collapsed navbar content -->
            <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </a>

            <!-- Be sure to leave the brand out there if you want it shown -->
            <%--<a class="brand" href="#">Iowa State Football</a>--%>

            <!-- Everything you want hidden at 940px or less, place within here -->
            <div class="nav-collapse collapse">
                <!-- .nav, .navbar-search, .navbar-form, etc -->
                <ul class="nav nav-tabs">
                    <li  id="gamesNav"><a href="${pageContext.request.contextPath}/game/create.html">Games</a></li>
                    <%--<li  id="recordPlayNav"><a href="${pageContext.request.contextPath}/game/playresult/add.html">Record Play</a></li>--%>
                    <li  id="playbookNav"><a href="${pageContext.request.contextPath}/playbook/add.html">Playbook</a></li>
                    <li  id="playersNav"><a href="${pageContext.request.contextPath}/players/add.html">Roster</a></li>
                    <li  id="playerStatsNav"><a href="${pageContext.request.contextPath}/../playerStats/list.html">Player Statistics</a></li>
                    <li  id="logoutNav"><a href=<c:url value='/j_spring_security_logout'/>>Logout</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
