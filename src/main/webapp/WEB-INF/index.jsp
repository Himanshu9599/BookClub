<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- c:out ; c:forEach etc. --> 
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!-- Formatting (dates) --> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"  %>
<!-- form:form -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- for rendering errors on PUT routes -->
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>login and reg</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->
</head>
<body>
    <!-- ${userId} -->
    <div class="container">
        
<h1  class="logreg">Where Fairytale might become true</h1>
    <div class="row">
        <div class="col">
            <h2 class="register">Register</h2>
            <form:form action="/register" method="post" modelAttribute="newUser">
                <div class="main">
                    <div class="form-group">
                    <form:label path="userName">User Name:</form:label>
                    <form:input  class="form-control" path="userName"/>
                    <form:errors path="userName"/>
                    </div>
                    <div class="form-group">
                    <form:label path="email">Email:</form:label>
                    <form:input  class="form-control" path="email"/>
                    <form:errors path="email"/>
                    </div>
                    <div>
                    <form:label path="password">Password:</form:label>
                    <form:input  class="form-control" type="password" path="password"/>
                    <form:errors path="password"/>
                    </div>
                    <div>
                    <form:label path="confirm">Confirm Password:</form:label>
                    <form:input  class="form-control" type= "password" path="confirm"/>
                    <form:errors path="confirm"/>
                    </div>
                </div>
                <button class="btn"><input type="submit" value="register"></button>
            </form:form>
        </div>
        <div class="col">
            <h2 class="login">Login</h2>
            <div class="main">
                <form:form action="/login" method="post" modelAttribute="newLogin">
                    <div class="form-group">
                        <form:label path="email">Email:</form:label>
                        <form:input  class="password" path="email"/>
                        <form:errors path="email"/>
                    </div>
                    <div>
                        <form:label path="password">Password:</form:label>
                        <form:input  class="form-control" path="password"/>
                        <form:errors path="password"/>
                    </div>
                </div>
                    <button class="btn"><input type="submit" value="login"></button>
                </form:form>
        </div>

    </div>
</div>
</body>
</html>