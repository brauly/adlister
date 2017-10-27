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
        <h1>Welcome to Spooklist!</h1>
        <p>A community of exchange for all things Halloween!</p>



        <%--<c:if test="${(sessionScope.user == null)}">--%>
        <%--<p><a class="btn btn-primary btn-lg" href="/register" role="button">Register now!</a></p>--%>
        <%--<p><a class="btn btn-primary btn-lg" href="/login" role="button">Log in!</a></p>--%>
        <%--</c:if>--%>

        <c:if test="${(sessionScope.user != null)}">
        </c:if>
        <img id="ghost-gif" src="img/ghost.gif" alt="ghost">
    </div>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
