<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In"/>
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp"/>
<div class="container">
    <h1 class="text-center title">Please Login</h1>

    <c:if test="${Errors.containsKey('username')}">
        <p class="error"> ${Errors.get('username')}</p>
    </c:if>
    <c:if test="${Errors.containsKey('password')}">
        <p class="error"> ${Errors.get('password')}</p>
    </c:if>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" value="${username}" type="text" autofocus>


        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">


        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp"/>

</body>
</html>
