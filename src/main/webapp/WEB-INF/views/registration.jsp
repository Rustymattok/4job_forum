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

    <title>Registration</title>
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
    <p class="lead">Registration User</p>
</div>

<form:form method="POST" action="/registration" modelAttribute="user">
    <div class="form-group row">
        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="username">Login</form:label>
        <div class="col-sm-10">
            <form:input type="text" class="form-control form-control-lg" path="username" placeholder="Введите логин"/>
        </div>
    </div>

    <div class="form-group row">
        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="password">Password</form:label>
        <div class="col-sm-10">
            <form:input type="text" class="form-control form-control-lg" path="password" placeholder="Введите пароль"/>
        </div>
    </div>

    <div class="form-group row">
        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="firstName">FirstName</form:label>
        <div class="col-sm-10">
            <form:input type="text" class="form-control form-control-lg" path="firstName" placeholder="Введите имя"/>
        </div>
    </div>

    <div class="form-group row">
        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="lastName">SecondName</form:label>
        <div class="col-sm-10">
            <form:input type="text" class="form-control form-control-lg" path="lastName" placeholder="Введите Фамилию"/>
        </div>
    </div>

    <div class="form-group row">
        <form:label class="col-sm-2 col-form-label col-form-label-lg" path="email">MailBox</form:label>
        <div class="col-sm-10">
            <form:input type="text" class="form-control form-control-lg" path="email" placeholder="Введите email"/>
        </div>
    </div>
    <div class="col-auto">
        <button type="submit" class="btn btn-primary mb-2">Submit</button>
    </div>
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
</form:form>

<div class="container mt-3">
    <div class="row">
        <h4>Список пользователей</h4>
    </div>
    <div class="row">
        <table class="table">
            <thead>
            <tr>
                <th scope="col">Users</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${listUser}" var="user">
                <tr>
                    <td><c:out value="${user.firstName}"/></td>
                    <td><c:out value="${user.lastName}"/></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

</body>
</html>