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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/style.css"> <!-- change to match your file/naming structure -->
    <title>Welcome page</title>
</head>
<body>
<div class="body">
    <div class="home">
        <h1>Welcome, ${user.userName}</h1>
        <!-- <h3>Book from everyone's shelves:</h3> -->
    </div>
    <a class="logout" href="/logout">logout</a>
    <a href="books/new"> + Add to my shelf</a>

    <table class="table">
    
        <thead>
            <tr>
                <th>Id</th>
                <th>Author Name</th>
                <th>Title</th>
                <th>Owner</th>
                <th>Actions</th>
            </tr>    
            
        </thead>
    
        <tbody>
            
            <c:forEach var="book" items="${books}">

            <c:if test="${userId != book.borrower.id}">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.author}</td>
                    <td>
                        <a href="/books/${book.id}">${book.title}</a>      
                    </td>
                    <td>${book.user.userName}</td>

            
                        <c:if test="${userId == book.user.id}">
                            <td><a href="/books/${book.id}/edit">Edit</a> 

                                <form action="/books/delete/${book.id}" method="post">
                                    <input type="hidden" name="_method" value="delete">
                                    <input type="submit" class="delete" value="Delete">
                                </form>
                            </td>
                        </c:if>

                        <c:if test="${userId != book.user.id}">
                            <td><a href="books/${book.id}/borrow">Borrow</a></td>
                        </c:if>
                </tr>
            </c:if>

            </c:forEach>
        </tbody>
        
    </table>

    <h3>Books I'm Borrowing</h3>
		
		<table class="table">
		
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Owner</th>
				<th>Actions</th>
			</tr>

			<c:forEach var="book" items="${books}">
            

				<c:if test="${userId == book.borrower.id}">
					<tr>
						<td><c:out value="${book.id}"/></td>
						<td><a href="books/${book.id}"><c:out value="${book.title}"/></a></td>
						<td><c:out value="${book.author}"/></td>
						<td><c:out value="${book.user.userName}"/></td>

						<c:if test="${user!=book.user}">
							<td><a href="books/${book.id}/return">return</a></td>
						</c:if>
					</tr>
				</c:if>
				
			</c:forEach>
		
		</table>
    </div>


    </div>
</body>

</html>