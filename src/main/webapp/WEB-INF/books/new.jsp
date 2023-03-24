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
            
            <h2>Add a book to Your Shelf</h2>
            <form:form action="/books" method="POST" modelAttribute="book">
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
                    <form:label path="thoughts">Thoughts:</form:label>
                    <form:errors path="thoughts"></form:errors>
                    <form:input path="thoughts"/>
                </div>
                
                
                <input class="btn" type="submit" value="Submit">

                <a href="/books">Back to shelves</a>
            </form:form>
        </div>
    </div>
    
</body>
</html>