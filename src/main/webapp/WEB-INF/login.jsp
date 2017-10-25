<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="/WEB-INF/partials/head.jsp">
        <jsp:param name="title" value="Please Log In" />
    </jsp:include>
</head>
<body>
<jsp:include page="/WEB-INF/partials/navbar.jsp" />
<div class="container">
    <h1>Please Log In</h1>
    <form action="/login" method="POST">
        <div class="form-group">
            <label for="username">Username</label>
            <input id="username" name="username" class="form-control" type="text">

            <script type="text/javascript">
                (function() {
                    var form = document.getElementsByName('username')[0];
                    if (localStorage['username'] !== undefined) {
                        var displayArea = document.getElementById('username');
                        displayArea.textContent = localStorage['username'];
                    }
                    form.addEventListener('submit', function() {
                        var nameField = document.getElementsByName('username')[0];
                        localStorage['username'] = nameField.value;
                    }, false);
                })();
            </script>

        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input id="password" name="password" class="form-control" type="password">
        </div>
        <input type="submit" class="btn btn-primary btn-block" value="Log In">
    </form>
</div>
</body>
</html>
