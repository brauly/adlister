<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Update your profile" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />

<h1 class="text-center">Update your profile</h1>

<div class="row">

    <div class="list-group col-xs-12 col-sm-6">
        <a href="#" class="list-group-item active">
            Your profile info
        </a>
        <form action="/update-profile" method="POST">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstName">First name</label>
                    <input type="text" class="form-control" id="firstName" placeholder="First name" value="${user.getFirstName()}">
                </div>
                <div class="form-group col-md-6">
                    <label for="lastName">Last name</label>
                    <input type="text" class="form-control" id="lastName" placeholder="Last name" value="${user.getLastName()}">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" placeholder="Email" value="${user.getEmail()}">
                </div>
                <div class="form-group col-md-6">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" placeholder="Password" value="${user.getPassword()}">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="username" class="col-form-label">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" readonly class="form-control-plaintext" value="${user.getUsername()}/>">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>

        </form>

    </div>

</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
