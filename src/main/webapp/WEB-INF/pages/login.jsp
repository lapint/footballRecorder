<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login Page</title>
    <script src="<c:url value="/resources/js/jquery.js" />" type="text/javascript"></script>
    <script src="<c:url value="/resources/js/bootstrap.min.js" />"></script>
    <script src="<c:url value="/resources/js/jquery-ui-1.10.3.custom.min.js" />" type="text/javascript" ></script>
    <script src="<c:url value="/resources/js/jquery.dataTables.min.js" />" type="text/javascript"></script>
    <link href="<c:url value="/resources/css/jquery.dataTables.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery.dataTables_themeroller.css"/>" rel="stylesheet">
    <link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/site.css" />" rel="stylesheet">
    <link href="<c:url value="/resources/css/jquery-ui-1.10.3.custom.min.css"/>" rel="stylesheet">

    <style>
        .errorblock {
            color: #ff0000;
            background-color: #ffEEEE;
            border: 3px solid #ff0000;
            padding: 8px;
            margin: 16px;
        }
    </style>
</head>
<body onload='document.loginForm.j_username.focus();'>

<c:if test="${not empty error}">
    <div class="errorblock">
        Your login attempt was not successful, try again.<br /> Caused :
            ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
    </div>
</c:if>



<div>

    <div class="LoginNavbar navbar">
        <div class="title">
            Football Team Manager
        </div>
        <div class="navbar-inner login-navbar-inner">
            <div class="container login-container">

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
                        <li><a href="#playResults">Play Results</a></li>
                        <li><a href="#playbook">Playbook</a></li>
                        <li><a href="#players">Players</a></li>
                        <li><a href="#playerStats">Player Stats</a></li>
                        <li><a href="#contact">Contact</a></li>
                        <li><a href=<c:url value='/j_spring_security_logout'/>>Logout</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="login">
            <form class="loginForm form-inline" name='loginForm' action="<c:url value="j_spring_security_check" />" method='POST'>
                <input type="text" id="inputEmail" name="j_username" placeholder="Email">
                <input type="password" id="inputPassword" name="j_password"  placeholder="Password">
                <label class="checkbox">
                    <input type="checkbox"> Remember me
                </label>
                <button type="submit" class="btn">Sign in</button>
                <input name="reset" type="reset" class="btn"/>
            </form>
        </div>
    </div>

    <div class="main">

        <div class="loginContainer">
            <div class="loginWrapper">
                <div class="info">
                    <div class="about">
                        ScoreRecorder is Team Management <br/>
                        Main Features:<br/>
                        Enter in player information. <br/>
                        Enter in entire playbook. <br/>
                        Enter in play results <br/>
                    </div>
                </div>

            </div>
        </div>

        <div class="playResults" id="playResults">
            <div class="wrapper">
                Play Results<br/>
                Create a new game. <br/>
                Record every play as it happens in real time. <br/>
                Analyze player performance during the game. <br/>
                Analyze play performance during the game.
            </div>
        </div>

        <div class="playbook" id="playbook">
            <div class="wrapper">
                Playbook<br/>
                Enter plays into your own teams Virtual Playbook <br/>
                Convenient play lookup. <br/>
            </div>
        </div>
        <div class="players" id="players">
            <div class="wrapper">
                Players
            </div>
        </div>
        <div class="playerStats" id="playerStats">
            <div class="wrapper">
                Player Stats
            </div>
        </div>
        <div class="contact" id="contact">
            <div class="wrapper">
                Contact
            </div>
        </div>
    </div>
</div>

</body>
</html>