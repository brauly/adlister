<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="/index.jsp">
                <img src="/img/ghost.png" alt="ghost">
                    Spooklist
            </a>
            <p class="navbar-text">
                Creepin' it real since this past Thursday
            </p>
        </div>

        <div class="collapse navbar-collapse text-center" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <form class="navbar-form navbar-left" action="/search">
                    <div class="form-group">
                        <input type="text" name="search" class="form-control" placeholder="Search">
                    </div>
                    <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>
                </form>
                <li class="text-center"><a href="/ads">View all ads</a></li>

                <%-- Logged in --%>
                <c:if test="${(sessionScope.user != null)}">
                <li role="presentation" class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">
                        <span>Hi, <c:out value="${user.getFirstname()}"/>!</span>
                        <span class="glyphicon glyphicon-user"></span>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="text-center"><a href="/profile">View profile</a></li>
                        <li class="text-center"><a href="/ads/create">Create ad</a></li>
                    </ul>
                </li>
                <li><a href="/logout">Logout</a></li>
                </c:if>
                <%-- End of logged in --%>

                <%-- Logged out --%>
                <c:if test="${(sessionScope.user == null)}">
                    <li class="text-center"><a href="/register">Register!</a></li>
                    <li><a href="/login">Login <span class="glyphicon glyphicon-user"></span></a></li>
                </c:if>
            <%-- End of logged out --%>

            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->

</nav>