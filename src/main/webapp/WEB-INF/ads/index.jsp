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
                    <c:out value="${ad.title} - ${ad.getUsername()}"/></p>
                </h2>
                <form action="/ads/delete" method="post">
                    <div class="form-group">
                        <input type="hidden" name="id" class="form-control" value="${ad.id}">
                            <span class="pull-right">
                                <button id="delete" class="btn btn-default">
                                    <span class="glyphicon glyphicon-minus"></span>
                                </button>
                            </span>
                    </div>
                </form>
                <form action="/ads/update" method="get">
                    <div class="form-group">
                        <input type="hidden" name="id" class="form-control" value="${ad.id}">
                        <span class="pull-right">
                                <button id="update" class="btn btn-default">
                                    <span class="glyphicon glyphicon-pencil"></span>
                                </button>
                            </span>
                    </div>
                </form>

            </div>
            <div class="media">
                <div class="media-left">
                    <img class="media-object" src="http://via.placeholder.com/100x100" alt="random-image">
                </div>
                <div class="media-body">
                    <div class="panel-body">
                        <p><c:out value="${ad.description}"/></p>
                        <p> - <c:out value="${ad.getFirstname()}"/></p>
                    </div>
                </div>
            </div>
        </div>
    </a>
    </c:forEach>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />


</body>
</html>



