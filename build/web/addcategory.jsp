
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Category</title>
        
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src ="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
            function readURL(input) {
                var path;
                var reader = new FileReader();
    		reader.onload = function (e) {
                    path=e.target.result;
                    $('#blah').attr('src', path);
		};
                reader.readAsDataURL(input.files[0]);
            }   
        </script>
    </head>
<%
    try {
            if(!request.getSession().getAttribute("role").toString().equalsIgnoreCase("admin")){
                response.sendRedirect("denied.jsp");
            }
        } catch (Exception e) {
            request.setAttribute("error", "<script>alert('LogIn First');</script>");
            RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.forward(request, response);
        }
%>
    <body>
        <c:import url="header.jsp"></c:import>
        
        <h1 style="text-align: center; margin: auto;"><span class="bdots">&bullet;</span> Add Category &bullet;</h1>
        <form action="category" method="post" style="text-align: center; width:70%; margin: auto;" enctype="multipart/form-data">
            <input type="text" placeholder="Name" pattern="[A-Za-z\s]+" class="form-control" name="addcar" required>
            <br>
            <textarea placeholder="Description" name="descar" class="form-control"></textarea>
            <br>
            <input type="file" id='img' name="img" onchange="readURL(this);" class="form-control" required>
            <br>
            <img id="blah" src="#" alt="Your image will deploy here" name="data" style="margin: auto; text-align: center; width: 30%;"/>
            <br>
            <button class="btn btn-success">Add</button>
        </form>
    </body>
</html>
