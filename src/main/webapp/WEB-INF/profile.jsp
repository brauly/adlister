<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Your Profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<div class="container">
    <h1>Welcome, ${sessionScope.user.username}!</h1>
</div>

<div class="row">

    <div class="list-group col-xs-12 col-sm-6">
        <a href="#" class="list-group-item active">
            Manage your ads
        </a>
            <a href="#" class="list-group-item">View your ads</a>
            <a href="/ads/create" class="list-group-item">Create ad</a>
            <a href="#" class="list-group-item">Edit your ad</a>
            <a href="#" class="list-group-item">Delete your ad</a>
    </div>

    <div class="list-group col-xs-12 col-sm-6">
        <a href="#" class="list-group-item active">
            Manage your profile
        </a>
        <a href="#" class="list-group-item">Update profile</a>
        <a href="#" class="list-group-item">Change password</a>
    </div>

</div>

</body>
</html>
