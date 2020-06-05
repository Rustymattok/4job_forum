<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
          integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <title>Форум job4j</title>
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
    <p class="lead">Topic Post</p>
</div>
<div class="container">
    <div class="container">
        <h3><c:out value="${post.name}"/></h3>
        <p><c:out value="${post.desc}"/></p>
    </div>
    <div class="container">
        <c:forEach items="${post.comments}" var="comment">
            <p><c:out value="${comment.name}"/></p>
        </c:forEach>
    </div>
    <form:form method="POST" action="/topic" modelAttribute="comments">
        <div class="form-group row">
            <form:label class="col-sm-2 col-form-label col-form-label-lg" path="name">Name</form:label>
            <div class="col-sm-10">
                <form:input type="text" class="form-control form-control-lg" path="name"
                            placeholder="Введите имя поста"/>
                <form:input type="hidden" path="id" value="${post.id}"/>
            </div>
        </div>
        <div class="col-auto">
            <button type="submit" class="btn btn-primary mb-2">Submit</button>
        </div>
    </form:form>
</div>
</body>

</html>