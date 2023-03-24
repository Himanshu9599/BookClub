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
    <title>Books ADD </title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->

</head>
<body>

    <div class="body">
        <div class="table">
            <a href="/books">Back to shelves</a>

            <h1>Change your entry</h1>
                <form:form action="/books/${book.id}" method="POST" modelAttribute="book">
                    <input type="hidden" name="_method" value="PUT">
                    <form:input type="hidden" value="${userId}" path="user"></form:input>
                <div>
                <form:label path="title">Title:</form:label>
                <form:errors path="title"></form:errors>
                <form:input path="title"/>
                </div>

                <div>   
                <form:label path="author">Author:</form:label>
                <form:errors path="author"></form:errors>
                <form:input path="author"/>
                </div>
                
                <div>
                <form:label path="thoughts">My thoughts:</form:label>
                <form:errors path="thoughts"></form:errors>
                <form:input path="thoughts"/>
                </div>

                <div>
                <form:errors path="user" class="error"></form:errors>
                <form:input type="hidden" path="user" value="${user.id}"/>
                </div>
    

                
                <input class="submit" type="submit" value="Submit">
            </form:form>

            <button class="delete"><a href="books/${book.id}/delete">DELETE</a></button>

        </div>
    </div>
</body>
</html>