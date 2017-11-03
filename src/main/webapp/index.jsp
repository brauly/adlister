<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Welcome!" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">

    <div class="jumbotron text-center">
        <h1 class="title">Welcome to Spooklist!</h1>
        <p>A community of exchange for all things Halloween!</p>
        <p><a class="btn btn-primary btn-lg" href="/ads" role="button">View all ads</a></p>
        <img id="ghost-gif" src="img/ghost.gif" alt="ghost">
    </div>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
