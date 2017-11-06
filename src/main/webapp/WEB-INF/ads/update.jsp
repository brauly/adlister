<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
    <jsp:param name="title" value="Update ad" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">

    <h1 class="text-center title">Update your ad</h1>
    <form action="/ads/update" method="post">
        <input name="id" type="hidden" value="${ad.id}">
        <div class="form-group">
            <label for="title">Title</label>
            <input id="title" name="title" class="form-control" type="text" value="${ad.title}">

            <c:if test = "${errors.containsKey('title')}">
                <p class="error"> ${errors.get('title')}</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="description">Description</label>
            <textarea id="description" name="description" class="form-control" type="text">${ad.description}</textarea>

            <c:if test = "${errors.containsKey('description')}">
                <p class="error"> ${errors.get('description')}</p>
            </c:if>
        </div>
        <div class="form-group">
            <label for="category">Category</label>
            <select class="form-control" id="category" name="category">
                <c:forEach var="category" items="${categories}">
                    <option ${ad.categoryId == category.id ? 'selected' : '' } value="${category.id}">"${category.classification}" </option>
                </c:forEach>
            </select>
        </div>
        <br>
        <input type="submit" class="btn btn-block btn-primary">
    </form>
</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>

<%--<c:if test = "${Errors.containsKey('firstname')}">--%>
<%--<p class="error"> ${Errors.get('firstname')}</p>--%>
<%--</c:if>--%>
