<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<%@ page session="false" isELIgnored="false" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%--@elvariable id="_csrf" type="org.springframework.security.web.server.csrf.DefaultCsrfToken"--%>
<html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

    <title>Login Page</title>
</head>
<body>
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
        integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
        crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
        crossorigin="anonymous"></script>
<div class="jumbotron">
    <h1 class="display-4">Spring Boot Forum</h1>
    <p class="lead">Login Page</p>
</div>

<form action="<c:url value="/login"/>" method="post">
    <div class="form-group row">
        <label class="col-sm-2 col-form-label col-form-label-lg"> User Name : <input type="text"
                                                                                     class="form-control form-control-lg"
                                                                                     name="username"
                                                                                     placeholder="login"/> </label>
        <label class="col-sm-2 col-form-label col-form-label-lg"> Password : <input type="password"
                                                                                    class="form-control form-control-lg"
                                                                                    name="password"
                                                                                    placeholder="password"/> </label>
    </div>
    <%--<input type="hidden" text="${_csrf.parameterName}" value="${_csrf.token}"/>--%>
    <div class="col-auto">
        <input type="submit" class="btn btn-primary mb-2" value="Sign In"/>
    </div>
    <div>
        <a class="underlineHover" href="<c:url value="/registration"/>">Registration</a>
    </div>
</form>
</body>
</html>
