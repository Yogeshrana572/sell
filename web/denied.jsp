
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

    </head>
    <body>
    <c:import url="header.jsp"></c:import>
    
        <form style="text-align: center; margin:auto;" action="index.jsp">
            <img src="http://allthingsoracle.com/wp-content/uploads/2011/11/Error.png" width="200px" height="100px">
            <h1>Go Back to Home Page</h1>
            <button class="btn btn-primary">Home</button>
        </form>
    </body>
</html>
