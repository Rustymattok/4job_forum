<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--@elvariable id="_csrf" type="org.springframework.security.web.server.csrf.DefaultCsrfToken"--%>

<!doctype html>
<html lang="en-US">
<head>
    <STYLE>
        button {
            background: transparent;
            border: none !important;
            font-size: 0;
        }
    </STYLE>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Responsive HTML5 Template">
    <meta name="author" content="author.com">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Форум job4j</title>
    <!-- STYLESHEET -->
    <!-- fonts -->
    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet">

    <!-- icon -->
    <link rel="stylesheet" href="../../resources/fonts/icons/main/mainfont/style.css">
    <link rel="stylesheet" href="../../resources/fonts/icons/font-awesome/css/font-awesome.min.css">

    <!-- Vendor -->
    <link rel="stylesheet" href="../../resources/vendor/bootstrap/v3/bootstrap.min.css">
    <link rel="stylesheet" href="../../resources/vendor/bootstrap/v4/bootstrap-grid.css">
    <!-- Custom -->
    <link rel="stylesheet" href="../../resources/css/style.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="container">
    <h1 class="display-4">Spring Boot Forum</h1>
    <p class="lead">4Job Forum</p>
</div>
<header>
    <div class="header js-header js-dropdown">
        <div class="container">
            <div class="header__logo">
                <h1>
                    <img src="../../resources/fonts/icons/main/Logo_Forum.svg" alt="logo">
                </h1>
                <div class="header__logo-btn" data-dropdown-btn="logo">
                    4Job<i class="icon-Arrow_Below"></i>
                </div>
                <nav class="dropdown dropdown--design-01" data-dropdown-list="logo">
                    <ul class="dropdown__catalog">
                        <li><a href="<c:url value="/index"/>">Home Page</a></li>
                        <li><a href="<c:url value="/usertopics/${online.id}"/>">My Topics</a></li>
                        <li><a href="<c:url value="/newtopic"/>">Create Topic Page</a></li>
                    </ul>
                </nav>
            </div>
            <%--//todo раздел поиска пользователей.--%>
            <div class="header__search">
                <form:form method="POST" action="/admin" modelAttribute="request">
                    <label>
                        <i class="icon-Search js-header-search-btn-open"></i>
                        <form:input type="search" path="" value="${request}"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    </label>
                </form:form>
                <div class="header__search-close js-header-search-btn-close"><i class="icon-Cancel"></i></div>
                <div class="header__search-btn" data-dropdown-btn="search">
                    Topics<i class="icon-Arrow_Below"></i>
                </div>
                <div class="dropdown dropdown--design-01" data-dropdown-list="search">
                    <ul>
                        <li>
                            <label>
                                <label class="custom-checkbox">
                                    <input type="checkbox" checked="checked">
                                    <i></i>
                                </label>Search Titles Only
                            </label>

                        </li>
                        <li>
                            <label>
                                <label class="custom-checkbox">
                                    <input type="checkbox">
                                    <i></i>
                                </label>Show Results as Posts
                            </label>
                        </li>
                        <li>
                            <a href="#">
                                <i class="icon-Advanced_Search"></i>Advanced Search
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
            <%--<div class="header__menu">--%>
            <%--<div class="header__menu-btn" data-dropdown-btn="menu">--%>
            <%--Latest Topics<i class="icon-Menu_Icon"></i>--%>
            <%--</div>--%>
            <%--<nav class="dropdown dropdown--design-01" data-dropdown-list="menu">--%>
            <%--<div>--%>
            <%--<ul class="dropdown__catalog row">--%>
            <%--<li class="col-xs-6"><a href="#">New</a></li>--%>
            <%--<li class="col-xs-6"><a href="#">Unread</a></li>--%>
            <%--<li class="col-xs-6"><a href="#">Groups</a></li>--%>
            <%--<li class="col-xs-6"><a href="#">Users</a></li>--%>
            <%--<li class="col-xs-6"><a href="#">Tags</a></li>--%>
            <%--<li class="col-xs-6"><a href="#">Shortcuts</a></li>--%>
            <%--</ul>--%>
            <%--</div>--%>
            <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<h3>Categories</h3>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<ul class="dropdown__catalog row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-f9bc64"></i>Hobbies</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-348aa7"></i>Social</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-4436f8"></i>Video</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-5dd39e"></i>Random</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-ff755a"></i>Arts</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-bce784"></i>Tech</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-83253f"></i>Gaming</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-c49bbb"></i>Science</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-3ebafa"></i>Exchange</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-c6b38e"></i>Pets</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-a7cdbd"></i>Entertainment</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-525252"></i>Education</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-777da7"></i>Q&amp;As</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#" class="category"><i class="bg-368f8b"></i>Politics</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<div>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<ul class="dropdown__catalog row">&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#">Support</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#">Forum Rules</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#">Blog</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;<li class="col-xs-6"><a href="#">About</a></li>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</ul>&ndash;%&gt;--%>
            <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
            <%--</nav>--%>
            <%--</div>--%>

            <%--<div class="header__notification">--%>
            <%--<div class="header__notification-btn" data-dropdown-btn="notification">--%>
            <%--<i class="icon-Notification"></i>--%>
            <%--<span>6</span>--%>
            <%--</div>--%>
            <%--<div class="dropdown dropdown--design-01" data-dropdown-list="notification">--%>
            <%--<div>--%>
            <%--<a href="#">--%>
            <%--<i class="icon-Favorite_Topic"></i>--%>
            <%--<p>Roswell . 16 feb, 17<span>Which movie have you watched recently?</span></p>--%>
            <%--</a>--%>
            <%--<a href="#">--%>
            <%--<i class="icon-Reply_Empty"></i>--%>
            <%--<p>Callis . 18 feb, 17<span>I got an amzon thingie!</span></p>--%>
            <%--</a>--%>
            <%--<a href="#">--%>
            <%--<i class="icon-Badge"></i>--%>
            <%--<p>Earned Badge . 19 feb, 17<span><img--%>
            <%--src="../../resources/fonts/icons/badges/Lets_talk.svg"--%>
            <%--alt="Lets Talk">Lets Talk</span></p>--%>
            <%--</a>--%>
            <%--<a href="#">--%>
            <%--<i class="icon-Badge"></i>--%>
            <%--<p>Earned Badge . 21 feb, 17<span><img--%>
            <%--src="../../resources/fonts/icons/badges/Intermediate.svg" alt="Intermediate">Intermediate</span>--%>
            <%--</p>--%>
            <%--</a>--%>
            <%--<a href="#">--%>
            <%--<i class="icon-Share_Topic"></i>--%>
            <%--<p>Charlie . 22 feb, 17<span>Need Video file of that cat.</span></p>--%>
            <%--</a>--%>
            <%--<a href="#">--%>
            <%--<i class="icon-Pencil"></i>--%>
            <%--<p>Greentea . 22 feb, 17<span>New Facebook like and share button.</span></p>--%>
            <%--</a>--%>
            <%--<span><a href="#">view older notifications...</a></span>--%>
            <%--</div>--%>
            <%--</div>--%>
            <%--</div>--%>
            <div class="header__user">
                <div class="header__user-btn" data-dropdown-btn="user">
                    <img src="../../resources/fonts/icons/avatars/A.svg" alt="avatar">
                    <c:out value="${online.firstName}"/>
                    <i class="icon-Arrow_Below"></i>
                </div>
                <nav class="dropdown dropdown--design-01" data-dropdown-list="user">
                    <div>
                        <div class="dropdown__icons">
                            <a href="#"><i class="icon-Bookmark"></i></a>
                            <a href="#"><i class="icon-Message"></i></a>
                            <a href="#"><i class="icon-Preferences"></i></a>
                            <form action="<c:url value="/logout"/>" method="post">
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                <button type="submit"><i class="icon-Logout"></i></button>
                            </form>
                        </div>
                    </div>
                    <div>
                        <ul class="dropdown__catalog">
                            <li><a href="#">Dashboard</a></li>
                            <li><a href="#">Badges</a></li>
                            <li><a href="#">My Groups</a></li>
                            <li><a href="#">Notifications</a></li>
                            <li><a href="#">Topics</a></li>
                            <li><a href="#">Likes</a></li>
                            <li><a href="#">Solved</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="header__offset-btn">
            <a href="<c:url value="/newtopic"/>"><img src="../../resources/fonts/icons/main/New_Topic.svg"
                                                      alt="New Topic"></a>
        </div>
    </div>
</header>
<main>
    <div class="container">
        <div class="posts">
            <div class="posts__head">
                <div class="posts__users">Users</div>
                <div class="posts__users">Topics</div>
                <div class="posts__users">Comments</div>
                <div class="posts__topic">Roles</div>
                <div class="posts__users">Activity</div>
            </div>
            <c:forEach items="${users}" var="user">
                <div class="posts__body">
                    <div class="posts__item bg-f2f4f6">
                        <div class="posts__users"><c:out value="${user.username}"/></div>
                        <div class="posts__users">
                            <a href="/usertopics/${user.id}">
                                <h style="color:#0000ff">topics</h>
                            </a>
                        </div>
                        <div class="posts__users">
                            <a href="/usercomments/${user.id}">
                                <h style="color:#0000ff">comments</h>
                            </a>
                        </div>
                        <div class="posts__topic"><c:out value="${user.roles}"/>
                        </div>
                        <div class="posts__users">
                            <a href="admin/userform/${user.id}" class="create__btn-create btn btn--type-02">edit
                                roles</a>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</main>
<!-- JAVA SCRIPT -->
<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../resources/vendor/velocity/velocity.min.js"></script>
<script src="../../resources/js/app.js"></script>

</body>
</html>
