<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%--@elvariable id="_csrf" type="org.springframework.security.web.server.csrf.DefaultCsrfToken"--%>
<!doctype html>
<html lang="en-US">
<head>
    <STYLE>
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

<div class="signup">
    <!-- MAIN -->
    <main class="signup__main">
        <img class="signup__bg" src="../../resources/images/signup-bg.png" alt="bg">

        <div class="container">
            <div class="signup__container">
                <div class="signup__logo">
                    <a href="#"><img src="../../resources/fonts/icons/main/Logo_Forum.svg" alt="logo">4JOB</a>
                </div>
                <div class="signup__head">
                    <h3>Admin panel User Info</h3>
                </div>
                <!--//todo сюда перенести форма User для редактирования админом-->
                <form:form method="POST" action="/userform" modelAttribute="user">
                    <div class="signup__form">
                        <div class="row" data-visible="desktop">
                            <div class="col-md-6">
                                <div class="signup__section">
                                    <label class="signup__label" for="firstName">First Name</label>
                                    <form:input type="text" class="form-control" path="firstName"
                                                value="${user.firstName}"/>
                                        <%--<label class="signup__label" for="first-name">First Name</label>--%>
                                        <%--<input type="text" class="form-control" id="first-name" value="${user.firstName}">--%>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="signup__section">
                                    <label class="signup__label" for="lastName">Last Name</label>
                                    <form:input type="text" class="form-control" path="lastName"
                                                value="${user.lastName}"/>
                                        <%--<input type="text" class="form-control" id="last-name" value="${user.lastName}">--%>
                                </div>
                            </div>
                        </div>
                        <div class="signup__section">
                            <label class="signup__label" for="username">Username</label>
                            <form:input type="text" class="form-control" path="username" value="${user.username}"/>
                                <%--<input type="text" class="form-control" id="username" value="${user.username}">--%>
                        </div>
                        <div class="signup__section">
                            <label class="signup__label" for="email">Emain Address</label>
                            <form:input type="text" class="form-control" path="email" value="${user.email}"/>
                                <%--<input type="text" class="form-control" id="email" value="${user.email}">--%>
                        </div>
                        <div class="signup__section">
                            <label class="signup__label" for="password">Password</label>
                            <div class="message-input">
                                <form:input type="text" class="form-control" path="password" value="${user.password}"/>
                                    <%--<input type="text" class="form-control" id="password" value="${user.password}">--%>
                            </div>
                        </div>
                        <form:checkboxes element="li" path="roles" items="${rolesList}"/>
                        <form:input type="hidden" path="id" value="${user.id}"/>
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        <div class="col-auto">
                            <input type="submit" class="signup__btn-create btn btn--type-02" value="Save"/>
                        </div>
                            <%--<a href="#" class="signup__btn-create btn btn--type-02">Create New Account</a>--%>
                    </div>
                </form:form>
            </div>
        </div>
    </main>

    <!-- FOOTER -->
    <footer class="signup__footer">
        <div class="container">
            <div class="signup__footer-content">
                <ul class="signup__footer-menu">
                    <li><a href="#">Teams</a></li>
                    <li><a href="#">Privacy</a></li>
                    <li><a href="#">Send Feedback</a></li>
                </ul>
                <ul class="signup__footer-social">
                    <li><a href="#"><i class="fa fa-facebook-square" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-google-plus" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-cloud" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-rss" aria-hidden="true"></i></a></li>
                </ul>
            </div>
        </div>
    </footer>
</div>

<!-- JAVA SCRIPT -->
<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../resources/vendor/velocity/velocity.min.js"></script>
<script src="../../resources/js/app.js"></script>

</body>
</html>