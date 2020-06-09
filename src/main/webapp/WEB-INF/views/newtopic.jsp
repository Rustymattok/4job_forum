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
<!-- MAIN -->
<main>
    <div class="container">
        <div class="create">
            <div class="create__head">
                <div class="create__title"><img src="../../resources/fonts/icons/main/New_Topic.svg" alt="New topic">Create
                    New Thread
                </div>
                <span>Forum Guidelines</span>
            </div>
            <form:form method="POST" action="/newtopic" modelAttribute="topic">
                <div class="create__section">
                    <form:label class="create__label" for="title" path="name">Thread Title</form:label>
                    <form:input type="text" class="form-control" path="name" placeholder="Add here"/>
                </div>
                <div class="create__section create__textarea">
                    <form:label class="create__label" for="description" path="content">Description</form:label>
                    <div class="create__textarea-head">
                        <span><i class="icon-Quote"></i></span>
                        <span><i class="icon-Bold"></i></span>
                        <span><i class="icon-Italic"></i></span>
                        <div class="create__textarea-separate"></div>
                        <span><i class="icon-Share_Topic"></i></span>
                        <span><i class="icon-BlockQuote"></i></span>
                        <span><i class="icon-Performatted"></i></span>
                        <span><i class="icon-Upload_Files"></i></span>
                        <span class="create__textarea-separate"></span>
                        <span><i class="icon-Bullet_List"></i></span>
                        <span><i class="icon-heading"></i></span>
                        <span><i class="icon-Horizontal_Line"></i></span>
                        <span><i class="icon-Emoticon"></i></span>
                        <span><i class="icon-Settings"></i></span>
                        <span><i class="icon-Color_Picker"></i></span>
                        <div class="create__textarea-btn">
                            <a href="#" class="btn">Preview</a>
                        </div>
                    </div>
                    <form:textarea class="form-control" id="description" path="content"
                                   placeholder="Add here you text"/>
                </div>

                <div class="create__footer">
                    <a href="<c:url value="/index"/>" class="create__btn-cansel btn">Cancel</a>
                    <button type="submit" class="create__btn-create btn btn--type-02">Create Thread</button>
                </div>
            </form:form>
        </div>
    </div>
</main>
<!-- JAVA SCRIPT -->
<script src="../../resources/vendor/jquery/jquery.min.js"></script>
<script src="../../resources/vendor/velocity/velocity.min.js"></script>
<script src="../../resources/js/app.js"></script>

</body>
</html>