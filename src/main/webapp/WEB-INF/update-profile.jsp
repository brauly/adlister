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

        <a href="#" class="list-group-item active">Your profile info</a>

        <form action="/update-profile" method="POST">

            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="firstname">First name</label>
                    <input type="text" class="form-control" id="firstname" name="firstname" placeholder="First name" value="${user.firstname}">

                    <c:if test = "${errors.containsKey('firstname')}">
                        <p class="error"> ${errors.get('firstname')}</p>
                    </c:if>

                </div>

                <div class="form-group col-md-6">
                    <label for="lastname">Last name</label>
                    <input type="text" class="form-control" id="lastname" name="lastname" placeholder="Last name" value="${user.lastname}">

                    <c:if test = "${errors.containsKey('lastname')}">
                        <p class="error"> ${errors.get('lastname')}</p>
                    </c:if>

                </div>

            </div>

            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" id="email" name="email" placeholder="Email" value="${user.email}">

                    <c:if test = "${errors.containsKey('email')}">
                        <p class="error"> ${errors.get('email')}</p>
                    </c:if>

                </div>

                <div class="form-group col-md-6">
                    <label for="username" class="col-form-label">Username</label>
                    <input type="text" class="form-control" id="username" placeholder="Username" readonly class="form-control-plaintext" value="${user.username}">

                </div>

            </div>


        <a href="#" class="list-group-item active">Update your password</a>

            <div class="form-row">

                <div class="form-group col-md-12">

                    <label for="currentPassword">Current password</label>
                    <input type="password" class="form-control" name="currentPassword" id="currentPassword" placeholder="Current password">

                    <c:if test = "${errors.containsKey('password')}">
                        <p class="error"> ${errors.get('password')}</p>
                    </c:if>

                     <%--Validate that what they enter = current password--%>
                    <c:if test = "${errors.containsKey('currentPassword')}">
                        <p class="error"> ${errors.get('currentPassword')}</p>
                    </c:if>

                </div>

            </div>

            <div class="form-row">

                <div class="form-group col-md-6">

                    <label for="newPassword">New password</label>
                    <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="New password">

                    <c:if test = "${errors.containsKey('password')}">
                        <p class="error"> ${errors.get('password')}</p>
                    </c:if>

                </div>

                <div class="form-group col-md-6">
                    <label for="confirmPassword">Confirm password</label>
                    <input type="password" class="form-control" name="confirmPassword" id="confirmPassword" placeholder="Confirm password">

                    <c:if test = "${errors.containsKey('confirmPassword')}">
                        <p class="error"> ${errors.get('confirmPassword')}</p>
                    </c:if>

                </div>

                <button type="submit" id="update-profile" class="btn btn-primary">Update profile</button>

            </div>

        </form>

    </div>

</div>

<jsp:include page="/WEB-INF/partials/scripts.jsp" />

</body>
</html>
