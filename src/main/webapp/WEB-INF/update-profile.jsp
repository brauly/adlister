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
                    <label for="firstname">First name</label>
                    <input type="text"
                           class="form-control"
                           id="firstname" name="firstname" placeholder="First name" value="${user.firstname}">
                </div>
                <div class="form-group col-md-6">
                    <label for="lastname">Last name</label>
                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last name" value="${user.lastname}">
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email"
                           class="form-control"
                           id="email" name="email" placeholder="Email" value="${user.email}">
                </div>

            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="username" class="col-form-label">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" readonly class="form-control-plaintext" value="${user.username}">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Update</button>

        </form>

    <div class="list-group col-xs-12 col-sm-6">
        <a href="#" class="list-group-item active">
            Update your password
        </a>
        <form action="/update-profile" method="POST">

            <div class="form-group col-md-6">
                <label for="currentPassword">Current password</label>
                <input type="password" class="form-control" name="currentPassword" id="currentPassword" placeholder="Current password">

                <label for="newPassword">New password</label>
                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="New password">

                <label for="confirmPassword">Confirm password</label>
                <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm password">
            </div>


    </div>

</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
