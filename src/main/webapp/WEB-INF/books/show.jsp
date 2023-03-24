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
    <title>Update / Edit book</title>
    <link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <script src="/webjars/bootstrap/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="/js/app.js"></script><!-- change to match your file/naming structure -->

</head>
<body>
    <div class="table">

        <h1>This is: ${book.title}</h1>
        
        <h3>${book.user.userName} Read ${book.title} by: ${book.author}</h3>
        <br>
        <h3>Here are ${book.user.userName}' thoughts:</h3>
        <br>
        <p>${book.thoughts}</p>

        <c:if test="${book.user.id ==  userId}">
            <td>
                <form action="/books/delete/${book.id}" method="post">
                    <input type="hidden" name="_method" value="delete">
                    <input type="submit" class="btn" value="Delete">
                </form>
                
                <button class="btn"><a href="/book/update/${book.id}">Edit</a></button>
            </td>
        </c:if>
        
        <a href="/books">Back to shelves</a>


</div>
</body>
</html>