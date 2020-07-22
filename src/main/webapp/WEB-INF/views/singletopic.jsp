<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en-US">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, minimum-scale=1, maximum-scale=1">
    <meta name="keywords" content="HTML5 Template">
    <meta name="description" content="Responsive HTML5 Template">
    <meta name="author" content="author.com">
    <title>Responsive HTML5 Template</title>

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
<!-- HEADER -->
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
                        <li><a href="singletopic.jsp">My Topics</a></li>
                        <li><a href="simple-signup.html">Sign up Page</a></li>
                        <li><a href="create-topic.html">Create Topic Page</a></li>
                    </ul>
                </nav>
            </div>
            <div class="header__search">
                <form action="#">
                    <label>
                        <i class="icon-Search js-header-search-btn-open"></i>
                        <input type="search" placeholder="Search all forums" class="form-control">
                    </label>
                </form>
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
            <div class="header__menu">
                <div class="header__menu-btn" data-dropdown-btn="menu">
                    Latest Topics<i class="icon-Menu_Icon"></i>
                </div>
                <nav class="dropdown dropdown--design-01" data-dropdown-list="menu">
                    <div>
                        <ul class="dropdown__catalog row">
                            <li class="col-xs-6"><a href="#">New</a></li>
                            <li class="col-xs-6"><a href="#">Unread</a></li>
                            <li class="col-xs-6"><a href="#">Groups</a></li>
                            <li class="col-xs-6"><a href="#">Users</a></li>
                            <li class="col-xs-6"><a href="#">Tags</a></li>
                            <li class="col-xs-6"><a href="#">Shortcuts</a></li>
                        </ul>
                    </div>
                    <div>
                        <h3>Categories</h3>
                        <ul class="dropdown__catalog row">
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-f9bc64"></i>Hobbies</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-348aa7"></i>Social</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-4436f8"></i>Video</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-5dd39e"></i>Random</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-ff755a"></i>Arts</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-bce784"></i>Tech</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-83253f"></i>Gaming</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-c49bbb"></i>Science</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-3ebafa"></i>Exchange</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-c6b38e"></i>Pets</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-a7cdbd"></i>Entertainment</a>
                            </li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-525252"></i>Education</a>
                            </li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-777da7"></i>Q&amp;As</a></li>
                            <li class="col-xs-6"><a href="#" class="category"><i class="bg-368f8b"></i>Politics</a></li>
                        </ul>
                    </div>
                    <div>
                        <ul class="dropdown__catalog row">
                            <li class="col-xs-6"><a href="#">Support</a></li>
                            <li class="col-xs-6"><a href="#">Forum Rules</a></li>
                            <li class="col-xs-6"><a href="#">Blog</a></li>
                            <li class="col-xs-6"><a href="#">About</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="header__notification">
                <div class="header__notification-btn" data-dropdown-btn="notification">
                    <i class="icon-Notification"></i>
                    <span>6</span>
                </div>
                <div class="dropdown dropdown--design-01" data-dropdown-list="notification">
                    <div>
                        <a href="#">
                            <i class="icon-Favorite_Topic"></i>
                            <p>Roswell . 16 feb, 17<span>Which movie have you watched recently?</span></p>
                        </a>
                        <a href="#">
                            <i class="icon-Reply_Empty"></i>
                            <p>Callis . 18 feb, 17<span>I got an amzon thingie!</span></p>
                        </a>
                        <a href="#">
                            <i class="icon-Badge"></i>
                            <p>Earned Badge . 19 feb, 17<span><img
                                    src="../../resources/fonts/icons/badges/Lets_talk.svg"
                                    alt="Lets Talk">Lets Talk</span></p>
                        </a>
                        <a href="#">
                            <i class="icon-Badge"></i>
                            <p>Earned Badge . 21 feb, 17<span><img
                                    src="../../resources/fonts/icons/badges/Intermediate.svg" alt="Intermediate">Intermediate</span>
                            </p>
                        </a>
                        <a href="#">
                            <i class="icon-Share_Topic"></i>
                            <p>Charlie . 22 feb, 17<span>Need Video file of that cat.</span></p>
                        </a>
                        <a href="#">
                            <i class="icon-Pencil"></i>
                            <p>Greentea . 22 feb, 17<span>New Facebook like and share button.</span></p>
                        </a>
                        <span><a href="#">view older notifications...</a></span>
                    </div>
                </div>
            </div>
            <div class="header__user">
                <div class="header__user-btn" data-dropdown-btn="user">
                    <img src="../../resources/fonts/icons/avatars/A.svg" alt="avatar">
                    azyrusmax<i class="icon-Arrow_Below"></i>
                </div>
                <nav class="dropdown dropdown--design-01" data-dropdown-list="user">
                    <div>
                        <div class="dropdown__icons">
                            <a href="#"><i class="icon-Bookmark"></i></a>
                            <a href="#"><i class="icon-Message"></i></a>
                            <a href="#"><i class="icon-Preferences"></i></a>
                            <a href="#"><i class="icon-Logout"></i></a>
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
<!-- MAIN -->
<main>
    <div class="container">
        <div class="topics">
            <div class="topics__heading">
                <h2 class="topics__heading-title"><c:out value="${topic.name}"/></h2>
            </div>
            <div class="topics__body">
                <div class="topics__content">
                    <div class="topic">
                        <div class="topic__head">
                            <div class="topic__avatar">
                                <a href="#" class="avatar"><img src="../../resources/fonts/icons/avatars/B.svg"
                                                                alt="avatar"></a>
                            </div>
                            <div class="topic__caption">
                                <div class="topic__name">
                                    <a href="#"><c:out value="${topic.author.firstName}"/></a>
                                </div>
                                <div class="topic__date"><i class="icon-Watch_Later"></i>06 May, 2017</div>
                            </div>
                        </div>
                        <div class="topic__content">
                            <div class="topic__text">
                                <p><c:out value="${topic.content}"/></p>
                            </div>
                            <div class="topic__footer">
                                <div class="topic__footer-likes">
                                    <div>
                                        <a href="#"><i class="icon-Upvote"></i></a>
                                        <span>201</span>
                                    </div>
                                    <div>
                                        <a href="#"><i class="icon-Downvote"></i></a>
                                        <span>08</span>
                                    </div>
                                    <div>
                                        <a href="#"><i class="icon-Favorite_Topic"></i></a>
                                        <span>39</span>
                                    </div>
                                </div>
                                <div class="topic__footer-share">
                                    <div data-visible="desktop">
                                        <a href="#"><i class="icon-Share_Topic"></i></a>
                                        <a href="#"><i class="icon-Flag_Topic"></i></a>
                                        <a href="#"><i class="icon-Bookmark"></i></a>
                                    </div>
                                    <div data-visible="mobile">
                                        <a href="#"><i class="icon-More_Options"></i></a>
                                    </div>
                                    <a href="#"><i class="icon-Reply_Fill"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:forEach items="${comments}" var="reply">
                        <div class="topic topic--comment">

                            <div class="topic__head">
                                <div class="topic__avatar">
                                    <a href="#" class="avatar"><img src="../../resources/fonts/icons/avatars/L.svg"
                                                                    alt="avatar"></a>
                                </div>
                                <div class="topic__caption">
                                    <div class="topic__name">
                                        <a href="#"><c:out value="${reply.author.firstName}"/></a>
                                    </div>
                                </div>
                                <a href="#" class="topic__arrow topic__arrow--up"><i class="icon-Arrow_Up"></i></a>
                            </div>
                            <div class="topic__content">
                                <div class="topic__text">
                                    <p><c:out value="${reply.text}"/></p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <form:form method="POST" action="/singletopic/${topic.id}" modelAttribute="comment">
            <div class="create__section create__textarea">
                <form:textarea class="form-control" id="description" path="text" placeholder="Add here you text"/>
                <form:input type="hidden" path="topic" value="${topic.id}"/>
            </div>

            <div class="create__footer">
                <a href="<c:url value="/index"/>" class="create__btn-cansel btn">Cancel</a>
                <button type="submit" class="create__btn-create btn btn--type-02">Reply</button>
            </div>
        </form:form>
    </div>
</main>
<!-- JAVA SCRIPT -->
<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../resources/vendor/velocity/velocity.min.js"></script>
<script src="../../resources/js/app.js"></script>

</body>
</html>