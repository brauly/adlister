<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing Ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1 class="text-center">Advertisement</h1>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><c:out value="${ad.title}" /></h3>
        </div>
        <div class="panel-body">
            <img class="media-object" src="http://lorempixel.com/100/100/" alt="random-image">
            <p><c:out value="${ad.description}" /></p>
        </div>
    </div>

    <%--<c:forEach var="ad" items="${ads}">--%>

        <%--<div class="media">--%>
            <%--<a href="/ads/show?id=${ad.id}">--%>
                <%--<div class="media-left">--%>
                    <%--<img class="media-object" src="http://lorempixel.com/100/100/" alt="random-image">--%>
                <%--</div>--%>
                <%--<div class="media-body">--%>
                    <%--<h2 class="media-heading"><c:out value="${ad.title}" /></h2>--%>
                    <%--<p><c:out value="${ad.description}" /></p>--%>
                <%--</div>--%>
            <%--</a>--%>
        <%--</div>--%>
    <%--</c:forEach>--%>
</div>

</body>
</html>