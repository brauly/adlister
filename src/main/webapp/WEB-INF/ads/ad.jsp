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
    <h1 class="text-center title">Advertisement</h1>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title"><c:out value="${ad.title} - ${ad.user.username}" />
                <p>Category Type:  <em><c:out value="${ad.category.classification}"/></em></p></h3>
        </div>
        <div class="panel-body">
            <img class="media-object" src="http://via.placeholder.com/100x100" alt="random-image">
            <p><c:out value="${ad.description}" /></p>
            <p> - <c:out value="${ad.user.firstname}"/></p>
        </div>
    </div>

</div>


<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>