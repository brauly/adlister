<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
<jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Viewing All The Ads" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1 class="text-center">Spooklist Advertisements</h1>

    <c:forEach var="ad" items="${ads}">
    <a href="/ads/show?id=${ad.id}">
        <div class="panel panel-default">
            <div class="panel-heading">
                <h2 class="media-heading panel-title">
                    <c:out value="${ad.title}" />
                </h2>
            </div>
            <div class="media">
                <div class="media-left">
                    <img class="media-object" src="http://lorempixel.com/100/100/" alt="random-image">
                </div>
                <div class="media-body">
                    <div class="panel-body">
                    <p><c:out value="${ad.description}" /></p>
                    </div>
                </div>
            </div>
        </div>
    </a>
    </c:forEach>
</div>

</body>
</html>
